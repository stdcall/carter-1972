// Complete re-typeset book. The include order below is the reading order.
#set document(
  title: "Simple Groups of Lie Type",
  author: "Roger W. Carter",
  date: none,
)
// Reconstructed 1972 cover; text/lettering are vector paths, no scan image.
#page(width: 176mm, height: 250mm, margin: 0pt, header: none, footer: none)[
  #image(
    "../assets/figures/cover.svg",
    width: 176mm,
    height: 250mm,
    alt: (
      "Original cover design: dark violet, three thin geometric lines reading "
        + "simple groups of lie type, middle line red, Roger W.Carter in red "
        + "below."
    ),
  )
]
#counter(page).update(1)
#set page(
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
#set text(font: "Libertinus Serif", size: 12pt, lang: "en", fill: rgb("202020"))
#show link: set text(fill: rgb("202020"), weight: "regular")
#set par(
  justify: true,
  leading: 0.68em,
  first-line-indent: 1.25em,
  spacing: 1.1em,
)
#set heading(numbering: none)
#import "main-defs.typ": book-heading-body, book-heading-numbering
#show heading.where(level: 1): it => block(above: 5mm, below: 7mm)[#text(
  size: 22pt,
  weight: "bold",
  book-heading-body(it),
)]
#show heading.where(level: 2): it => block(above: 5mm, below: 3mm)[#text(
  size: 13pt,
  weight: "bold",
  book-heading-body(it),
)]
#show heading.where(level: 3): it => block(book-heading-body(it))
// Keep the existing contents layout while numbering comes from counters.
#show outline.entry: it => context link(
  it.element.location(),
  it.indented(none, if it.prefix() == none { it.inner() } else {
    [#it.prefix() #it.inner()]
  }),
)
#show math.equation: set text(font: "STIX Two Math")
// Long derivations may continue at their existing row breaks.
#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set math.equation(numbering: none)
#set footnote(numbering: n => [‡])
#import "main-defs.typ": source
#let V = $frak(V)$
#let L = $frak(L)$

// Title information verified against file pages 5–7.
#set par(first-line-indent: 0pt)
#source(5, "series")
#source(6, "title")
#v(10mm)
#text(size: 17pt)[Roger W. Carter]
#v(23mm)
#text(size: 34pt, weight: "regular")[Simple Groups\ of Lie Type]
#v(12mm)
#line(length: 26mm, stroke: 0.65pt)
#v(7mm)
#text(size: 11pt)[Pure and Applied Mathematics\ Volume XXVIII]
#v(3mm)
#text(size: 10pt)[A Series of Texts and Monographs]
#parbreak()
#text(size: 10pt)[Edited by R. Courant · L. Bers · J. J. Stoker]
#v(1fr)
#text(size: 11pt)[A Wiley-Interscience Publication]
#v(4mm)
#text(size: 12pt)[John Wiley & Sons]
#parbreak()
#text(size: 10pt)[London · New York · Sydney · Toronto\ 1972]

#pagebreak()
#include "frontmatter/publication.typ"
#pagebreak()
#heading(level: 1, outlined: false, bookmarked: true)[Contents]
#outline(title: none, depth: 2, indent: 1.2em)
#pagebreak()
#set par(first-line-indent: 1.25em)
#include "00-preface.typ"
#pagebreak()
#set heading(numbering: book-heading-numbering)
#import "01-classical-simple-groups.typ": chapter
#chapter
#pagebreak()
#import "02-weyl-groups.typ": chapter
#chapter
#pagebreak()
#import "03-simple-lie-algebras.typ": chapter
#chapter
#pagebreak()
#import "04-chevalley-groups.typ": chapter
#chapter
#pagebreak()
#import "05-unipotent-subgroups.typ": chapter
#chapter
#pagebreak()
#import "06-root-sl2-subgroups.typ": chapter
#chapter
#pagebreak()
#import "07-diagonal-and-monomial-subgroups.typ": chapter
#chapter
#pagebreak()
#import "08-bruhat-decomposition.typ": chapter
#chapter
#pagebreak()
#import "09-polynomial-invariants.typ": chapter
#chapter
#pagebreak()
#import "10-exponents.typ": chapter
#chapter
#pagebreak()
#import "11-properties-of-chevalley-groups.typ": chapter
#chapter
#pagebreak()
#import "12-generators-relations-and-automorphisms.typ": chapter
#chapter
#pagebreak()
#import "13-twisted-simple-groups.typ": chapter
#chapter
#pagebreak()
#import "14-properties-of-twisted-groups.typ": chapter
#chapter
#pagebreak()
#import "15-geometrical-structures.typ": chapter
#chapter
#pagebreak()
#import "16-sporadic-simple-groups.typ": chapter
#chapter
#pagebreak()
#set heading(numbering: none)
#include "90-bibliography.typ"
#pagebreak()
#include "91-notation-index.typ"
#pagebreak()
#include "92-subject-index.typ"
