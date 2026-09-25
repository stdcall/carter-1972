"""Check index coverage and original locators in evaluated Typst metadata.

PDF link rectangles and destinations are checked separately by check_links.py.
This checker does not infer whether the original author selected the best page.
"""
import re
from collections import Counter


def check_definition_destinations(pdf, marks, inventory):
    """Keep the introductory line visible when following a notation locator.

    Every locator now points at the mark placed where the symbol is defined,
    so the check is that the page the mark sits on is the page that
    introduces it.
    """
    import fitz
    pages = {plain_symbol(m.get('term')): m['page'] for m in marks}
    targets = {m['target']: m['page'] for m in marks if m.get('target')}
    checked = []
    with fitz.open(pdf) as document:
        for row in inventory:
            if not row.get('target_text'):
                continue
            symbol = plain_symbol(row['symbol'])
            page = targets.get(row.get('target'), pages.get(symbol))
            assert page, f'{row["symbol"]}: no mark for this symbol'
            # The introduction may wrap onto the next page; the locator still
            # lands the reader at the start of it.
            text = ' '.join(document[page - 1].get_text().split())
            if page < document.page_count:
                text += ' ' + ' '.join(document[page].get_text().split())
            phrase = ' '.join(row['target_text'].split())
            assert phrase in text, \
                f'{row["symbol"]}: page {page} does not introduce it: {phrase}'
            checked.append(row['target'])
    return checked


def mark_checks(marks, rows):
    """The text's own marks must name exactly the printed index entries."""
    expected, parent = [], None
    for row in rows:
        if row['indent'] == 0:
            parent = row['term']
            expected.append((row['term'], None))
        else:
            expected.append((parent, row['term']))
    seen = {(m.get('term'), m.get('sub')) for m in marks}
    errors = []
    for pair in expected:
        if pair not in seen:
            name = pair[0] if pair[1] is None else f'{pair[0]} / {pair[1]}'
            errors.append(f'index entry never marked in the text: {name}')
    # The accepted inventory checks coverage, not the complete future index.
    # New terms belong in the text and must not require a second inventory edit.
    return errors


def index_checks(metadata, inventories):
    rows = [row for inventory in inventories for row in inventory]
    marks, groups, notation_entries = [], [], []
    for item in metadata:
        value = item.get('value', item)
        if not isinstance(value, dict):
            continue
        kind = value.get('kind')
        if kind == 'index-mark':
            marks.append(value)
        elif kind == 'notation-entry':
            notation_entries.append(value)
        elif kind == 'index-entry':
            groups.append({'entry': value, 'references': []})
        elif kind == 'index-reference':
            if not groups:
                return ['Index reference appears before its entry']
            groups[-1]['references'].append(value)
    errors = []
    subject_marks = [m for m in marks if m.get('index') == 'subject']
    notation_marks = [m for m in marks if m.get('index') == 'notation']
    if subject_marks:
        errors.extend(mark_checks(
            subject_marks, [r for r in rows if r['id'].startswith('subject-')]))
        rows = [r for r in rows if not r['id'].startswith('subject-')]
    if notation_marks:
        if all('key' in m for m in notation_marks):
            expected = {m['key'] for m in notation_marks}
            actual = [e['key'] for e in notation_entries]
            if set(actual) != expected or len(actual) != len(expected):
                errors.append('Notation entries do not match the inline marks')
        else:
            errors.extend(notation_checks(
                notation_marks, [r for r in rows if r['id'].startswith('notation-')]))
        rows = [r for r in rows if not r['id'].startswith('notation-')]
    errors.extend(locator_checks(groups, rows))
    return errors


def plain_symbol(symbol):
    """Compare symbols by their mathematics, not by spacing or delimiters."""
    return re.sub(r'\s+', '', (symbol or '').strip().strip('$'))


def notation_checks(marks, rows):
    """Every symbol the original locates must be marked where it is defined."""
    wanted = {plain_symbol(row['symbol']) for row in rows if row.get('symbol')}
    seen = {plain_symbol(m.get('term')) for m in marks}
    errors = []
    for row in rows:
        if not row.get('original_locators') and not row.get('original_pages'):
            continue
        if plain_symbol(row['symbol']) not in seen:
            errors.append('notation symbol never marked in the text: %s'
                          % row['symbol'])
    for symbol in sorted(seen - wanted):
        errors.append('notation mark has no entry in the index: %s' % symbol)
    return errors


def locator_checks(groups, expected):
    """The indexes still built from original locators are checked as before."""
    errors = []
    actual_ids = [g['entry'].get('id') for g in groups]
    expected_ids = [r['id'] for r in expected]
    if actual_ids != expected_ids:
        errors.append('Index entries missing, duplicated, or reordered')
    lookup = {r['id']: r for r in expected}
    for group in groups:
        entry = group['entry']
        key = entry.get('id')
        if key not in lookup:
            continue
        row = lookup[key]
        locs = row.get('original_locators')
        if locs is None:
            locs = [[n, n] for n in row['original_pages']]
        else:
            locs = [[n[0], n[-1]] for n in locs]
        want = Counter(map(tuple, locs))
        declared = Counter(map(tuple, entry.get('original', [])))
        actual = Counter(tuple(pair) for ref in group['references']
                         for pair in ref.get('original', []))
        if want != declared or want != actual:
            errors.append(f'{key}: missing, duplicated, or altered page locator')
        for ref in group['references']:
            first, last = ref.get('first-page'), ref.get('last-page')
            if not isinstance(first, int) or not isinstance(last, int) or not 1 <= first <= last:
                errors.append(f'{key}: invalid current page interval')
            if row.get('target') and ref.get('target') != row['target']:
                errors.append(f'{key}: wrong semantic definition target')
    return errors
