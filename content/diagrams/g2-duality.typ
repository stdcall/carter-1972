// Figures8–9, source219 and222; bisector75deg when requested.
#import "@preview/cetz:0.5.2"
#let g2-duality(bisector: false) = cetz.canvas(length: 1.8cm, {
  import cetz.draw: *
  let h = calc.sqrt(3) / 2
  let nodes = (
    (1, 0),
    (1.5, h),
    (0.5, h),
    (0, 2 * h),
    (-0.5, h),
    (-1.5, h),
    (-1, 0),
    (-1.5, -h),
    (-0.5, -h),
    (0, -2 * h),
    (0.5, -h),
    (1.5, -h),
  )
  let labels = (
    $a$,
    $3a+b$,
    $2a+b$,
    $3a+2b$,
    $a+b$,
    $b$,
    $-a$,
    $-3a-b$,
    $-2a-b$,
    $-3a-2b$,
    $-a-b$,
    $-b$,
  )
  line(..nodes, close: true, stroke: 0.5pt)
  for i in range(6) { line(nodes.at(i), nodes.at(i + 6), stroke: 0.5pt) }
  if bisector {
    let dy = 1.65
    let dx = dy * calc.tan(15deg)
    line((-dx, -dy), (dx, dy), stroke: (thickness: 0.6pt, dash: "dashed"))
  }
  for (i, (x, y)) in nodes.enumerate() {
    circle((x, y), radius: 1.8pt, fill: white, stroke: 0.5pt)
    let dx = if x > 0 { 0.12 } else if x < 0 { -0.12 } else { 0 }
    let dy = if y > 0 { 0.12 } else if y < 0 { -0.12 } else { 0 }
    let anchor = if y == 0 { if x > 0 { "west" } else { "east" } } else if (
      x == 0
    ) { if y > 0 { "south" } else { "north" } } else {
      (
        (if y > 0 { "south" } else { "north" })
          + "-"
          + (if x > 0 { "west" } else { "east" })
      )
    }
    content((x + dx, y + dy), labels.at(i), anchor: anchor)
  }
})
