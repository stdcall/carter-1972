"""Lean proofs are bound to the labels of the passages they check."""
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'checks' / 'lean'))
from check_proofs import MANIFEST, passage_problems


class LeanBindings(unittest.TestCase):
    def setUp(self):
        self.manifest = json.loads(MANIFEST.read_text())

    def test_every_passage_is_a_label_of_the_book(self):
        self.assertEqual(passage_problems(self.manifest), [])

    def test_missing_label_names_the_proof_file_and_the_label(self):
        proof = self.manifest['proofs'][0]
        proof['passages'].append('eq:no-such-passage')
        self.assertEqual(passage_problems(self.manifest), [
            f'{proof["file"]}: label <eq:no-such-passage> is not in content/*.typ'])

    def test_every_proof_names_distinct_passages(self):
        first, second = self.manifest['proofs'][:2]
        first['passages'] = []
        second['passages'] *= 2
        self.assertEqual(passage_problems(self.manifest), [
            f'{first["file"]}: empty or repeated passages',
            f'{second["file"]}: empty or repeated passages'])


if __name__ == '__main__':
    unittest.main()
