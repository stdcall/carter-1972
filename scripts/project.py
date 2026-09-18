#!/usr/bin/env python3
"""Project commands; all formatting and layout policy lives in config files."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def settings(root=ROOT):
    return json.loads((root/'config/project.json').read_text())


def layout_settings(root=ROOT):
    return json.loads((root/'config/page-layout.json').read_text())


def cache_path(root=ROOT):
    return root/settings(root)['cache']


def tool_env(root=ROOT):
    env = os.environ.copy()
    env['TYPST_ROOT'] = str(root)
    env['TYPST_FONT_PATHS'] = os.pathsep.join(str(root/p) for p in settings(root)['font_paths'])
    return env


def formatter_command(root=ROOT, *, check=False, inplace=False):
    # Typstyle 0.15.1 has no native configuration-file switch. Read the actual
    # Tinymist workspace settings, so editor and CLI share the same policy.
    config = json.loads((root/'.vscode/settings.json').read_text())
    args = ['typstyle', '--line-width', str(config['tinymist.formatterPrintWidth']),
            '--indent-width', str(config['tinymist.formatterIndentSize']),
            '--wrap-text='+config['tinymist.formatterProseWrap']]
    if check:
        args.append('--check')
    if inplace:
        args.append('--inplace')
    return args + settings(root)['format_sources']


def run(args):
    subprocess.run(args, cwd=ROOT, env=tool_env(), check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['fmt', 'lint', 'build', 'check',
                                          'test', 'corrections', 'clean', 'publish',
                                          'editor-prepare', 'editor-finish'])
    parser.add_argument('--force', action='store_true')
    args = parser.parse_args()
    os.chdir(ROOT)
    cache_path().mkdir(parents=True, exist_ok=True)
    from bibliography import compile_bibliography
    if args.command == 'clean':
        shutil.rmtree(ROOT/'build')
        return
    if args.command == 'fmt':
        run(formatter_command(inplace=True))
        return
    compile_bibliography()
    if args.command == 'editor-prepare':
        from lint_typst import input_hashes
        (cache_path()/'main.pdf').unlink(missing_ok=True)
        (cache_path()/'editor-inputs.json').write_text(json.dumps(input_hashes(ROOT)))
        return
    if args.command == 'editor-finish':
        from lint_typst import input_hashes
        before = json.loads((cache_path()/'editor-inputs.json').read_text())
        if before != input_hashes(ROOT):
            raise SystemExit('Sources changed during export; run the build task again.')
        from build import build
        build(force=True, exported=cache_path()/'main.pdf')
        return
    if args.command == 'lint':
        from lint_typst import lint
        raise SystemExit(0 if lint()['status'] == 'passed' else 1)
    if args.command == 'test':
        run([sys.executable, '-m', 'unittest', 'discover', '-s', 'checks/tests', '-v'])
        return
    if args.command == 'corrections':
        from build import build_corrections
        build_corrections()
        return
    from build import build
    build(force=args.force or args.command == 'check', thorough=args.command == 'check')
    if args.command == 'check':
        run([sys.executable, '-m', 'unittest', 'discover', '-s', 'checks/tests', '-v'])
        from build import build_corrections
        build_corrections()
    if args.command == 'publish':
        from publish import publish
        publish()


if __name__ == '__main__':
    main()
