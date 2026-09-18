// The exported function can also be included in a future book appendix.
#let records = json("../corrections.json").entries
#let substantial = (
  "E010",
  "E018",
  "E019",
  "E020",
  "E021",
  "E025",
  "E029",
  "E030",
  "E035",
  "E038",
  "E046",
  "E047",
  "E051",
  "E052",
  "E055",
  "E062",
  "E065",
  "E067",
  "E070",
  "E072",
  "E078",
  "E079",
  "E081",
  "E082",
  "E084",
  "E089",
  "E090",
  "E094",
)
#let entry(id, body) = {
  let record = records.find(e => e.id == id)
  assert(record != none, message: "Unknown correction " + id)
  let page = record.at("printed_page", default: none)
  if page == none {
    let source = record.at("source_file_page", default: none)
    if source != none { page = source - 13 }
  }
  metadata((correction: id))
  block(above: 1.1em, below: 0.35em, sticky: true)[
    #text(weight: "semibold")[#id]
    #h(0.6em)
    #if page != none { [Original p. #page] } else { [Bibliography] }
    #if id in substantial {
      h(0.6em)
      text(size: 9pt, style: "italic")[Mathematical clarification]
    }
  ]
  body
  parbreak()
}
#let correction-list() = [
  = Corrections to the digital edition

  Roger W. Carter, _Simple Groups of Lie Type_ (1972)

  This list records 97 editorial changes and one bibliographic update. Page
  numbers refer to the printed 1972 edition. Mathematical clarifications are
  distinguished from spelling and notation corrections. Computations and bounded
  formal proofs support specific claims; they do not constitute a formal
  verification of the whole book. Detailed original readings and evidence are
  retained in the accompanying source project.

  == Chapter 2 · Weyl groups

  #entry("E001")[The fundamental system is $Pi = {r_1, dots, r_l}$, with no
    prime on $Pi$. No second fundamental system is introduced.]
  #entry("E002")[The sum defining the lexicographic vector runs from $i = 1$ to
    $l$, not from $l = 1$.]
  #entry("E003")[“Let $w$ by an element” becomes “Let $w$ be an element.”]
  #entry("E004")[“A produce of $k - 2$ fundamental reflections” becomes “a
    product of $k - 2$ fundamental reflections.”]
  #entry("E005")[The chamber inequalities are $(r_i, x) > 0$, using the simple
    roots $r_i$; the printed $v_i$ is not defined here.]
  #entry("E006")[“Vectors $x$ for $(r_i, x) = 0$” becomes “vectors $x$ for which
    $(r_i, x) = 0$.”]
  #entry("E007")[The positive cone in the ordered ambient space is $frak(V)^+$,
    not $Phi^+$. The latter denotes its intersection with the finite root
    system.]
  #entry("E008")[The involution relations use the defined generators:
    $w_(r_i)^2 = 1$, replacing $w_i^2 = 1$.]
  #entry("E009")[“Let $Pi$ by a fundamental system” becomes “Let $Pi$ be a
    fundamental system.”]
  #entry("E010")[The cells are the *non-empty* intersections of the given open
    half-spaces and hyperplanes. Empty intersections are not equivalence classes
    and would contradict the uniqueness in Proposition 2.6.3.]
  #entry("E011")[The duplicated “there-therefore” at a line break becomes
    “therefore.”]

  == Chapter 3 · Simple Lie algebras

  #entry("E015")[“Restricted to the Cartan subalgebra of $H$” becomes
    “restricted to the Cartan subalgebra $H$.”]
  #entry("E014")[“Intergers” becomes “integers.”]
  #entry("E016")[In Figure 1, the lower-right root of the $A_2$ diagram is
    labelled $-b$, replacing $b$.]
  #entry("E017")[The reference for the definition of co-roots points to section
    3.5, rather than to the existence theorem 3.5.1.]

  == Chapter 4 · Chevalley groups

  #entry("E018")[The zero-bracket condition includes $r + s != 0$. Opposite
    roots satisfy $[e_r e_(-r)] = h_r$ instead.]
  #entry("E019")[The structure-constant identity in 4.1.2(iii) assumes
    $r, s, r + s in Phi$. The printed condition mentions only $r, s$.]
  #entry("E020")[In Theorem 4.2.1, the nonzero bracket formula explicitly
    requires $r + s in Phi$, and the zero-bracket case excludes $r + s = 0$.]
  #entry("E021")[In the recursion for structure constants, only nonzero terms
    give pairs of roots. Their entries must also be placed in the prescribed
    order before calling them special pairs.]
  #entry("E022")[The smaller-sum assertion applies to “the last four special
    pairs,” not to every displayed pair: the first has the original sum
    $r + s$.]
  #entry("E023")[In the proof of Proposition 4.5.2, the generated Chevalley
    group is $L(K)$, replacing the Lie algebra notation $L_K$.]

  == Chapter 5 · Unipotent subgroups

  #entry("E024")[The third sum in the induction proof of Lemma 5.1.2 starts at
    $i >= 1$. Its factorial $(i - 1)!$ and power with exponent $i - 1$ are not
    defined as intended for $i = 0$.]
  #entry("E025")[In case (iii) of section 5.2, the first exponential factor is
    replaced by the two factors $exp(xi) exp(eta)$ defined on the preceding
    page. The printed expression loses both required noncentral root terms. The
    subsequent central correction and root-group factors confirm the intended
    expansion.]

  == Chapter 6 · Root subgroups of type A₁

  #entry("E026")[The final matrix in the diagonal factorization has bottom-right
    entry $1$, replacing $0$. The printed matrix is singular.]
  #entry("E027")[The group acting on $CC[x, y]$ is $op("SL")_2(CC)$, replacing
    $op("SL")_2(K)$; the surrounding construction is over the complex numbers.]
  #entry("E028")[In Proposition 6.4.1, the root index satisfies $s in Phi$,
    replacing the undefined set $Sigma$.]
  #entry("E029")[The sign relation along the root chain ranges over
    $j = -p, -p + 1, dots, q - 1$, replacing $j = 0, 1, dots, q - 1$. The
    complete range is needed for all adjacent roots of the chain.]

  == Chapter 7 · Diagonal and monomial subgroups

  #entry("E030")[In the proof of Theorem 7.2.2, the coefficient for an arbitrary
    monomial element satisfies $eta in K^*$, not necessarily
    $eta = plus.minus 1$. Diagonal elements can give other nonzero scalars.]
  #entry("E031")[The square of the root representative is $n_r^2 = h_r (-1)$,
    restoring the missing root index on $h$.]

  == Chapter 8 · Bruhat decomposition

  #entry("E032")[Proposition 8.2.1 uses the conjugation
    $n_r X_r n_r^(-1) = X_(-r)$, restoring the inverse on the right.]
  #entry("E033")[The inverse of the product in the conjugation word reverses the
    order of the factors and places an inverse on every factor.]
  #entry("E034")[The inverse factor $n_2^(-1)$ becomes $n_(r_2)^(-1)$, restoring
    the missing root index.]
  #entry("E035")[The support argument in Proposition 8.5.2 is stated using
    membership of $r - s$ in the *span* of $J$, rather than membership in its
    root subsystem. Differences of roots need not be roots. The two corrected
    support conditions intersect only at the required root vector.]
  #entry("E036")[The product index is $r_i in Phi^+$, matching the indexed root
    in its factor $x_(r_i)(t_i)$.]

  == Chapter 9 · Polynomial invariants

  #entry("E037")[“The algebra of symmetric element” becomes “the algebra of
    symmetric elements.”]
  #entry("E038")[In the proof of Theorem 9.2.2, choose a nonzero
    weighted-homogeneous relation of *minimal* weighted degree. This ensures
    that a nonzero formal partial derivative cannot itself vanish after
    substitution; an arbitrary relation does not have that property.]
  #entry("E039")[The action is applied before evaluation: $(w_r (I_i))(a)$,
    replacing $w_r (I_i (a))$. The group acts on polynomials, not on their
    scalar values.]
  #entry("E040")[The fixed-complement factor in 9.4.8 is
    $1 / (1 - t)^(l - abs(J))$, replacing $1 / (1 - t^(l - abs(J)))$. Each
    degree-one generator contributes a separate factor.]

  == Chapter 10 · Exponents

  #entry("E041")[The two subset sums in the product expansion range over
    $Omega subset.eq Phi^+$, restoring the missing positive signs.]
  #entry("E042")[The leading coefficients before and after differentiation are
    given different names, $lambda_i$ and $mu_i$. For the first invariant they
    differ by a factor $d_1$. The coordinate index in the remainder is changed
    to $j > 1$, avoiding reuse of $i$.]

  == Chapter 11 · Properties of Chevalley groups

  #entry("E043")[The BN4 expression is a *union* of double cosets, replacing the
    printed intersection. The following sentence already uses “or,” in agreement
    with the axiom.]
  #entry("E044")[The root indices in $x_(r_1 + r_2)(1)$ are subscripts,
    replacing the printed superscripts.]
  #entry("E045")[The transpose automorphism satisfies $theta(e_r) = -e_(-r)$,
    restoring the missing minus sign for the displayed classical root matrices.]
  #entry("E046")[The concluding argument in 11.2.3 uses the corrected transpose
    sign directly to obtain a Chevalley basis. The imaginary rescaling detour is
    removed: multiplying all positive root vectors by $i$ need not preserve
    integral structure constants. This is a repair of the proof, not a spelling
    correction.]
  #entry("E047")[Theorem 11.3.2(ii) explicitly excludes $B_2(2)$, as its proof
    already does. That Chevalley group has order 720; the orthogonal commutator
    group in the stated identification has order 360.]

  == Chapter 12 · Presentations and automorphisms

  #entry("E048")[Missing overbars are restored on the universal torus generators
    in the conclusion of 12.1.1(i) and the subsequent universal torus products,
    including the occurrence on p. 198.]
  #entry("E049")[“$t_1, dots, t_l$ determines” becomes “$t_1, dots, t_l$
    determine.”]
  #entry("E050")[The product in relation R2 ranges over $i, j > 0$, replacing
    $i, j != 0$. The commutator formula uses positive integers.]
  #entry("E051")[The dual root lies *in the direction* obtained by the stated
    reflection. Reflection alone preserves length, whereas the dual map
    exchanges long and short roots.]
  #entry("E052")[The final fixed-root conclusion ranges over all $r in Phi$,
    replacing $r in Pi$. The preceding fixed Weyl representatives extend the
    simple-root conclusion to every root group; the positive simple-root groups
    alone do not generate the whole group.]

  == Chapter 13 · Twisted simple groups

  #entry("E053")[The basis construction chooses the original root
    $r_i in Phi_(J_i)^+$, replacing its projection $r_i^1$. The projection need
    not belong to the original root system.]
  #entry("E054")[In 13.3.5 and 13.3.6, the rank-one group is $W^1$, replacing
    $W$. It is the fixed subgroup, of order two.]
  #entry("E055")[In the exceptional $B_2$ and $G_2$ cases of 13.5.1, use the
    product of two commuting terminal-root elements exchanged by the
    automorphism. There is no fixed root in these length-exchanging cases. The
    fixed-root argument remains for the $A_1$ and $A_2$ cases.]
  #entry("E056")[The third factor of the first triple-orbit product contains
    both consecutive signs, $gamma_r gamma_(overline(r))$. The later occurrences
    already have their product.]
  #entry("E057")[The two nonfixed simple-root vectors in the second induction
    case of 13.6.2 are exchanged, rather than each being fixed.]
  #entry("E058")[The third field parameter in the triple-orbit character is
    $overline(overline(lambda))$, restoring both overbars.]
  #entry("E059")[The multiplicative parameter domains in 13.7.3 and the torus
    formula on p. 248 are $K^*$, excluding zero. The separate norm variable is
    still allowed to vanish.]
  #entry("E060")[The negative highest-root vector has index $-3a - 2b$,
    replacing the non-root $-3a + 2b$.]
  #entry("E061")[“The only non-unit elements” becomes “the only non-unit
    element.”]
  #entry("E062")[The $A_2$ subsystem subgroup is a homomorphic image of
    $op("SL")_3(K)$; it need not be the adjoint group $A_2(K)$. Central scalars
    can survive in a subsystem even when the ambient group is adjoint. The proof
    only needs the root-compatible surjection.]

  == Chapter 14 · Properties of twisted groups

  #entry("E064")[The orbit-character count uses factors $q^(abs(J)) - 1$,
    replacing $q(abs(J) - 1)$.]
  #entry("E065")[The self-conjugate weight characters are distinguished from
    their restrictions to the root lattice. The restriction map has the stated
    kernel and image; the order calculation uses a ratio of cardinalities. A
    fixed adjoint element need not have every weight character extension
    self-conjugate. The resulting order is unchanged.]
  #entry("E066")[The inner length sum in 14.2.1(b) ranges over $W^1$, restoring
    the missing superscript.]
  #entry("E067")[The face-character identity in 14.2.1(c) holds for $w in W$,
    not only $w in W^1$. The next part averages over the whole Weyl group and
    needs this quantifier.]
  #entry("E068")[In the shifted Hilbert series, $t^N$ and the factor
    $overline(P)_(W^1)(t)$ occur once, outside the product over $i$.]
  #entry("E069")[The degree-one denominator factors are $1 - eta_i t$: missing
    $t$ factors are restored and printed $t^0$ factors replaced. “The
    coefficients … is” becomes “the coefficient … is.”]
  #entry("E071")[The product in the first display of 14.3.1 starts at $i = 1$,
    replacing $l = 1$.]
  #entry("E070")[In the degree-eight invariant for $F_4$, the long-root sum uses
    $i < j$ with all four sign choices. Ordered pairs $i != j$ count each long
    root twice and destroy the stated duality invariance.]
  #entry("E073")[“Complimentary subsets” becomes “complementary subsets.”]
  #entry("E072")[In 14.4.1(b), explicit orbit co-root characters supply the
    nontrivial root values required by the proof. The stronger printed claim
    that arbitrary permitted values can be prescribed is false. The replacement
    handles the small-field cases separately.]
  #entry("E075")[In the $A_4$ commutator of 14.4.1(c), the second coordinate is
    $t overline(t) v$, replacing $t overline(t) overline(v)$. At $t = 1$ it is
    $v$, not $overline(v)$. The first factor retains its overbar.]
  #entry("E074")[The parameter $lambda$ in the inverse-power torus expression is
    explicitly nonzero.]
  #entry("E076")[The element $epsilon$ defining the odd-rank form is explicitly
    nonzero, as required for nondegeneracy.]
  #entry("E077")[The final exponential in the adjoint conjugation formula
    restores the omitted $op("ad")$.]
  #entry("E078")[In 14.5.2, the displayed off-diagonal block matrix represents
    the *polar form*. The transformed matrix uses the reordered coordinates.
    This distinction matters in characteristic two, where a polar form does not
    determine its quadratic form.]
  #entry("E079")[The final identification in 14.5.2 is obtained from the fixed
    root subgroups and their elementary orthogonal generators. Taking all fixed
    elements of the larger commutator group can give a larger group and does not
    justify the printed inference.]

  == Chapter 15 · Geometrical structures

  #entry("E080")[“Each pair … have a greatest lower bound” becomes “Each pair …
    has a greatest lower bound.”]
  #entry("E081")[The exchange index satisfies $alpha >= 1$, replacing
    $alpha >= 2$. The value one is required when the reduced words begin with
    the same generator.]
  #entry("E082")[The thinness argument counts two *cosets* of $B inter N$ in
    $N inter P_J$, rather than claiming there are only two elements. The torus
    need not be trivial.]
  #entry("E083")[In the verification of B4, $P_J$ and $n P_K$ are called
    “elements,” replacing “chambers.” The subsets $J, K$ are arbitrary.]
  #entry("E084")[In 15.6.2, the claimed apartment isomorphism is replaced by the
    distance-preservation argument for retractions. The printed restriction need
    not be injective. The repair follows the parallel building argument in
    Abramenko–Brown, Proposition 4.131, using the preceding distance results.]
  #entry("E085")[The objects $n P_J$ of $Sigma_0$ are “elements,” replacing
    “chambers.” Chambers are the special case $n B$.]

  == Chapter 16 · Sporadic simple groups

  #entry("E093")[“MacKay” becomes “McKay” in section 16.2 and the table.]
  #entry("E089")[The Conway groups are described as “arising from” the lattice
    automorphism group, rather than all being contained in it. In particular,
    $op("Co")_1$ is the central quotient already defined.]
  #entry("E090")[The subgroup in the lattice automorphism group is a sixfold
    central extension of $op("Suz")$, rather than the simple Suzuki group
    itself.]
  #entry("E088")[The Weyl-group quotient is identified with $O_8^+(2)$,
    restoring the plus type of the quadratic form.]
  #entry("E094")[Before the subsequent simple-group identifications, replace $G$
    by $G / Z(G)$ and retain the notation $G$. The original hypotheses allow
    nontrivial central covers.]
  #entry("E086")[The order of $op("Fi")_22$ contains a factor $13$, replacing
    $23$. The adjacent prose already gives the correct factor.]
  #entry("E087")[The final table labels the simple group $op("Fi")'_24$,
    replacing $op("Fi")_24$. Its displayed order is the order of the subgroup of
    index two.]
  #entry("E091")[“MacLaughlin” becomes “McLaughlin,” both in the discoverer
    column and the bibliography author heading.]

  == Bibliography and indexes

  #entry("E012")[Chevalley's title reads _Sur certains groupes simples_,
    replacing _certain_.]
  #entry("E013")[Dieudonné's title reads _La géométrie des groupes classiques_,
    replacing _Le_.]
  #entry("E063")[Four French titles are corrected: _Algèbres de Lie semi-simples
    complexes_ (Serre 3); _Sur les analogues algébriques_ (Tits 1); _Géométries
    polyédriques finies_ (Tits 13); and _Sur le commutant_ (Yokonuma 2).]
  #entry("E092")[The author heading reads “H. V. Niemeier,” replacing “H. V.
    Niemeyer.”]
  #entry("E096")[The notation-index link for $op("Sp")_n (K)$ points to its
    definition in section 1.3, on original p. 3, replacing the original locator
    p. 2.]
  #entry("E095")[In the notation-index description of $W(Sigma)$, $Sigma$ is an
    abstract Coxeter *complex*, replacing “group.”]
  #entry("E097")[“Lefshetz” becomes “Lefschetz” in the subject index.]

  == Bibliographic update

  #block(above: 1em, below: 0.4em, sticky: true)[*BIB001 · Tits [22]*]
  The provisional reference “Notes on finite BN-pairs, to appear” is replaced,
  at the owner's request, by the published account:

  J. Tits, _Buildings of Spherical Type and Finite BN-Pairs_, Lecture Notes in
  Mathematics 386, Springer-Verlag, 1974. #link(
    "https://doi.org/10.1007/978-3-540-38349-9",
  )[
    doi:10.1007/978-3-540-38349-9
  ].

  This is a bibliographic substitution, not a claim that the provisional title
  has been conclusively identified with the final monograph.
]

#set document(
  title: "Corrections · Carter, Simple Groups of Lie Type (1972)",
  author: "Editorial record of the digital edition",
  date: none,
)
#set page(
  width: 176mm,
  height: 250mm,
  margin: 20mm,
  footer: context align(center, counter(page).display()),
)
#set text(font: "Libertinus Serif", size: 11.5pt, lang: "en")
#set par(justify: true, leading: 0.65em, spacing: 0.7em)
#show math.equation: set text(font: "STIX Two Math")
#show math.equation.where(block: false): box
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 24pt)
#show heading.where(level: 2): set text(size: 15pt)
#show link: set text(fill: rgb("234e70"))
#correction-list()
