import sys
from pathlib import Path
import unittest
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
