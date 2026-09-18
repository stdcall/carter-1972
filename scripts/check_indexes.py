"""Check index coverage and original locators in evaluated Typst metadata.

PDF link rectangles and destinations are checked separately by check_links.py.
This checker does not infer whether the original author selected the best page.
"""
from collections import Counter


def check_definition_destinations(pdf, links, inventory):
    """Keep the introductory line visible when following a notation locator."""
    import fitz
    checked = []
    with fitz.open(pdf) as document:
        for row in inventory:
            if not row.get('target_text'):
                continue
            target, phrase = row['target'], row['target_text']
            matches = [r for r in links if r['target'] == target]
            assert matches, f'{target}: no PDF link to definition'
            for link in matches:
                page = document[link['to_page'] - 1]
                top = link['target_top_origin']
                lines = page.search_for(phrase)
                visible = [box for box in lines if 0 <= box.y0 - top <= 28]
                assert visible, f'{target}: destination skips the introductory line: {phrase}'
            checked.append(target)
    return checked


def index_checks(metadata, inventories):
    expected = [row for inventory in inventories for row in inventory]
    groups = []
    for item in metadata:
        value = item.get('value', item)
        if not isinstance(value, dict):
            continue
        if value.get('kind') == 'index-entry':
            groups.append({'entry': value, 'references': []})
        elif value.get('kind') == 'index-reference':
            if not groups:
                return ['Index reference appears before its entry']
            groups[-1]['references'].append(value)
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
