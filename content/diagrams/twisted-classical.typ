// Carter source271: numbered D_l fundamental roots.
#import "@preview/cetz:0.5.2"

#let orthogonal-fork() = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let nodes = ((0, 0), (0.65, 0), (1.3, 0), (2.8, 0), (3.5, 0.4), (3.5, -0.4))
  for (i, j) in ((0, 1), (1, 2), (2, 3), (3, 4), (3, 5)) {
    line(nodes.at(i), nodes.at(j), stroke: (
      paint: black,
      thickness: 0.6pt,
      dash: if i == 2 { "dashed" } else { "solid" },
    ))
  }
  for pos in nodes { circle(pos, radius: 0.055, fill: white, stroke: 0.6pt) }
  for (i, lab) in ($1$, $2$, $3$, $l-2$, $l-1$).enumerate() {
    content(
      (
        nodes.at(i).at(0) - if i == 3 { 0.12 } else { 0 },
        nodes.at(i).at(1) + 0.16,
      ),
      lab,
      anchor: "south",
    )
  }
  content((3.5, -0.52), $l$, anchor: "north")
})
