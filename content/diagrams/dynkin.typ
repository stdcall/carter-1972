// Carter's undirected Dynkin diagrams (no root-length arrows) from the
// Cartan matrices of section 3.6, and the root systems of Figures 1 and 2.
#import "root-systems.typ": (
  bonds, cartan, cartan-of, dynkin, path-layout, relative, root-system, vadd,
  vector-label, vscale,
)

#let style = (stroke: 0.45pt, radius: 1.7pt, spacing: (0.055, 0.065))
#let above = ((0, 0.15), "south")

// Each type in a representative rank, the general ones with a middle node
// elided.
#let shape(kind) = {
  let family = kind.first()
  let rank = if kind.len() > 1 { int(kind.slice(1)) } else {
    (G: 2, F: 4, D: 6).at(family, default: 5)
  }
  let n = bonds(cartan(family, rank))
  let at = if family == "E" { path-layout(n, 0.6, drop: 0.4) } else {
    let fork = if family == "D" { (0.7, 0.28) }
    path-layout(n, 0.7, skip: if rank > 4 { (2,) } else { () }, fork: fork)
  }
  (n, at)
}

#let standard(kind, unit: 1cm) = dynkin(..shape(kind), unit: unit, ..style)

#let numbered-chain(double: false) = {
  let (n, at) = shape(if double { "B" } else { "A" })
  let shown = range(n.len()).filter(i => at.at(i) != none)
  let name(i) = relative(i + 1, ((0, ""), (n.len(), "l")))
  dynkin(n, at, labels: shown.map(i => (i, name(i), ..above)), ..style)
}

#let classification() = table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  inset: (x: 6mm, y: 2.5mm),
  [$A_l$ ($l>=1$)], standard("A"),
  [$B_l$ ($l>=2$)\ $C_l$ ($l>=3$)], standard("B"),
  [$D_l$ ($l>=4$)], standard("D"),
  [$G_2$], standard("G"),
  [$F_4$], standard("F"),
  [$E_6$], standard("E6"),
  [$E_7$], standard("E7"),
  [$E_8$], standard("E8"),
)

// The fundamental systems of section 3.6 in the orthonormal basis, in a
// representative rank l whose middle roots are elided; indices near l are
// printed relative to l. Their Cartan matrices must be those printed there.
#let fundamental(kind) = {
  let family = kind.first()
  let l = if family == "E" { int(kind.slice(1)) } else {
    (A: 6, B: 9, C: 9, D: 10, F: 4).at(family)
  }
  // Coordinate k stands for e_(k + first): e_0, …, e_l for A_l, e_1, …, e_8
  // for E_l, e_1, …, e_l otherwise.
  let (dim, first) = if family == "A" { (l + 1, 0) } else if family == "E" {
    (8, 1)
  } else { (l, 1) }
  let e(k) = range(dim).map(i => int(i == k))
  let minus(u, v) = vadd(u, vscale(-1, v))
  let chain(ks) = ks.map(k => minus(e(k), e(k + 1)))
  let roots = if family == "A" { chain(range(l)) } else if family == "F" {
    chain(range(2)) + (e(2), (-0.5, -0.5, -0.5, 0.5))
  } else if family == "E" {
    let half = range(8).map(_ => -0.5)
    chain(range(8 - l, 5)) + (minus(e(5), e(6)), vadd(e(5), e(6)), half)
  } else {
    let last = (
      B: e(l - 1),
      C: vscale(2, e(l - 1)),
      D: vadd(e(l - 2), e(l - 1)),
    )
    chain(range(l - 1)) + (last.at(family),)
  }
  let a = cartan(family, l)
  assert(
    cartan-of(roots) == a,
    message: "not a fundamental system of this type",
  )
  let n = bonds(a)
  let skip = if family == "A" { (2, 3) } else if family in ("B", "C", "D") {
    range(3, 7)
  } else { () }
  let at = if family == "E" {
    let xs = range(l - 1).map(i => 1.65 * i)
    xs.at(-1) += 0.65
    path-layout(n, xs, drop: 0.8)
  } else if family == "D" {
    path-layout(n, (0, 1.5, 3, 5.6), skip: skip, fork: (2, 0.65))
  } else {
    let xs = (
      A: (0, 1.65, 4.8, 6.7),
      B: (0, 1.5, 3, 5.6, 7.1),
      C: (0, 1.5, 3, 5.6, 7.1),
      F: (0, 1.8, 3.6, 6.3),
    )
    path-layout(n, xs.at(family), skip: skip)
  }
  let anchors = if family == "E" or family == "F" { ((0, ""),) } else {
    ((0, ""), (l, "l"))
  }
  let index(k) = relative(k + first, anchors)
  let side(i) = if family == "D" and i == l - 3 {
    ((0, 0.75), "south")
  } else if (
    family == "D" and i > l - 3
  ) { ((0.16, 0), "west") } else if at.at(i).last() < 0 {
    ((0, -0.15), "north")
  } else { above }
  let shown = range(l).filter(i => at.at(i) != none)
  dynkin(
    n,
    at,
    labels: shown.map(i => (i, vector-label(roots.at(i), index), ..side(i))),
    ..style,
  )
}

// Figure 1: lattice coordinates, with corrected −b in the A₂ panel (E016).
#let rank-two(kind, names: ("a", "b"), basis: none) = root-system(
  cartan(kind.first(), int(kind.last())),
  names: names,
  basis: basis,
  unit: 1.6cm,
  stroke: 0.45pt,
  radius: 1.5pt,
  diagonal: if kind == "G2" { 0.1 },
  origin: true,
)

#let low-rank-roots() = {
  set text(size: 11pt)
  grid(
    columns: (50mm, 1fr),
    gutter: 6mm,
    align: center + horizon,
    stack(dir: ttb, spacing: 3mm, [$A_1$], rank-two("A1")),
    stack(dir: ttb, spacing: 3mm, [$A_2$], rank-two("A2")),

    stack(dir: ttb, spacing: 3mm, [$B_2$], rank-two("B2")),
    stack(dir: ttb, spacing: 3mm, [$G_2$], rank-two("G2")),
  )
}

// Figure 2: the G₂ roots over the short roots r = a + b and s = a of 5.2.
#let g2-root-string() = rank-two(
  "G2",
  names: ("r", "s"),
  basis: ((1, 1), (1, 0)),
)
