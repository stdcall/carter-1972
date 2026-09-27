// The r-chains −pr+s, …, qr+s with r+s a root, in the proof of Lemma 4.1.1.
// Such a chain lies in the rank-two system spanned by r and s, so the rows
// are the chains found in A_2, B_2 and G_2, each with the ratio
// (s,s)/(r+s,r+s) found there; all occurrences of a chain must agree.
#import "root-systems.typ": (
  as-math, cartan, dynkin, gram, inner, linear, path-layout, roots, vadd,
  vscale,
)

#let rows() = {
  let found = (:)
  for family in ("A", "B", "G") {
    let a = cartan(family, 2)
    let (g, phi) = (gram(a), roots(a))
    let norm(c) = int(calc.round(inner(c, g.map(row => inner(row, c)))))
    for (r, s) in phi.map(r => phi.map(s => (r, s))).join() {
      if s == r or s == vscale(-1, r) { continue }
      let member(k) = vadd(s, vscale(k, r)) in phi
      let (p, q) = (0, 0)
      while member(-p - 1) { p += 1 }
      while member(q + 1) { q += 1 }
      if q > 0 {
        let (x, y) = (norm(s), norm(vadd(s, r)))
        // The lemma: (r+s, r+s)/(s, s) = (p+1)/q.
        assert(y * q == x * (p + 1))
        let d = calc.gcd(x, y)
        let key = str(p) + "," + str(q)
        let ratio = (calc.quo(x, d), calc.quo(y, d))
        assert(found.at(key, default: ratio) == ratio)
        found.insert(key, ratio)
      }
    }
  }
  found
    .pairs()
    .map(((key, ratio)) => (..key.split(",").map(int), ratio))
    .sorted(key: ((p, q, _)) => (p + q, p))
}

#let chain(p, q) = {
  let size = p + q + 1
  let n = range(size).map(i => range(size).map(j => int(calc.abs(i - j) == 1)))
  // The roots kr+s; the longer chains name only s and r+s.
  let shown = if size > 3 { (0, 1) } else { range(-p, q + 1) }
  dynkin(
    n,
    path-layout(n, 1.2),
    labels: shown.map(k => (
      k + p,
      linear(((k, "r"), (1, "s"))),
      (0, 0.15),
      "south",
    )),
    stroke: 0.45pt,
    radius: 1.7pt,
  )
}

#let root-chains() = {
  set text(size: 10.5pt)
  table(
    columns: (48mm, auto, auto, auto),
    stroke: none,
    align: (left, left, left, left),
    inset: (x: 2mm, y: 2.5mm),
    ..rows()
      .map(((p, q, (x, y))) => {
        let factor = if y > 1 { str(x) + "/" + str(y) } else if x > 1 {
          str(x)
        } else { "" }
        (
          chain(p, q),
          as-math("p=" + str(p)),
          as-math("q=" + str(q)),
          as-math("(s,s)=" + factor + "(r+s,r+s)"),
        )
      })
      .join(),
  )
}
