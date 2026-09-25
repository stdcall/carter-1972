"""Compile the Lean checks of checks/lean/bindings.json and audit their axioms.

Every listed file is compiled on its own with `lake env lean FILE` in a
prebuilt mathlib checkout, given by `--mathlib PATH` or the environment
variable LEAN_MATHLIB. Nothing is built, updated or downloaded: the checkout
must be at the pinned mathlib commit, unmodified, with the pinned toolchain
installed and the required .olean files present.

A file passes if it compiles without errors or warnings and its
`#print axioms` lines cover exactly its listed declarations, which may depend
only on propext, Classical.choice and Quot.sound. The SHA-256 of each proof
file and of each chapter file it is bound to must match bindings.json: a
changed chapter makes the binding stale until its claim has been checked in
the new text and the hash updated.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

LEAN_DIR = Path(__file__).resolve().parent
ROOT = LEAN_DIR.parents[1]
MANIFEST = LEAN_DIR / 'bindings.json'
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}
AXIOMS = re.compile(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]"
                    r"|does not depend on any axioms)")


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def project_file(name):
    path = (ROOT / name).resolve()
    if Path(name).is_absolute() or not path.is_relative_to(ROOT) or not path.is_file():
        raise SystemExit(f'Expected an existing project file: {name}')
    return path


def check_records(manifest, mathlib, lake):
    problems = []
    toolchain = (LEAN_DIR / 'lean-toolchain').read_text().strip()
    if manifest['lean_toolchain'] != toolchain:
        problems.append('bindings.json and lean-toolchain name different toolchains')
    if (mathlib / 'lean-toolchain').read_text().strip() != toolchain:
        problems.append(f'toolchain of {mathlib} differs from {toolchain}')
    elan = Path(lake).parent / 'elan'
    if elan.is_file():
        listed = subprocess.run([str(elan), 'toolchain', 'list'], text=True,
                                capture_output=True, check=True).stdout
        if toolchain not in {line.split()[0] for line in listed.splitlines() if line.strip()}:
            problems.append(f'{toolchain} is not installed; refusing a download')
    head = subprocess.run(['git', 'rev-parse', 'HEAD'], cwd=mathlib, text=True,
                          capture_output=True, check=True).stdout.strip()
    if head != manifest['mathlib_commit']:
        problems.append(f'mathlib commit {head} in {mathlib}, pinned {manifest["mathlib_commit"]}')
    dirty = subprocess.run(['git', 'status', '--porcelain', '--untracked-files=no'],
                           cwd=mathlib, text=True, capture_output=True, check=True).stdout
    if dirty.strip():
        problems.append(f'tracked files of {mathlib} are modified')
    for name, digest in manifest['content_sha256'].items():
        if sha256(project_file(name)) != digest:
            problems.append(f'{name} changed since the proofs were bound; check the '
                            'claims in the new text, then update its SHA-256')
    seen = set()
    cache = (mathlib / '.lake/build/lib/lean').resolve()
    for proof in manifest['proofs']:
        if sha256(project_file(proof['file'])) != proof['sha256']:
            problems.append(f'{proof["file"]}: SHA-256 differs from bindings.json')
        declarations = proof['declarations']
        if not declarations or len(set(declarations)) != len(declarations) or seen & set(declarations):
            problems.append(f'{proof["file"]}: empty or repeated declarations')
        seen |= set(declarations)
        for name in proof['required_olean']:
            if not (cache / name).resolve().is_file():
                problems.append(f'{proof["file"]}: missing prebuilt {name}')
    listed = {project_file(p['file']) for p in manifest['proofs']}
    for path in sorted(set(LEAN_DIR.glob('*.lean')) - listed):
        problems.append(f'{path.relative_to(ROOT)}: not listed in bindings.json')
    return problems


def audit(proof, output, returncode):
    problems = []
    if returncode != 0:
        problems.append(f'lean exited with {returncode}')
    if re.search(r'\bwarning:', output):
        problems.append('compiler warning')
    if 'sorryAx' in output:
        problems.append('sorryAx')
    found = {}
    for match in AXIOMS.finditer(output):
        if match[1] in found:
            problems.append(f'axioms of {match[1]} printed twice')
        found[match[1]] = {a.strip() for a in (match[2] or '').split(',') if a.strip()}
    expected = set(proof['declarations'])
    if set(found) != expected:
        problems.append(f'#print axioms: missing {sorted(expected - set(found))}, '
                        f'unlisted {sorted(set(found) - expected)}')
    for name, axioms in found.items():
        if axioms - ALLOWED:
            problems.append(f'{name} uses {sorted(axioms - ALLOWED)}')
    return problems


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument('--mathlib', default=os.environ.get('LEAN_MATHLIB'),
                        help='prebuilt mathlib checkout (default: $LEAN_MATHLIB)')
    parser.add_argument('--lake', default=os.environ.get('LAKE') or shutil.which('lake')
                        or str(Path.home() / '.elan' / 'bin' / 'lake'))
    parser.add_argument('--timeout', type=int, default=300)
    args = parser.parse_args()
    if not args.mathlib:
        sys.exit('Set LEAN_MATHLIB (or --mathlib) to a prebuilt mathlib checkout '
                 'of the commit pinned in checks/lean/bindings.json.')
    mathlib = Path(args.mathlib).expanduser().resolve()
    if not (mathlib / 'lake-manifest.json').is_file() or not Path(args.lake).is_file():
        sys.exit(f'Expected an existing mathlib checkout at {mathlib} and lake at {args.lake}')

    manifest_text = MANIFEST.read_text()
    manifest = json.loads(manifest_text)
    problems = check_records(manifest, mathlib, args.lake)
    if problems:
        sys.exit('\n'.join(['Lean check records:'] + problems))

    failed = False
    for proof in manifest['proofs']:
        path = project_file(proof['file'])
        try:
            run = subprocess.run([args.lake, 'env', 'lean', str(path)], cwd=mathlib,
                                 text=True, capture_output=True, timeout=args.timeout)
            output, returncode = run.stdout + run.stderr, run.returncode
        except subprocess.TimeoutExpired:
            output, returncode = 'timed out', 124
        problems = audit(proof, output, returncode)
        if problems:
            failed = True
            print(f'FAIL {proof["file"]}')
            for problem in problems:
                print(f'  {problem}')
            print(output)
        else:
            print(f'ok   {proof["file"]}: {len(proof["declarations"])} declarations')
    if MANIFEST.read_text() != manifest_text or check_records(manifest, mathlib, args.lake):
        failed = True
        print('Inputs changed during the run.')
    if failed:
        sys.exit(1)
    total = sum(len(p['declarations']) for p in manifest['proofs'])
    print(f'{len(manifest["proofs"])} files, {total} declarations: only {sorted(ALLOWED)}')


if __name__ == '__main__':
    main()
