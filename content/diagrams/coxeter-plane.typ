// Source Figure5, exact equal-radius geometry; illustrative acute angle.
#import "@preview/cetz:0.5.2"

#let coxeter-plane(reflected: false) = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let r = 1.55
  let opening = 40deg
  let b = (r * calc.cos(opening), r * calc.sin(opening))
  circle((0, 0), radius: r, stroke: 0.55pt)
  line((0, 0), (r, 0), stroke: 0.55pt)
  line((0, 0), b, stroke: 0.55pt)
  if reflected {
    line((0, 0), (b.at(0), -b.at(1)), stroke: 0.55pt)
    content((b.at(0) + 0.08, -b.at(1) - 0.07), $c$, anchor: "north-west")
    arc(
      (0, 0),
      anchor: "origin",
      start: -opening,
      stop: 0deg,
      radius: 0.35,
      stroke: 0.45pt,
    )
    content((0.53, -0.19), $theta$, anchor: "center")
    content((-1.45, 0.70), $Gamma$, anchor: "east")
  } else {
    line(b, (b.at(0), 0), stroke: 0.55pt)
    content((b.at(0), -0.10), $lambda a$, anchor: "north")
  }
  arc(
    (0, 0),
    anchor: "origin",
    start: 0deg,
    stop: opening,
    radius: 0.35,
    stroke: 0.45pt,
  )
  content((-0.08, -0.04), $O$, anchor: "east")
  content((r + 0.09, 0), $a$, anchor: "west")
  content((b.at(0) + 0.08, b.at(1) + 0.07), $b$, anchor: "south-west")
  content((0.53, 0.19), $theta$, anchor: "center")
})
