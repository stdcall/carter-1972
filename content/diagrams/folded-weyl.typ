// Section 13.3 (printed pages 221–224): the symmetries ρ of the Dynkin
// diagrams with the numbering used there, and the diagram of W^1 obtained by
// folding the diagram of W along the ρ-orbits.
#import "root-systems.typ": (
  across, as-math, bonds, cartan, complete, dynkin, flip, fold, mirror-arc,
  orbit-layout, orbits, path-layout, permute, relative, strength, symmetry,
  symmetry-arc,
)

#let style = (stroke: 0.5pt, radius: 1.8pt, spacing: (0.045, 0.065))
#let named(anchors) = i => text(size: 11pt, as-math(relative(i + 1, anchors)))

// Each diagram with ρ, its numbering (relative to l for the general types),
// the label offsets and the arcs of ρ.
#let numbered-symmetry(kind) = {
  let literal = ((0, ""),)
  let (a, rho, at, anchors, offsets, arcs) = if kind == "A" {
    let a = cartan("A", 5)
    let rho = symmetry(a, range(5).rev())
    let axis = across(2.2)
    let at = complete(path-layout(bonds(a), 1, skip: (2, 3, 4)), rho, axis)
    let arc = symmetry-arc(at, rho, 0, (0.3, -0.15), (0.9, -0.65), mirror: axis)
    let offsets = (0, 1, 3, 4).map(i => (i, (0, 0.3)))
    (a, rho, at, literal + ((5, "l"),), offsets, (arc,))
  } else if kind == "D" {
    let a = cartan("D", 7)
    let rho = symmetry(a, (0, 1, 2, 3, 4, 6, 5))
    let xs = (0, 0.8, 1.6, 3.5)
    let at = path-layout(bonds(a), xs, skip: (3,), fork: (0.9, 0.4))
    let arc = symmetry-arc(
      at,
      rho,
      5,
      (0.2, -0.06),
      (0.35, -0.14),
      mirror: flip,
    )
    let offsets = (0, 1, 2, 4, 5).map(i => (i, (0, 0.3))) + ((6, (0, -0.3)),)
    (a, rho, at, literal + ((7, "l"),), offsets, (arc,))
  } else if kind == "E6" {
    let a = cartan("E", 6)
    let rho = symmetry(a, (5, 4, 2, 3, 1, 0))
    let axis = across(1.8)
    let at = complete(path-layout(bonds(a), 0.9, drop: 0.6), rho, axis)
    let arc = symmetry-arc(at, rho, 0, (0.15, 0.16), (0.85, 0.94), mirror: axis)
    let dxs = (-0.12, 0, 0, 0, 0, 0.12)
    let offsets = range(6).map(i => {
      (i, (dxs.at(i), if i == 3 { -0.3 } else { 0.3 }))
    })
    (a, rho, at, literal, offsets, (arc,))
  } else if kind == "D4" {
    // Here p_1 is the central node, and ρ permutes the others cyclically.
    let a = permute(cartan("D", 4), (1, 0, 2, 3))
    let rho = symmetry(a, (0, 2, 3, 1))
    let at = path-layout(bonds(a), (0, 1), start: 1, fork: (0.8, 0.7))
    let enter = ((-0.18, 0.14), (-0.42, 0.28))
    let first = symmetry-arc(
      at,
      rho,
      1,
      (0.12, 0.22),
      (0.38, 0.6),
      enter: enter,
    )
    let arcs = (
      first,
      symmetry-arc(at, rho, 2, (0.24, -0.15), (0.3, -0.33), mirror: flip),
      mirror-arc(first, flip),
    )
    let offsets = ((-0.08, 0.28), (-0.3, 0), (0.2, 0.25), (0.2, -0.25))
    (a, rho, at, literal, offsets.enumerate(), arcs)
  } else if kind == "F4" {
    let a = cartan("F", 4)
    let rho = symmetry(a, range(4).rev())
    let axis = across(1.35)
    let at = complete(path-layout(bonds(a), 0.9), rho, axis)
    let arc = symmetry-arc(at, rho, 0, (0.1, 0.16), (0.65, 0.68), mirror: axis)
    (a, rho, at, literal, range(4).map(i => (i, (0, -0.3))), (arc,))
  }
  let name = named(anchors)
  let labels = offsets.map(((i, offset)) => (i, name(i), offset, "center"))
  dynkin(bonds(a), at, labels: labels, arcs: arcs, ..style)
}

// The rows of the table: each type in a representative rank (k = 6 for
// A_(2k-1) and A_(2k), l = 7 for D_l) with the orbit of the fourth node
// elided; ρ; the anchors of the node numbers; the labels (node or orbit,
// offset) of both diagrams; the steps of both layouts.
#let rows = (
  (
    name: $A_(2k-1)$,
    a: cartan("A", 11),
    rho: range(11).rev(),
    skip: (3, 7),
    anchors: ((0, ""), (6, "k"), (12, "2k")),
    labels: (
      (0, (0, 0.4)),
      (10, (0, -0.4)),
      (4, (0, 0.4)),
      (6, (0, -0.4)),
      (5, (0.3, 0)),
    ),
    folded: ((0, (0, 0.4)), (1, (0, 0.4)), (4, (-0.3, 0.4)), (5, (0.3, 0.4))),
  ),
  (
    name: $A_(2k)$,
    a: cartan("A", 12),
    rho: range(12).rev(),
    skip: (3, 8),
    anchors: ((0, ""), (6, "k"), (12, "2k")),
    labels: ((0, (0, 0.4)), (11, (0, -0.4)), (5, (0, 0.4)), (6, (0, -0.4))),
    folded: ((0, (0, 0.4)), (1, (0, 0.4)), (4, (-0.3, 0.4)), (5, (0.3, 0.4))),
  ),
  (
    name: $D_l$,
    a: cartan("D", 7),
    rho: (0, 1, 2, 3, 4, 6, 5),
    skip: (3,),
    anchors: ((0, ""), (7, "l")),
    labels: (
      (0, (0, 0.4)),
      (4, (-0.15, 0.4)),
      (5, (0.15, 0.4)),
      (6, (0, -0.4)),
    ),
    folded: ((0, (0, 0.4)), (1, (0, 0.4)), (4, (-0.3, 0.4)), (5, (0.3, 0.4))),
  ),
  (name: $E_6$, a: cartan("E", 6), rho: (5, 4, 2, 3, 1, 0), steps: (0.8, 0.8)),
  (
    name: $D_4$,
    a: cartan("D", 4),
    rho: (2, 1, 3, 0),
    steps: (0.85, 0.85),
    dy: 0.45,
  ),
  (name: $B_2$, a: cartan("B", 2), rho: (1, 0), steps: (0.85, 0.85)),
  (name: $G_2$, a: cartan("G", 2), rho: (1, 0), steps: (0.85, 0.85)),
  (name: $F_4$, a: cartan("F", 4), rho: range(4).rev(), steps: (0.85, 0.85)),
).map(row => (
  skip: (),
  anchors: ((0, ""),),
  labels: (),
  folded: (),
  steps: (0.8, 0.85),
  dy: 0.4,
  ..row,
))

#let table-graph(row, folded: false) = {
  let rho = symmetry(row.a, row.rho)
  let parts = orbits(rho)
  let name = named(row.anchors)
  let (step, folded-step) = row.steps
  if not folded {
    // The diagram of W with ρ as the reflection in the axis; a diagram that
    // is a single ρ-orbit is drawn as it stands.
    let n = bonds(row.a)
    let at = if parts.len() == 1 { path-layout(n, step) } else {
      orbit-layout(n, rho, step, row.dy, skip: row.skip)
    }
    let labels = row.labels.map(((i, offset)) => (i, name(i), offset, "center"))
    return dynkin(n, at, labels: labels, unit: 8mm, ..style)
  }
  // The diagram of W^1: a node for each ρ-orbit, bonds from the Coxeter
  // matrix of W^1.
  let m = fold(row.a, rho)
  let n = range(parts.len()).map(J => range(parts.len()).map(K => {
    if J == K { 0 } else { strength(m.at(J).at(K)) }
  }))
  if n.join().contains(none) {
    // Not a Weyl group: generated by two reflections whose product has
    // order m, a dihedral group of order 2m.
    assert(parts.len() == 2)
    return as-math("W^1 tilde.eq cal(D)_" + str(2 * m.at(0).at(1)))
  }
  let elided(J) = parts.at(J).any(j => j in row.skip)
  let at = path-layout(n, folded-step, skip: range(parts.len()).filter(elided))
  let labels = row.folded.map(((J, offset)) => {
    (J, name(parts.at(J).first()), offset, "center")
  })
  dynkin(n, at, labels: labels, unit: 8mm, ..style)
}

#let folding-table() = table(
  columns: (auto, 48mm, 48mm),
  align: (right + horizon, center + horizon, center + horizon),
  inset: (x: 3mm, y: 2.8mm),
  stroke: none,
  table.header([], [Diagram of $W$], [Diagram of $W^1$]),
  ..rows
    .map(row => (row.name, table-graph(row), table-graph(row, folded: true)))
    .flatten(),
)
