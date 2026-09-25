// Statements and subsections share Carter’s chapter.section.item sequence.
// Layout blocks may keep an opening paragraph with its following formula.
#let prepend-heading(body, head) = {
  if body.func() == block {
    let fields = body.fields()
    let inner = fields.remove("body")
    block(prepend-heading(inner, head), ..fields)
  } else if body.func() == [].func() and body.children.len() > 0 {
    let children = body.children
    let first = children.position(it => it.func() != [ ].func())
    if first == none { head + body } else {
      children.slice(0, first).join()
      prepend-heading(children.at(first), head)
      children.slice(first + 1).join()
    }
  } else { head + body }
}

#let render-statement(kind, prefix, target, title: none, body) = {
  assert(
    str(target).starts-with(prefix + ":"),
    message: "Wrong statement label prefix: " + str(target),
  )
  let plain = kind in ("Definition", "Example")
  // Lists keep upright markers; tabular statements keep upright cell text.
  show grid: set text(style: "normal")
  show table: set text(style: "normal")
  show enum: it => {
    if type(it.numbering) == function { it } else {
      let fields = it.fields()
      let items = fields.remove("children")
      let pattern = fields.remove("numbering", default: "1.")
      fields.numbering = (..n) => text(
        style: "normal",
        numbering(pattern, ..n.pos()),
      )
      enum(..fields, ..items)
    }
  }
  let head = [#counter(heading).step(level: 3)#context {
      let number = numbering("1.1", ..counter(heading).get())
      [#metadata((
        kind: "statement",
        type: kind,
        number: number,
        id: str(target),
      ))]
      let caption = [#kind #number]
      if plain {
        emph(caption + [.] + if title == none { [] } else { [ #title.] })
      } else {
        smallcaps(caption + if title == none { [.] } else { [] })
        if title != none { [ (#title).] }
      }
      [ ]
    }]
  text(
    style: if plain { "normal" } else { "italic" },
    prepend-heading(body, text(style: "normal", head)),
  )
}

// A native figure owns the explicit label at the call site. Its show rule
// preserves the statement's existing paragraph layout.
#let statement(kind, prefix, title: none, body) = figure(
  metadata((kind: kind, prefix: prefix, title: title, body: body)),
  kind: "statement",
  supplement: kind,
  numbering: none,
  outlined: false,
)

#let statement-rules(body) = {
  show figure.where(kind: "statement"): it => {
    set align(left)
    set block(breakable: true)
    let value = it.body.value
    render-statement(
      value.kind,
      value.prefix,
      it.label,
      title: value.title,
      value.body,
    )
  }
  body
}

#let theorem = statement.with("Theorem", "th")
#let lemma = statement.with("Lemma", "l")
#let proposition = statement.with("Proposition", "p")
#let corollary = statement.with("Corollary", "cor")
#let definition = statement.with("Definition", "def")
#let example = statement.with("Example", "ex")

// Keep the end marker inside the final layout block (or inline box).
// Do not descend into lists, equations or an auxiliary proof’s text wrapper.
#let append-ending(body, ending) = {
  if body.func() in (block, box) {
    let fields = body.fields()
    let inner = fields.remove("body")
    body.func()(append-ending(inner, ending), ..fields)
  } else if body.func() == [].func() and body.children.len() > 0 {
    let children = body.children
    let last = children
      .rev()
      .position(it => (
        it.func()
          not in (
            [ ].func(),
            parbreak,
          )
      ))
    if last == none { body + ending } else {
      let index = children.len() - last - 1
      children.slice(0, index).join()
      append-ending(children.at(index), ending)
      children.slice(index + 1).join()
    }
  } else { body + ending }
}

#let proof(body, of: none, continued: false, qed: true) = {
  let head = if continued { [] } else {
    smallcaps([Proof] + if of == none { [.] } else { [ of #of.] }) + [ ]
  }
  metadata((kind: "proof", continued: continued))
  if qed {
    body = append-ending(body, [#h(1fr)#box[#text(size: 11pt)[■]]])
  }
  text(style: "normal", prepend-heading(body, head))
}
