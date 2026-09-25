#import "main-defs.typ": index-locators, index-marks, index-sort-key, source

= Index <sec:subject-index>

// The index is assembled from the marks in the text, so the divisions of the
// original index pages no longer fall anywhere in particular.
#source(342, "329")
#source(343, "330")
#source(344, "331")

#set text(size: 11pt)
#set par(first-line-indent: 0pt, justify: false, leading: 0.55em)
#let entry(body, sub: false) = block(
  inset: (left: if sub { 1em } else { 0pt }),
  above: 0pt,
  below: 0.35em,
  breakable: false,
)[#set par(hanging-indent: 0.8em)
  #body]

#columns(2, gutter: 7mm)[
  #context {
    let terms = (:)
    for mark in index-marks() {
      let value = mark.value
      let key = index-sort-key(value.term)
      let term = terms.at(
        key,
        default: (term: value.term, marks: (), subs: (:)),
      )
      if value.sub == none {
        term.marks.push(mark)
      } else {
        let sub-key = index-sort-key(value.sub)
        let sub = term.subs.at(sub-key, default: (name: value.sub, marks: ()))
        sub.marks.push(mark)
        term.subs.insert(sub-key, sub)
      }
      terms.insert(key, term)
    }

    let letter = ""
    for key in terms.keys().sorted() {
      let term = terms.at(key)
      if key.first() != letter {
        if letter != "" { v(0.65em, weak: true) }
        letter = key.first()
      }
      let head = eval(term.term, mode: "markup")
      entry[#head#if term.marks.len() > 0 [
          #h(0.3em)#index-locators(term.marks)
        ]]
      for sub-key in term.subs.keys().sorted() {
        let sub = term.subs.at(sub-key)
        entry(sub: true)[#eval(sub.name, mode: "markup") #h(
            0.3em,
          )#index-locators(
            sub.marks,
          )]
      }
    }
  }
]
