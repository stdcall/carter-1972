import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
from lint_typst import source_checks, semantic_checks
from project import formatter_command


class FormatterConfiguration(unittest.TestCase):
    def test_editor_boolean_maps_to_cli_wrapping_mode(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root/'.vscode').mkdir()
            (root/'config').mkdir()
            (root/'config/project.json').write_text('{"format_sources": ["content"]}')
            config = {'tinymist.formatterPrintWidth': 80,
                      'tinymist.formatterIndentSize': 2}
            path = root/'.vscode/settings.json'
            for enabled, mode in [(True, 'fill'), (False, 'none')]:
                config['tinymist.formatterProseWrap'] = enabled
                path.write_text(json.dumps(config))
                self.assertIn('--wrap-text='+mode, formatter_command(root))
            config['tinymist.formatterProseWrap'] = 'fill'
            path.write_text(json.dumps(config))
            with self.assertRaisesRegex(ValueError, 'must be a boolean'):
                formatter_command(root)


class SourceRules(unittest.TestCase):
    def test_reference_number_is_not_a_statement(self):
        self.assertNotIn('T011', self.rules('#book-ref("cor", "2-3-5", [Corollary 2.3.5])\n'))

    def test_line_length_limit(self):
        self.assertNotIn('T004', self.rules('x' * 80 + '\n'))
        self.assertIn('T004', self.rules('x' * 81 + '\n'))

    def rules(self, source, config=None):
        errors, _ = source_checks('content/test.typ', source, config or {})
        return {e['rule'] for e in errors}

    def test_subscript_argument_regression(self):
        self.assertIn('T020', self.rules('$GL_n(K)$\n'))

    def test_superscript_call_regression(self):
        self.assertIn('T024', self.rules('$q^N(q-1)$\n'))
        self.assertIn('T024', self.rules('$phi^G(g)$\n'))
        self.assertNotIn('T024', self.rules('$q^N (q-1), phi^G (g)$\n'))
        self.assertNotIn('T024', self.rules('$t^(f(x)), (-1)^abs(J)$\n'))
        self.assertNotIn('T024', self.rules('// $q^N(q-1)$\n'))

    def test_explicit_index_group_and_separate_argument(self):
        self.assertNotIn('T020', self.rules('$GL_n (K), x_(f(n)), GL_2(K), x_(-r)(u)$\n'))

    def test_comments_and_strings_do_not_create_labels(self):
        errors, labels = source_checks('main.typ', '// <wrong> $GL_n(K)$\n/* nested /* <bad> */ */\n#let x = "<fake> $GL_n(K)$"\n', {})
        self.assertFalse(errors)
        self.assertFalse(labels)

    def test_latex_command_but_not_literal_quotient(self):
        self.assertIn('T021', self.rules('$\\frac{1}{2}$\n'))
        self.assertFalse(self.rules('$G\\/Z$\n'))

    def test_doubled_math_linebreak(self):
        self.assertIn('T025', self.rules('$ a=b '+ '\\' * 2 + '\n &=c $\n'))
        self.assertNotIn('T025', self.rules('$ a=b '+ '\\' + '\n &=c $\n'))
        self.assertNotIn('T025', self.rules('// $ a=b '+ '\\' * 2 + '\n'))

    def test_conjugation_not_vertical_fences(self):
        self.assertIn('T022', self.rules('$bar(lambda)$\n'))
        self.assertNotIn('T022', self.rules('$overline(lambda), abs(lambda)$\n'))

    def test_prime_does_not_attach_to_subscript(self):
        self.assertIn('T023', self.rules("$v_i', v_(k-1)'$\n"))
        self.assertNotIn('T023', self.rules("$v'_i, v'_(k-1), v_(i')$\n"))

    def test_external_page_exception_and_stale_exception(self):
        config = {'external_page_literals': {'content/test.typ': {'p. 182':'Huppert [1]'}}}
        self.assertNotIn('T030', self.rules('Huppert p. 182.\n', config))
        self.assertIn('T030', self.rules('See p. 12.\n', config))
        self.assertIn('T099', self.rules('No citation.\n', config))

    def test_citations_require_individual_links(self):
        self.assertIn('T017', self.rules(r'Author \[1, 2\]'+'\n'))
        self.assertNotIn('T017', self.rules('Author #bib-ref("work1", "work2")\n'))

    def test_label_prefix(self):
        self.assertIn('T010', self.rules('= A <theorem1>\n'))
        self.assertNotIn('T010', self.rules('$ x=0 $ <eq:sum-identity>\n'))
        self.assertIn('T010', self.rules('$ x=0 $ <eq:1-2-3>\n'))

    def test_confusable_and_placeholder(self):
        self.assertIn('T002', self.rules('The grоup\n'))  # Cyrillic о
        self.assertIn('T003', self.rules('UNREADABLE\n'))

    def test_manual_statement_and_proof_headers_are_rejected(self):
        for source in ['#smallcaps[Lemma 1.2.3.]', '#smallcaps[Proof.]',
                       '_Definition 1.2.3._', '_Example 1.2.3._', '#qed']:
            self.assertIn('T011', self.rules(source+'\n'))
        self.assertNotIn('T011', self.rules('#lemma(<l:root-factorization>)[Text.]\n'))



class SemanticRules(unittest.TestCase):
    def setUp(self):
        self.data = {'headings':[{'label':'<ch:chapter>', 'level':1, 'number':'1', 'body':{'text':'Chapter'}}],
                     'equations':[{'label':'<eq:1-1>'}],
                     'metadata':[{'label':'<pg:source-1>', 'value':{'kind':'source', 'file-page':14, 'printed-page':'1'}}]}

    def rules(self, data=None):
        return {e['rule'] for e in semantic_checks(data or self.data, [14])}

    def test_valid_document(self):
        self.assertFalse(self.rules())

    def test_floating_figure_requires_physical_anchor(self):
        self.data['figures'] = [{'label': '<fig:5>', 'floating': True}]
        self.assertIn('T018', self.rules())
        self.data['figures'][0]['label'] = None
        self.assertNotIn('T018', self.rules())
        self.data['figures'][0] = {'label': '<fig:5>', 'floating': False}
        self.assertNotIn('T018', self.rules())

    def test_display_label_must_belong_to_equation(self):
        self.data['equations'][0]['label'] = None
        self.assertIn('T013', self.rules())

    def test_duplicate_evaluated_dynamic_label(self):
        self.data['metadata'].append(copy.deepcopy(self.data['metadata'][0]))
        self.assertIn('T010', self.rules())
        self.assertIn('T015', self.rules())

    def test_statement_requires_correct_semantic_prefix(self):
        item = {'label': '<th:root-factorization>', 'value': {
            'kind': 'statement', 'type': 'Lemma', 'number': '13.5.1'}}
        self.data['metadata'].append(item)
        self.assertIn('T011', self.rules())
        item['label'] = '<l:root-factorization>'
        self.assertNotIn('T011', self.rules())

    def test_source_offset(self):
        self.data['metadata'][0]['value']['file-page'] = 15
        self.assertIn('T015', self.rules())

    def test_missing_reference_is_always_an_error(self):
        for target in ['ch:missing', 'sec:missing', 'th:1-1-1', 'bib:missing']:
            with self.subTest(target=target):
                data = copy.deepcopy(self.data)
                data['metadata'].append({'value': {
                    'kind': 'cross-reference', 'target': target, 'resolved': False}})
                self.assertIn('T014', self.rules(data))

    def test_missing_source_page_is_an_error(self):
        self.data['metadata'].append({'value': {
            'kind': 'page-reference', 'original-page': '2', 'resolved': False}})
        self.assertIn('T014', self.rules())

    def test_number_only_subsection_uses_counter_and_semantic_label(self):
        self.data['headings'].append({
            'body': {}, 'number': '13.3.8', 'level': 3,
            'label': '<sec:folded-diagram-classification>'})
        self.assertNotIn('T012', self.rules())
        self.data['headings'][-1]['label'] = '<sec:13-3>'
        self.assertIn('T012', self.rules())

    def test_numbered_heading_requires_semantic_label(self):
        self.data['headings'][0]['label'] = '<ch:2>'
        self.assertIn('T012', self.rules())

    def test_heading_cannot_hardcode_its_number(self):
        self.data['headings'][0]['body'] = {'text': '1. Chapter'}
        self.assertIn('T012', self.rules())


if __name__ == '__main__':
    unittest.main()
