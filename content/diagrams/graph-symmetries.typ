// Section 12.2: the undirected Dynkin diagrams with their non-trivial
// symmetries ρ. The arcs show ρ, not root lengths; each is drawn from a node
// to its image, and symmetric arcs are completed by the reflection of the
// picture that realizes ρ.
#import "root-systems.typ": (
  across, bonds, cartan, complete, dynkin, flip, mirror-arc, path-layout,
  symmetry, symmetry-arc,
)

#let style = (stroke: 0.5pt, radius: 1.8pt, spacing: (0.045, 0.065))

#let symmetric-diagram(kind) = {
  let (a, at, arcs) = if kind == "A" {
    let a = cartan("A", 7)
    let rho = symmetry(a, range(7).rev())
    let axis = across(2.6)
    let at = complete(path-layout(bonds(a), 0.8, skip: range(3, 7)), rho, axis)
    (a, at, (symmetry-arc(at, rho, 1, (0, 0.12), (1, 0.8), mirror: axis),))
  } else if kind == "D" {
    let a = cartan("D", 7)
    let rho = symmetry(a, (0, 1, 2, 3, 4, 6, 5))
    let xs = (0, 0.8, 1.6, 3.6)
    let at = path-layout(bonds(a), xs, skip: (3,), fork: (0.8, 0.28))
    (a, at, (symmetry-arc(at, rho, 5, (0.1, 0), (0.5, -0.12), mirror: flip),))
  } else if kind == "E6" {
    let a = cartan("E", 6)
    let rho = symmetry(a, (5, 4, 2, 3, 1, 0))
    let axis = across(1.6)
    let at = complete(path-layout(bonds(a), 0.8, drop: 0.5), rho, axis)
    (a, at, (symmetry-arc(at, rho, 0, (0, 0.12), (0.8, 0.62), mirror: axis),))
  } else if kind == "D4" {
    // ρ has order 3: two arcs are images of each other under the reflection
    // in the axis, the third is symmetric.
    let a = cartan("D", 4)
    let rho = symmetry(a, (3, 1, 0, 2))
    let at = path-layout(bonds(a), 0.8, fork: (0.8, 0.55))
    let enter = ((0.04, 0.13), (0.31, 0.52))
    let first = symmetry-arc(
      at,
      rho,
      2,
      (-0.14, 0.06),
      (-0.56, 0.25),
      enter: enter,
    )
    let last = symmetry-arc(
      at,
      rho,
      3,
      (0.12, 0.07),
      (0.34, 0.28),
      mirror: flip,
    )
    (a, at, (first, mirror-arc(first, flip), last))
  } else {
    let a = cartan(kind.first(), int(kind.last()))
    let rho = symmetry(a, range(a.len()).rev())
    let axis = across(0.4 * (a.len() - 1))
    let at = complete(path-layout(bonds(a), 0.8), rho, axis)
    let bend = (B2: (0.2, 0.35), G2: (0.2, 0.35), F4: (0.6, 0.55)).at(kind)
    (a, at, (symmetry-arc(at, rho, 0, (0, 0.13), bend, mirror: axis),))
  }
  dynkin(bonds(a), at, arcs: arcs, ..style)
}

#let diagram-symmetries() = table(
  columns: (auto, auto),
  stroke: none,
  align: (right + horizon, left + horizon),
  inset: (x: 5mm, y: 2.5mm),
  [$A_l$], symmetric-diagram("A"),
  [$D_l$], symmetric-diagram("D"),
  [$E_6$], symmetric-diagram("E6"),
  [$D_4$], symmetric-diagram("D4"),
  [$B_2$], symmetric-diagram("B2"),
  [$G_2$], symmetric-diagram("G2"),
  [$F_4$], symmetric-diagram("F4"),
)
