#let chapter = [
  #[
    #import "main-defs.typ": book-ref, qed, source
    #let Av = math.op("Av")

    #source(136, "123")
    = Polynomial Invariants of the Weyl Group <ch:polynomial-invariants>

    == The Algebra of Polynomial Invariants <sec:polynomial-invariant-algebra>

    We have seen how the Bruhat decomposition enables us to obtain a formula for
    the orders of the finite Chevalley groups which involves the polynomial
    $ sum_(w in W) t^(l(w)). $ <eq:9-1-length-polynomial>
    We shall show in the present chapter that this polynomial factorizes into a
    product of terms of form
    $ 1+t+t^2+dots+t^(d_i-1)=(t^(d_i)-1)/(t-1), $ <eq:9-1-degree-factor>
    where $d_1,dots,d_l$ are the degrees of certain basic polynomial invariants
    of $W$. The numbers $d_1,dots,d_l$ have other interpretations also, as we
    shall see in the #book-ref(
      "ch",
      "exponents",
      [following chapter],
      highlight: false,
    ), but we describe them first in terms of polynomial invariants as this
    appears to be the approach which generalizes most readily to the twisted
    groups to be considered in chapters #book-ref(
      "ch",
      "twisted-simple-groups",
    ), #book-ref("ch", "properties-of-twisted-groups").

    Let $W$ be a Weyl group operating on the Euclidean space $frak(V)$, and let
    $e_1,e_2,dots,e_l$ be an orthonormal basis of $frak(V)$. Then each
    $x in frak(V)$ can be written in the form
    $ x=x_1 e_1+dots+x_l e_l, quad x_i in RR. $ <eq:9-1-coordinates>
    Given any polynomial $P(x_1,dots,x_l)$ in $x_1,dots,x_l$, $P$ may be
    regarded as a map from $frak(V)$ to $RR$. Let $frak(S)$ be the algebra of
    all such polynomial functions on $frak(V)$. $frak(S)$ is independent of the
    basis chosen for $frak(V)$. For the homogeneous polynomials of degree one in
    $frak(S)$ form the dual space $hat(frak(V))$ of $frak(V)$, and $frak(S)$ is
    then the symmetric algebra of $hat(frak(V))$; viz., the algebra of symmetric
    elements in the tensor space
    // E037: printed singular "element" corrected to "elements".
    $
      RR 1 ⊕ hat(frak(V)) ⊕ (hat(frak(V)) ⊗ hat(frak(V)))
      ⊕ (hat(frak(V)) ⊗ hat(frak(V)) ⊗ hat(frak(V))) ⊕ dots.
    $ <eq:9-1-tensor-algebra>
    Now the action of $W$ on $frak(V)$ may be transferred in a natural way to an
    action on $hat(frak(V))$ by defining $w(f)$, $w in W$, $f in hat(frak(V))$
    by
    $ w(f)(w(x))=f(x), quad x in frak(V). $ <eq:9-1-dual-action>

    #block(sticky: true)[
      #source(137, "124")
      The action of $W$ on $hat(frak(V))$ may then be extended to an action on
      $frak(S)$ by defining
    ]
    $
      w(P)(x)=P(w^(-1)(x)), quad P in frak(S), quad x in frak(V).
    $ <eq:9-1-polynomial-action>
    #metadata((kind: "anchor")) <def:invariant-ring>
    A polynomial function in $frak(S)$ is called an invariant of $W$ if $w(P)=P$
    for all $w in W$. The invariants form a subring $frak(I)$ of $frak(S)$. Now
    $frak(S)$ is the polynomial ring $RR[x_1,x_2,dots,x_l]$, and we shall show
    that its subring of invariants is also a polynomial ring, i.e.
    $ frak(I)=RR[I_1,I_2,dots,I_l], $ <eq:9-1-invariant-ring>
    where $I_1,I_2,dots,I_l$ are certain elements of $frak(I)$.

    #metadata((kind: "anchor")) <ex:9-1-1>
    _Example 9.1.1._ The Weyl group of type $A_l$ is isomorphic to the symmetric
    group $S_(l+1)$. It is best described operating on the subspace of an
    $(l+1)$-dimensional Euclidean space with orthonormal basis
    $e_0,e_1,dots,e_l$ whose elements satisfy $x_0+x_1+dots+x_l=0$. The elements
    of $W$ operate on $frak(V)$ by permuting the coordinates $x_0,x_1,dots,x_l$
    in all possible ways. Thus the polynomial invariants are the symmetric
    polynomials in $x_0,x_1,dots,x_l$. These are all polynomials in the
    elementary symmetric polynomials. Since $x_0+x_1+dots+x_l=0$ we have
    $frak(I)=RR[I_1,I_2,dots,I_l]$, where $I_i$ is the elementary symmetric
    polynomial of degree $i+1$.

    #metadata((kind: "anchor")) <ex:9-1-2>
    _Example 9.1.2._ The Weyl group of type $B_l$ operates on a Euclidean space
    with orthonormal basis $e_1,dots,e_l$ by permuting the coordinates
    $x_1,dots,x_l$ in all possible ways and by changing the signs arbitrarily.
    Thus the polynomial invariants are the symmetric polynomials in
    $x_1^2,x_2^2,dots,x_l^2$. These are all polynomials in the elementary
    symmetric polynomials in $x_1^2,dots,x_l^2$. Thus
    $frak(I)=RR[I_1,I_2,dots,I_l]$ where $I_i$ is the $i$th elementary symmetric
    polynomial in $x_1^2,dots,x_l^2$.

    In general, a polynomial of form
    $lambda x_1^(k_1) x_2^(k_2) dots x_m^(k_m)$, $lambda in RR$, is called a
    monomial of degree $k_1+k_2+dots+k_m$. The degree of an arbitrary polynomial
    $P$ is the greatest degree of any monomial constituent and will be denoted
    by $deg P$. A polynomial is called homogeneous if all its monomial
    constituents have the same degree.

    For each $P in frak(S)$, the average of $P$ under $W$ is defined by
    $ Av P=1/abs(W) sum_(w in W) w(P). $ <eq:9-1-average>

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:9-1-3>
      #smallcaps[Lemma 9.1.3.] _If $P in frak(S)$ then $Av P in frak(I)$._
    ]

    #block(width: 100%, breakable: false)[
      #source(138, "125")
      #smallcaps[Proof.] Let $w in W$. Then we have
      $
        w(Av P)=1/abs(W) sum_(w' in W) w w'(P)
        =1/abs(W) sum_(w' in W) w'(P)=Av P.
      $ <eq:9-1-3-average-invariant>
      #qed
    ]
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, qed, source
    #let Av = math.op("Av")
    #let trdeg = math.op("tr. deg.")

    == A Theorem of Chevalley <sec:chevalley-invariant-theorem>

    The fact that $frak(I)$ is a polynomial ring was originally proved by
    Chevalley #bib-ref("chevalley1955invariants"). In order to prove Chevalley's
    theorem we first need a preliminary lemma. Let $frak(S)^+$ be the set of
    polynomials in $frak(S)$ with constant term $0$, and let
    $frak(I)^+=frak(I) inter frak(S)^+$. Let $frak(S)frak(I)^+$ be the ideal of
    $frak(S)$ generated by $frak(I)^+$. The elements of $frak(S)frak(I)^+$
    therefore have form $P_1 J_1+dots+P_k J_k$, where $P_i in frak(S)$,
    $J_i in frak(I)^+$ for each $i$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:9-2-1>
      #smallcaps[Lemma 9.2.1.] _Suppose $J_1,J_2,dots,J_k$ are elements of
      $frak(I)$ such that $J_1$ is not in the ideal of $frak(I)$ generated by
      $J_2,dots,J_k$. Let $P_1,P_2,dots,P_k$ be homogeneous polynomials in
      $frak(S)$ such that $P_1 J_1+dots+P_k J_k=0$. Then
      $P_1 in frak(S)frak(I)^+$._
    ]

    #smallcaps[Proof.] We show first that $J_1$ is not in the ideal of $frak(S)$
    generated by $J_2,dots,J_k$. Suppose this were false. Then
    $ J_1=Q_2 J_2+dots+Q_k J_k, quad Q_i in frak(S). $ <eq:9-2-1-ideal>
    Now for each $w in W$ we have
    $ w(Q_i J_i)=w(Q_i)w(J_i)=w(Q_i)J_i. $ <eq:9-2-1-invariant-factor>
    Thus $Av(Q_i J_i)=(Av Q_i)J_i$. It follows that
    $ J_1=Av J_1=(Av Q_2)J_2+dots+(Av Q_k)J_k. $ <eq:9-2-1-averaged-ideal>
    Since $Av Q_i in frak(I)$, this means that $J_1$ is in the ideal of
    $frak(I)$ generated by $J_2,dots,J_k$, a contradiction.

    We prove that $P_1 in frak(S)frak(I)^+$ by induction on $deg P_1$. If
    $deg P_1=0$, $P_1$ is constant. Since $J_1$ is not in the ideal of $frak(S)$
    generated by $J_2,dots,J_k$, we must have $P_1=0$. Thus
    $P_1 in frak(S)frak(I)^+$ in this case.

    #block()[
      We now assume $deg P_1>0$. The root system $Phi$ is a finite subset of
      $frak(V)$ and, for each $r in Phi$, the hyperplane orthogonal to $r$ is
      given by an equation $H_r=0$, where $H_r$ is a homogeneous polynomial of
      degree $1$. Consider the polynomial $w_r (P_i)-P_i$. This polynomial
      vanishes at all points for which $H_r$ is zero.
    ]
    #block(sticky: true)[
      Since $H_r$ is an irreducible polynomial, $H_r$ divides
      #source(139, "126")
      $w_r (P_i)-P_i$, thus
    ]
    $
      w_r (P_i)-P_i=H_r dot overline(P)_i, quad overline(P)_i in frak(S).
    $ <eq:9-2-1-reflection-quotient>
    Now $P_i$ is homogeneous, hence $w_r (P_i)$ is homogeneous of the same
    degree. Thus $w_r (P_i)-P_i$ is also homogeneous, and it follows that
    $overline(P)_i$ is homogeneous. Moreover $deg overline(P)_i<deg P_i$. Now we
    have
    $ P_1 J_1+dots+P_k J_k=0. $ <eq:9-2-1-relation>
    Thus
    $ w_r (P_1)J_1+dots+w_r (P_k)J_k=0 $ <eq:9-2-1-reflected-relation>
    and so
    $ H_r (overline(P)_1 J_1+dots+overline(P)_k J_k)=0. $ <eq:9-2-1-difference>
    Since $H_r$ is not identically zero we have
    $ overline(P)_1 J_1+dots+overline(P)_k J_k=0. $ <eq:9-2-1-lower-relation>
    But $deg overline(P)_1<deg P_1$ and so $overline(P)_1 in frak(S)frak(I)^+$
    by induction. Thus
    $ w_r (P_1)-P_1 in frak(S)frak(I)^+. $ <eq:9-2-1-reflection-congruence>

    Now $w(frak(I)^+)=frak(I)^+$ for each $w in W$, hence
    $w(frak(S)frak(I)^+)=frak(S)frak(I)^+$. Thus each $w in W$ operates
    naturally on the quotient ring $frak(S)\/frak(S)frak(I)^+$. We have seen
    that $w_r$ operates trivially on $P_1$ in this quotient ring for each
    $r in Phi$. Since the $w_r$ generate $W$, each $w in W$ operates trivially
    on $P_1$ in the quotient ring. Thus
    $ w(P_1)-P_1 in frak(S)frak(I)^+. $ <eq:9-2-1-group-congruence>
    It follows that $Av P_1-P_1 in frak(S)frak(I)^+$. But $P_1$ is homogeneous
    with $deg P_1>0$, hence $Av P_1 in frak(I)^+$. In particular
    $Av P_1 in frak(S)frak(I)^+$ and so $P_1 in frak(S)frak(I)^+$ as required.
    #qed

    Now the ideal $frak(S)frak(I)^+$ of $frak(S)$ is generated by the
    homogeneous elements of $frak(I)$ of positive degree. By Hilbert's basis
    theorem there is a finite subset of this generating set which generates
    $frak(S)frak(I)^+$. Thus there is a set $I_1,I_2,dots,I_n$ of homogeneous
    polynomials in $frak(I)$ such that $I_1,dots,I_n$ generates
    $frak(S)frak(I)^+$ but no proper subset has this property.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:9-2-2>
      #smallcaps[Theorem 9.2.2.] _There is no polynomial $P!=0$ such that_
      $ P(I_1,dots,I_n)=0. $ <eq:9-2-2-independence>
      _Thus $I_1,dots,I_n$ are algebraically independent._
    ]

    #source(140, "127")
    #smallcaps[Proof.] Suppose $P(I_1,dots,I_n)=0$ with $P!=0$. We may assume,
    by comparing terms of a given degree, that all monomials in $I_1,dots,I_n$
    which occur in $P$ have the same degree $d$ in $x_1,dots,x_l$.
    // E038: minimal weighted degree is needed before evaluating the derivatives.
    Choose such a relation with $d$ as small as possible. Let $P_i=∂ P\/∂ I_i$.
    Then $P_i (I_1,dots,I_n)$, $i=1,dots,n$, are elements of $frak(I)$ and not
    all the $P_i$ are zero. Let $frak(K)$ be the ideal of $frak(I)$ generated by
    $P_1,P_2,dots,P_n$. We may choose the notation so that $P_1,dots,P_m$ but no
    proper subset generate $frak(K)$ as an ideal of $frak(I)$. Then there exist
    polynomials $Q_(i,j) in frak(I)$ such that
    $ P_i=sum_(j=1)^m Q_(i,j)P_j, quad i>m. $ <eq:9-2-2-minimal-generators>

    Now each $P_i$ is homogeneous in $x_1,dots,x_l$ of degree $d-deg I_i$. Thus,
    by comparing terms of the same degree in $x_1,dots,x_l$ on both sides, we
    may assume each $Q_(i,j)$ is homogeneous of degree $deg P_i-deg P_j$. Thus
    $deg Q_(i,j)=deg I_j-deg I_i$.

    Now $P(I_1,dots,I_n)=0$, thus $∂ P\/∂ x_k=0$ for $k=1,dots,l$. Hence
    $
      sum_(i=1)^n (∂ P)/(∂ I_i)
      (∂ I_i)/(∂ x_k)=0,
    $ <eq:9-2-2-chain-rule>
    $ sum_(i=1)^n P_i (∂ I_i)/(∂ x_k)=0. $
    <eq:9-2-2-derivative-relation>
    It follows that
    $
      sum_(i=1)^m P_i (∂ I_i)/(∂ x_k)
      +sum_(i=m+1)^n lr(
        (
          sum_(j=1)^m Q_(i,j)P_j
          (∂ I_i)/(∂ x_k)
        )
      )=0,
    $ <eq:9-2-2-substitution>
    $
      sum_(i=1)^m P_i lr(
        (
          (∂ I_i)/(∂ x_k)
          +sum_(j=m+1)^n Q_(j,i)(∂ I_j)/(∂ x_k)
        )
      )=0.
    $ <eq:9-2-2-regrouped>
    We now apply #book-ref("l", "9-2-1", [9.2.1]). $P_1,dots,P_m$ are in
    $frak(I)$ and $P_1$ is not in the ideal of $frak(I)$ generated by
    $P_2,dots,P_m$. Each of the polynomials
    $
      (∂ I_i)/(∂ x_k)
      +sum_(j=m+1)^n Q_(j,i)(∂ I_j)/(∂ x_k),
      quad i=1,dots,m,
    $ <eq:9-2-2-homogeneous-coefficients>
    #block(sticky: true)[
      is homogeneous in $x_1,dots,x_l$ of degree $deg I_i-1$. Thus by #book-ref(
        "l",
        "9-2-1",
        [9.2.1],
      ) we have
    ]
    $
      (∂ I_1)/(∂ x_k)
      +sum_(j=m+1)^n Q_(j,1)(∂ I_j)/(∂ x_k)
      in frak(S)frak(I)^+.
    $ <eq:9-2-2-coefficient-ideal>
    #block(sticky: true)[
      We now multiply this polynomial by $x_k$ and sum over $k$. For a
      homogeneous polynomial $I_j$ in $x_1,dots,x_l$ we have, by Euler's
      formula,
    ]
    $
      sum_(k=1)^l x_k (∂ I_j)/(∂ x_k)=deg I_j dot I_j.
    $ <eq:9-2-2-euler>

    #source(141, "128")
    Therefore
    $
      deg I_1 dot I_1+sum_(j=m+1)^n deg I_j dot Q_(j,1)I_j
      =sum_(i=1)^n I_i R_i,
    $ <eq:9-2-2-positive-coefficients>
    where each $R_i in frak(S)^+$. All the terms on the left-hand side are
    homogeneous of degree $deg I_1$. Comparing terms of this degree on both
    sides we obtain
    $
      deg I_1 dot I_1+sum_(j=m+1)^n deg I_j dot Q_(j,1)I_j=sum_i I_i S_i,
    $ <eq:9-2-2-degree-component>
    where the sum on the right extends over some subset of $1,dots,n$ not
    including $i=1$ (since the monomials in $I_1 R_1$ have too large a degree).
    It follows now that $I_1$ is in the ideal of $frak(S)$ generated by
    $I_2,dots,I_n$ and we have a contradiction. This completes the proof. #qed

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:9-2-3>
      #smallcaps[Theorem 9.2.3.] _Every element of $frak(I)$ is a polynomial in
      $I_1,dots,I_n$._
    ]

    #smallcaps[Proof.] It is sufficient to prove this for homogeneous
    polynomials in $frak(I)$. Let $J in frak(I)$ be homogeneous. We use
    induction on $deg J$, the result being clear if $deg J=0$. Suppose
    $deg J>0$. Then $J in frak(I)^+$ and in particular $J in frak(S)frak(I)^+$.
    Thus we have
    $ J=P_1 I_1+dots+P_n I_n $ <eq:9-2-3-generation>
    for certain $P_1,dots,P_n in frak(S)$. Since $J,I_1,dots,I_n$ are all
    homogeneous we may assume each $P_i$ is homogeneous also, with
    $deg P_i=deg J-deg I_i$. Then
    $ J=Av J=Av P_1 dot I_1+dots+Av P_n dot I_n. $ <eq:9-2-3-average>
    $Av P_1,dots,Av P_n$ are homogeneous polynomials in $frak(I)$ of degree less
    than $deg J$. Thus they are polynomials in $I_1,dots,I_n$ by induction, and
    so $J$ is also. #qed

    #block(sticky: true)[
      #metadata((kind: "anchor")) <cor:9-2-4>
      #smallcaps[Corollary 9.2.4.] _$frak(I)=RR[I_1,dots,I_n]$ is isomorphic to
      the polynomial ring in $n$ generators over $RR$._
    ]

    #smallcaps[Proof.] This follows from #book-ref("th", "9-2-2", [9.2.2]) and
    #book-ref("th", "9-2-3", [9.2.3]). #qed

    $I_1,dots,I_n$ is called a set of _basic polynomial invariants_ of $W$. We
    now determine the number of invariants in a basic set.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:9-2-5>
      #smallcaps[Theorem 9.2.5.] _The number of invariants in a basic set is
      equal to the rank of the Weyl group._
    ]

    #source(142, "129")
    #smallcaps[Proof.] In the above notation we must show that $n=l$. Let
    $ K=RR(x_1, dots, x_l) $ <eq:9-2-5-rational-field>
    be the field of rational functions in $x_1,dots,x_l$ over $RR$. Similarly
    let $k=RR(I_1, dots, I_n)$ be the field of rational functions in
    $I_1,dots,I_n$ over $RR$. Then we have
    $ RR subset k subset K. $ <eq:9-2-5-field-tower>
    Since $x_1,dots,x_l$ are algebraically independent over $RR$, the
    transcendence degree of $K$ over $RR$ is given by
    $ trdeg K\/RR=l. $ <eq:9-2-5-ambient-degree>
    Also by #book-ref("th", "9-2-2", [9.2.2]) we have
    $ trdeg k\/RR=n. $ <eq:9-2-5-invariant-degree>
    Since
    $ trdeg K\/RR=trdeg k\/RR+trdeg K\/k $ <eq:9-2-5-tower-degree>
    by Galois theory (see, for example, Jacobson #bib-ref("jacobson1964")), we
    consider $trdeg K\/k$. Now $K$ is generated over $k$ by $x_1,dots,x_l$.
    However, each $x_i$ is an algebraic element over $k$. For the polynomial
    $ product_(w in W) (t-w(x_i)) $ <eq:9-2-5-orbit-polynomial>
    #block(width: 100%)[
      has $x_i$ as a root, and its coefficients are the elementary symmetric
      polynomials in $w(x_i)$ for all $w in W$. These coefficients are invariant
      under each element of $W$ so are in $frak(I)$ and therefore in $k$. Thus
      $K$ is generated over $k$ by a finite number of algebraic elements over
      $k$, and so
      $ trdeg K\/k=0. $ <eq:9-2-5-algebraic-extension>
      It follows that $n=l$. #qed

    ]
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, qed, source
    #let Av = math.op("Av")
    #let diag = math.op("diag")
    // Right overhang avoids the outer sum limit.
    #let mathrlap(body) = context {
      let content = $script(body)$
      let width = measure(content).width
      box(width: 0pt, inset: (right: -width), content)
    }

    == The Degrees of the Basic Invariants <sec:basic-invariant-degrees>

    Now the set $I_1,dots,I_l$ of basic polynomial invariants of $W$ is not
    uniquely determined. It is not difficult to show, however, that the degrees
    of the polynomials in a basic set are uniquely determined.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:9-3-1>
      #smallcaps[Proposition 9.3.1.] _Let $I_1,dots,I_l$; $I'_1,dots,I'_l$ be
      two sets of basic
      #source(143, "130")
      polynomial invariants. Then we may arrange the numbering so that
      $deg I_i=deg I'_i$ for $i=1,dots,l$._
    ]

    #smallcaps[Proof.] Each of $I'_1,dots,I'_l$ is expressible as a polynomial
    in $I_1,dots,I_l$ and conversely. Consider the matrices
    $ lr(((∂ I_i)/(∂ I'_j))), quad lr(((∂ I'_i)/(∂ I_j))). $
    <eq:9-3-1-jacobian-matrices>
    These are inverse matrices since
    $
      sum_(k=1)^l (∂ I_i)/(∂ I'_k) (∂ I'_k)/(∂ I_j)
      =(∂ I_i)/(∂ I_j)=cases(1 & "if" i=j, 0 & "if" i!=j.)
    $ <eq:9-3-1-chain-rule>
    Thus the determinant $abs(∂ I_i\/∂ I'_j)$ is non-zero. It follows that for
    some permutation $rho$ of $1,2,dots,l$,
    $ product_(i=1)^l (∂ I_i)/(∂ I'_(rho(i))) != 0. $
    <eq:9-3-1-permutation-term>
    By renumbering $I'_1,dots,I'_l$ we may assume $rho$ is the identity. Thus
    $∂ I_i\/∂ I'_i!=0$ for each $i$. This means that $I_i$, as a polynomial in
    $I'_1,dots,I'_l$, involves $I'_i$ and so $deg I_i>=deg I'_i$. In particular
    $ sum_(i=1)^l deg I_i >= sum_(i=1)^l deg I'_i. $ <eq:9-3-1-degree-sums>
    By symmetry we must have equality. Thus $deg I_i=deg I'_i$ for each $i$.
    #qed

    We shall denote the degrees of the basic invariants by $d_1,d_2,dots,d_l$,
    and shall derive some properties of this set of integers.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:9-3-2>
      #smallcaps[Lemma 9.3.2.] _Let $M$ be any finite-dimensional $W$-module
      over a field of characteristic $0$. Then the dimension of the subspace
      formed by the $W$-invariants of $M$ (i.e. the elements $x in M$ such that
      $w(x)=x$ for all $w in W$) is equal to the trace of the linear
      transformation_
      $ 1/abs(W) sum_(w in W) w $ <eq:9-3-2-average-operator>
      _of $M$._
    ]

    #block(sticky: true)[#smallcaps[Proof.] Let]
    $ T=1/abs(W) sum_(w in W) w. $ <eq:9-3-2-projector>
    #source(144, "131")
    Then $T^2=T$. Let $M_0$ be the set of $x in M$ with $T(x)=0$ and $M_1$ be
    the set of $x in M$ with $T(x)=x$. Then $M=M_0 ⊕ M_1$ since $T$ is
    idempotent. The trace of $T$ is the dimension of $M_1$. Also the
    $W$-invariants of $M$ are just the elements which lie in $M_1$. For if $x$
    is $W$-invariant,
    $ T(x)=1/abs(W) sum_(w in W) x=x, $ <eq:9-3-2-fixed-image>
    whereas conversely if $T(x)=x$ we have
    $ w(x)=w T(x)=T(x)=x $ <eq:9-3-2-invariant-image>
    for all $w in W$. This completes the proof. #qed

    We now return to the natural representation of $W$ on $frak(V)$. Let
    $w in W$ be an element with eigenvalues $lambda_1,dots,lambda_l$ on
    $frak(V)$. The $lambda_i$ are in the complex field. Let $frak(V)_CC$ be the
    complexification of $frak(V)$. Then $w$ may be represented by the diagonal
    matrix $diag(lambda_1, dots, lambda_l)$ with respect to a suitable basis of
    $frak(V)_CC$. Thus, for each $t in CC$,
    $ det(1-t w)=(1-lambda_1 t)(1-lambda_2 t)dots(1-lambda_l t). $
    <eq:9-3-eigenvalue-determinant>
    #block(sticky: true)[
      If we consider $t$ now as an indeterminate, $1\/det(1-t w)$ may be
      expressed as a power series in $t$. In fact
    ]
    $
      1/(det(1-t w)) & = (1+lambda_1 t+lambda_1^2 t^2+dots)
                       (1+lambda_2 t+lambda_2^2 t^2+dots) \
                     & quad dots(1+lambda_l t+lambda_l^2 t^2+dots) \
                     & = sum_(n>=0) lr(
                         (
                           sum_(mathrlap(k_1+dots+k_l=n))
                           lambda_1^(k_1) lambda_2^(k_2) dots lambda_l^(k_l)
                         )
                       ) t^n.
    $ <eq:9-3-eigenvalue-series>
    We write $Av 1\/det(1-t w)$ to denote the power series
    $ 1/abs(W) sum_(w in W) 1/(det(1-t w)) $ <eq:9-3-average-series>
    in $t$. The next result shows that this power series can be expressed simply
    in terms of the degrees $d_1,dots,d_l$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:9-3-3>
      #smallcaps[Proposition 9.3.3.]
      $ Av 1/(det(1-t w))=product_(i=1)^l 1/(1-t^(d_i)) $ <eq:9-3-3-molien>
      _as power series in $t$._
    ]

    #source(145, "132")
    #smallcaps[Proof.] We have earlier defined the action of $W$ on the dual
    space $hat(frak(V))$ of $frak(V)$ and on the ring $frak(S)$ of polynomial
    functions on $frak(V)$. In the present proof we take
    $frak(V),hat(frak(V)),frak(S)$ over the complex field instead of the real
    field as before.

    $lambda_1,dots,lambda_l$ are the eigenvalues of $w$ on $frak(V)$, thus
    $lambda_1^(-1),dots,lambda_l^(-1)$ are the eigenvalues of $w$ on
    $hat(frak(V))$. However these eigenvalues are roots of unity and $w$ is a
    real transformation, hence the eigenvalues of $w$ on $hat(frak(V))$ are
    $lambda_1,dots,lambda_l$. Let $y_1,dots,y_l$ be corresponding eigenvectors
    spanning $hat(frak(V))$. $y_1,dots,y_l$ are linear combinations (possibly
    complex) of the original basis $x_1,dots,x_l$ of $hat(frak(V))$. The
    polynomial functions $y_1^(k_1)y_2^(k_2)dots y_l^(k_l)$ for all sets of
    non-negative integers $k_1,dots,k_l$ with $k_1+dots+k_l=n$ form a basis for
    $frak(S)_n$, the space of polynomial functions which are homogeneous of
    degree $n$. Since $w(y_i)=lambda_i y_i$ we have
    $
      w(y_1^(k_1)dots y_l^(k_l))
      =lambda_1^(k_1)dots lambda_l^(k_l)y_1^(k_1)dots y_l^(k_l).
    $ <eq:9-3-3-monomial-eigenvalues>
    #block(sticky: true)[
      Thus the eigenvalues of $w$ on $frak(S)_n$ are the complex numbers
      $lambda_1^(k_1)dots lambda_l^(k_l)$. Hence the coefficient of $t^n$ in the
      power series $1\/det(1-t w)$ is the sum of the eigenvalues of $w$ on
      $frak(S)_n$, i.e. the trace of $w$ on $frak(S)_n$. It follows that the
      coefficient of $t^n$ in the power series $Av 1\/det(1-t w)$ is the trace
      of the linear transformation
    ]
    $ 1/abs(W) sum_(w in W) w $ <eq:9-3-3-trace-average>
    on $frak(S)_n$. By #book-ref("l", "9-3-2", [9.3.2]) this is the dimension of
    the space $frak(S)_n inter frak(I)=frak(I)_n$. Now $frak(I)_n$ has as a
    basis the set of all polynomials $I_1^(e_1)I_2^(e_2)dots I_l^(e_l)$ of
    degree $n$, where $I_1,dots,I_l$ are a set of basic invariants. Since
    $deg I_i=d_i$ the number of such polynomials is the number of solutions of
    the equation
    $ d_1 e_1+d_2 e_2+dots+d_l e_l=n, $ <eq:9-3-3-weighted-degree>
    which is in turn the coefficient of $t^n$ in the power series
    $
      (1+t^(d_1)+t^(2 d_1)+dots)(1+t^(d_2)+t^(2 d_2)+dots)
      dots(1+t^(d_l)+t^(2 d_l)+dots).
    $ <eq:9-3-3-degree-series>
    This is the coefficient of $t^n$ in
    $ product_(i=1)^l 1/(1-t^(d_i)) $ <eq:9-3-3-hilbert-series>
    and so the result is proved. #qed

    By applying this result we can determine the sum and the product of the
    degrees $d_1,dots,d_l$.

    #source(146, "133")
    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:9-3-4>
      #smallcaps[Theorem 9.3.4.]
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.6em,
        row-gutter: 0.65em,
        [(i)], [$d_1 d_2 dots d_l=abs(W),$],
        [(ii)], [$d_1+d_2+dots+d_l=N+l.$],
      )
    ]

    #smallcaps[Proof.] Consider $det(1-t w)$. This is $(1-t)^l$ if $w=1$,
    $(1-t)^(l-1)(1+t)$ if $w$ is a reflection, and a polynomial not divisible by
    $(1-t)^(l-1)$ otherwise. Now the only elements of $W$ which are reflections
    are the elements $w_r$ with $r in Phi$. For suppose $W$ contains a
    reflection $w_H$ in a hyperplane $H$ not orthogonal to any root. $H$
    contains a vector $v$ not orthogonal to any root, and $w_H (v)=v$. $v$ lies
    in a chamber $C$ (see section #book-ref(
      "sec",
      "fundamental-systems-geometrical-interpretation",
    )), and since $w_H (C)$ is also a chamber containing $v$ we have
    $w_H (C)=C$. Hence $w_H=1$ by #book-ref(
      "cor",
      "2-3-2",
      [2.3.2],
    ) and we have a contradiction. Therefore $W$ contains exactly $N$
    reflections, where $N=abs(Phi^+)$.

    #block(sticky: true)[
      We now apply #book-ref("p", "9-3-3", [9.3.3]). Multiplying both sides by
      $(1-t)^l$ we have
    ]
    $
      product_(i=1)^l 1/(1+t+dots+t^(d_i-1))
      =1/abs(W) lr((1+(N(1-t))/(1+t)+(1-t)^2 F(t))),
    $ <eq:9-3-4-reflection-expansion>
    where $F(t)$ is some rational function whose denominator is not divisible by
    $1-t$. (The first term on the right comes from the unit element, the second
    from the $N$ reflections, and the third from the remaining elements of $W$.)

    Putting $t=1$ we obtain
    $ 1/(d_1 d_2 dots d_l)=1/abs(W), $ <eq:9-3-4-product-degrees>
    hence $abs(W)=d_1 d_2 dots d_l$.

    To obtain the second result we first differentiate and then put $t=1$. We
    have
    $
      & product_(i=1)^l 1/(1+t+dots+t^(d_i-1))
        lr(
          (sum_(i=1)^l -(1+2t+dots+(d_i-1)t^(d_i-2))
            /(1+t+dots+t^(d_i-1)))
        ) \
      & quad =-N/abs(W) dot 1/(1+t)+G(t),
    $ <eq:9-3-4-derivative>
    where $G(t)$ is a rational function whose numerator is divisible by $1-t$.
    Putting $t=1$ we obtain
    $
      -1/2 dot 1/(d_1 d_2 dots d_l) dot sum_(i=1)^l (d_i-1)
      =-N/(2abs(W)).
    $ <eq:9-3-4-derivative-at-one>
    It follows that
    $ d_1+d_2+dots+d_l=N+l. $ <eq:9-3-4-sum-degrees>
    #qed

    #source(147, "134")
    Let $I_1,dots,I_l$ be a set of basic polynomial invariants and
    $ ∂(I_1,dots,I_l)\/∂(x_1,dots,x_l) $ <eq:9-3-jacobian-matrix>
    be the Jacobian of the map
    $
      (x_1,dots,x_l) arrow.r
      (I_1 (x_1,dots,x_l),dots,I_l (x_1,dots,x_l)).
    $ <eq:9-3-invariant-map>
    #block(sticky: true)[
      The Jacobian is the matrix whose $(i,j)$-coefficient is $∂ I_i\/∂ x_j$.
      Let
    ]
    $ J=abs((∂(I_1,dots,I_l))/(∂(x_1,dots,x_l))) $ <eq:9-3-jacobian>
    #block(sticky: true)[
      be the determinant of this matrix. $J$ is a homogeneous polynomial in
      $x_1,dots,x_l$ of degree
    ]
    $ sum_(i=1)^l (d_i-1). $ <eq:9-3-jacobian-degree>
    By #book-ref("th", "9-3-4", [9.3.4]) $J$ has degree $N$. We now show that
    $J$ has a factorization into linear factors.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:9-3-5>
      #smallcaps[Theorem 9.3.5.] _For each root $r in Phi^+$ let $H_r=0$ be the
      equation of the hyperplane orthogonal to $r$. Then_
      $ J=lambda dot product_(r in Phi^+) H_r $ <eq:9-3-5-jacobian-product>
      _for some $lambda in RR$._
    ]

    #smallcaps[Proof.] Consider the map $T$ of $frak(V)$ into itself given by
    $
      T(x_1,dots,x_l)=(I_1 (x_1,dots,x_l),dots,I_l (x_1,dots,x_l)).
    $ <eq:9-3-5-map>
    For each point $x=(x_1,dots,x_l)$ of $frak(V)$ at which $J!=0$ there exist
    open neighbourhoods of $x,T(x)$ in $1$–$1$ correspondence under $T$. (See,
    for example Loomis and Sternberg #bib-ref("loomisSternberg1968").) Now
    suppose $x$ lies in a reflecting hyperplane $H_r$, $r in Phi$. Then any open
    neighbourhood of $x$ contains points $a,b$ such that $a!=b$ but $w_r (a)=b$.
    Then we have
    // E039: the reflection acts on the polynomial, before evaluation at a.
    $ I_i (b)=I_i (w_r (a))=(w_r (I_i))(a)=I_i (a) $ <eq:9-3-5-invariance>
    for $i=1,dots,l$. Thus $T(b)=T(a)$ and so $J=0$ at $x$. Hence the polynomial
    $J$ vanishes at each point at which the linear polynomial $H_r$ vanishes.
    Since $H_r$ is an irreducible polynomial, $H_r$ divides $J$. This is true
    for all $r in Phi^+$, thus
    $ product_(r in Phi^+) H_r $ <eq:9-3-5-divisor>
    #source(148, "135")
    #block(sticky: true)[divides $J$. But]
    $ deg J=N=deg lr((product_(r in Phi^+) H_r)). $ <eq:9-3-5-equal-degrees>
    #block(sticky: true)[Hence]
    $ J=lambda dot product_(r in Phi^+) H_r $ <eq:9-3-5-factorization>
    for some $lambda in RR$. #qed
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, mathclap, qed, source
    #let rank = math.op("rank")

    == A Theorem of Solomon <sec:solomon-theorem>

    We now turn to the proof of the identity
    $ sum_(w in W) t^(l(w))=product_(i=1)^l lr(((t^(d_i)-1)/(t-1))). $
    <eq:9-4-factorization-goal>
    This factorization of the polynomial $sum t^(l(w))$ was first proved by Bott
    #bib-ref("bott1956"), with a suitable interpretation of the integers
    $d_1,dots,d_l$, by considerations involving the topology of Lie groups. We
    give here a proof due to Solomon #bib-ref("solomon1966orders") in a slightly
    modified form due to Steinberg #bib-ref("steinberg1968endomorphisms"), where
    $d_1,dots,d_l$ are interpreted as the degrees of the basic polynomial
    invariants of $W$.

    We define
    $
                P_W (t) & =sum_(w in W) t^(l(w)), \
      overline(P)_W (t) & =product_(i=1)^l (t^(d_i)-1)/(t-1),
    $ <eq:9-4-two-polynomials>
    #block(sticky: true)[
      and $P_(W_J) (t),overline(P)_(W_J) (t)$ denote the corresponding
      polynomials for the Weyl groups $W_J$, where $J$ is any subset of $Pi$.
      The idea of Solomon’s proof is to show that $P_W (t),overline(P)_W (t)$
      satisfy the following identities:
    ]
    $
                          sum_J (-1)^abs(J) (P_W (t))/(P_(W_J) (t)) & =t^N, \
      sum_J (-1)^abs(J) (overline(P)_W (t))/(overline(P)_(W_J) (t)) & =t^N.
    $ <eq:9-4-two-identities>
    Assuming by induction that $P_(W_J) (t)=overline(P)_(W_J) (t)$ whenever $J$
    is a proper subset of $Pi$, it follows from these identities that
    $P_W (t)=overline(P)_W (t)$.

    We concentrate first on the polynomial $P_W (t)$.

    #source(149, "136")
    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:9-4-1>
      #smallcaps[Lemma 9.4.1.] _Let $w$ be an element of $W_J$. Then $l(w)$ is
      the same whether $w$ is regarded as an element of the Weyl group $W$ or
      the Weyl group $W_J$._
    ]

    #smallcaps[Proof.] Suppose $r$ is a positive root not in $Phi_J$. Then $r$
    is a positive combination of roots in $Pi$ involving some root in $Pi-J$. If
    $r_i in J$, $w_(r_i) (r)$ still involves this root in $Pi-J$ with a positive
    coefficient. Thus $w_(r_i) (r)$ is still a positive root not in $Phi_J$.
    Repeating this argument we see that $w(r)$ is a positive root not in $Phi_J$
    for all $w in W_J$. Thus all positive roots transformed by $w$ into negative
    roots are in $Phi_J$. The result follows by #book-ref(
      "th",
      "2-2-2",
      [2.2.2],
    ).
    #qed

    Lemma #book-ref("l", "9-4-1", [9.4.1]) shows that we may write $l(w)$ for
    $w in W_J$ without ambiguity.

    We now consider the operation of $W$ on the Coxeter complex, as described in
    section #book-ref("sec", "coxeter-complex"). By #book-ref(
      "p",
      "2-6-3",
      [2.6.3],
    ) each element of the Coxeter complex can be transformed under $W$ into just
    one element of the form
    $
      C_J=lr(
        {v; vec(
            delim: #none,
            (v,r)=0 quad "for" r in J,
            (v,r)>0 quad "for" r in Pi-J
          )}
      ).
    $ <eq:9-4-fundamental-face>
    Consider the orbit of the Coxeter complex under $W$ containing $C_J$. For
    $w in W$ we define $n_J (w)$ to be the number of elements in this orbit
    which are fixed by $w$. By #book-ref("p", "2-6-1", [2.6.1]) $n_J (w)$ is
    equal to the number of left cosets $x W_J$ fixed by $w$ under left
    multiplication.

    Now $n_J (w)$ has a useful interpretation in terms of the theory of
    characters. If $G$ is any finite group and $H$ a subgroup of $G$ we define
    the operations of restriction and induction of class functions in the usual
    way. If $chi$ is a class function on $G$ we denote by $chi_H$ the
    restriction of $chi$ to $H$, and if $phi$ is a class function on $H$ we
    denote by $phi^G$ the induced class function on $G$. $phi^G$ is defined by
    $
      phi^G (g)=1/abs(H) sum_(x in G) phi(x g x^(-1))
    $ <eq:9-4-induced-class-function>
    summed over those elements $x in G$ for which $x g x^(-1) in H$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:9-4-2>
      #smallcaps[Lemma 9.4.2.] _Let $1_(W_J)$ be the unit character of $W_J$.
      Thus $1_(W_J) (w)=1$ for all $w in W_J$. Then $1_(W_J)^W (w)=n_J (w)$ for
      all $w in W$._
    ]

    #block(sticky: true)[#smallcaps[Proof.]]
    $ 1_(W_J)^W (w)=1/abs(W_J) sum_x 1 $ <eq:9-4-2-induced-unit>
    #source(150, "137")
    summed over the elements $x in W$ for which $x w x^(-1) in W_J$. Now
    $x w x^(-1) in W_J$ if and only if $x w x^(-1)(C_J)=C_J$ by #book-ref(
      "p",
      "2-6-1",
      [2.6.1],
    ), and this holds if and only if $w$ fixes $x^(-1)(C_J)$. Now there are
    $n_J (w)$ such elements $x^(-1)(C_J)$ fixed by $w$ and for each one of them
    the element $x$ may be chosen in $abs(W_J)$ ways. Thus
    $ 1_(W_J)^W (w)=1/abs(W_J) dot abs(W_J)n_J (w)=n_J (w). $
    <eq:9-4-2-face-count>
    #qed

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:9-4-3>
      #smallcaps[Proposition 9.4.3.]
      $ sum_J (-1)^abs(J) n_J (w)=det w. $ <eq:9-4-3-alternating-faces>
    ]

    To prove this we again consider the operation of $w$ on the Coxeter complex.
    However, we first require a preliminary lemma. In this we consider not the
    Coxeter complex defined in terms of the reflecting hyperplanes, but a
    complex $cal(K)$ defined similarly by any finite set of hyperplanes of
    $frak(V)$. The dimension of an element $frak(K) in cal(K)$ is defined as the
    dimension of the smallest subspace of $frak(V)$ containing $frak(K)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:9-4-4>
      #smallcaps[Lemma 9.4.4.] _Let $n_i$ be the number of elements of $cal(K)$
      of dimension $i$. Then_
      $ sum_i (-1)^i n_i=(-1)^(dim frak(V)). $ <eq:9-4-4-euler-sum>
    ]

    #smallcaps[Proof.] We use induction on the number of hyperplanes. Suppose
    the result proved for a system of $n$ hyperplanes and that an additional
    hyperplane $H$ is then added. Each element of $cal(K)$ of dimension $i$
    which is cut in two by $H$ has corresponding to it an element of dimension
    $i-1$ in $H$ separating the two parts. Thus the sum
    $ sum_i (-1)^i n_i $ <eq:9-4-4-unchanged-sum>
    remains unchanged. #qed

    #smallcaps[Proof of #book-ref("p", "9-4-3", [9.4.3]).] Let $U$ be the
    subspace of $frak(V)$ of elements fixed by $w$. The elements of the Coxeter
    complex which are fixed by $w$ are just the ones which lie in $U$, by
    #book-ref(
      "cor",
      "2-6-2",
      [2.6.2],
    ). We now apply #book-ref("l", "9-4-4", [9.4.4]) to $U$. $n_i$ is the number
    of elements of the Coxeter complex which have dimension $i$ and lie in $U$.
    Since $dim C_J=l-abs(J)$ we have
    $ n_i=sum_(#mathclap($abs(J)=l-i$)) n_J (w). $ <eq:9-4-3-dimension-count>
    #source(151, "138")
    Thus, by #book-ref("l", "9-4-4", [9.4.4]),
    $
      sum_i (-1)^i n_i=(-1)^l sum_J (-1)^abs(J)n_J (w)=(-1)^(dim U).
    $ <eq:9-4-3-euler-subspace>
    Now $w$, being an orthogonal transformation of $frak(V)$, has eigenvalues
    which are $1,-1$ or pairs of complex conjugates of modulus $1$. Thus
    $ det w=(-1)^(l-dim U). $ <eq:9-4-3-determinant>
    #block(sticky: true)[It follows that]
    $ sum_J (-1)^abs(J) n_J (w)=det w. $ <eq:9-4-3-result>
    #qed

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:9-4-5>
      #smallcaps[Theorem 9.4.5.]
      $ sum_J (-1)^abs(J) (P_W (t))/(P_(W_J) (t))=t^N. $
      <eq:9-4-5-length-identity>
    ]

    #smallcaps[Proof.] Let $D_J$ be the set of distinguished coset
    representatives of $W_J$ in $W$ defined in #book-ref(
      "th",
      "2-5-8",
      [2.5.8],
    ). Define
    $
      P_(D_J) (t)=sum_(#mathclap($w in D_J$)) t^(l(w)).
    $ <eq:9-4-5-coset-polynomial>
    #block(sticky: true)[
      Then, by #book-ref("th", "2-5-8", [2.5.8]), we have
    ]
    $ P_W (t)=P_(W_J) (t) dot P_(D_J) (t). $ <eq:9-4-5-coset-factorization>
    #block(sticky: true)[
      Therefore
    ]
    $
      sum_J (-1)^abs(J) (P_W (t))/(P_(W_J) (t))
      &=sum_J (-1)^abs(J) P_(D_J) (t) \
      &=sum_J (-1)^abs(J) lr((sum_(w \ w(J) subset.eq Phi^+) t^(l(w)))) \
      &=sum_(w in W) lr((sum_(J \ w(J) subset.eq Phi^+) (-1)^abs(J))) t^(l(w)).
    $ <eq:9-4-5-reordered-sums>
    Let $J_w$ be the set of roots $r in Pi$ such that $w(r) in Phi^+$. Then the
    coefficient of $t^(l(w))$ in the above sum is
    $ sum_(#mathclap($J subset.eq J_w$)) (-1)^abs(J)=(1-1)^abs(J_w). $
    <eq:9-4-5-binomial-sum>
    This is $0$ unless $J_w$ is the empty set, when it is $1$. However if $J_w$
    is empty $w$ transforms every positive root into a negative root, so $w=w_0$
    by #book-ref("p", "2-2-6", [2.2.6]). Hence the above sum is $t^(l(w_0))=t^N$
    and the result is proved. #qed

    #source(152, "139")
    We now turn to consider the polynomial
    $ overline(P)_W (t)=product_(i=1)^l lr(((t^(d_i)-1)/(t-1))). $
    <eq:9-4-degree-polynomial>
    In order to show that $overline(P)_W (t)$ satisfies the required identity it
    is necessary to look more closely at the operation of $W$ on the ring
    $frak(S)$ of polynomial functions on $frak(V)$. As before, $frak(I)$ denotes
    the set of invariant polynomials under $W$. A polynomial $P in frak(S)$ is
    said to be alternating if $w(P)=det w dot P$ for all $w in W$, and the set
    of alternating polynomials is denoted by $hat(frak(I))$. As before, $H_r$
    denotes the linear form representing the hyperplane orthogonal to the root
    $r$, defined by $H_r (x)=(r,x)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:9-4-6>
      #smallcaps[Lemma 9.4.6.] _A polynomial $P in frak(S)$ is alternating if
      and only if it is the product of an invariant polynomial with_
      $ product_(r in Phi^+) H_r. $ <eq:9-4-6-alternant>
    ]

    #block(sticky: true)[#smallcaps[Proof.] We show first that]
    $ product_(r in Phi^+) H_r $ <eq:9-4-6-product>
    #block(sticky: true)[
      is alternating. If $s$ is any root we have $w_s (H_r)=H_(w_s (r))$. For
      // E039: action on the linear form precedes evaluation.
    ]
    $
      (w_s (H_r))(x) & =H_r (w_s (x))=(r,w_s (x)) \
                     & =(w_s (r),x)=H_(w_s (r)) (x).
    $ <eq:9-4-6-linear-form-action>
    Let $r_i in Pi$ be any fundamental root. Then
    $
      w_(r_i) lr((product_(r in Phi^+) H_r))
      =-lr((product_(r in Phi^+) H_r)),
    $ <eq:9-4-6-simple-reflection>
    since $w_(r_i)$ transforms $r_i$ into $-r_i$ and permutes the remaining
    positive roots amongst themselves. Hence
    $ w lr((product_(r in Phi^+) H_r))=det w dot product_(r in Phi^+) H_r $
    <eq:9-4-6-determinant-action>
    and so
    $ product_(r in Phi^+) H_r $ <eq:9-4-6-alternating-product>
    #block(sticky: true)[
      is alternating. Furthermore if $Q in frak(I)$ we have
    ]
    $
      w lr((product_(r in Phi^+) H_r dot Q))
      =det w dot product_(r in Phi^+) H_r dot Q
    $ <eq:9-4-6-invariant-multiple>
    #source(153, "140")
    and so
    $ product_(r in Phi^+) H_r dot Q $ <eq:9-4-6-alternating-multiple>
    is also alternating.

    #block(sticky: true)[
      Now let $P$ be any alternating polynomial. Then $w_r (P)=-P$ for each
      $r in Phi$. Let $x$ be an element in the hyperplane orthogonal to $r$.
      Then
      // E039: action on the polynomial precedes evaluation.
    ]
    $ -P(x)=(w_r (P))(x)=P(w_r (x))=P(x). $ <eq:9-4-6-hyperplane-vanishing>
    #block(sticky: true)[
      Hence $P(x)=0$. Thus $P$ vanishes at all points for which $H_r$ vanishes,
      therefore $H_r$ divides $P$. In fact
    ]
    $ product_(r in Phi^+) H_r $ <eq:9-4-6-divisor>
    divides $P$. Thus
    $ P=product_(r in Phi^+) H_r dot Q $ <eq:9-4-6-factorization>
    for some $Q in frak(S)$. But now
    $
      det w dot P & =w(P)=w lr((product_(r in Phi^+) H_r)) dot w(Q) \
                  & =det w dot product_(r in Phi^+) H_r dot w(Q).
    $ <eq:9-4-6-quotient-action>
    Therefore $w(Q)=Q$ for all $w in W$ and so $Q in frak(I)$. Thus every
    alternating element is the product of
    $ product_(r in Phi^+) H_r $ <eq:9-4-6-final-product>
    with an invariant element. #qed

    Let $frak(S)_n$ be the set of homogeneous polynomial functions on $frak(V)$
    of degree $n$, let $frak(I)_n=frak(I) inter frak(S)_n$ and
    $hat(frak(I))_n=hat(frak(I)) inter frak(S)_n$. Let $frak(I)_J$ be the set of
    polynomial functions in $frak(S)$ invariant under $W_J$ and
    $(frak(I)_J)_n=frak(I)_J inter frak(S)_n$. $frak(I)_n$, $(frak(I)_J)_n$ and
    $hat(frak(I))_n$ are all finite dimensional vector spaces over $RR$.
    #block(sticky: true)[Also we have]
    $ dim hat(frak(I))_n=dim frak(I)_(n-N) $ <eq:9-4-alternating-dimension>
    for all $n>=N$ by #book-ref("l", "9-4-6", [9.4.6]), since
    $ product_(r in Phi^+) H_r $ <eq:9-4-degree-shift-product>
    is homogeneous of degree $N$. If $n<N$ then $dim hat(frak(I))_n=0$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:9-4-7>
      #smallcaps[Proposition 9.4.7.]
      $ sum_J (-1)^abs(J) dim (frak(I)_J)_n=dim hat(frak(I))_n. $
      <eq:9-4-7-alternating-dimension>
    ]

    #source(154, "141")
    #smallcaps[Proof.] Let $chi(w)=tr_(frak(S)_n) w$ be the trace of $w$ on
    $frak(S)_n$. Let $chi_(W_J)$ be the restriction of $chi$ to $W_J$ and
    $chi_(W_J)^W$ be the induced character of $W$. Then
    $chi_(W_J)^W=chi dot 1_(W_J)^W$.

    #block(sticky: true)[
      For
    ]
    $
      chi_(W_J)^W (w) & =1/abs(W_J) sum_(x in W \ x w x^(-1) in W_J)
                        chi_(W_J) (x w x^(-1)) \
                      & =1/abs(W_J) sum_(x in W \ x w x^(-1) in W_J) chi(w) \
                      & =chi(w) dot 1/abs(W_J) sum_(x in W \ x w x^(-1)
                        in W_J) 1 \
                      & =chi(w) dot 1_(W_J)^W (w).
    $ <eq:9-4-7-induced-product>
    Now by #book-ref("l", "9-4-2", [9.4.2]) $1_(W_J)^W (w)=n_J (w)$ and by
    #book-ref("p", "9-4-3", [9.4.3]) we have
    $ sum_J (-1)^abs(J) n_J (w)=det w. $ <eq:9-4-7-face-character>
    It follows that
    $ sum_J (-1)^abs(J) chi_(W_J)^W (w)=det w dot chi(w). $
    <eq:9-4-7-character-identity>
    We now average over $W$ and obtain
    $
      sum_J (-1)^abs(J) chi_(W_J)^W lr((1/abs(W) sum_(w in W) w))
      =1/abs(W) sum_(w in W) det w dot chi(w).
    $ <eq:9-4-7-average-over-w>
    #block(sticky: true)[The left-hand side can be simplified since]
    $
      chi_(W_J)^W lr((1/abs(W) sum_(w in W) w))
      =chi_(W_J) lr((1/abs(W_J) sum_(w in W_J) w)).
    $ <eq:9-4-7-restricted-average>
    #block(sticky: true)[For]
    $
      chi_(W_J)^W lr((1/abs(W) sum_(w in W) w))
      &=1/abs(W_J) dot 1/abs(W)
      sum_(x,w \ x w x^(-1) in W_J) chi_(W_J) (x w x^(-1)) \
      &=1/abs(W_J) sum_(y in W_J) chi_(W_J) (y).
    $ <eq:9-4-7-average-reindexing>
    #block(sticky: true)[
      Thus we obtain
    ]
    $
      sum_J (-1)^abs(J) chi_(W_J) lr((1/abs(W_J) sum_(w in W_J) w))
      =1/abs(W) sum_(w in W) det w dot chi(w).
    $ <eq:9-4-7-determinant-average>
    We now apply #book-ref("l", "9-3-2", [9.3.2]).
    $ chi_(W_J) lr((1/abs(W_J) sum_(w in W_J) w)) $
    <eq:9-4-7-invariant-trace>
    #source(155, "142")
    is the dimension of the subspace of invariants of $frak(S)_n$ under $W_J$,
    viz., $dim (frak(I)_J)_n$. Also
    $ 1/abs(W) sum_(w in W) det w dot chi(w) $ <eq:9-4-7-alternating-trace>
    is the dimension of the subspace of invariants of $frak(S)_n$ under the
    $W$-action
    $ P arrow.r^W det w dot w(P). $ <eq:9-4-7-twisted-action>
    However $det w dot w(P)=P$ if and only if $w(P)=det w dot P$; thus we
    require the dimension of the space of alternating elements of $frak(S)_n$,
    viz., $dim hat(frak(I))_n$. Hence
    $ sum_J (-1)^abs(J) dim (frak(I)_J)_n=dim hat(frak(I))_n. $
    <eq:9-4-7-result>
    #qed

    We are now able to show that the polynomial $overline(P)_W (t)$ satisfies
    the analogue of #book-ref("th", "9-4-5", [9.4.5]).

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:9-4-8>
      #smallcaps[Proposition 9.4.8.]
      $ sum_J (-1)^abs(J) (overline(P)_W (t))/(overline(P)_(W_J) (t))=t^N. $
      <eq:9-4-8-degree-identity>
    ]

    #smallcaps[Proof.] We prove this result by comparing the coefficients of
    $t^n$ in the power series expansion of the rational functions
    $
      sum_J ((-1)^abs(J))/((1-t)^l overline(P)_(W_J) (t))
      quad "and" quad t^N/((1-t)^l overline(P)_W (t)).
    $ <eq:9-4-8-rational-functions>
    #block(sticky: true)[
      Now
    ]
    $
      1/((1-t)^l overline(P)_W (t))=product_(i=1)^l 1/(1-t^(d_i))
    $ <eq:9-4-8-invariant-series>
    and the coefficient of $t^n$ in the expansion of this function is
    $dim frak(I)_n$ as in #book-ref("p", "9-3-3", [9.3.3]). Thus the coefficient
    of $t^n$ in
    $ t^N/((1-t)^l overline(P)_W (t)) $ <eq:9-4-8-shifted-series>
    is $dim frak(I)_(n-N)$, and this is equal to $dim hat(frak(I))_n$ by
    #book-ref(
      "l",
      "9-4-6",
      [9.4.6],
    ).

    We now consider the operation of $W_J$ on $frak(V)$. We have
    $
      overline(P)_(W_J) (t)=product_(i=1)^abs(J) lr(((t^(d'_i)-1)/(t-1))),
    $ <eq:9-4-8-parabolic-polynomial>
    #source(156, "143")
    where $d'_1,dots,d'_(abs(J))$ are the degrees of the basic invariants of
    $W_J$ on $frak(V)_J$, the subspace of $frak(V)$ spanned by roots in $J$.
    Since $W_J$ operates as the identity on the subspace of $frak(V)$ orthogonal
    to $frak(V)_J$, the degrees of the basic polynomial invariants of $W_J$ on
    $frak(V)$ are $d'_1,dots,d'_(abs(J)),1,dots,1$. Thus the coefficient of
    $t^n$ in
    // E040: l-|J| is the number of degree-one invariants, hence (1-t)^(l-|J|).
    $
      lr((product_(i=1)^abs(J) 1/(1-t^(d'_i)))) dot 1/(1-t)^(l-abs(J))
      =1/((1-t)^l overline(P)_(W_J) (t))
    $ <eq:9-4-8-fixed-complement>
    is $dim (frak(I)_J)_n$, also as in #book-ref("p", "9-3-3", [9.3.3]). However
    $ sum_J (-1)^abs(J) dim (frak(I)_J)_n=dim hat(frak(I))_n $
    <eq:9-4-8-coefficients>
    by #book-ref("p", "9-4-7", [9.4.7]). It follows that the rational functions
    $
      sum_J ((-1)^abs(J))/((1-t)^l overline(P)_(W_J) (t)),
      quad t^N/((1-t)^l overline(P)_W (t))
    $ <eq:9-4-8-equal-series>
    have the same power series expansion, and so are equal. #qed

    We now complete the proof that $P_W (t)=overline(P)_W (t)$.

    #block(width: 100%, breakable: false, sticky: true)[
      #metadata((kind: "anchor")) <th:9-4-9>
      #smallcaps[Theorem 9.4.9.]
      $ sum_(w in W) t^(l(w))=product_(i=1)^l lr(((t^(d_i)-1)/(t-1))). $
      <eq:9-4-9-factorization>
    ]

    #smallcaps[Proof.] We use induction on $l=rank W$. We may assume inductively
    that $P_(W_J) (t)=overline(P)_(W_J) (t)$ for all proper subsets $J$ of $Pi$.
    By #book-ref("th", "9-4-5", [9.4.5]) and #book-ref("p", "9-4-8", [9.4.8]) we
    have
    $
      (t^N-(-1)^abs(Pi))/(P_W (t))
      &=sum_(J subset Pi) ((-1)^abs(J))/(P_(W_J) (t)), \
      (t^N-(-1)^abs(Pi))/(overline(P)_W (t))
      &=sum_(J subset Pi) ((-1)^abs(J))/(overline(P)_(W_J) (t)).
    $ <eq:9-4-9-induction>
    Since the right-hand sides are equal by induction it follows that
    $ P_W (t)=overline(P)_W (t). $ <eq:9-4-9-equal-polynomials>
    #qed

    We have now been able to derive a multiplicative formula for the orders of
    the finite Chevalley groups.

    #source(157, "144")
    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:9-4-10>
      #smallcaps[Theorem 9.4.10.] _Let $G=frak(L)(q)$ be a finite Chevalley
      group. Then_
      $ abs(G)=1/d q^N (q^(d_1)-1)(q^(d_2)-1)dots(q^(d_l)-1), $
      <eq:9-4-10-group-order>
      _where $d$ is defined as in section #book-ref(
        "sec",
        "finite-chevalley-groups",
      ), $N$ is the number of positive roots of $frak(L)$, and $d_1,dots,d_l$
      are the degrees of the basic polynomial invariants of $W$._
    ]

    #smallcaps[Proof.] This follows from #book-ref("p", "8-6-1", [8.6.1]) and
    #book-ref("th", "9-4-9", [9.4.9]). #qed
  ]
]

// Preview this file in the context of the complete book.
#context { include "main.typ" }
