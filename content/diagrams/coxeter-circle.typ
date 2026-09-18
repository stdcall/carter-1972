// Source Figure3: twelve illustrative marks; only five carry labels.
#import "@preview/cetz:0.5.2"

#let polar(radius, angle) = (
  radius * calc.cos(angle),
  radius * calc.sin(angle),
)

#let coxeter-circle(detail: false) = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let r = 1.65
  if detail {
    arc(
      (0, 0),
      anchor: "origin",
      start: 30deg,
      stop: 150deg,
      radius: r,
      stroke: 0.55pt,
    )
  } else {
    circle((0, 0), radius: r, stroke: 0.55pt)
  }
  let angles = if detail { (60deg, 90deg, 120deg) } else {
    range(12).map(i => 90deg - i * 30deg)
  }
  for angle in angles {
    line(polar(r - 0.075, angle), polar(r + 0.075, angle), stroke: 0.55pt)
  }
  let labels = if detail {
    ((120deg, $p_i$), (90deg, $p_l$), (60deg, $p_j$))
  } else {
    (
      (120deg, $p_(l-1)$),
      (90deg, $p_l$),
      (60deg, $p_1$),
      (30deg, $p_2$),
      (0deg, $p_3$),
    )
  }
  for (angle, body) in labels {
    content(polar(r + 0.32, angle), body, anchor: "center")
  }
})

// Standalone preview; imports use the function and discard this content.
#set page(width: auto, height: auto, margin: 5mm)
#set text(font: "Libertinus Serif", size: 12pt, fill: rgb("202020"))
#show math.equation: set text(font: "STIX Two Math")
#stack(dir: ltr, spacing: 10mm, coxeter-circle(), coxeter-circle(detail: true))
