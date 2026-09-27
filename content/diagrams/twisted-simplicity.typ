// Printed page 265: the diagram of A_(2k) with the fundamental roots r, s in
// the middle and their images under the symmetry ρ.
#import "root-systems.typ": (
  across, bonds, cartan, complete, dynkin, path-layout, symmetry,
)

#let unitary-chain() = {
  let a = cartan("A", 10)
  let rho = symmetry(a, range(10).rev())
  let (r, s) = (3, 4)
  // The left half; the bond from s to ρ(s) has the common length 0.65, and ρ
  // is the reflection in its perpendicular bisector.
  let half = path-layout(
    bonds(a),
    (0, 0.65, 2, 2.65),
    skip: (2, ..range(5, 10)),
  )
  let at = complete(half, rho, across(2.65 + 0.65 / 2))
  let labels = (
    (r, "r"),
    (s, "s"),
    (rho.at(s), "overline(s)"),
    (rho.at(r), "overline(r)"),
  )
  dynkin(
    bonds(a),
    at,
    labels: labels.map(((i, body)) => (i, body, (0, 0.12), "south")),
    stroke: 0.6pt,
    radius: 0.055,
  )
}
