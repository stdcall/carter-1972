// The undirected Dynkin diagrams and their vertex permutations, source213.
// These arcs indicate diagram symmetries, not root-length arrows on bonds.
#import "@preview/cetz:0.5.2"

#let symmetry(kind) = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let nodes = ((0, 0), (0.8, 0), (1.6, 0), (3.6, 0), (4.4, 0), (5.2, 0))
  let edges = ((0, 1, 1), (1, 2, 1), (2, 3, 0), (3, 4, 1), (4, 5, 1))
  if kind == "D" {
    nodes = ((0, 0), (0.8, 0), (1.6, 0), (3.6, 0), (4.4, 0.28), (4.4, -0.28))
    edges = ((0, 1, 1), (1, 2, 1), (2, 3, 0), (3, 4, 1), (3, 5, 1))
  } else if kind == "E6" {
    nodes = ((0, 0), (0.8, 0), (1.6, 0), (2.4, 0), (3.2, 0), (1.6, -0.5))
    edges = ((0, 1, 1), (1, 2, 1), (2, 3, 1), (3, 4, 1), (2, 5, 1))
  } else if kind == "D4" {
    nodes = ((0.8, 0), (0, 0), (1.6, 0.55), (1.6, -0.55))
    edges = ((0, 1, 1), (0, 2, 1), (0, 3, 1))
  } else if kind in ("B2", "G2") {
    nodes = ((0, 0), (0.8, 0))
    edges = ((0, 1, if kind == "B2" { 2 } else { 3 }),)
  } else if kind == "F4" {
    nodes = ((0, 0), (0.8, 0), (1.6, 0), (2.4, 0))
    edges = ((0, 1, 1), (1, 2, 2), (2, 3, 1))
  }
  for (i, j, strength) in edges {
    let (x, y) = nodes.at(i)
    let (xx, yy) = nodes.at(j)
    if strength == 0 {
      line((x, y), (xx, yy), stroke: (thickness: 0.5pt, dash: "dashed"))
    } else {
      let offsets = if strength == 3 { (-0.065, 0, 0.065) } else if (
        strength == 2
      ) { (-0.045, 0.045) } else { (0,) }
      for dy in offsets {
        line((x, y + dy), (xx, yy + dy), stroke: 0.5pt)
      }
    }
  }
  let two-way = (start: ">", end: ">", length: 4pt, width: 3pt)
  let one-way = (end: ">", length: 4pt, width: 3pt)
  if kind == "A" {
    bezier(
      (0.8, 0.12),
      (4.4, 0.12),
      (1.8, 0.92),
      (3.4, 0.92),
      stroke: 0.55pt,
      mark: two-way,
    )
  } else if kind == "D" {
    bezier(
      (4.5, 0.28),
      (4.5, -0.28),
      (5, 0.16),
      (5, -0.16),
      stroke: 0.55pt,
      mark: two-way,
    )
  } else if kind == "E6" {
    bezier(
      (0, 0.12),
      (3.2, 0.12),
      (0.8, 0.74),
      (2.4, 0.74),
      stroke: 0.55pt,
      mark: two-way,
    )
  } else if kind == "D4" {
    bezier(
      (1.46, 0.61),
      (0.04, 0.13),
      (0.9, 0.86),
      (0.35, 0.65),
      stroke: 0.55pt,
      mark: one-way,
    )
    bezier(
      (0.04, -0.13),
      (1.46, -0.61),
      (0.35, -0.65),
      (0.9, -0.86),
      stroke: 0.55pt,
      mark: one-way,
    )
    bezier(
      (1.72, -0.48),
      (1.72, 0.48),
      (2.06, -0.2),
      (2.06, 0.2),
      stroke: 0.55pt,
      mark: one-way,
    )
  } else {
    let right = if kind == "F4" { 2.4 } else { 0.8 }
    let high = if kind == "F4" { 0.68 } else { 0.48 }
    bezier(
      (0, 0.13),
      (right, 0.13),
      (0.25 * right, high),
      (0.75 * right, high),
      stroke: 0.55pt,
      mark: two-way,
    )
  }
  for node in nodes {
    circle(node, radius: 1.8pt, fill: white, stroke: 0.5pt)
  }
})

#let diagram-symmetries() = table(
  columns: (auto, auto),
  stroke: none,
  align: (right + horizon, left + horizon),
  inset: (x: 5mm, y: 2.5mm),
  [$A_l$], symmetry("A"),
  [$D_l$], symmetry("D"),
  [$E_6$], symmetry("E6"),
  [$D_4$], symmetry("D4"),
  [$B_2$], symmetry("B2"),
  [$G_2$], symmetry("G2"),
  [$F_4$], symmetry("F4"),
)

// Standalone preview; imports use the functions and discard this content.
#set page(width: auto, height: auto, margin: 5mm)
#set text(font: "Libertinus Serif", size: 12pt, fill: rgb("202020"))
#show math.equation: set text(font: "STIX Two Math")
#diagram-symmetries()
