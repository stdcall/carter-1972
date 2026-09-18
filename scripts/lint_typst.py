#!/usr/bin/env python3
"""Project lint: conservative source checks plus Typst's evaluated document.

No fixes: mathematical meaning and source readings must never change implicitly.
This is not a general Typst parser or a mathematical proof checker.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import unicodedata
from check_indexes import index_checks
from project import settings, formatter_command, tool_env, cache_path

ROOT = Path(__file__).resolve().parents[1]
PREFIXES = {'th', 'l', 'p', 'cor', 'eq', 'fig', 'def', 'ex', 'ch', 'sec', 'pg', 'bib'}
EXPRESSION = '''(
  figures: query(figure).map(it => (label: it.at("label", default: none), floating: it.placement != none, position: it.location().position())),
  headings: query(heading).map(it => (label: it.at("label", default: none), level: it.level, body: it.body, number: if it.numbering == none { none } else { numbering("1.1", ..counter(heading).at(it.location())) }, position: it.location().position())),
  equations: query(math.equation.where(block: true)).map(it => (label: it.at("label", default: none), position: it.location().position())),
  metadata: query(metadata).map(it => (label: it.at("label", default: none), value: it.value)),
)'''


def mask_noncode(text):
    """Hide quoted strings and nested comments, preserving offsets and newlines.

    In this project's sources quotes in prose are typographic; ASCII double
    quotes delimit code/math strings. Backslash escapes are retained elsewhere.
    """
    out = list(text)
    i = 0
    while i < len(text):
        start = i
        if text.startswith('//', i):
            end = text.find('\n', i)
            i = len(text) if end < 0 else end
        elif text.startswith('/*', i):
            depth = 1
            i += 2
            while i < len(text) and depth:
                if text.startswith('/*', i):
                    depth += 1
                    i += 2
                elif text.startswith('*/', i):
                    depth -= 1
                    i += 2
                else:
                    i += 1
        elif text[i] == '"':
            i += 1
            while i < len(text):
                if text[i] == '\\':
                    i += 2
                elif text[i] == '"':
                    i += 1
                    break
                else:
                    i += 1
        else:
            i += 1
            continue
        for j in range(start, min(i, len(text))):
            if text[j] != '\n':
                out[j] = ' '
    return ''.join(out)


def source_checks(path, text, config):
    findings = []
    def add(rule, offset, message):
        findings.append({'rule': rule, 'path': path, 'line': text.count('\n', 0, offset)+1, 'message': message})
    if not text.endswith('\n'):
        add('T001', len(text), 'Missing final newline')
    if text != unicodedata.normalize('NFC', text):
        add('T001', 0, 'Use Unicode NFC')
    for m in re.finditer(r'[ \t]+(?=\n)|\t|\r', text):
        add('T001', m.start(), 'Trailing whitespace, tab or CR line ending')
    offset = 0
    for line in text.splitlines(keepends=True):
        width = len(line.rstrip('\r\n'))
        if width > config.get("max_line_length", 80):
            add('T004', offset, f'Line has {width} characters; maximum is {config.get('max_line_length', 80)}. Run just fmt; split long formulas or strings explicitly if needed.')
        offset += len(line)
    clean = mask_noncode(text)
    for m in re.finditer(r'[\u0000-\u0008\u000b\u000c\u000e-\u001f\u00ad\u200b\ufeff\ufffd]|[\u0400-\u04ff]', clean):
        add('T002', m.start(), 'Control/OCR character or Cyrillic in this English corpus')
    for m in re.finditer(r'\b(?:TODO|FIXME|OCR_ERROR|UNREADABLE)\b|\?\?\?', clean):
        add('T003', m.start(), 'Unresolved transcription marker')
    labels = []
    for m in re.finditer(r'(?<!\\)<([A-Za-z][A-Za-z0-9_:\-.]*)>', clean):
        name = m.group(1)
        labels.append((name, text.count('\n', 0, m.start())+1))
        if not re.fullmatch(r'(?:'+'|'.join(sorted(PREFIXES))+r'):[a-z0-9]+(?:-[a-z0-9]+)*', name):
            add('T010', m.start(), f'Invalid semantic label: {name}')
    # Check only math spans; skip escaped dollar signs and masked strings/comments.
    for m in re.finditer(r'(?<!\\)\$([\s\S]*?)(?<!\\)\$', clean):
        body = m.group(1)
        for bad in re.finditer(r'_[A-Za-z][A-Za-z0-9]*\(', body):
            add('T020', m.start(1)+bad.start(), 'Ambiguous subscript call; separate the argument or explicitly group the index')
        for bad in re.finditer(r'\^[A-Za-z]\(', body):
            add('T024', m.start(1)+bad.start(), 'Ambiguous superscript call; separate the following factor or group the exponent explicitly')
        for bad in re.finditer(r'\\(?:frac|dfrac|begin|end|sqrt|mathbb|mathfrak|mathbf|boldsymbol)\b', body):
            add('T021', m.start(1)+bad.start(), 'Unconverted LaTeX in Typst mathematics')
        for bad in re.finditer(r'\\\\(?=[ \t]*(?:\n|&))', body):
            add('T025', m.start(1)+bad.start(), 'LaTeX-style doubled linebreak; use one backslash for a Typst math linebreak')
        for bad in re.finditer(r"_(?:[A-Za-z0-9]+|\([^()\n]*\))'+", body):
            add('T023', m.start(1)+bad.start(), "Prime attaches to the subscript; use v'_i (or an explicitly grouped primed index)")
        for bad in re.finditer(r'(?<![\w.])bar\(', body):
            add('T022', m.start(1)+bad.start(), 'bar() creates vertical fences; use overline() for conjugation or abs() for absolute value')
    external = config.get('external_page_literals', {}).get(path, {})
    used = set()
    for m in re.finditer(r'\bp{1,2}\.\s*\d+(?:[–-]\d+)?', clean):
        literal = m.group()
        if literal in external and external[literal].strip():
            used.add(literal)
        else:
            add('T030', m.start(), f'Literal page reference {literal!r}: use source-page-ref or document external citation')
    for literal in set(external)-used:
        add('T099', 0, f'Unused external-page exception: {literal}')
    if path.startswith('content/') and path not in config.get('layout_files', []):
        for m in re.finditer(r'\\\[\d+(?:,\s*\d+)*\\\]', clean):
            add('T017', m.start(), 'Literal bibliography numbers: use bib-ref with stable BibLaTeX keys')
        for m in re.finditer(r'#set\s+(?:page\b|text\s*\([^)]*\bfont\s*:)|#include\s+', clean):
            add('T040', m.start(), 'Page/font policy and includes belong to the configured layout files')
        for m in re.finditer(r'\b(Theorem|Lemma|Proposition|Corollary|Definition)\s+(\d+(?:\.\d+)+)\.(?!\d)', clean):
            prefix = {'Theorem':'th','Lemma':'l','Proposition':'p','Corollary':'cor','Definition':'def'}[m.group(1)]
            expected = prefix+':'+m.group(2).replace('.', '-')
            if f'<{expected}>' not in clean[max(0,m.start()-180):m.start()]:
                add('T011', m.start(), f'Statement requires preceding <{expected}> anchor')
    return findings, labels


def plain(node):
    if isinstance(node, str):
        return node
    if not isinstance(node, dict):
        return ''
    if node.get('func') == 'space':
        return ' '
    return node.get('text', '') + ''.join(plain(x) for x in node.get('children', []))


def label_name(item):
    return (item.get('label') or '').strip('<>')


def semantic_checks(data, config, expected_pages):
    findings = []
    def add(rule, item, message):
        findings.append({'rule': rule, 'path': 'content/main.typ', 'position': item.get('position'), 'message': message})
    semantic_labels = []
    for item in data.get('figures', []):
        if item['floating'] and label_name(item).startswith('fig:'):
            add('T018', item, 'Label the block inside a floating figure, not the logical figure wrapper (Typst issue 4359)')
    for item in data['headings']:
        title = plain(item['body']).strip()
        name = label_name(item)
        if name:
            semantic_labels.append(name)
        if re.match(r'\d+(?:\.\d+)*(?=[. ]|$)', title):
            add('T012', item, f'Heading {title!r} must use automatic numbering')
        if item.get('number') is not None:
            prefix = 'ch:' if item['level'] == 1 else 'sec:'
            if not re.fullmatch(prefix+r'[a-z][a-z0-9]*(?:-[a-z0-9]+)*', name):
                add('T012', item, f'Numbered heading requires a semantic {prefix} label')
    for item in data['equations']:
        name = label_name(item)
        if not name.startswith('eq:'):
            add('T013', item, 'Displayed equation must itself carry an eq: label')
        else:
            semantic_labels.append(name)
    missing = set()
    sources = []
    for item in data['metadata']:
        value = item['value']
        if not isinstance(value, dict):
            continue
        name = label_name(item)
        if name:
            semantic_labels.append(name)
        kind = value.get('kind')
        if kind in ('cross-reference', 'page-reference'):
            target = value.get('target', 'pg:source-'+str(value.get('original-page', '')))
            if not value.get('resolved'):
                missing.add(target)
                if target.startswith('bib:') or not config.get('absent_targets', {}).get(target, '').strip():
                    add('T014', value, f'Unresolved reference: {target}')
        if kind == 'source':
            sources.append(value['file-page'])
            printed = value['printed-page']
            if name != 'pg:source-'+printed:
                add('T015', value, 'Source anchor label does not match printed page')
            if printed.isdecimal() and value['file-page'] != int(printed)+13:
                add('T015', value, 'Incorrect Carter DjVu/printed page offset')
        if kind == 'bibliography-anchor' and name != 'bib:'+value['key']:
            add('T016', value, 'Bibliography key/anchor mismatch')
    for target in set(config.get('absent_targets', {}))-missing:
        add('T099', {}, f'Unused absent-target exception: {target}')
    if sources != sorted(set(sources)):
        add('T015', {}, 'Source pages must be unique and in original order')
    if sources != expected_pages:
        add('T015', {}, f'Source coverage differs from transcription manifest: {sources} != {expected_pages}')
    for name, count in Counter(semantic_labels).items():
        if count > 1:
            add('T010', {}, f'Duplicate evaluated label: {name}')
    return findings


def input_hashes(root):
    paths = [root/'corrections.json',
             *sorted((root/'content').rglob('*.typ')),
             root/'references.bib', *sorted((root/'data').glob('*.json')),
             *sorted((root/'config').glob('*.json')),
             *sorted(p for p in (root/'assets').rglob('*') if p.is_file()),
             root/'.vscode/settings.json', *sorted((root/'scripts').glob('*.py'))]
    return {str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}


def format_sources(root=ROOT):
    subprocess.run(formatter_command(root, inplace=True), cwd=root,
                   check=True, timeout=90)


def lint(root=ROOT, semantic=True):
    cache_path(root).mkdir(parents=True, exist_ok=True)
    config = json.loads((root/'config/lint.json').read_text())
    findings = []
    seen = {}
    hashes = input_hashes(root)
    upstream = []
    if semantic:
        commands = [
            ['tinymist', 'lint', '--diagnostic-format', 'short', '--root', str(root), settings(root)['entry']],
            formatter_command(root, check=True),
        ]
        for cmd in commands:
            if not shutil.which(cmd[0]):
                findings.append({'rule':'T000', 'path':'content/main.typ', 'message':f'Missing {cmd[0]}; install with brew install tinymist typstyle'})
                continue
            checked = subprocess.run(cmd, cwd=root, env=tool_env(root), capture_output=True, text=True, timeout=90)
            output = checked.stdout+checked.stderr
            upstream.append({'command':cmd, 'exit_code':checked.returncode, 'diagnostics':output,
                             'version':subprocess.check_output([cmd[0], '--version'], text=True).strip()})
            if checked.returncode or re.search(r'(?:^|: )(?:warning|error):', output, re.M):
                findings.append({'rule':'T000', 'path':'content/main.typ', 'message':f'{cmd[0]} failed: {output.strip()}'})
    for path in (p for p in hashes if p.endswith('.typ')):
        errors, labels = source_checks(path, (root/path).read_text(), config)
        findings.extend(errors)
        for name, line in labels:
            if name in seen:
                findings.append({'rule':'T010','path':path,'line':line,'message':f'Duplicate label {name}; first in {seen[name]}'})
            seen[name] = path
    data = None
    if semantic:
        result = subprocess.run(['typst','eval',EXPRESSION,'--in',settings(root)['entry'],'--format','json'],
                                cwd=root, env=tool_env(root), capture_output=True, text=True)
        if result.returncode or result.stderr.strip():
            findings.append({'rule':'T000','path':'content/main.typ','message':result.stderr.strip() or 'Typst evaluation failed'})
        if result.returncode == 0:
            data = json.loads(result.stdout)
            expected = json.loads((root/'data/source-pages.json').read_text())['source_file_pages']
            findings.extend(semantic_checks(data, config, expected))
            inventories = [json.loads((root/name).read_text()) for name in
                           ['data/notation-index.json', 'data/subject-index.json']]
            index_errors = index_checks(data['metadata'], inventories)
            findings.extend({'rule': 'T050', 'path': 'content/main.typ', 'message': e}
                            for e in index_errors)
            (root/'build/.cache/index-report.json').write_text(json.dumps({
                'status': 'failed' if index_errors else 'passed',
                'counts': [len(rows) for rows in inventories],
                'input_sha256': hashes, 'errors': index_errors,
            }, ensure_ascii=False, indent=2)+'\n')
    report = {'status':'failed' if findings else 'passed', 'scope':'source+evaluated document' if semantic else 'source only',
              'input_sha256':hashes, 'upstream':upstream, 'errors':findings, 'explicit_absent_targets':config.get('absent_targets', {}),
              'counts':{'source_files':sum(p.endswith('.typ') for p in hashes), 'static_labels':len(seen),
                        'display_equations':len(data['equations']) if data else None,
                        'headings':len(data['headings']) if data else None}}
    (root/'build/.cache/typst-lint.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    if data is not None:
        (cache_path(root)/'document.json').write_text(json.dumps(data, ensure_ascii=False)+'\n')
    for item in findings:
        print(f"{item['path']}:{item.get('line', '?')}: {item['rule']}: {item['message']}")
    print(json.dumps({'lint':report['status'], 'errors':len(findings), **report['counts']}))
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source-only', action='store_true', help='Fast incomplete check; cannot qualify a release')
    parser.add_argument('--fix', action='store_true', help='Apply upstream Typstyle fixes before checking; never fix source readings')
    args = parser.parse_args()
    if args.fix:
        format_sources()
    raise SystemExit(0 if lint(semantic=not args.source_only)['status'] == 'passed' else 1)
