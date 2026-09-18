#import "book-style.typ": book-style
#import "main-defs.typ": book-heading-numbering, chapter-preview-mode

// The book imports only `chapter`; this template is for opening a file alone.
#let chapter-preview(number, body) = {
  show: book-style
  set document(title: "Carter — chapter " + str(number), date: none)
  set heading(numbering: book-heading-numbering)
  counter(heading).update(number - 1)
  chapter-preview-mode.update(true)
  body
}
