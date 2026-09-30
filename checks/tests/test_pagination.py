"""Printed folios and PDF labels must agree across numbering transitions."""
from pathlib import Path
import sys
import tempfile
import unittest

import pymupdf
from pypdf import PdfReader, PdfWriter

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'scripts'))
from build import check_book_pagination, set_book_page_labels


class Pagination(unittest.TestCase):
    def make_pdf(self, folder, folios, body_start):
        raw, output = Path(folder)/'raw.pdf', Path(folder)/'final.pdf'
        with pymupdf.open() as document:
            for folio in folios:
                page = document.new_page(width=500, height=700)
                page.insert_text((60, 100), 'Page body')
                if folio:
                    page.insert_text((245, 665), folio)
            document.save(raw)
        writer = PdfWriter(raw, incremental=True)
        set_book_page_labels(writer, body_start)
        writer.write(output)
        return output

    def test_extra_preliminary_page_moves_the_arabic_reset(self):
        for folios, body_start, expected in [
            (['', '', '', 'iii', '1', '2'], 4,
             ['Cover', 'i', 'ii', 'iii', '1', '2']),
            (['', '', '', 'iii', 'iv', '1', '2'], 5,
             ['Cover', 'i', 'ii', 'iii', 'iv', '1', '2']),
        ]:
            with self.subTest(body_start=body_start):
                with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
                    pdf = self.make_pdf(folder, folios, body_start)
                    self.assertEqual(PdfReader(pdf).page_labels, expected)
                    self.assertEqual(check_book_pagination(pdf, body_start), {
                        'first_body_pdf_page': body_start+1,
                        'visible_folios_checked': len(folios)-3,
                    })

    def test_copyright_folio_is_rejected(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            pdf = self.make_pdf(folder, ['', '', 'ii', 'iii', '1', '2'], 4)
            with self.assertRaisesRegex(AssertionError, 'PDF page 3: folio'):
                check_book_pagination(pdf, 4)

    def test_missing_number_after_reset_is_rejected(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'build/.cache') as folder:
            pdf = self.make_pdf(folder, ['', '', '', 'iii', '1', ''], 4)
            with self.assertRaisesRegex(AssertionError, 'PDF page 6: folio'):
                check_book_pagination(pdf, 4)


if __name__ == '__main__':
    unittest.main()
