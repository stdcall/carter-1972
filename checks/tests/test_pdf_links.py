"""Exercise reference helpers through the real Typst-to-PDF export."""
import json
import copy
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

from pypdf import PdfReader, PdfWriter
from pypdf.generic import NameObject, NumberObject

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'scripts'))
from check_links import check_links, check_figure_anchors, set_link_descriptions
from check_indexes import check_definition_destinations

EXPR = 'query(metadata).filter(it => it.value.at("kind", default: "") in ("cross-reference", "page-reference")).map(it => it.value)'
FIXTURE = '''#import "/content/main-defs.typ": *
#set page(width: 176mm, height: 250mm)
#set heading(numbering: book-heading-numbering)
#chapter-ref("chapter"), #section-ref("section"), #equation-ref("1.2"),
#theorem-ref("1.3"), #lemma-ref("1.4"), #proposition-ref("1.5"),
#definition-ref("1.6"), #corollary-ref("1.8"), #figure-ref("1.7"), #source-page-ref("1"),
#bib-ref("chevalley1955", "jordan1870")
#bib-ref("steinberg1967lectures"), #bib-ref("tits1966existence")
#pagebreak()
#source(14, "1")
= Chapter <ch:chapter>
== Section <sec:section>
$ x = 1 $ <eq:1-2>
#metadata((kind: "anchor")) <th:1-3>
Theorem 1.3.\n
#metadata((kind: "anchor")) <l:1-4>
Lemma 1.4.\n
#metadata((kind: "anchor")) <p:1-5>
Proposition 1.5.\n
#metadata((kind: "anchor")) <def:1-6>
Definition 1.6.\n
#metadata((kind: "anchor")) <fig:1-7>
Figure 1.7.\n
#metadata((kind: "anchor")) <cor:1-8>
Corollary 1.8.\n
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


class ChapterPreview(unittest.TestCase):
    def test_local_links_work_and_external_numbers_are_placeholders(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'chapter.typ'
            pdf = Path(folder)/'chapter.pdf'
            source.write_text('''#import "/content/main-defs.typ": section-ref
#import "/content/chapter-preview.typ": chapter-preview
#chapter-preview(11)[
= A single chapter <ch:preview-example>
See #section-ref("local-section") and #section-ref("external-section").
== Local section <sec:local-section>
The chapter ends here.
]
''')
            subprocess.run(['typst', 'compile', '--root', str(ROOT), str(source), str(pdf)],
                           check=True, capture_output=True)
            reader = PdfReader(pdf)
            self.assertEqual(len(reader.pages), 1)
            text = reader.pages[0].extract_text()
            self.assertIn('11. A single chapter', text)
            self.assertIn('section 11.1', text)
            self.assertIn('section ?', text)
            references = json.loads(subprocess.check_output(
                ['typst', 'eval', EXPR, '--root', str(ROOT), '--in', str(source), '--format', 'json'], text=True))
            local = [r for r in references if r['resolved']]
            self.assertEqual(len(local), 1)
            self.assertEqual(local[0]['target'], 'sec:local-section')
            check_links(pdf, local)

    def test_importing_chapter_preview_does_not_relax_full_book_references(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            source.write_text('''#import "/content/main-defs.typ": section-ref
#import "/content/11-properties-of-chevalley-groups.typ": chapter
#section-ref("missing-section")
''')
            result = subprocess.run(
                ['typst', 'compile', '--root', str(ROOT), str(source), str(Path(folder)/'main.pdf')],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('Missing heading:', result.stderr)


class IndexLinks(unittest.TestCase):
    def test_definition_intro_is_visible_and_index_inset_is_local(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            pdf = Path(folder)/'index.pdf'
            source.write_text('''#import "/content/main-defs.typ": *
#set page(width: 300pt, height: 300pt, margin: 20pt)
#index-ref(1, target: "def:term")
#index-refs(1)
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
            refs = json.loads(subprocess.check_output([
                'typst', 'eval', EXPR, '--root', str(ROOT), '--in', str(source),
                '--format', 'json'], text=True))
            with self.assertRaisesRegex(AssertionError, 'accessible page description'):
                check_links(pdf, refs)
            writer = PdfWriter(pdf, incremental=True)
            set_link_descriptions(writer, refs)
            fixed = Path(folder)/'checked.pdf'
            writer.write(fixed)
            links = check_links(fixed, refs)['references']
            self.assertEqual(len(links), 3)
            self.assertAlmostEqual(links[2]['target_top_origin'] -
                                   links[0]['target_top_origin'], 4, places=3)
            inventory = [dict(target='def:term', target_text='For each pair of roots')]
            self.assertEqual(check_definition_destinations(pdf, links, inventory), ['def:term'])
            bad = copy.deepcopy(links)
            bad[0]['target_top_origin'] += 30
            with self.assertRaisesRegex(AssertionError, 'skips the introductory line'):
                check_definition_destinations(pdf, bad, inventory)


class FloatingFigureLinks(unittest.TestCase):
    def test_links_follow_rendered_float_not_source_insertion(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            pdf = Path(folder)/'float.pdf'
            source.write_text('''#import "/content/main-defs.typ": figure-ref
#set page(width: 200pt, height: 200pt, margin: 10pt)
See #figure-ref("1").
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
