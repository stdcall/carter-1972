// Printed page 271: the fundamental roots of D_l numbered 1, …, l.
#import "root-systems.typ": bonds, cartan, dynkin, path-layout, relative

#let orthogonal-fork() = {
  let n = bonds(cartan("D", 7))
  let at = path-layout(n, (0, 0.65, 1.3, 2.8), skip: (3,), fork: (0.7, 0.4))
  let numbered(i, offset, anchor) = (
    i,
    relative(i + 1, ((0, ""), (7, "l"))),
    offset,
    anchor,
  )
  dynkin(
    n,
    at,
    labels: (0, 1, 2, 5).map(i => numbered(i, (0, 0.16), "south"))
      + (numbered(4, (-0.12, 0.16), "south"), numbered(6, (0, -0.12), "north")),
    stroke: 0.6pt,
    radius: 0.055,
  )
}
