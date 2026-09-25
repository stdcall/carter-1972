"""Counters must follow document order without encoding numbers in labels."""
import json
from pathlib import Path
import subprocess
import tempfile
import unittest

import fitz
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[2]
QUERY = 'query(metadata).filter(it => it.value.at("kind", default: "") == "statement").map(it => (label: it.value.id, number: it.value.number))'


class Statements(unittest.TestCase):
    def compile(self, content):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            source = Path(folder)/'main.typ'
            pdf = Path(folder)/'main.pdf'
            source.write_text('''#import "/content/statements.typ": *
#import "/content/main-defs.typ": *
#show: statement-rules
#show: reference-rules
#set heading(numbering: book-heading-numbering)
'''+content)
            subprocess.run(['typst', 'compile', '--root', str(ROOT), str(source), str(pdf)],
                           check=True, capture_output=True)
            rows = json.loads(subprocess.check_output(
                ['typst', 'eval', QUERY, '--root', str(ROOT), '--in', str(source),
                 '--format', 'json'], text=True))
            with fitz.open(pdf) as document:
                self.words = [word for page in document for word in page.get_text('words')]
            return {r['label']: r['number'] for r in rows}, '\n'.join(
                p.extract_text() for p in PdfReader(pdf).pages)

    def test_inserted_statement_updates_forward_references_and_resets(self):
        body = '''= Chapter <ch:test>
== First <sec:first>
See @l:factorization[Lemma], @th:existence[Theorem].
INSERT
#lemma()[The factorization exists.] <l:factorization>
#proof[An argument.]
#theorem()[The object exists.] <th:existence>
== Second <sec:second>
#proposition()[The object is unique.] <p:uniqueness>
'''
        numbers, text = self.compile(body.replace('INSERT', ''))
        self.assertEqual(numbers, {'l:factorization': '1.1.1',
                                  'th:existence': '1.1.2', 'p:uniqueness': '1.2.1'})
        self.assertIn('See Lemma 1.1.1, Theorem 1.1.2.', text)
        numbers, text = self.compile(body.replace('INSERT',
            '#definition()[An object is defined.] <def:object>'))
        self.assertEqual(numbers['l:factorization'], '1.1.2')
        self.assertEqual(numbers['th:existence'], '1.1.3')
        self.assertEqual(numbers['p:uniqueness'], '1.2.1')
        self.assertIn('See Lemma 1.1.2, Theorem 1.1.3.', text)

    def test_statement_and_subsection_share_counter(self):
        numbers, text = self.compile('''#counter(heading).update(10)
= Matrix groups <ch:matrix-groups>
#counter(heading).step(level: 2)
== Classical algebras <sec:classical-algebras>
=== Type A <sec:type-a>
#lemma()[#block(sticky: true)[Let $A$ be a matrix.]
$ exp(A) = I. $] <l:form-exponential>
=== Type D <sec:type-d>
''')
        self.assertEqual(numbers, {'l:form-exponential': '11.2.2'})
        self.assertIn('11.2.3 Type D', text)
        self.assertIn('Lemma 11.2.2. Let', text)

    def test_statement_preserves_lists_and_grids(self):
        numbers, text = self.compile('''= Chapter <ch:chapter>
== Section <sec:section>
#theorem()[
#enum(numbering: "(i)", [First condition.], [Second condition.])
] <th:conditions>
#theorem()[
#grid(columns: (auto, 1fr), column-gutter: 1em,
  [(i)], [Alpha], [(ii)], [Beta])
] <th:degree-identities>
''')
        self.assertIn('(i) First condition.', text)
        self.assertIn('(ii) Second condition.', text)
        self.assertNotIn('1. First condition.', text)
        alpha = next(w for w in self.words if w[4] == 'Alpha')
        beta = next(w for w in self.words if w[4] == 'Beta')
        self.assertAlmostEqual(alpha[0], beta[0], places=2)
        self.assertGreater(beta[1], alpha[1]+5)

    def test_proof_automatically_ends_final_paragraph_inside_layout_block(self):
        _, text = self.compile('''#proof[
#block(breakable: false)[
An argument ending with a formula:
$ x = 1. $
Finished.

]
]
''')
        self.assertIn('Proof. An argument', text)
        self.assertEqual(text.count('■'), 1)
        last = next(w for w in self.words if w[4] == 'Finished.')
        marker = next(w for w in self.words if w[4] == '■')
        self.assertGreater(marker[0], last[2])
        self.assertAlmostEqual(marker[3], last[3], delta=2)

    def test_nested_and_unfinished_proofs_have_independent_endings(self):
        _, text = self.compile('''#proof(qed: false)[Introduction.]
#proof[
Outer argument.

#proof[Auxiliary argument.]

#block(breakable: false)[$ x = 1. $]
]
#proof(continued: true)[Conclusion.]
''')
        self.assertEqual(text.count('Proof.'), 3)
        self.assertEqual(text.count('■'), 3)
        self.assertNotIn('■', text.split('Outer argument.')[0])
        auxiliary = text.index('Auxiliary argument.')
        conclusion = text.index('Conclusion.')
        self.assertEqual(text[auxiliary:conclusion].count('■'), 2)


if __name__ == '__main__':
    unittest.main()
