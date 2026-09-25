import sys
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
import unicodedata
import fitz
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
from check_indexes import index_checks


class IndexChecks(unittest.TestCase):
    def setUp(self):
        self.inventory = [[dict(id='subject-001', original_locators=[[30, 32], [33]])]]
        self.metadata = [
            dict(kind='index-entry', id='subject-001', original=[[30, 32], [33, 33]]),
            dict(kind='index-reference', original=[[30, 32], [33, 33]],
                 target='pg:source-30', **{'first-page': 35, 'last-page': 39}),
        ]

    def test_merged_intervals_retain_all_original_locators(self):
        self.assertEqual(index_checks(self.metadata, self.inventory), [])

    def test_missing_link_rejected(self):
        self.assertTrue(index_checks(self.metadata[:1], self.inventory))

    def test_changed_original_number_rejected(self):
        self.metadata[1]['original'][1] = [34, 34]
        self.assertTrue(index_checks(self.metadata, self.inventory))

    def test_wrong_semantic_destination_rejected(self):
        self.inventory[0][0]['target'] = 'sec:2-6'
        self.assertTrue(index_checks(self.metadata, self.inventory))

    def test_duplicate_row_rejected(self):
        self.assertTrue(index_checks(self.metadata * 2, self.inventory))

    def test_new_inline_notation_needs_no_inventory_edit(self):
        marks = [dict(kind='index-mark', index='notation', key='new-symbol')]
        entries = [dict(kind='notation-entry', key='new-symbol')]
        self.assertEqual(index_checks(marks + entries, []), [])
        self.assertTrue(index_checks(marks, []))
        self.assertTrue(index_checks(marks + entries * 2, []))

    def test_new_subject_mark_is_not_rejected_by_historical_inventory(self):
        marks = [dict(kind='index-mark', index='subject', term='New term', sub=None)]
        self.assertEqual(index_checks(marks, [[]]), [])


class GeneratedNotation(unittest.TestCase):
    root = Path(__file__).resolve().parents[2]

    def compile(self, inserted=''):
        with tempfile.TemporaryDirectory(dir=self.root/'build/.cache') as folder:
            source = Path(folder)/'notation.typ'
            output = source.with_suffix('.pdf')
            source.write_text('''#import "/content/main-defs.typ": *
                ''' + inserted + '''
                #nx("N-count", [$N$], group: "latin-n")[A root count]FIRST.
                #nx("N-count", [$N$], group: "latin-n")[A
                  root count]
                #pagebreak()
                #nx("N-group", [$N$], group: "latin-n")[A group]SECOND.
                #nx("Z-new", [$Z$], group: "latin-z")[A new symbol]
                #nx("basic", [$perp$], group: "symbols", locator: false)[Basic]
                #pagebreak()
                #notation-index()
                ''')
            subprocess.run(['typst', 'compile', '--root', str(self.root),
                            str(source), str(output)], check=True, capture_output=True)
            query = ('(entries: query(metadata).filter(it => '
                     'it.value.at("kind", default: "") == "notation-entry")'
                     '.map(it => it.value.key), marks: query(label("nx"))'
                     '.map(it => (key: it.value.key, page: '
                     'counter(page).at(it.location()).first(), '
                     'position: it.location().position())))')
            data = json.loads(subprocess.check_output(
                ['typst', 'eval', query, '--root', str(self.root), '--in', str(source),
                 '--format', 'json'], text=True))
            with fitz.open(output) as pdf:
                index = pdf[-1]
                data['text'] = unicodedata.normalize('NFKC', ' '.join(index.get_text().split()))
                data['links'] = index.get_links()
                for link in data['links']:
                    key = 'FIRST.' if link['page'] == data['marks'][0]['page']-1 else 'SECOND.'
                    target = pdf[link['page']].search_for(key)[0]
                    self.assertLess(abs(link['to'].y - target.y0), 20)
            return data

    def test_marks_generate_meanings_and_distinct_symbols_without_manual_table(self):
        data = self.compile()
        self.assertEqual(data['entries'], ['basic', 'N-count', 'N-group', 'Z-new'])
        self.assertIn('Basic —', data['text'])
        self.assertIn('N A root count 1', data['text'])
        self.assertIn('N A group 2', data['text'])
        self.assertIn('Z A new symbol 2', data['text'])
        self.assertEqual([link['page'] for link in data['links']], [0, 1, 1])

    def test_inserting_page_updates_locators_and_actual_pdf_destinations(self):
        data = self.compile('Inserted page.\n#pagebreak()\n')
        self.assertIn('N A root count 2', data['text'])
        self.assertIn('N A group 3', data['text'])
        self.assertEqual([link['page'] for link in data['links']], [1, 2, 2])

    def test_book_duplicate_symbols_retain_separate_definitions(self):
        query = '''query(label("nx")).filter(it => it.value.key in (
          "N-positive-roots", "N-monomial", "S-weight-sum", "S-root-class",
        )).map(it => (key: it.value.key, target: it.value.target,
          page: it.location().position().page,
          definition-page: if it.value.target != none {
            query(label(it.value.target)).first().location().position().page
          } else { none },
        ))'''
        values = json.loads(subprocess.check_output(
            ['typst', 'eval', query, '--root', str(self.root), '--in',
             str(self.root/'content/main.typ'), '--format', 'json'], text=True))
        entries = {v['key']: v for v in values}
        self.assertEqual(len(entries), 4)
        self.assertEqual(entries['N-monomial']['target'], 'sec:monomial-subgroup')
        self.assertEqual(entries['S-weight-sum']['target'],
                         'eq:weyl-exponent-theorem-half-sum')
        for key in ('N-monomial', 'S-weight-sum'):
            self.assertEqual(entries[key]['page'], entries[key]['definition-page'])
        self.assertNotEqual(entries['N-monomial']['page'], entries['N-positive-roots']['page'])
        self.assertNotEqual(entries['S-weight-sum']['page'], entries['S-root-class']['page'])
