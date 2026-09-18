#!/usr/bin/env python3
"""Build Typst text and CeTZ diagrams, with zoom-preserving PDF outlines."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

from pypdf import PdfReader, PdfWriter
from pypdf.generic import ArrayObject, NameObject, NullObject
from bibliography import compile_bibliography
from check_links import check_links, set_link_descriptions
from check_indexes import check_definition_destinations
from check_whitespace import check_whitespace
from lint_typst import lint, input_hashes
from project import settings, tool_env, cache_path

ROOT = Path(__file__).resolve().parents[1]


def run(args):
    result = subprocess.run(args, cwd=ROOT, env=tool_env(ROOT), capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f'{args[0]} failed:\n{result.stdout}\n{result.stderr}')
    return result



def accessibility_signature(reader):
    """Compare Carter's tagged structure and embedded fonts across finalization."""
    from pypdf.generic import IndirectObject, StreamObject, BooleanObject
    seen = {}
    page_ids = {p.indirect_reference.idnum: i for i, p in enumerate(reader.pages)}
    embedded = set()
    structures = set()

    def canonical(value):
        if isinstance(value, IndirectObject):
            key = (value.idnum, value.generation)
            if value.idnum in page_ids:
                return ['page', page_ids[value.idnum]]
            if key in seen:
                return ['ref', seen[key]]
            seen[key] = len(seen)
            return ['object', seen[key], canonical(value.get_object())]
        if isinstance(value, dict):
            if value.get('/Type') == '/StructElem':
                structures.add(value.indirect_reference.idnum)
            for key in ['/FontFile', '/FontFile2', '/FontFile3']:
                if key in value:
                    embedded.add(hashlib.sha256(value[key].get_data()).hexdigest())
            result = {str(k): canonical(v) for k, v in sorted(value.items())
                      if k not in ('/Length', '/Filter', '/DecodeParms')}
            if isinstance(value, StreamObject):
                result['decoded_stream_sha256'] = hashlib.sha256(value.get_data()).hexdigest()
            return result
        if isinstance(value, (list, tuple)):
            return [canonical(v) for v in value]
        if isinstance(value, NullObject):
            return None
        if isinstance(value, BooleanObject):
            return value.value
        if isinstance(value, bytes):
            return value.hex()
        if isinstance(value, (int, float)):
            return float(value)
        return str(value)

    catalog = reader.trailer['/Root']
    assert '/StructTreeRoot' in catalog, 'PDF accessibility tags missing'
    tags = {key: catalog.raw_get(key) for key in
            ['/StructTreeRoot', '/MarkInfo', '/Lang'] if key in catalog}
    fonts = [page['/Resources'].get('/Font') for page in reader.pages]
    data = canonical([tags, fonts])
    assert embedded, 'No embedded fonts'
    return {'sha256': hashlib.sha256(json.dumps(data, sort_keys=True).encode()).hexdigest(),
            'structure_elements': len(structures), 'embedded_font_programs': len(embedded),
            'font_program_sha256': sorted(embedded)}

def normalize_outlines(raw, output, *, book=True, references=()):
    original = PdfReader(raw)
    writer = PdfWriter(raw, incremental=True)
    # Typst uses physical page numbers for coordinate-link tooltips. Keep the
    # new index offsets while describing their printed page numbers correctly.
    set_link_descriptions(original, references)
    set_link_descriptions(writer, references)
    preserved = accessibility_signature(original)
    # Match viewer page labels to the visible book numbering after the cover.
    if book:
        writer.set_page_label(0, 0, prefix='Cover')
        writer.set_page_label(1, len(writer.pages)-1, style='/D', start=1)
    count = 0

    def walk(ref):
        nonlocal count
        while ref:
            node = ref.get_object()
            holder, key = node, '/Dest'
            if '/A' in node:
                holder = node['/A'].get_object()
                if holder.get('/S') != '/GoTo':
                    raise ValueError('Unexpected non-GoTo outline action')
                key = '/D'
            dest = holder.get(key)
            if hasattr(dest, 'get_object'):
                dest = dest.get_object()
            if isinstance(dest, str):
                dest = original.named_destinations[dest].dest_array
            if not isinstance(dest, (list, ArrayObject)) or len(dest) != 5 or dest[1] != '/XYZ':
                raise ValueError(f'Unexpected destination: {dest}')
            holder[NameObject(key)] = ArrayObject([
                dest[0], NameObject('/XYZ'), NullObject(), dest[3], NullObject()])
            count += 1
            if node.get('/First'):
                walk(node['/First'])
            ref = node.get('/Next')

    walk(writer.root_object['/Outlines']['/First'])
    assert '/OpenAction' not in writer.root_object
    tmp = output.with_suffix('.tmp.pdf')
    writer.write(tmp)
    checked = PdfReader(tmp)
    assert accessibility_signature(checked) == preserved, 'Tags or embedded fonts changed'
    if book:
        assert checked.page_labels == ['Cover'] + [str(i) for i in range(1,len(checked.pages))]
    records = []

    def validate(items, depth=0):
        for item in items:
            if isinstance(item, list):
                validate(item, depth+1)
                continue
            dest = item.dest_array
            assert len(dest) == 5 and dest[1] == '/XYZ'
            assert isinstance(dest[2], NullObject) and isinstance(dest[4], NullObject)
            page = checked.get_destination_page_number(item)
            assert page is not None and 0 <= page < len(checked.pages)
            assert 0 <= float(dest[3]) <= float(checked.pages[page].mediabox.top)
            records.append({'title': item.title, 'depth': depth, 'pdf_page': page+1,
                            'top': float(dest[3]), 'left': None, 'zoom': None, 'type': 'XYZ'})

    validate(checked.outline)
    assert len(records) == count
    assert len(original.pages) == len(checked.pages)
    for before, after in zip(original.pages, checked.pages):
        assert list(before.mediabox) == list(after.mediabox)
        assert list(before.cropbox) == list(after.cropbox)
        assert before.get('/Rotate', 0) == after.get('/Rotate', 0)
        assert before.get_contents().get_data() == after.get_contents().get_data()
        assert len(before.get('/Annots', [])) == len(after.get('/Annots', []))
    text = '\n'.join(p.extract_text() for p in checked.pages)
    phrases = (['Since Chevalley showed in 1955', 'The Dynkin Diagram',
                'C. W. Curtis', 'Bibliography', 'Morse theory'] if book else ['E001', 'E097', 'BIB001'])
    for phrase in phrases:
        assert phrase in text, phrase
    assert '\ufffd' not in text and '\x00' not in text
    assert sum(len(p.images) for p in checked.pages) == 0, 'Unexpected raster image in new setting'
    tmp.replace(output)
    return {'pdf_pages': len(checked.pages), 'bookmark_count': count,
            'accessibility_and_fonts_unchanged': preserved,
            'page_labels': checked.page_labels,
            'bookmarks': records, 'page_streams_unchanged_after_outline_normalization': True,
            'geometry_and_annotation_counts_unchanged': True, 'raster_images': 0,
            'text_search_checks': 'passed', 'viewer_zoom_test': 'not performed; PDF objects validated'}


def build(force=False, thorough=False, exported=None):
    cache = cache_path(ROOT)
    cache.mkdir(parents=True, exist_ok=True)
    output = ROOT/settings()['output']
    compile_bibliography()
    versions = {name: run([name, '--version']).stdout.strip()
                for name in settings()['tool_versions']}
    fingerprint = {'sources': input_hashes(ROOT), 'tools': versions}
    previous = cache/'build-state.json'
    if not force and previous.exists() and output.exists():
        state = json.loads(previous.read_text())
        if state['fingerprint'] == fingerprint and state['pdf_sha256'] == hashlib.sha256(output.read_bytes()).hexdigest():
            print('PDF is current: '+str(output.relative_to(ROOT)))
            return
    lint_report = lint()
    if lint_report['status'] != 'passed':
        raise SystemExit('Lint failed; PDF was not replaced.')
    start = time.perf_counter()
    raw = cache/'book-raw.pdf'
    if exported is None:
        result = run(['typst', 'compile', settings()['entry'], str(raw)])
        (cache/'typst.log').write_text(result.stdout+result.stderr)
    else:
        if not exported.is_file():
            raise RuntimeError('Tinymist produced no PDF; inspect its export task log.')
        shutil.copyfile(exported, raw)
    raw_reader = PdfReader(raw)
    assert '/StructTreeRoot' in raw_reader.trailer['/Root'], 'PDF accessibility tags missing'

    document = json.loads((cache/'document.json').read_text())
    metadata = [x['value'] for x in document['metadata'] if isinstance(x['value'], dict)]
    references = [x for x in metadata if x.get('kind') in ('cross-reference','page-reference')]
    figure_labels = sorted(set(re.findall(r'<(fig:[0-9]+)>',
        '\n'.join(p.read_text() for p in (ROOT/'content').rglob('*.typ')))))
    expr = '(' + ','.join(json.dumps(n) for n in figure_labels) + ',).map(n => (target: n, position: query(label(n)).first().location().position()))'
    figure_anchors = json.loads(run(['typst', 'eval', expr, '--in', settings()['entry'], '--format', 'json']).stdout)
    (cache/'cross-references.json').write_text(json.dumps(references))
    (cache/'figure-anchors.json').write_text(json.dumps(figure_anchors))
    staged = cache/'book-checked.pdf'
    report = normalize_outlines(raw, staged, references=references)
    links = check_links(staged, references, figure_anchors)
    links['definition_introductions_checked'] = check_definition_destinations(
        staged, links['references'],
        json.loads((ROOT/'data/notation-index.json').read_text()))
    report['output_sha256'] = hashlib.sha256(staged.read_bytes()).hexdigest()
    report['source_input_sha256'] = fingerprint['sources']
    report['tools'] = versions
    if thorough:
        whitespace = check_whitespace(staged, report['bookmarks'])
        (cache/'whitespace-report.json').write_text(json.dumps(whitespace, indent=2)+'\n')
        if whitespace['status'] != 'passed':
            raise SystemExit('Unreviewed bottom gaps: '+str(whitespace['pages_requiring_review']))
    assert fingerprint['sources'] == input_hashes(ROOT), 'Sources changed during build'
    staged.replace(output)
    raw.unlink()
    (cache/'pdf-report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
    (cache/'internal-links.json').write_text(json.dumps(links, ensure_ascii=False, indent=2)+'\n')
    previous.write_text(json.dumps({'fingerprint':fingerprint,'pdf_sha256':report['output_sha256']}, indent=2)+'\n')
    print(json.dumps({'pages':report['pdf_pages'],'bookmarks':report['bookmark_count'],
                      'links':links['internal_link_annotations'],'seconds':round(time.perf_counter()-start,2)}))


def build_corrections():
    cache = cache_path(ROOT)
    cache.mkdir(parents=True, exist_ok=True)
    raw = cache/'corrections-raw.pdf'
    run(['typst', 'compile', settings()['corrections_entry'], str(raw)])
    expr = 'query(metadata).map(m => m.value).filter(v => type(v) == dictionary and "correction" in v).map(v => v.correction)'
    ids = json.loads(run(['typst', 'eval', expr, '--in', settings()['corrections_entry'], '--format', 'json']).stdout)
    expected = [e['id'] for e in json.loads((ROOT/'corrections.json').read_text())['entries']]
    assert len(ids) == len(set(ids)) and set(ids) == set(expected), 'Correction list is incomplete or duplicated'
    report = normalize_outlines(raw, ROOT/settings()['corrections_output'], book=False)
    (cache/'corrections-report.json').write_text(json.dumps(report, indent=2)+'\n')
    raw.unlink()
    print('Corrections: '+str(len(ids))+' entries; '+str(report['pdf_pages'])+' pages')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--force', action='store_true')
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    build(force=args.force or args.check, thorough=args.check)
