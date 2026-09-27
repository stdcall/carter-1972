// Figure 7, printed page 204: the roots of B_2 and the line bisecting a, b.
#import "root-systems.typ": cartan, root-system

#let b2-duality() = root-system(
  cartan("B", 2),
  unit: 2cm,
  stroke: 0.55pt,
  bisector: (1.42, 0.65pt),
)
