// Printed page 211; two panels preserve 12pt labels and blank cells.
#let data = json("../../data/g2-structure-constants.json")
#let names = (
  $a$,
  $b$,
  $a+b$,
  $2a+b$,
  $3a+b$,
  $3a+2b$,
  $-a$,
  $-b$,
  $-a-b$,
  $-2a-b$,
  $-3a-b$,
  $-3a-2b$,
)
#let panel(start) = table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: none,
  align: center + horizon,
  inset: (x: 3pt, y: 4pt),
  table.hline(stroke: 0.6pt),
  table.header([], ..names.slice(start, start + 6)),
  table.hline(stroke: 0.4pt),
  ..data
    .rows
    .enumerate()
    .map(((i, row)) => (
      names.at(i),
      ..row.slice(start, start + 6).map(n => if n == 0 { [] } else { $#n$ }),
    ))
    .flatten(),
  table.hline(stroke: 0.6pt),
)
#let constants-table() = {
  block(breakable: false, width: 100%, panel(0))
  v(1.2em)
  block(breakable: false, width: 100%, panel(6))
}
