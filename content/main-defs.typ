#let source(n, printed) = context {
  [#metadata((
      kind: "source",
      file-page: n,
      printed-page: printed,
      position: here().position(),
    ))#label("pg:source-" + printed)]
}
// Author's numbering is retained; an absent pilot target stays plain text.
#let reference-numbers(body) = {
  show regex("[0-9]+(?:\\.[0-9]+)*|\\b[ivxlcdm]+\\b"): set text(
    weight: "semibold",
  )
  body
}
#let book-ref(prefix, id, body, highlight: true, above: 0pt) = box(context {
  let target = label(prefix + ":" + id)
  let found = query(target)
  let destination = if found.len() == 1 {
    let pos = found.first().location().position()
    pos.y = calc.max(10pt, pos.y - above)
    pos
  }
  metadata((
    kind: "cross-reference",
    target: str(target),
    resolved: found.len() == 1,
    position: here().position(),
    target-position: destination,
    description: if above > 0pt and found.len() == 1 {
      "page " + str(counter(page).at(found.first().location()).first())
    },
  ))
  if found.len() == 1 {
    link(
      if above == 0pt { target } else { destination },
      if highlight { reference-numbers(body) } else { body },
    )
  } else { body }
})
#let chapter-ref(n) = book-ref("ch", str(n), [chapter #n])
#let section-ref(n) = book-ref("sec", n.replace(".", "-"), [section #n])
// Keep original wording/numbers; IDs are stable across pagination changes.
#let equation-ref(n, body: none, highlight: true) = book-ref(
  "eq",
  n.replace(".", "-"),
  if body == none {
    [(#n)]
  } else { body },
  highlight: highlight,
)
#let theorem-ref(n) = book-ref("th", n.replace(".", "-"), [Theorem #n])
#let lemma-ref(n) = book-ref("l", n.replace(".", "-"), [Lemma #n])
#let proposition-ref(n) = book-ref("p", n.replace(".", "-"), [Proposition #n])
#let corollary-ref(n) = book-ref("cor", n.replace(".", "-"), [Corollary #n])
#let definition-ref(n) = book-ref("def", n.replace(".", "-"), [Definition #n])
#let figure-ref(n, body: none, highlight: true) = book-ref(
  "fig",
  n.replace(".", "-"),
  if body == none {
    [Figure #n]
  } else { body },
  highlight: highlight,
)
// Each author-local work number is its own link, including multi-work
// citations.
#let bib-db = json("../build/.cache/bibliography.json")
#let bib-entries = (
  bib-db.groups.map(g => g.works.map(w => w.parts).flatten()).flatten()
)
#let bib-ref(..keys) = {
  let refs = keys
    .pos()
    .map(key => {
      let entries = bib-entries.filter(e => e.key == key)
      assert(entries.len() == 1, message: "Unknown bibliography key: " + key)
      book-ref("bib", key, entries.first().shorthand)
    })
  [\[#refs.join([, ])\]]
}
// Only for INTERNAL page references. External bibliographic page numbers are
// literal.
#let source-page-ref(printed) = box(context {
  let target = label("pg:source-" + printed)
  let found = query(target)
  metadata((
    kind: "page-reference",
    original-page: printed,
    resolved: found.len() == 1,
    position: here().position(),
    target-position: if found.len() == 1 {
      found.first().location().position()
    },
  ))
  if found.len() == 1 {
    link(target, reference-numbers([
      p. #counter(page).at(found.first().location()).first()
    ]))
  } else {
    [p. #printed (original edition)]
  }
})
#let V = $frak(V)$
#let L = $frak(L)$

#let qed = [#h(1fr)#box[#text(size: 11pt)[■]]]

// Center a long operator limit without reserving its horizontal width.
// Like \mathclap in a script: use deliberately and inspect neighbouring
// subscripts. The limit retains its full height, font and readable size.
#let mathclap(body) = context {
  let content = $script(body)$
  let width = measure(content).width
  box(width: 0pt, inset: (left: -width / 2, right: -width / 2), content)
}

// Index locators use current pagination. Exact semantic targets are preferred;
// otherwise cover the entire relocated source-page interval.
#let index-location(printed, target: none, through: none) = {
  let endpoint = if through == none { printed } else { through }
  let key = if target == none { "pg:source-" + str(printed) } else { target }
  let found = query(label(key))
  assert(found.len() == 1, message: "Missing index target: " + key)
  let start = found.first().location()
  let first = counter(page).at(start).first()
  let last = first
  if target == none {
    let following = query(label("pg:source-" + str(endpoint + 1)))
    assert(following.len() == 1, message: "Missing index end boundary")
    let stop = following.first().location()
    last = counter(page).at(stop).first()
    if stop.position().y <= 62pt and last > first { last -= 1 }
  }
  (
    original: ((printed, endpoint),),
    target: key,
    first: first,
    last: last,
    exact: target != none,
  )
}
// Add 4pt to Typst’s own 10pt destination inset, keeping tall math on the
// target line visible. This applies only to links from the two indexes.
#let index-link(loc) = {
  metadata((
    kind: "index-reference",
    original: loc.original,
    target: loc.target,
    first-page: loc.first,
    last-page: loc.last,
    exact-semantic-target: loc.exact,
  ))
  let parts = loc.target.split(":")
  book-ref(
    parts.first(),
    parts.slice(1).join(":"),
    if loc.first == loc.last {
      [#loc.first]
    } else { [#loc.first–#loc.last] },
    above: 4pt,
  )
}
#let index-ref(printed, target: none, through: none) = context {
  index-link(index-location(printed, target: target, through: through))
}
// Merge overlapping page intervals within one subject entry, avoiding repeated
// numbers introduced by the changed pagination. Keep all original locators.
#let index-refs(..refs) = context {
  let spans = refs
    .pos()
    .map(r => {
      if type(r) == array {
        index-location(r.first(), through: r.last())
      } else { index-location(r) }
    })
    .sorted(key: r => r.first)
  let merged = ()
  for r in spans {
    if merged.len() > 0 and r.first <= merged.last().last + 1 {
      let previous = merged.pop()
      previous.last = calc.max(previous.last, r.last)
      previous.original += r.original
      merged.push(previous)
    } else { merged.push(r) }
  }
  merged.map(index-link).join([, ])
}
