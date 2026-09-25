// Обложка переиздания 1989 года (Wiley Classics Library), реконструкция.
// Сборка: `typst compile cover-1989.typ cover-1989.svg` на машине с системными
// шрифтами macOS (Snell Roundhand, Georgia, Helvetica); в SVG буквы
// уже контуры, так что книга от шрифтов не зависит.
//
// Пропорции и цвета сняты с издательской фотографии обложки
// 1989 г. (338×522 px). В долях высоты:
// надпись серии 7–12 % с линией на 10 % по обе стороны; «CARTER» 33–45 %,
// буквица опускается ниже строки и прерывает полосу; широкая жёлтая полоса
// 42,7–44,1 % и тонкая линия под ней; строки названия 52–58, 59–62 и 64–69 %.
#let background = rgb("000000")
#let yellow = rgb("eccc60")
#let cream = rgb("d8cfae")
#let ink = rgb("ffffff")
#let W = 176mm
#let H = 250mm

#set page(width: W, height: H, margin: 0pt, fill: background)
#set text(fill: ink)

// Серия: каллиграфическая пропись, по обе стороны — тонкая линия.
#place(top + left, dy: 0.100 * H, line(length: W, stroke: 0.7pt + cream))
#place(top + center, dy: 0.058 * H, box(
  fill: background,
  inset: (x: 2mm, y: 0.3mm),
  scale(x: 88%, reflow: true, text(
    font: "Snell Roundhand",
    weight: 900,
    size: 34pt,
    fill: cream,
  )[Wiley Classics Library]),
))

// Полоса под фамилией: широкая, затем тонкая линия.
#let band(top-at, height) = place(
  top + left,
  dy: top-at * H,
  rect(width: W, height: height * H, fill: yellow),
)
#band(0.427, 0.014)
#band(0.4455, 0.0035)

// «CARTER»: буквица опускается ниже строки и прерывает обе полосы.
#place(top + center, dy: 0.302 * H, box({
  set text(font: "Georgia", weight: "bold")
  box(
    fill: background,
    inset: (left: 1.6mm, right: 1mm, bottom: 1.4mm),
    text(size: 106pt, baseline: 7.5mm)[C],
  )
  h(-1.2mm)
  text(size: 60pt)[ARTER]
}))

// Название — три строки рубленым шрифтом.
#place(top + center, dy: 0.515 * H, align(center, block({
  set text(font: "Helvetica", size: 41pt, tracking: -0.3pt)
  set par(leading: 0.30em)
  [Simple Groups \ of \ Lie Type]
})))
