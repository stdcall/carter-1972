// Carter printed278: chambers and their shared panel under a folding.
#import "@preview/cetz:0.5.2"
#let folding-panel() = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  for (offset, labels) in (
    (0, ($overline(alpha)(D)$, $D''$, $A$)),
    (4.8, ($D$, $D'$, $D inter D'$)),
  ) {
    let a = (offset, 0)
    let b = (offset - 0.85, 0.9)
    let c = (offset + 0.85, 0.9)
    line(b, a, c, stroke: 0.7pt)
    for pos in (a, b, c) {
      circle(pos, radius: 0.055, fill: white, stroke: 0.7pt)
    }
    content((offset - 0.85, 1.08), labels.at(0), anchor: "south")
    content((offset + 0.85, 1.08), labels.at(1), anchor: "south")
    content((offset, -0.16), labels.at(2), anchor: "north")
  }
  line((1.65, 0.48), (3.15, 0.48), mark: (end: ">"), stroke: 0.7pt)
  content((2.4, 0.64), $alpha$, anchor: "south")
})

// Standalone preview; importing this file does not insert the preview.
#import "../diagram-preview.typ": diagram-preview
#show: diagram-preview
#folding-panel()
