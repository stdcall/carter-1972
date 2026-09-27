// Carter printed296 and302: retractions and algebra/geometry correspondence.
#import "@preview/fletcher:0.5.8": diagram, edge, node

// Both schemes share the arrow weight of the book's figures. Fletcher returns
// an inline box; the block keeps a scheme a displayed element, like the other
// figures, so the paragraph after it is not indented.
#let scheme(..args) = block(breakable: false, diagram(
  edge-stroke: 0.5pt,
  ..args,
))

#let retr = math.op("retr")

#let retraction-scheme() = scheme(
  spacing: 2.45cm,
  $
    Sigma edge(retr_(Sigma', C), ->) & Sigma' edge(retr_(Sigma, C'), ->) & Sigma
  $,
)

// The headings stand 0.85cm above the objects of their columns; physical
// offsets point up.
#let building-correspondence() = scheme(
  spacing: (3.3cm, 1.45cm),
  node((0, 0), [Group with $(B,N)$-pair]),
  node((1, 0), [Building]),
  node((0, 1), [Coxeter group]),
  node((1, 1), [Abstract Coxeter complex]),
  node((rel: (0pt, 0.85cm), to: (0, 0)), [_Algebraic structure_]),
  node((rel: (0pt, 0.85cm), to: (1, 0)), [_Geometric structure_]),
  edge((0, 0), (1, 0), "<->"),
  edge((0, 1), (1, 1), "<->"),
  edge((0, 0), (0, 1), "->"),
  edge((1, 0), (1, 1), "->"),
)
