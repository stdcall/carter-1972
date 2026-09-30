"""Build Typst text and CeTZ diagrams, with zoom-preserving PDF outlines.

Typst does not see system fonts; a Typst font warning fails the build, and
every PDF is checked to contain no font other than those in the book's font
directories (not even one bundled with Typst) and no missing glyph.
"""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import re
import shutil
import struct
import subprocess
import time

import pymupdf
from pypdf import PdfReader, PdfWriter
from pypdf.generic import ArrayObject, FloatObject, NameObject, NullObject
from bibliography import compile_bibliography
from check_links import check_links, set_link_descriptions
from check_indexes import check_definition_destinations
from check_whitespace import check_whitespace
from lint_typst import lint, input_hashes
from project import settings, tool_env, cache_path

ROOT = Path(__file__).resolve().parents[1]
SUBSET_TAG = re.compile(r'^[A-Z]{6}\+')


def run(args):
    result = subprocess.run(args, cwd=ROOT, env=tool_env(ROOT), capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f'{args[0]} failed:\n{result.stdout}\n{result.stderr}')
    # A missing font family or math font is only a warning in Typst.
    if re.search(r'^warning: .*font', result.stderr, re.MULTILINE):
        raise RuntimeError(f'{args[0]}: Typst font warning:\n{result.stderr}')
    return result


def book_font_names():
    """PostScript names (OpenType name ID 6) of the font files of the book."""
    names = set()
    for directory in settings()['font_paths']:
        for path in sorted((ROOT/directory).rglob('*')):
            if path.suffix.lower() not in {'.otf', '.ttf'}:
                continue
            data = path.read_bytes()
            for index in range(struct.unpack_from('>H', data, 4)[0]):
                tag, _, table, _ = struct.unpack_from('>4sIII', data, 12 + 16*index)
                if tag != b'name':
                    continue
                _, count, strings = struct.unpack_from('>3H', data, table)
                for record in range(count):
                    platform, _, _, name_id, length, offset = struct.unpack_from(
                        '>6H', data, table + 6 + 12*record)
                    if name_id == 6:
                        start = table + strings + offset
                        names.add(data[start:start+length].decode(
                            'utf-16-be' if platform in (0, 3) else 'latin-1'))
    if not names:
        raise ValueError('No fonts found in '+', '.join(settings()['font_paths']))
    return names


def check_fonts(pdf, label):
    """Fail if the PDF has a font outside the book's fonts or a missing glyph."""
    allowed = book_font_names()
    found = defaultdict(dict)  # problem -> {PDF page: text set in the font}
    for page in pymupdf.open(pdf):
        number, foreign = page.number + 1, {}
        for _, _, kind, name, _, encoding, *_ in page.get_fonts(full=True):
            name = SUBSET_TAG.sub('', name)
            if kind == 'Type0':  # a composite font's name ends in its encoding
                name = name.removesuffix(f'-{encoding}')
            if name not in allowed:
                foreign[name] = found[f'font {name} is not a book font']
                foreign[name][number] = ''
        text = ''
        for span in page.get_texttrace():
            chars = ''.join(chr(c) if c > 0 else '?' for c, *_ in span['chars'])
            chars = chars.replace('\xad', '-')
            # MuPDF shortens the font names of spans.
            for name, pages in foreign.items():
                if name.startswith(span['font']):
                    pages[number] += chars
            if any(name.startswith(span['font']) for name in allowed):
                for index, (_, glyph, *_) in enumerate(span['chars']):
                    if glyph == 0:
                        context = (text + chars[:index])[-40:]
                        found[f'no book font has the glyph after "{context}"'][number] = ''
            text += chars
    if found:
        raise ValueError(f'{label}:' + ''.join(
            f'\n  {problem}: ' + ', '.join(
                f'PDF page {page}' + (f' "{sample[:30]}"' if sample else '')
                for page, sample in list(pages.items())[:8]
            ) + (f' and {len(pages) - 8} more pages' if len(pages) > 8 else '')
            for problem, pages in found.items()))



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

def normalize_outline_destinations(writer, original, *, left=None):
    """Keep heading heights and inherited zoom in every nested bookmark."""
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
            # MuPDF drops the vertical target when x is null. The book can
            # choose an explicit left edge while retaining null (inherited) zoom.
            x = NullObject() if left is None else FloatObject(left)
            holder[NameObject(key)] = ArrayObject([
                dest[0], NameObject('/XYZ'), x, dest[3], NullObject()])
            count += 1
            if node.get('/First'):
                walk(node['/First'])
            ref = node.get('/Next')

    if '/Outlines' in writer.root_object:
        walk(writer.root_object['/Outlines'].get('/First'))
    return count


def set_book_page_labels(writer, body_start):
    """Use the first chapter's physical position, not a fixed front-matter size."""
    assert 3 < body_start < len(writer.pages)
    writer.root_object.pop(NameObject('/PageLabels'), None)
    writer.set_page_label(0, 0, prefix='Cover')
    writer.set_page_label(1, body_start-1, style='/r', start=1)
    writer.set_page_label(body_start, len(writer.pages)-1, style='/D', start=1)


def check_book_pagination(pdf, body_start):
    """Compare every printed folio with the labels a PDF viewer displays."""
    labels = PdfReader(pdf).page_labels
    assert labels[:4] == ['Cover', 'i', 'ii', 'iii']
    assert labels[body_start:] == [str(i) for i in range(1, len(labels)-body_start+1)]
    with pymupdf.open(pdf) as document:
        for index, page in enumerate(document):
            footer = [word[4] for word in page.get_text('words')
                      if word[1] > page.rect.height-50]
            assert footer == ([] if index < 3 else [labels[index]]), \
                f'PDF page {index+1}: folio {footer} differs from label {labels[index]}'
    return {'first_body_pdf_page': body_start+1, 'visible_folios_checked': len(labels)-3}


def normalize_outlines(raw, output, *, book=True, body_start=None, references=()):
    original = PdfReader(raw)
    writer = PdfWriter(raw, incremental=True)
    # Typst uses physical page numbers for coordinate-link tooltips. Keep the
    # new index offsets while describing their printed page numbers correctly.
    set_link_descriptions(original, references)
    set_link_descriptions(writer, references)
    preserved = accessibility_signature(original)
    # Match viewer labels to the Roman preliminary and Arabic body counters.
    if book:
        set_book_page_labels(writer, body_start)
    left = settings()['pdf_navigation']['outline_left']
    count = normalize_outline_destinations(writer, original, left=left)
    assert '/OpenAction' not in writer.root_object
    tmp = output.with_suffix('.tmp.pdf')
    writer.write(tmp)
    check_fonts(tmp, Path(settings()['output' if book else 'corrections_output']).name)
    checked = PdfReader(tmp)
    assert accessibility_signature(checked) == preserved, 'Tags or embedded fonts changed'
    if book:
        check_book_pagination(tmp, body_start)
    records = []

    def validate(items, depth=0):
        for item in items:
            if isinstance(item, list):
                validate(item, depth+1)
                continue
            dest = item.dest_array
            assert len(dest) == 5 and dest[1] == '/XYZ'
            assert (isinstance(dest[2], NullObject) if left is None
                    else float(dest[2]) == left)
            assert isinstance(dest[4], NullObject)
            page = checked.get_destination_page_number(item)
            assert page is not None and 0 <= page < len(checked.pages)
            assert 0 <= float(dest[3]) <= float(checked.pages[page].mediabox.top)
            records.append({'title': item.title, 'depth': depth, 'pdf_page': page+1,
                            'top': float(dest[3]), 'left': left, 'zoom': None, 'type': 'XYZ'})

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
    staged = cache/'book-checked.pdf'
    body_start = next(h['position']['page']-1 for h in document['headings']
                      if h['label'] == '<ch:classical-simple-groups>')
    report = normalize_outlines(raw, staged, body_start=body_start, references=references)
    links = check_links(staged, references, figure_anchors)
    notation_expr = ('query(label("nx"))'
                     '.map(m => (key: m.value.key, target: m.value.target, '
                     'page: m.location().position().page))')
    notation_marks = json.loads(run(['typst', 'eval', notation_expr, '--in',
                                     settings()['entry'], '--format', 'json']).stdout)
    links['definition_introductions_checked'] = check_definition_destinations(
        staged, notation_marks,
        json.loads((ROOT/'data/notation-index.json').read_text()))
    report['output_sha256'] = hashlib.sha256(staged.read_bytes()).hexdigest()
    report['source_input_sha256'] = fingerprint['sources']
    report['tools'] = versions
    if thorough:
        whitespace = check_whitespace(staged, report['bookmarks'])
        (cache/'whitespace-report.json').write_text(json.dumps(whitespace, indent=2)+'\n')
        if whitespace['status'] != 'passed':
            print('Layout advisory (does not fail the build): bottom gaps on PDF pages '
                  +str(whitespace['pages_requiring_review'])
                  +'; see build/.cache/whitespace-report.json')
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
