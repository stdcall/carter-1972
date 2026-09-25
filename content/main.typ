// Complete re-typeset book. The include order below is the reading order.
#set document(
  title: "Simple Groups of Lie Type",
  author: "Roger W. Carter",
  date: none,
)
// Reconstructed cover of the 1989 Wiley Classics Library edition (source in
// assets/figures/cover-1989.typ); the lettering is drawn as vector paths.
// The reconstructed 1972 cover is kept as assets/figures/cover.svg.
#page(width: 176mm, height: 250mm, margin: 0pt, header: none, footer: none)[
  #image(
    "../assets/figures/cover-1989.svg",
    width: 176mm,
    height: 250mm,
    alt: (
      "Cover of the Wiley Classics Library edition: black, «Wiley Classics "
        + "Library» in gold script between thin rules, CARTER in white with a "
        + "large initial cutting a yellow band, Simple Groups of Lie Type "
        + "below."
    ),
  )
]
#counter(page).update(1)
#import "book-style.typ": book-style
#import "main-defs.typ": book-heading-numbering
#show: book-style
#import "main-defs.typ": source
#let V = $frak(V)$
#let L = $frak(L)$

// Title information as on the printed series, title and copyright pages.
#set par(first-line-indent: 0pt)
#source(5, "series")
#source(6, "title")
#v(10mm)
#text(size: 17pt)[Roger W. Carter]
#v(23mm)
#text(size: 34pt, weight: "regular")[Simple Groups\ of Lie Type]
#v(12mm)
#line(length: 26mm, stroke: 0.65pt)
// As on the 1989 title page: the series page of 1972 (Pure and Applied
// Mathematics, Volume XXVIII) is dropped, the reprint line is added.
#v(1fr)
#text(size: 11pt, style: "italic")[A Wiley-Interscience Publication]
#v(2mm)
#text(size: 10pt)[Wiley Classics Library Edition Published 1989]
#v(4mm)
#text(size: 12pt)[John Wiley & Sons]
#parbreak()
#text(size: 10pt)[London · New York · Sydney · Toronto]

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
#include "01-classical-simple-groups.typ"
#pagebreak()
#include "02-weyl-groups.typ"
#pagebreak()
#include "03-simple-lie-algebras.typ"
#pagebreak()
#include "04-chevalley-groups.typ"
#pagebreak()
#include "05-unipotent-subgroups.typ"
#pagebreak()
#include "06-root-sl2-subgroups.typ"
#pagebreak()
#include "07-diagonal-and-monomial-subgroups.typ"
#pagebreak()
#include "08-bruhat-decomposition.typ"
#pagebreak()
#include "09-polynomial-invariants.typ"
#pagebreak()
#include "10-exponents.typ"
#pagebreak()
#include "11-properties-of-chevalley-groups.typ"
#pagebreak()
#include "12-generators-relations-and-automorphisms.typ"
#pagebreak()
#include "13-twisted-simple-groups.typ"
#pagebreak()
#include "14-properties-of-twisted-groups.typ"
#pagebreak()
#include "15-geometrical-structures.typ"
#pagebreak()
#include "16-sporadic-simple-groups.typ"
#pagebreak()
#set heading(numbering: none)
// Added in the 1989 reprint, between chapter 16 and the bibliography.
#include "17-supplement.typ"
#pagebreak()
#include "90-bibliography.typ"
#pagebreak()
#include "91-notation-index.typ"
#pagebreak()
#include "92-subject-index.typ"

// Literature for the editorial footnotes (editorial.bib). It is not printed as
// a list: a footnote cites it in full.
#[
  #show bibliography: none
  #bibliography("../editorial.bib", style: "chicago-notes")
]
