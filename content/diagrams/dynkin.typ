// Carter's undirected diagrams: the source does not use root-length arrows.
#import "@preview/cetz:0.5.2"

#let graph(nodes, edges, labels: (), unit: 1cm) = cetz.canvas(length: unit, {
  import cetz.draw: *
  for (i, j, strength) in edges {
    let (x, y) = nodes.at(i)
    let (xx, yy) = nodes.at(j)
    if strength == "dashed" {
      line((x, y), (xx, yy), stroke: (thickness: 0.45pt, dash: "dashed"))
    } else {
      let offsets = if strength == 3 { (-0.065, 0, 0.065) } else if (
        strength == 2
      ) { (-0.055, 0.055) } else { (0,) }
      for dy in offsets {
        line((x, y + dy), (xx, yy + dy), stroke: 0.45pt)
      }
    }
  }
  for (i, node) in nodes.enumerate() {
    circle(node, radius: 1.7pt, fill: white, stroke: 0.45pt)
    if labels.len() > i {
      let (body, side) = labels.at(i)
      let (x, y) = node
      let (offset, anchor) = if side == "below" {
        ((0, -0.15), "north")
      } else if side == "right" { ((0.16, 0), "west") } else if side == "high" {
        ((0, 0.75), "south")
      } else {
        ((0, 0.15), "south")
      }
      content((x + offset.at(0), y + offset.at(1)), body, anchor: anchor)
    }
  }
})

#let shape(kind) = {
  let nodes = ((0, 0), (0.7, 0), (2.1, 0), (2.8, 0))
  let edges = ((0, 1, 1), (1, 2, "dashed"), (2, 3, 1))
  if kind in ("B", "C") { edges.at(2) = (2, 3, 2) }
  if kind == "D" {
    nodes = ((0, 0), (0.7, 0), (2.1, 0), (2.8, 0.28), (2.8, -0.28))
    edges = ((0, 1, 1), (1, 2, "dashed"), (2, 3, 1), (2, 4, 1))
  }
  if kind == "G" {
    nodes = ((0, 0), (0.7, 0))
    edges = ((0, 1, 3),)
  }
  if kind == "F" {
    nodes = ((0, 0), (0.7, 0), (1.4, 0), (2.1, 0))
    edges = ((0, 1, 1), (1, 2, 2), (2, 3, 1))
  }
  if kind.starts-with("E") {
    let rank = int(kind.slice(1))
    nodes = range(rank - 1).map(i => (0.6 * i, 0))
    nodes.push((0.6 * (rank - 4), -0.4))
    edges = range(rank - 2).map(i => (i, i + 1, 1))
    edges.push((rank - 4, rank - 1, 1))
  }
  (nodes, edges)
}

#let standard(kind, unit: 1cm) = {
  let (nodes, edges) = shape(kind)
  graph(nodes, edges, unit: unit)
}

#let numbered-chain(double: false) = {
  let (nodes, edges) = shape(if double { "B" } else { "A" })
  graph(nodes, edges, labels: ($1$, $2$, $l-1$, $l$).map(x => (x, "above")))
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

#let fundamental(kind) = {
  let nodes = ((0, 0), (1.65, 0), (4.8, 0), (6.7, 0))
  let edges = ((0, 1, 1), (1, 2, "dashed"), (2, 3, 1))
  let labels = ($e_0-e_1$, $e_1-e_2$, $e_(l-2)-e_(l-1)$, $e_(l-1)-e_l$)
  if kind in ("B", "C") {
    nodes = ((0, 0), (1.5, 0), (3, 0), (5.6, 0), (7.1, 0))
    edges = ((0, 1, 1), (1, 2, 1), (2, 3, "dashed"), (3, 4, 2))
    labels = (
      $e_1-e_2$,
      $e_2-e_3$,
      $e_3-e_4$,
      $e_(l-1)-e_l$,
      if kind == "B" { $e_l$ } else { $2e_l$ },
    )
  }
  if kind == "D" {
    return graph(
      ((0, 0), (1.5, 0), (3, 0), (5.6, 0), (7.6, 0.65), (7.6, -0.65)),
      ((0, 1, 1), (1, 2, 1), (2, 3, "dashed"), (3, 4, 1), (3, 5, 1)),
      labels: (
        ($e_1-e_2$, "above"),
        ($e_2-e_3$, "above"),
        ($e_3-e_4$, "above"),
        ($e_(l-2)-e_(l-1)$, "high"),
        ($e_(l-1)-e_l$, "right"),
        ($e_(l-1)+e_l$, "right"),
      ),
    )
  }
  if kind == "F" {
    nodes = ((0, 0), (1.8, 0), (3.6, 0), (6.3, 0))
    edges = ((0, 1, 1), (1, 2, 2), (2, 3, 1))
    labels = ($e_1-e_2$, $e_2-e_3$, $e_3$, $1/2(-e_1-e_2-e_3+e_4)$)
  }
  if kind.starts-with("E") {
    let rank = int(kind.slice(1))
    let start = 9 - rank
    nodes = range(rank - 1).map(i => (1.65 * i, 0))
    nodes.at(rank - 2) = (1.65 * (rank - 2) + 0.65, 0)
    nodes.push((1.65 * (rank - 4), -0.8))
    edges = range(rank - 2).map(i => (i, i + 1, 1))
    edges.push((rank - 4, rank - 1, 1))
    labels = range(start, 6).map(i => $e_#i - e_#(i + 1)$)
    labels += ($e_6+e_7$, $-1/2 sum_(i=1)^8 e_i$)
    return graph(
      nodes,
      edges,
      labels: labels.map(x => (x, "above")) + (($e_6-e_7$, "below"),),
    )
  }
  graph(nodes, edges, labels: labels.map(x => (x, "above")))
}

// Figure 1: lattice coordinates, with corrected −b in the A₂ panel (E016).
#let rank-two(kind, labels-override: none) = cetz.canvas(length: 1.6cm, {
  import cetz.draw: *
  let h = calc.sqrt(3) / 2
  let nodes = ((1, 0), (-1, 0))
  let labels = ($a$, $-a$)
  if kind == "A2" {
    nodes = ((1, 0), (0.5, h), (-0.5, h), (-1, 0), (-0.5, -h), (0.5, -h))
    labels = ($a$, $a+b$, $b$, $-a$, $-a-b$, $-b$)
  }
  if kind == "B2" {
    nodes = (
      (1, 0),
      (1, 1),
      (0, 1),
      (-1, 1),
      (-1, 0),
      (-1, -1),
      (0, -1),
      (1, -1),
    )
    labels = ($a$, $2a+b$, $a+b$, $b$, $-a$, $-2a-b$, $-a-b$, $-b$)
  }
  if kind == "G2" {
    nodes = (
      (1, 0),
      (1.5, h),
      (0.5, h),
      (0, 2 * h),
      (-0.5, h),
      (-1.5, h),
      (-1, 0),
      (-1.5, -h),
      (-0.5, -h),
      (0, -2 * h),
      (0.5, -h),
      (1.5, -h),
    )
    labels = (
      $a$,
      $3a+b$,
      $2a+b$,
      $3a+2b$,
      $a+b$,
      $b$,
      $-a$,
      $-3a-b$,
      $-2a-b$,
      $-3a-2b$,
      $-a-b$,
      $-b$,
    )
  }
  if labels-override != none { labels = labels-override }
  if nodes.len() > 2 { line(..nodes, close: true, stroke: 0.45pt) }
  for i in range(calc.quo(nodes.len(), 2)) {
    line(nodes.at(i), nodes.at(i + calc.quo(nodes.len(), 2)), stroke: 0.45pt)
  }
  line((0, -0.08), (0, 0.08), stroke: 0.45pt)
  for (i, (x, y)) in nodes.enumerate() {
    circle((x, y), radius: 1.5pt, fill: white, stroke: 0.45pt)
    let anchor = if y > 0 { "south" } else if y < 0 { "north" } else if x > 0 {
      "west"
    } else { "east" }
    let dy = if y > 0 { 0.12 } else if y < 0 { -0.12 } else { 0 }
    let dx = if y == 0 { if x > 0 { 0.12 } else { -0.12 } } else { 0 }
    if kind == "G2" and y != 0 and x != 0 {
      dx = if x > 0 { 0.1 } else { -0.1 }
      anchor = (
        (if y > 0 { "south" } else { "north" })
          + "-"
          + (if x > 0 { "west" } else { "east" })
      )
    }
    content((x + dx, y + dy), labels.at(i), anchor: anchor)
  }
})

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

// Figure 2: the G₂ roots expressed in the pair used in section 5.2.
#let g2-root-string() = rank-two("G2", labels-override: (
  $s$,
  $r+2s$,
  $r+s$,
  $2r+s$,
  $r$,
  $r-s$,
  $-s$,
  $-r-2s$,
  $-r-s$,
  $-2r-s$,
  $-r$,
  $-r+s$,
))
