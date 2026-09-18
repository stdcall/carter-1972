// Carter source265: the four central roots of the A_(2k) diagram.
#import "@preview/cetz:0.5.2"

#let unitary-chain() = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let xs = (0, 0.65, 2, 2.65, 3.3, 3.95, 5.3, 5.95)
  for i in range(7) {
    line(
      (xs.at(i), 0),
      (xs.at(i + 1), 0),
      stroke: (
        paint: black,
        thickness: 0.6pt,
        dash: if i in (1, 5) { "dashed" } else { "solid" },
      ),
    )
  }
  for x in xs { circle((x, 0), radius: 0.055, fill: white, stroke: 0.6pt) }
  for (i, lab) in ($r$, $s$, $overline(s)$, $overline(r)$).enumerate() {
    content((xs.at(i + 2), 0.12), lab, anchor: "south")
  }
})

// Standalone preview; importing this file does not insert the preview.
#import "../diagram-preview.typ": diagram-preview
#show: diagram-preview
#unitary-chain()
