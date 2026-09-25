"""Exercise reference helpers through the real Typst-to-PDF export."""
import json
import copy
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

import fitz
from pypdf import PdfReader, PdfWriter
from pypdf.generic import NameObject, NullObject, NumberObject

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'scripts'))
from check_links import check_links, check_figure_anchors, set_link_descriptions
from check_indexes import check_definition_destinations
from build import normalize_outline_destinations
from project import settings

EXPR = 'query(metadata).filter(it => it.value.at("kind", default: "") in ("cross-reference", "page-reference")).map(it => it.value)'
FIXTURE = '''#import "/content/main-defs.typ": *
#import "/content/statements.typ": *
#show: reference-rules
#show: statement-rules
#set page(width: 176mm, height: 250mm)
#set heading(numbering: book-heading-numbering)
@ch:chapter[chapter], @sec:section[section], @eq:1-2[(1.2)],
@th:theorem-example[Theorem], @l:lemma-example[Lemma], @p:proposition-example[Proposition],
@def:definition-example[Definition], @cor:corollary-example[Corollary], @fig:1-7[Figure 1.7], #source-page-ref("1"),
#bib-ref("chevalley1955", "jordan1870")
#bib-ref("steinberg1967lectures"), #bib-ref("tits1966existence")
#pagebreak()
#source(14, "1")
= Chapter <ch:chapter>
== Section <sec:section>
$ x = 1 $ <eq:1-2>
#theorem[An assertion.] <th:theorem-example>\n
#lemma[An assertion.] <l:lemma-example>\n
#proposition[An assertion.] <p:proposition-example>\n
#definition[An assertion.] <def:definition-example>\n
#metadata((kind: "anchor")) <fig:1-7>
Figure 1.7.\n
#corollary[An assertion.] <cor:corollary-example>\n
#metadata((kind: "bibliography-anchor", key: "chevalley1955")) <bib:chevalley1955>
Chevalley 4.\n
#metadata((kind: "bibliography-anchor", key: "jordan1870")) <bib:jordan1870>
Jordan 1.
#pagebreak()
#metadata((kind: "bibliography-anchor", key: "steinberg1967lectures")) <bib:steinberg1967lectures>
Steinberg 15.\n
#metadata((kind: "bibliography-anchor", key: "tits1966existence")) <bib:tits1966existence>
Tits 15.
'''


class PDFLinks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(dir=ROOT/'build/.cache', prefix='link-test-')
        cls.folder = Path(cls.temp.name)
        source = cls.folder/'main.typ'
        source.write_text(FIXTURE)
        cls.pdf = cls.folder/'links.pdf'
        subprocess.run(['typst', 'compile', '--root', str(ROOT), str(source), str(cls.pdf)], check=True, capture_output=True)
        cls.references = json.loads(subprocess.check_output(
            ['typst', 'eval', EXPR, '--root', str(ROOT), '--in', str(source), '--format', 'json'], text=True))

    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()

    def test_every_helper_and_individual_citation_target(self):
        report = check_links(self.pdf, self.references)
        self.assertEqual(report['semantic_references_checked'], 14)
        self.assertEqual(report['bibliography_references_checked'], 4)
        self.assertEqual({r['target'].split(':')[0] for r in report['references']},
                         {'ch', 'sec', 'eq', 'th', 'l', 'p', 'cor', 'def', 'fig', 'pg', 'bib'})
        text = PdfReader(self.pdf).pages[0].extract_text()
        self.assertIn('[4, 1]', text)
        self.assertIn('p. 2', text)
        self.assertEqual(text.count('[15]'), 2)
        same_number = [r for r in report['references'] if r['target'] in
                       ['bib:steinberg1967lectures', 'bib:tits1966existence']]
        self.assertEqual(len(same_number), 2)

    def test_wrong_destination_is_rejected_even_on_correct_page(self):
        writer = PdfWriter(self.pdf)
        link = writer.pages[0]['/Annots'][0].get_object()
        dest = writer.named_destinations[link['/Dest']].dest_array if isinstance(link['/Dest'], str) else link['/Dest']
        dest[3] = NumberObject(100)
        link[NameObject('/Dest')] = dest
        broken = self.folder/'wrong-height.pdf'
        writer.write(broken)
        with self.assertRaisesRegex(AssertionError, 'wrong target height'):
            check_links(broken, self.references)


class PDFOutline(unittest.TestCase):
    def test_nested_sections_on_same_page_keep_precise_targets_and_zoom(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            raw, final = Path(folder)/'raw.pdf', Path(folder)/'final.pdf'
            source.write_text('''#set page(width: 400pt, height: 700pt)
= Chapter
#v(100pt)
== First section
#v(100pt)
=== Subsection
''')
            subprocess.run(['typst', 'compile', str(source), str(raw)],
                           check=True, capture_output=True)
            original = PdfReader(raw)
            writer = PdfWriter(raw, incremental=True)
            count = normalize_outline_destinations(
                writer, original, left=settings()['pdf_navigation']['outline_left'])
            self.assertEqual(count, 3)
            writer.write(final)
            checked = PdfReader(final)

            def flatten(items):
                for item in items:
                    if isinstance(item, list):
                        yield from flatten(item)
                    else:
                        yield item

            expected = list(flatten(original.outline))
            actual = list(flatten(checked.outline))
            with fitz.open(final) as doc:
                toc = doc.get_toc(simple=False)
                self.assertEqual([row[0] for row in toc], [1, 2, 3])
                tops = []
                for before, after, row in zip(expected, actual, toc):
                    self.assertEqual(before.title, after.title)
                    self.assertEqual(before.dest_array[3], after.dest_array[3])
                    self.assertIsInstance(after.dest_array[4], NullObject)
                    dest = row[3]
                    self.assertEqual(dest['kind'], fitz.LINK_GOTO)
                    self.assertEqual(dest['page'], 0)
                    top = 700 - float(after.dest_array[3])
                    self.assertAlmostEqual(dest['to'].y, top, places=3)
                    self.assertEqual(dest['to'].x, 0)
                    self.assertEqual(dest['zoom'], 0)
                    tops.append(top)
                self.assertLess(tops[0], tops[1])
                self.assertLess(tops[1], tops[2])


class MissingReferences(unittest.TestCase):
    def test_missing_reference_target_is_a_compile_error(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            source.write_text('''#import "/content/main-defs.typ": reference-rules
#show: reference-rules
@sec:missing-section[section]
''')
            result = subprocess.run(
                ['typst', 'compile', '--root', str(ROOT), str(source), str(Path(folder)/'main.pdf')],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('does not exist', result.stderr)


class IndexLinks(unittest.TestCase):
    def test_notation_locator_lands_on_the_page_that_introduces_it(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            pdf = Path(folder)/'index.pdf'
            source.write_text('''#import "/content/main-defs.typ": *
#set page(width: 300pt, height: 300pt, margin: 20pt)
#book-ref("def", "term", [ordinary reference])
#pagebreak()
#counter(page).update(1)
#v(40pt)
#source(14, "1")
#block(sticky: true)[#metadata((kind: "anchor")) <def:term>
For each pair of roots we define]
$ A_(r s) = frac(2(r,s), (r,r)). $ <eq:term>
#pagebreak()
#source(15, "2")
The next source page.
''')
            subprocess.run(['typst', 'compile', '--root', str(ROOT), str(source), str(pdf)],
                           check=True, capture_output=True)
            inventory = [dict(target='def:term', symbol='$A_(r s)$',
                              target_text='For each pair of roots')]
            marks = [dict(term='$A_(r s)$', page=1)]
            self.assertEqual(check_definition_destinations(pdf, marks, inventory),
                             ['def:term'])
            with self.assertRaisesRegex(AssertionError, 'does not introduce it'):
                check_definition_destinations(
                    pdf, [dict(term='$A_(r s)$', page=fitz.open(pdf).page_count)],
                    inventory)
            with self.assertRaisesRegex(AssertionError, 'no mark for this symbol'):
                check_definition_destinations(pdf, [], inventory)


class FloatingFigureLinks(unittest.TestCase):
    def test_links_follow_rendered_float_not_source_insertion(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            pdf = Path(folder)/'float.pdf'
            source.write_text('''#import "/content/main-defs.typ": reference-rules
#show: reference-rules
#set page(width: 200pt, height: 200pt, margin: 10pt)
See @fig:1[Figure 1].
#v(50pt)
This text is before the logical insertion of the float.
#figure(
  [#block[#rect(width: 50pt, height: 25pt)
  #align(center)[Figure 1]] <fig:1>],
  placement: top,
)
''')
            subprocess.run(['typst', 'compile', '--root', str(ROOT), str(source), str(pdf)],
                           check=True, capture_output=True)
            def evaluate(expr):
                return json.loads(subprocess.check_output([
                    'typst', 'eval', expr, '--root', str(ROOT), '--in', str(source),
                    '--format', 'json'], text=True))
            references = evaluate(EXPR)
            anchors = evaluate('((target: "fig:1", position: query(<fig:1>).first().location().position()),)')
            report = check_links(pdf, references, anchors)
            self.assertEqual(len(report['numbered_figure_anchors']), 1)
            bad = copy.deepcopy(anchors)
            bad[0]['position']['y'] = '190pt'
            with self.assertRaisesRegex(AssertionError, 'below visible figure'):
                check_figure_anchors(pdf, bad)
            bad[0]['position']['page'] += 1
            with self.assertRaisesRegex(AssertionError, 'different pages'):
                check_figure_anchors(pdf, bad)


if __name__ == '__main__':
    unittest.main()
