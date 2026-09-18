from pathlib import Path
import sys
from tempfile import TemporaryDirectory
import unittest

import fitz

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
from check_whitespace import check_whitespace


class RenderedWhitespace(unittest.TestCase):
    def make_pdf(self, path, vector=False, next_text='Second page'):
        with fitz.open() as doc:
            for text in ['First page', next_text]:
                page = doc.new_page(width=176 * 72 / 25.4,
                                    height=250 * 72 / 25.4)
                page.insert_text((60, 35), 'Running header')
                page.insert_text((60, 100), text)
                page.insert_text((240, 675), 'Footer')
                if vector:
                    page.draw_line((60, 642), (200, 642))
            doc.save(path)

    def test_footer_cannot_hide_large_body_gap(self):
        with TemporaryDirectory() as tmp:
            pdf = Path(tmp) / 'gap.pdf'
            self.make_pdf(pdf)
            report = check_whitespace(pdf, [
                {'title': 'Preface', 'depth': 0, 'pdf_page': 1}])
            self.assertEqual(report['pages_requiring_review'], [1])
            self.assertGreater(report['pages'][0]['gap_pt'], 500)

    def test_vector_ink_and_chapter_ending(self):
        with TemporaryDirectory() as tmp:
            pdf = Path(tmp) / 'vector.pdf'
            self.make_pdf(pdf, vector=True)
            marks = [{'title': 'Preface', 'depth': 0, 'pdf_page': 1}]
            report = check_whitespace(pdf, marks)
            self.assertLess(report['pages'][0]['gap_pt'], 10)
            self.assertEqual(report['status'], 'passed')
            pdf = Path(tmp) / 'chapter.pdf'
            self.make_pdf(pdf)
            marks.append({'title': '1. Chapter', 'depth': 0, 'pdf_page': 2})
            report = check_whitespace(pdf, marks)
            self.assertEqual(report['status'], 'passed')
            self.assertEqual(report['pages'][0]['classification'],
                             'before chapter or major division')

    def test_two_line_spill_is_not_exempt_as_a_chapter_ending(self):
        with TemporaryDirectory() as tmp:
            pdf = Path(tmp) / 'spill.pdf'
            self.make_pdf(pdf)
            complete = Path(tmp) / 'three-pages.pdf'
            with fitz.open(pdf) as doc:
                doc[0].draw_line((60, 642), (200, 642))
                doc.new_page(width=doc[0].rect.width,
                             height=doc[0].rect.height)
                doc[-1].insert_text((60, 100), 'Next chapter')
                doc.save(complete)
            report = check_whitespace(complete, [
                {'title': 'Preface', 'depth': 0, 'pdf_page': 1},
                {'title': 'Next chapter', 'depth': 0, 'pdf_page': 3}])
            self.assertEqual(report['pages_requiring_review'], [2])


if __name__ == '__main__':
    unittest.main()
