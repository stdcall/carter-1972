"""Verify actual PDF link rectangles and destinations against Typst references.

For this project's unrotated, full-page Typst export, Typst puts the destination
10pt above its semantic target. Validate positions, not just page existence.
"""
import hashlib
from pathlib import Path
import re

import fitz
from pypdf import PdfReader
from pypdf.generic import NameObject, TextStringObject


def pt(value):
    assert value.endswith('pt'), value
    return float(value[:-2])


def set_link_descriptions(document, references):
    """Coordinate links need the printed page label, not a physical-page tooltip."""
    for ref in references:
        if not ref.get('description'):
            continue
        source = ref['position']
        page = document.pages[source['page'] - 1]
        height = float(page.mediabox.height)
        matches = []
        for item in page.get('/Annots', []):
            annotation = item.get_object()
            if annotation.get('/Subtype') != '/Link':
                continue
            rect = [float(v) for v in annotation['/Rect']]
            if (abs(rect[0] - pt(source['x'])) < 0.03 and
                    height - rect[3] - 0.03 <= pt(source['y']) <= height - rect[1] + 0.03):
                matches.append(annotation)
        assert len(matches) == 1, 'Expected one index link for its description'
        matches[0][NameObject('/Contents')] = TextStringObject(ref['description'])


def check_figure_anchors(pdf, anchors):
    """Check physical captions, independently of Typst's logical float location.

    Carter's numbered figures have captions below the complete diagram. A
    target must be on that page and above the caption, never in the later flow.
    The rendered figure itself is also inspected during visual review.
    """
    captions = {}
    with fitz.open(pdf) as document:
        for page_number, page in enumerate(document, 1):
            for block in page.get_text('blocks'):
                match = re.fullmatch(r'Figure (\d+)', block[4].strip())
                if match:
                    target = 'fig:'+match[1]
                    assert target not in captions, f'{target}: duplicate caption'
                    captions[target] = (page_number, block[1])
    assert {a['target'] for a in anchors} == set(captions), 'Figure anchor/caption inventory mismatch'
    checked = []
    for anchor in anchors:
        target, position = anchor['target'], anchor['position']
        page, caption_top = captions[target]
        assert position['page'] == page, f'{target}: anchor and visible caption are on different pages'
        assert 0 <= pt(position['y']) < caption_top, f'{target}: anchor lies below visible figure'
        checked.append({'target': target, 'pdf_page': page,
                        'anchor_top': pt(position['y']), 'caption_top': caption_top})
    return checked


def check_links(pdf, references, figure_anchors=None):
    reader = PdfReader(pdf)
    page_ids = {p.indirect_reference.idnum: i+1 for i, p in enumerate(reader.pages)}
    records = []
    for number, page in enumerate(reader.pages, 1):
        assert page.get('/Rotate', 0) == 0
        assert list(page.cropbox) == list(page.mediabox)
        assert list(page.mediabox)[:2] == [0, 0]
        height = float(page.mediabox.height)
        for ref in page.get('/Annots', []):
            annotation = ref.get_object()
            if annotation.get('/Subtype') != '/Link':
                continue
            action = annotation.get('/A', {}).get_object() if '/A' in annotation else {}
            if action.get('/S') == '/URI':
                continue
            assert not action or action.get('/S') == '/GoTo', 'Unexpected link action'
            dest = annotation.get('/Dest', action.get('/D'))
            if hasattr(dest, 'get_object'):
                dest = dest.get_object()
            if isinstance(dest, str):
                dest = reader.named_destinations[dest].dest_array
            assert len(dest) == 5 and dest[1] == '/XYZ', dest
            target_page = page_ids[dest[0].idnum]
            target_height = float(reader.pages[target_page-1].mediabox.height)
            assert 0 <= float(dest[3]) <= target_height
            rect = [float(v) for v in annotation['/Rect']]
            assert 0 <= rect[0] < rect[2] <= float(page.mediabox.width)
            assert 0 <= rect[1] < rect[3] <= height
            records.append({'from_page': number, 'to_page': target_page,
                            'rect_top_origin': [rect[0], height-rect[3], rect[2], height-rect[1]],
                            'target_top_origin': target_height-float(dest[3]), 'type': '/XYZ',
                            'description': str(annotation.get('/Contents', ''))})
    checked = []
    absent = []
    for ref in references:
        target = ref.get('target', 'pg:source-'+str(ref.get('original-page', '')))
        if not ref['resolved']:
            absent.append(target)
            continue
        source = ref['position']
        destination = ref['target-position']
        matching = [r for r in records if r['from_page'] == source['page']
                    and abs(r['rect_top_origin'][0]-pt(source['x'])) < 0.03
                    and r['rect_top_origin'][1]-0.03 <= pt(source['y']) <= r['rect_top_origin'][3]+0.03]
        assert len(matching) == 1, f'{target}: expected one clickable rectangle at {source}; got {matching}'
        actual = matching[0]
        assert actual['to_page'] == destination['page'], f'{target}: wrong target page'
        expected_top = max(0, pt(destination['y'])-10)
        assert abs(actual['target_top_origin']-expected_top) < 0.03, f'{target}: wrong target height'
        if ref.get('description'):
            assert actual['description'] == ref['description'], f'{target}: wrong accessible page description'
        checked.append({'target': target, **actual})
    figures = check_figure_anchors(pdf, figure_anchors) if figure_anchors is not None else []
    return {'sha256': hashlib.sha256(Path(pdf).read_bytes()).hexdigest(),
            'status': 'passed', 'internal_link_annotations': len(records),
            'semantic_references_checked': len(checked),
            'bibliography_references_checked': sum(r['target'].startswith('bib:') for r in checked),
            'references': checked, 'explicit_absent_targets': sorted(set(absent)),
            'numbered_figure_anchors': figures,
            'links': records, 'viewer_click_test': 'not performed; actual PDF objects checked'}
