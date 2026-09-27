// Figures 3 and 4: the fundamental roots written round a circle at equally
// spaced marks, twelve standing for l, read clockwise from p_l at the top.
#import "@preview/cetz:0.5.2"
#import "root-systems.typ": as-math, indexed, relative

#let coxeter-circle(detail: false) = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let (r, l) = (1.65, 12)
  // The k-th mark clockwise from the top, which carries p_k (p_l = p_0).
  let place(k, radius) = (90deg - k * 360deg / l, radius)
  set-style(stroke: 0.55pt)
  if detail {
    // Figure 4: p_l between its neighbours p_i and p_j.
    let (start, _) = place(2, r)
    let (stop, _) = place(-2, r)
    arc((0, 0), anchor: "origin", start: start, stop: stop, radius: r)
  } else {
    circle((0, 0), radius: r)
  }
  for k in if detail { (-1, 0, 1) } else { range(l) } {
    line(place(k, r - 0.075), place(k, r + 0.075))
  }
  let labels = if detail { ((-1, "i"), (0, "l"), (1, "j")) } else {
    (-1, 0, 1, 2, 3).map(k => (
      k,
      relative(calc.rem-euclid(k - 1, l) + 1, ((0, ""), (l, "l"))),
    ))
  }
  for (k, index) in labels {
    content(place(k, r + 0.32), as-math(indexed("p", index)), anchor: "center")
  }
})
