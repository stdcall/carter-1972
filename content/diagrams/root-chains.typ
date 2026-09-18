// The six root strings in the proof of Carter's Lemma 4.1.1.
#import "dynkin.typ": graph

#let chain(labels) = graph(
  range(labels.len()).map(i => (1.2 * i, 0)),
  range(labels.len() - 1).map(i => (i, i + 1, 1)),
  labels: labels.map(body => (body, "above")),
)

#let root-chains() = {
  set text(size: 10.5pt)
  table(
    columns: (48mm, auto, auto, auto),
    stroke: none,
    align: (left, left, left, left),
    inset: (x: 2mm, y: 2.5mm),
    chain(($s$, $r+s$)), [$p=0$], [$q=1$], [$(s,s)=(r+s,r+s)$],
    chain(($s$, $r+s$, $2r+s$)), [$p=0$], [$q=2$], [$(s,s)=2(r+s,r+s)$],
    chain(($-r+s$, $s$, $r+s$)), [$p=1$], [$q=1$], [$(s,s)=1/2(r+s,r+s)$],
    chain(($s$, $r+s$, [], [])), [$p=0$], [$q=3$], [$(s,s)=3(r+s,r+s)$],
    chain(([], $s$, $r+s$, [])), [$p=1$], [$q=2$], [$(s,s)=(r+s,r+s)$],
    chain(([], [], $s$, $r+s$)), [$p=2$], [$q=1$], [$(s,s)=1/3(r+s,r+s)$],
  )
}

// Standalone preview; importing this file does not insert the preview.
#import "../diagram-preview.typ": diagram-preview
#show: diagram-preview
#root-chains()
