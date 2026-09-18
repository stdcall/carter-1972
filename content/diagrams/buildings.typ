// Carter printed296 and302: retractions and algebra/geometry correspondence.
#import "@preview/cetz:0.5.2"

#let retraction-scheme() = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let retr = math.op("retr")
  content((0, 0), $Sigma$)
  content((3.2, 0), $Sigma'$)
  content((6.4, 0), $Sigma$)
  for (left, right, label) in (
    (0.3, 2.85, $retr_(Sigma',C)$),
    (3.55, 6.1, $retr_(Sigma,C')$),
  ) {
    line((left, 0), (right, 0), mark: (end: ">"), stroke: 0.65pt)
    content(((left + right) / 2, 0.15), label, anchor: "south")
  }
})

#let building-correspondence() = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  content((0, 2), [_Algebraic structure_])
  content((8, 2), [_Geometric structure_])
  content((0, 1.15), [Group with $(B,N)$-pair])
  content((8, 1.15), [Building])
  content((0, -0.9), [Coxeter group])
  content((8, -0.9), [Abstract Coxeter complex])
  for (left, right, y) in ((2.6, 6.85, 1.15), (2, 4.8, -0.9)) {
    line((left, y), (right, y), mark: (start: ">", end: ">"), stroke: 0.7pt)
  }
  for x in (0, 8) {
    line((x, 0.8), (x, -0.55), mark: (end: ">"), stroke: 0.7pt)
  }
})

// Standalone preview; importing this file does not insert the preview.
#import "../diagram-preview.typ": diagram-preview
#show: diagram-preview
#retraction-scheme()

#v(10mm)
#building-correspondence()
