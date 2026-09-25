#import "main-defs.typ": source
#source(324, "311")
= Bibliography
#set text(size: 11pt)
#set par(
  first-line-indent: 0pt,
  leading: 0.5em,
  spacing: 0.45em,
  justify: false,
)
#let db = json("../build/.cache/bibliography.json")
#let title-tokens = (
  ("$B_n$", $B_n$),
  ("$A_n$", $A_n$),
  ("$\\mathcal{P}$", $cal(P)$),
)
#let title-content(t, level: 0) = {
  if level == title-tokens.len() {
    t
  } else {
    let (token, body) = title-tokens.at(level)
    for (i, part) in t.split(token).enumerate() {
      if i > 0 { body }
      title-content(part, level: level + 1)
    }
  }
}
#let entry(e) = {
  if e.source_start { source(e.source_file_page, str(e.source_file_page - 13)) }
  [#metadata((kind: "bibliography-anchor", key: e.key))#label("bib:" + e.key)]
  let first = "part" not in e or e.part == "I"
  let fields = ()
  if first and e.title != "" {
    let title = if e.type == "book" and "series" not in e {
      emph(title-content(e.title))
    } else { title-content(e.title) }
    fields.push(if "url" in e and "addendum" not in e {
      link(e.url, title)
    } else { title })
  }
  if e.type == "book" {
    for key in ("volume", "edition") {
      if key in e { fields.push(e.at(key)) }
    }
    if "series" in e {
      fields.push([#emph(e.series)#if "number" in e {
          [, #strong(e.number)]
        }#if "date" in e { [ (#e.date)] }])
    }
    if "note" in e { fields.push([(#e.note)]) }
    if "publisher" in e { fields.push(e.publisher) }
    if "location" in e { fields.push(e.location) }
    if "series" not in e and "date" in e {
      fields.last() = [#fields.last() (#e.date)]
    }
  } else {
    let publication = if e.type == "incollection" {
      emph(e.booktitle)
    } else if "journaltitle" in e {
      emph(e.journaltitle)
    }
    if publication != none {
      fields.push([#if (
          "part" in e and e.at("partstyle", default: "") != "none"
        ) {
          [(#e.part) ]
        }#publication#if "volume" in e { [, #strong(e.volume)] }])
    }
    if "editor" in e { fields.push([edited by #e.editor]) }
    if "publisher" in e { fields.push(e.publisher) }
    if "location" in e { fields.push(e.location) }
    if "date" in e { fields.last() = [#fields.last() (#e.date)] }
    if "pages" in e { fields.push(e.pages) }
    if "note" in e { fields.push(e.note) }
  }
  fields.join([, ])
  if "addendum" in e {
    [. #if "url" in e { link(e.url, e.addendum) } else { e.addendum }]
  }
}
#for group in db.groups {
  table(
    columns: (1.8em, 1fr),
    column-gutter: 0.5em,
    row-gutter: 0.3em,
    inset: 0pt,
    stroke: none,
    align: (right, left),
    table.header(
      repeat: true,
      table.cell(
        colspan: 2,
        align: left,
        inset: (top: 0.5em, bottom: 0.3em),
        group.author,
      ),
    ),
    ..group
      .works
      .map(work => (
        table.cell(breakable: false)[#work.number.],
        table.cell(breakable: false)[#work.parts.map(entry).join([; ]).],
      ))
      .flatten(),
  )
}
