// Figures 5 and 6: the circle Γ through a and b, inclined at an illustrative
// acute angle θ; λa is the projection of b on Oa, and c the reflection of b
// in Oa.
#import "@preview/cetz:0.5.2"

#let coxeter-plane(reflected: false) = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let (r, opening) = (1.55, 40deg)
  set-style(
    stroke: 0.55pt,
    angle: (radius: 0.35, label-radius: 0.56, stroke: 0.45pt),
  )
  let (o, a, b) = ((0, 0), (0deg, r), (opening, r))
  let foot = (b, "_|_", o, a)
  circle(o, radius: r)
  line(o, a)
  line(o, b)
  if reflected {
    let c = (b, 200%, foot)
    line(o, c)
    content((rel: (0.08, -0.07), to: c), $c$, anchor: "north-west")
    cetz.angle.angle(o, c, a, label: $theta$)
    content((-1.45, 0.70), $Gamma$, anchor: "east")
  } else {
    line(b, foot)
    content((rel: (0, -0.10), to: foot), $lambda a$, anchor: "north")
  }
  cetz.angle.angle(o, a, b, label: $theta$)
  content((rel: (-0.08, -0.04), to: o), $O$, anchor: "east")
  content((rel: (0.09, 0), to: a), $a$, anchor: "west")
  content((rel: (0.08, 0.07), to: b), $b$, anchor: "south-west")
})
