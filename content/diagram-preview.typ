// Standalone previews use the book's text width and fonts.
// Importing diagram functions does not insert their preview content.
#let diagram-preview(body) = {
  set page(width: 146mm, height: auto, margin: 5mm)
  set text(font: "Libertinus Serif", size: 12pt, fill: rgb("202020"))
  set par(leading: 0.68em, spacing: 1.1em)
  show math.equation: set text(font: "STIX Two Math")
  body
}
