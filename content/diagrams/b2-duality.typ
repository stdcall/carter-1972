// Figure 7, printed page 204: B2 roots and the angular bisector of a and b.
#import "@preview/cetz:0.5.2"

#let b2-duality() = cetz.canvas(length: 2cm, {
  import cetz.draw: *
  line((-1, 1), (1, 1), (1, -1), (-1, -1), close: true, stroke: 0.55pt)
  line((-1, 1), (1, -1), stroke: 0.55pt)
  line((-1, -1), (1, 1), stroke: 0.55pt)
  line((-1, 0), (1, 0), stroke: 0.55pt)
  line((0, -1), (0, 1), stroke: 0.55pt)
  let dy = 1.42
  let dx = dy * calc.tan(22.5deg)
  line((-dx, -dy), (dx, dy), stroke: (thickness: 0.65pt, dash: "dashed"))
  let nodes = (
    ((-1, 1), $b$, "south"),
    ((0, 1), $a+b$, "south"),
    ((1, 1), $2a+b$, "south"),
    ((-1, 0), $-a$, "east"),
    ((1, 0), $a$, "west"),
    ((-1, -1), $-2a-b$, "north"),
    ((0, -1), $-a-b$, "north"),
    ((1, -1), $-b$, "north"),
  )
  for (pos, label, anchor) in nodes {
    circle(pos, radius: 1.8pt, fill: white, stroke: 0.55pt)
    let (x, y) = pos
    let offset = 0.12
    let point = if anchor == "south" { (x, y + offset) } else if (
      anchor == "north"
    ) { (x, y - offset) } else if anchor == "east" { (x - offset, y) } else {
      (x + offset, y)
    }
    content(point, label, anchor: anchor)
  }
})
