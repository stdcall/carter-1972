#let source(n, printed) = context {
  [#metadata((
      kind: "source",
      file-page: n,
      printed-page: printed,
      position: here().position(),
    ))#label("pg:source-" + printed)]
}

#let reference-numbers(body) = {
  show regex("[0-9]+(?:\\.[0-9]+)*|\\b[ivxlcdm]+\\b"): set text(
    weight: "semibold",
  )
  body
}
#let reference-element(element) = {
  if element.func() == figure and element.kind == "statement" {
    query(metadata).find(it => (
      type(it.value) == dictionary
        and it.value.at("id", default: none) == str(element.label)
    ))
  } else { element }
}

// A subpart suffix retains the main statement's automatic number.
#let ref-suffix(body) = metadata((ref-suffix: body))

#let book-ref(
  prefix,
  id,
  supplement: [],
  suffix: [],
  highlight: true,
  above: 0pt,
  ..content,
) = box(context {
  assert(content.named().len() == 0 and content.pos().len() <= 1)
  let body = content.pos().at(0, default: none)
  let target = label(prefix + ":" + id)
  let found = query(target)
  let body = if body == none {
    assert(
      found.len() == 1,
      message: "Missing reference target: " + str(target),
    )
    let entry = reference-element(found.first())
    let number = if entry.func() == heading {
      assert(entry.numbering != none)
      numbering("1.1", ..counter(heading).at(entry.location()))
    } else {
      let value = entry.value
      if value.at("statement", default: none) != none {
        value = reference-element(query(label(value.statement)).first()).value
      }
      assert(value.kind == "statement", message: "Unnumbered target")
      value.number
    }
    supplement + number + suffix
  } else { body }
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
#let book-heading-numbering(..numbers) = {
  let parts = numbers.pos()
  numbering("1.1", ..parts) + if parts.len() == 1 { "." } else { "" }
}
#let book-heading-body(it) = context {
  if it.numbering == none { it.body } else {
    let number = numbering(it.numbering, ..counter(heading).at(it.location()))
    if it.body == [] { number } else { [#number #it.body] }
  }
}
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


// Center a long operator limit without reserving its horizontal width.
// Like \mathclap in a script: use deliberately and inspect neighbouring
// subscripts. The limit retains its full height, font and readable size.
#let mathclap(body) = context {
  let content = $script(body)$
  let width = measure(content).width
  box(width: 0pt, inset: (left: -width / 2, right: -width / 2), content)
}


// Index marks. A term is declared where the book discusses it, written as the
// markup it should print as; the locators below are this edition’s pages,
// recomputed at build time.
#let ix(term, sub: none) = [
  #metadata((
    kind: "index-mark",
    index: "subject",
    term: term,
    sub: sub,
  ))#label("ix")
]

// A notation mark owns its symbol and meaning as well as its live locator.
// Distinct meanings of the same printed symbol have distinct semantic keys.
#let nx(
  key,
  symbol,
  group: "latin",
  after: none,
  definition: none,
  locator: true,
  meaning,
) = [
  #metadata((
    kind: "index-mark",
    index: "notation",
    key: key,
    symbol: symbol,
    meaning: meaning,
    group: group,
    after: after,
    target: if definition == none { none } else { str(definition.target) },
    locator: locator,
  ))#label("nx")
]

#let index-marks(index: "subject") = {
  if index == "notation" { query(label("nx")) } else { query(label("ix")) }
}


// Sub-entries read as phrases under their term, so they sort by their first
// significant word: “of a twisted group” files under “twisted”.
#let index-sort-key(term) = {
  let key = lower(term)
  for lead in (
    "of the ",
    "of a ",
    "of ",
    "in the ",
    "in a ",
    "in ",
    "for the ",
    "for a ",
    "for ",
    "on the ",
    "on ",
    "to ",
    "with ",
    "from ",
    "associated with ",
    "relationship to ",
  ) {
    if key.starts-with(lead) { key = key.slice(lead.len()) }
  }
  let kept = ""
  for ch in key.clusters() {
    if ch.match(regex("[a-z0-9]")) != none { kept += ch }
  }
  kept
}

// Consecutive pages read as a range, as they do in a printed index.
#let index-locators(marks) = {
  let seen = ()
  for mark in marks {
    let page = counter(page).at(mark.location()).first()
    if seen.len() > 0 and page == seen.last().last {
      continue
    } else if seen.len() > 0 and page == seen.last().last + 1 {
      let previous = seen.pop()
      previous.last = page
      seen.push(previous)
    } else {
      seen.push((first: page, last: page, loc: mark.location()))
    }
  }
  seen
    .map(span => link(
      span.loc,
      if span.first == span.last { [#span.first] } else {
        [#span.first–#span.last]
      },
    ))
    .join([, ])
}

// Within each alphabetic group, retain the author's ordering of related
// symbols with semantic predecessor constraints, not row numbers.
#let notation-order(entries) = {
  let ordered = entries.sorted(key: it => lower(it.key))
  if entries.len() == 0 { return ordered }
  for _ in entries {
    let changed = false
    for entry in ordered {
      if entry.after == none { continue }
      let position = ordered.position(it => it.key == entry.key)
      let previous = ordered.position(it => it.key == entry.after)
      assert(
        previous != none,
        message: "Missing notation predecessor: " + entry.after,
      )
      if position < previous {
        ordered.remove(position)
        ordered.insert(previous, entry)
        changed = true
      }
    }
    if not changed { return ordered }
  }
  panic("Cyclic notation ordering")
}

// Prose wrapping can split a text node without changing the description.
#let notation-content-key(body) = {
  if body.func() == text { body.text } else if body == [ ] {
    " "
  } else if body.has("children") {
    body.children.map(notation-content-key).join("")
  } else { repr(body) }
}

#let notation-index() = context {
  let terms = (:)
  for mark in index-marks(index: "notation") {
    let value = mark.value
    if value.key not in terms { terms.insert(value.key, value + (marks: ())) }
    for field in ("symbol", "meaning") {
      assert(
        notation-content-key(terms.at(value.key).at(field))
          == notation-content-key(value.at(field)),
        message: "Conflicting notation marks: " + value.key + " / " + field,
      )
    }
    for field in ("group", "after", "locator") {
      assert(
        terms.at(value.key).at(field) == value.at(field),
        message: "Conflicting notation marks: " + value.key + " / " + field,
      )
    }
    terms.at(value.key).marks.push(mark)
  }
  let entries = terms.values()
  let categories = ("symbols", "latin", "greek", "relations")
  let groups = entries
    .map(it => it.group)
    .dedup()
    .sorted(key: group => (
      categories.position(it => group.starts-with(it)),
      group,
    ))
  let cells = ()
  for group in groups {
    for entry in notation-order(entries.filter(it => it.group == group)) {
      cells.push(
        metadata((kind: "notation-entry", key: entry.key)) + entry.symbol,
      )
      cells.push(entry.meaning)
      cells.push(if entry.locator { index-locators(entry.marks) } else { [—] })
    }
  }
  table(
    columns: (28mm, 1fr, 17mm),
    column-gutter: 2mm,
    row-gutter: 0.6em,
    inset: 0pt,
    stroke: none,
    align: (left, left, right),
    table.header([_Symbol_], [_Meaning_], [_Page of definition_]),
    ..cells,
  )
}


#let reference-rules(body) = {
  show ref: it => {
    if it.form != "normal" { return it }
    if it.element == none { return it }
    let parts = str(it.target).split(":")
    if parts.len() != 2 { return it }
    let prefix = []
    let suffix = []
    let custom = none
    if it.supplement != auto {
      let supplied = it.supplement
      if supplied.func() == metadata {
        suffix = supplied.value.ref-suffix
      } else if (
        supplied
          in (
            [chapter],
            [section],
            [Theorem],
            [Lemma],
            [Proposition],
            [Corollary],
            [Definition],
          )
      ) {
        prefix = supplied + [ ]
      } else { custom = supplied }
    }
    book-ref(
      parts.first(),
      parts.last(),
      supplement: prefix,
      suffix: suffix,
      custom,
    )
  }
  body
}
