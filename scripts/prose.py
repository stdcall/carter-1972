"""Check the prose with Harper, ignoring what it reads out of the markup.

Harper parses Typst, but it also reads string literals inside code: a path
like "../figures/x.svg" looks to it like a broken ellipsis, and an
enumeration label "(i)" like the pronoun. Every finding that starts in code
is dropped here instead of switching rules off. What is left is compared
with checks/prose-accepted.json, so only new findings are reported.
"""
import argparse
import json
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
CONFIG = json.loads((ROOT / 'config/prose.json').read_text())
CALL = re.compile(r'\#[A-Za-z][A-Za-z0-9-]*\s*\(')


def code_mask(text):
    """Mark the characters that are Typst code rather than running text."""
    mask = bytearray(len(text))
    stack = ['markup']
    i = 0
    while i < len(text):
        ch = text[i]
        in_code = stack[-1] == 'code'
        if ch == '"' and in_code:
            j = i + 1
            while j < len(text) and text[j] != '"':
                j += 2 if text[j] == '\\' else 1
            j = min(j + 1, len(text))
            mask[i:j] = b'\x01' * (j - i)
            i = j
            continue
        if ch == '`':
            j = text.find('`', i + 1)
            j = len(text) if j < 0 else j + 1
            mask[i:j] = b'\x01' * (j - i)
            i = j
            continue
        call = CALL.match(text, i)
        if call:
            mask[i:call.end()] = b'\x01' * (call.end() - i)
            stack.append('code')
            i = call.end()
            continue
        if in_code:
            mask[i] = 1
            if ch == '(':
                stack.append('code')
            elif ch == ')' and len(stack) > 1:
                stack.pop()
            elif ch == '[':
                stack.append('markup')
        elif ch == ']' and len(stack) > 1:
            stack.pop()
        i += 1
    return mask


def letter_of_a_symbol(text, start, lint):
    """A lone letter after a formula or a list label is not a word.

    The plural of a symbol, $r_i$'s, and enumerations such as (i) or (f)
    leave Harper with a single letter to spell-check.
    """
    word = lint['matched_text']
    if lint['rule'] != 'SpellCheck':
        return False
    if re.fullmatch(r'[A-Z]\.', word):        # an author's initial
        return True
    if len(word) > 2:
        return False
    before = text[:start].rstrip('’\'')
    return before.endswith(('$', '(', '['))


def findings(binary, path):
    result = subprocess.run(
        [binary, 'lint', '--quiet', '--format', 'json', '--no-color',
         '--dialect', CONFIG['dialect'],
         '--user-dict-path', CONFIG['dictionary'],
         '--ignore', ','.join(CONFIG['ignore']), str(path)],
        capture_output=True, text=True, cwd=ROOT)
    try:
        report = json.loads(result.stdout)
    except json.JSONDecodeError:
        raise SystemExit('harper-cli failed on %s:\n%s'
                         % (path, result.stderr.strip()[:400]))
    text = path.read_text()
    mask = code_mask(text) if path.suffix == '.typ' else bytearray(len(text))
    for entry in report:
        for lint in entry['lints']:
            start = lint['span']['char_start']
            if start < len(mask) and mask[start]:
                continue
            if letter_of_a_symbol(text, start, lint):
                continue
            line = text.split('\n')[lint['line'] - 1].strip()
            yield {'rule': lint['rule'], 'file': path.relative_to(ROOT).as_posix(),
                   'text': lint['matched_text'], 'line': lint['line'],
                   'message': lint['message'], 'context': line}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('files', nargs='*', type=Path,
                        help='Files to check. Default: everything configured.')
    parser.add_argument('--accept', action='store_true',
                        help='Write every finding to the accepted list.')
    args = parser.parse_args()

    binary = shutil.which('harper-cli')
    if binary is None:
        parser.exit(2, 'Install Harper first: brew install harper\n')

    paths = args.files or [p for pattern in CONFIG['paths']
                           for p in sorted(ROOT.glob(pattern))]
    accepted_path = ROOT / 'checks/prose-accepted.json'
    accepted = json.loads(accepted_path.read_text()) if accepted_path.exists() else []
    seen = {(item['rule'], item['file'], item['text']) for item in accepted}

    fresh = []
    for path in paths:
        for item in findings(binary, (ROOT / path).resolve()):
            if (item['rule'], item['file'], item['text']) not in seen:
                fresh.append(item)

    if args.accept:
        kept = accepted + [{'rule': i['rule'], 'file': i['file'],
                            'text': i['text'], 'reason': 'reviewed'}
                           for i in fresh]
        accepted_path.write_text(json.dumps(kept, ensure_ascii=False, indent=2) + '\n')
        print('accepted %d finding(s); write the reason for each' % len(fresh))
        return
    for item in fresh:
        print('%s:%d [%s] %s' % (item['file'], item['line'], item['rule'],
                                 item['message']))
        print('    %r in %s' % (item['text'], item['context'][:90]))
    print('%d finding(s); %d accepted earlier' % (len(fresh), len(accepted)))
    raise SystemExit(1 if fresh else 0)


main()
