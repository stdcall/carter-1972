from pathlib import Path
import json
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
from bibliography import compile_bibliography


class MultipartBibliography(unittest.TestCase):
    def compile(self, parts):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'data').mkdir()
            entries = []
            for i, part in enumerate(parts):
                entries.append(
                    '@article{part' + str(i) + ',\n'
                    'author = {Killing, W.}, title = {Transformationsgruppen},\n'
                    'date = {1888}, shorthand = {1}, part = {' + part + '}\n}'
                )
            (root / 'references.bib').write_text('\n'.join(entries))
            return compile_bibliography(root)

    def test_four_parts_retain_one_original_number_and_four_keys(self):
        result = self.compile(['I', 'II', 'III', 'IV'])
        self.assertEqual(result['printed_items'], 1)
        work = result['groups'][0]['works'][0]
        self.assertEqual(work['number'], 1)
        self.assertEqual([p['key'] for p in work['parts']],
                         ['part0', 'part1', 'part2', 'part3'])

    def test_duplicate_missing_and_reordered_parts_are_rejected(self):
        for parts in [['II'], ['I', 'III'], ['I', 'II', 'II'], ['I', 'II', 'IV']]:
            with self.subTest(parts=parts), self.assertRaises(AssertionError):
                self.compile(parts)


class CompleteBibliography(unittest.TestCase):
    def compile(self, entries, groups, counts=None):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'data').mkdir()

            (root / 'references.bib').write_text(entries)
            inventory = {'groups': groups}
            if counts is not None:
                inventory['numbered_items_per_source_page'] = counts
            (root / 'data/bibliography-inventory.json').write_text(
                json.dumps(inventory))
            return compile_bibliography(root)

    @staticmethod
    def entry(key, author, number):
        return ('@unpublished{' + key + ', author = {' + author + '}, '
                'title = {Example}, shorthand = {' + str(number) + '}, '
                'note = {to appear}}\n')

    def test_numbering_restarts_for_each_author_and_missing_date_is_preserved(self):
        result = self.compile(
            self.entry('s', 'Steinberg, R.', 1)
            + self.entry('t', 'Tits, J.', 1)
            + self.entry('h', 'Harish-Chandra', 1),
            [{'author': a, 'last_number': 1}
             for a in ['Steinberg, R.', 'Tits, J.', 'Harish-Chandra']],
            {'324': 3})
        self.assertEqual([g['works'][0]['number'] for g in result['groups']],
                         [1, 1, 1])
        self.assertEqual(result['groups'][2]['author'], 'Harish-Chandra')
        self.assertNotIn('date', result['groups'][2]['works'][0]['parts'][0])

    def test_missing_number_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'groups/numbers differ'):
            self.compile(self.entry('t1', 'Tits, J.', 1)
                         + self.entry('t3', 'Tits, J.', 3),
                         [{'author': 'Tits, J.', 'last_number': 3}])

    def test_repeated_author_group_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'non-contiguously'):
            self.compile(self.entry('t1', 'Tits, J.', 1)
                         + self.entry('s1', 'Steinberg, R.', 1)
                         + self.entry('t2', 'Tits, J.', 2), [])

    def test_wrong_source_page_inventory_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'source-page counts differ'):
            self.compile(self.entry('t1', 'Tits, J.', 1),
                         [{'author': 'Tits, J.', 'last_number': 1}], {'325': 1})


if __name__ == '__main__':
    unittest.main()
