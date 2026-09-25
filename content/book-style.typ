#import "statements.typ": statement-rules
#import "main-defs.typ": reference-rules
#import "main-defs.typ": book-heading-body

#let book-style(body) = {
  show: statement-rules
  show: reference-rules
  set page(
    width: 176mm,
    height: 250mm,
    margin: (x: 20mm, top: 21mm, bottom: 21mm),
    header: context if counter(page).get().first() > 2 {
      align(center, text(size: 8pt, tracking: 0.6pt)[SIMPLE GROUPS OF LIE TYPE])
    },
    footer: context if counter(page).get().first() > 1 {
      align(center, text(size: 10pt, counter(page).display("1")))
    },
  )
  set text(
    font: "Libertinus Serif",
    size: 12pt,
    lang: "en",
    region: "GB",
    fill: rgb("202020"),
  )
  show link: set text(fill: rgb("202020"), weight: "regular")
  set par(
    justify: true,
    leading: 0.68em,
    first-line-indent: 1.25em,
    spacing: 1.1em,
  )
  set heading(numbering: none)
  show heading.where(level: 1): it => block(above: 5mm, below: 7mm)[#text(
    size: 22pt,
    weight: "bold",
    book-heading-body(it),
  )]
  show heading.where(level: 2): it => block(above: 5mm, below: 3mm)[#text(
    size: 13pt,
    weight: "bold",
    book-heading-body(it),
  )]
  show heading.where(level: 3): it => block(book-heading-body(it))
  // Keep the existing contents layout while numbering comes from counters.
  show outline.entry: it => context link(
    it.element.location(),
    it.indented(none, if it.prefix() == none { it.inner() } else {
      [#it.prefix() #it.inner()]
    }),
  )
  show math.equation: set text(font: "STIX Two Math")
  // Long derivations may continue at their existing row breaks.
  show math.equation.where(block: true): set block(breakable: true)
  show math.equation.where(block: false): box
  set math.equation(numbering: none)
  set footnote(numbering: n => [‡])
  body
}
