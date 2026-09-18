// Numbered symmetries and folding table on original pages221–224.
#import "@preview/cetz:0.5.2"

#let graph(nodes, edges, labels: (), arcs: (), unit: 1cm) = cetz.canvas(
  length: unit,
  {
    import cetz.draw: *
    for (i, j, strength) in edges {
      let (x, y) = nodes.at(i)
      let (xx, yy) = nodes.at(j)
      if strength == 0 {
        line((x, y), (xx, yy), stroke: (thickness: 0.5pt, dash: "dashed"))
      } else {
        let offsets = if strength == 3 { (-0.065, 0, 0.065) } else if (
          strength == 2
        ) { (-0.045, 0.045) } else { (0,) }
        let norm = calc.sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y))
        for dy in offsets {
          let dx = -dy * (yy - y) / norm
          let dz = dy * (xx - x) / norm
          line((x + dx, y + dz), (xx + dx, yy + dz), stroke: 0.5pt)
        }
      }
    }
    for (a, b, c, d, both) in arcs {
      let mark = if both { (start: ">", end: ">") } else { (end: ">") }
      bezier(a, b, c, d, stroke: 0.55pt, mark: (
        ..mark,
        length: 4pt,
        width: 3pt,
      ))
    }
    for node in nodes {
      circle(node, radius: 1.8pt, fill: white, stroke: 0.5pt)
    }
    for (i, label, dx, dy) in labels {
      let (x, y) = nodes.at(i)
      content((x + dx, y + dy), text(size: 11pt, label))
    }
  },
)

#let numbered-symmetry(kind) = {
  if kind == "A" {
    graph(
      ((0, 0), (1, 0), (3.4, 0), (4.4, 0)),
      ((0, 1, 1), (1, 2, 0), (2, 3, 1)),
      labels: (
        (0, $1$, 0, 0.3),
        (1, $2$, 0, 0.3),
        (2, $l-1$, 0, 0.3),
        (3, $l$, 0, 0.3),
      ),
      arcs: (((0.3, -0.15), (4.1, -0.15), (1.2, -0.8), (3.2, -0.8), true),),
    )
  } else if kind == "D" {
    graph(
      ((0, 0), (0.8, 0), (1.6, 0), (3.5, 0), (4.4, 0.4), (4.4, -0.4)),
      ((0, 1, 1), (1, 2, 1), (2, 3, 0), (3, 4, 1), (3, 5, 1)),
      labels: (
        (0, $1$, 0, 0.3),
        (1, $2$, 0, 0.3),
        (2, $3$, 0, 0.3),
        (3, $l-2$, 0, 0.3),
        (4, $l-1$, 0, 0.3),
        (5, $l$, 0, -0.3),
      ),
      arcs: (((4.6, 0.34), (4.6, -0.34), (4.95, 0.2), (4.95, -0.2), true),),
    )
  } else if kind == "E6" {
    graph(
      ((0, 0), (0.9, 0), (1.8, 0), (2.7, 0), (3.6, 0), (1.8, -0.6)),
      ((0, 1, 1), (1, 2, 1), (2, 3, 1), (3, 4, 1), (2, 5, 1)),
      labels: (
        (0, $1$, -0.12, 0.3),
        (1, $2$, 0, 0.3),
        (2, $3$, 0, 0.3),
        (3, $5$, 0, 0.3),
        (4, $6$, 0.12, 0.3),
        (5, $4$, 0, -0.3),
      ),
      arcs: (((0.15, 0.16), (3.45, 0.16), (1, 1.1), (2.6, 1.1), true),),
    )
  } else if kind == "D4" {
    graph(
      ((1, 0), (0, 0), (1.8, 0.7), (1.8, -0.7)),
      ((0, 1, 1), (0, 2, 1), (0, 3, 1)),
      labels: (
        (0, $1$, -0.08, 0.28),
        (1, $2$, -0.3, 0),
        (2, $3$, 0.2, 0.25),
        (3, $4$, 0.2, -0.25),
      ),
      arcs: (
        ((0.12, 0.22), (1.62, 0.84), (0.5, 0.82), (1.2, 1.12), false),
        ((2.04, 0.55), (2.04, -0.55), (2.34, 0.22), (2.34, -0.22), false),
        ((1.62, -0.84), (0.12, -0.22), (1.2, -1.12), (0.5, -0.82), false),
      ),
    )
  } else if kind == "F4" {
    graph(
      ((0, 0), (0.9, 0), (1.8, 0), (2.7, 0)),
      ((0, 1, 1), (1, 2, 2), (2, 3, 1)),
      labels: (
        (0, $1$, 0, -0.3),
        (1, $2$, 0, -0.3),
        (2, $3$, 0, -0.3),
        (3, $4$, 0, -0.3),
      ),
      arcs: (((0.1, 0.16), (2.6, 0.16), (0.75, 0.84), (1.95, 0.84), true),),
    )
  }
}

#let table-graph(kind, folded: false) = {
  let nodes = ((0, 0), (0.85, 0), (1.7, 0), (3.4, 0), (4.25, 0))
  let edges = ((0, 1, 1), (1, 2, 1), (2, 3, 0), (3, 4, 2))
  let end = if kind == "D" { ($l-2$, $l-1$) } else { ($k-1$, $k$) }
  let labels = (
    (0, $1$, 0, 0.4),
    (1, $2$, 0, 0.4),
    (3, end.at(0), -0.3, 0.4),
    (4, end.at(1), 0.3, 0.4),
  )
  if not folded and kind in ("Aodd", "Aeven") {
    nodes = (
      (0, 0.4),
      (0.8, 0.4),
      (1.6, 0.4),
      (3.2, 0.4),
      (0, -0.4),
      (0.8, -0.4),
      (1.6, -0.4),
      (3.2, -0.4),
      (4, 0),
    )
    edges = (
      (0, 1, 1),
      (1, 2, 1),
      (2, 3, 0),
      (4, 5, 1),
      (5, 6, 1),
      (6, 7, 0),
      (3, 8, 1),
      (7, 8, 1),
    )
    labels = (
      (0, $1$, 0, 0.4),
      (4, $2k-1$, 0, -0.4),
      (3, $k-1$, 0, 0.4),
      (7, $k+1$, 0, -0.4),
      (8, $k$, 0.3, 0),
    )
    if kind == "Aeven" {
      nodes = nodes.slice(0, 8) + ((4, 0.4), (4, -0.4))
      edges = edges.slice(0, 6) + ((3, 8, 1), (7, 9, 1), (8, 9, 1))
      labels = (
        (0, $1$, 0, 0.4),
        (4, $2k$, 0, -0.4),
        (8, $k$, 0, 0.4),
        (9, $k+1$, 0, -0.4),
      )
    }
  } else if not folded and kind == "D" {
    nodes = ((0, 0), (0.8, 0), (1.6, 0), (3.2, 0), (4, 0.4), (4, -0.4))
    edges = ((0, 1, 1), (1, 2, 1), (2, 3, 0), (3, 4, 1), (3, 5, 1))
    labels = (
      (0, $1$, 0, 0.4),
      (3, $l-2$, -0.15, 0.4),
      (4, $l-1$, 0.15, 0.4),
      (5, $l$, 0, -0.4),
    )
  } else if kind == "E6" {
    labels = ()
    if folded {
      nodes = ((0, 0), (0.8, 0), (1.6, 0), (2.4, 0))
      edges = ((0, 1, 1), (1, 2, 2), (2, 3, 1))
    } else {
      nodes = ((0, 0.4), (0.8, 0.4), (0, -0.4), (0.8, -0.4), (1.6, 0), (2.4, 0))
      edges = ((0, 1, 1), (2, 3, 1), (1, 4, 1), (3, 4, 1), (4, 5, 1))
    }
  } else if kind in ("D4", "B2", "G2") {
    labels = ()
    if folded and kind != "D4" {
      nodes = ((0, 0),)
      edges = ()
    } else if not folded and kind == "D4" {
      nodes = ((0, 0.45), (0, 0), (0, -0.45), (0.85, 0))
      edges = ((0, 3, 1), (1, 3, 1), (2, 3, 1))
    } else {
      nodes = ((0, 0), (0.85, 0))
      edges = ((0, 1, if kind == "B2" { 2 } else { 3 }),)
    }
  } else if kind == "F4" {
    nodes = ((0, 0.4), (0.85, 0.4), (0.85, -0.4), (0, -0.4))
    edges = ((0, 1, 1), (1, 2, 2), (2, 3, 1))
    labels = ()
  }
  graph(nodes, edges, labels: labels, unit: 8mm)
}

#let folding-table() = table(
  columns: (auto, 48mm, 48mm),
  align: (right + horizon, center + horizon, center + horizon),
  inset: (x: 3mm, y: 2.8mm),
  stroke: none,
  table.header([], [Diagram of $W$], [Diagram of $W^1$]),
  ..("Aodd", "Aeven", "D", "E6", "D4", "B2", "G2", "F4")
    .enumerate()
    .map(((i, kind)) => (
      ($A_(2k-1)$, $A_(2k)$, $D_l$, $E_6$, $D_4$, $B_2$, $G_2$, $F_4$).at(i),
      table-graph(kind),
      if kind == "F4" { $W^1 tilde.eq cal(D)_16$ } else {
        table-graph(kind, folded: true)
      },
    ))
    .flatten(),
)

// Standalone preview; importing this file does not insert the preview.
#import "../diagram-preview.typ": diagram-preview
#show: diagram-preview
#table(
  columns: (auto, auto),
  stroke: none,
  align: (right + horizon, left + horizon),
  inset: (x: 5mm, y: 3mm),
  [$A_l$], numbered-symmetry("A"),
  [$D_l$], numbered-symmetry("D"),
  [$E_6$], numbered-symmetry("E6"),
  [$D_4$], numbered-symmetry("D4"),
  [$F_4$], numbered-symmetry("F4"),
)
#pagebreak()
#folding-table()
