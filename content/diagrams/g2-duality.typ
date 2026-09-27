// Figures 8 and 9 of chapter 12: the roots of G_2, in Figure 8 with the line
// bisecting a and b.
#import "root-systems.typ": cartan, root-system

#let g2-duality(bisector: false) = root-system(
  cartan("G", 2),
  unit: 1.8cm,
  diagonal: 0.12,
  bisector: if bisector { (1.65, 0.6pt) },
)
