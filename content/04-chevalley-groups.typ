#[
  #import "main-defs.typ": L, book-ref, qed, section-ref, source
  #import "diagrams/root-chains.typ": root-chains
  #source(64, "51")
  = 4. The Chevalley Groups <ch:4>

  We now begin the development of the theory of the Chevalley groups, making use
  of the properties of the simple Lie algebras over $CC$ described in the last
  chapter. The information given there about these simple Lie algebras may be
  regarded as classical; however we shall require certain additional facts about
  them which necessitate a closer look at the Cartan decomposition. We shall
  show that if #L is a simple Lie algebra over $CC$ it is possible to choose a
  basis for #L, adapted to a Cartan decomposition, such that the constants of
  multiplication with respect to this basis are all rational integers.

  == 4.1 Properties of the Structure Constants <sec:4-1>

  #block(sticky: true)[Let]
  $ frak(L)=frak(H) ⊕ sum_(r in Phi) frak(L)_r $
  <eq:4-1-cartan-decomposition>
  #block(sticky: true)[be a Cartan decomposition of #L. Let]
  $ h_r=frac(2r, lr((r,r))) $ <eq:4-1-coroot>
  be the co-root corresponding to the root $r in Phi$. For each root $r$ let
  $e_r$ be a non-zero element of $frak(L)_r$. If $e_r$ is already chosen for
  $r in Phi^+$ there is a unique element $e_(-r) in frak(L)_(-r)$ such that
  $[e_r e_(-r)]=h_r$, and we shall suppose $e_(-r)$ chosen in this way. The set
  $ {h_r, r in Pi; e_r, r in Phi} $ <eq:4-1-root-basis>
  is a basis for #L. It consists of the fundamental co-roots $h_r$ together with
  the set of all root vectors $e_r$. The elements of this basis multiply
  together as follows:
  // E018: the original omits r+s≠0 in the final line.
  $
       [h_r h_s] & =0,          & r,s & in Pi, \
       [h_r e_s] & =A_(r s)e_s, &   r & in Pi, s in Phi, \
    [e_r e_(-r)] & =h_r,        &   r & in Phi, \
       [e_r e_s] & =0,          & r,s & in Phi, r+s in.not Phi, r+s!=0.
  $ <eq:4-1-basis-products>

  #source(65, "52")
  If $r,s,r+s in Phi$ then $[e_r e_s]$ is a scalar multiple of $e_(r+s)$ since
  $[frak(L)_r frak(L)_s]=frak(L)_(r+s)$. We define $N_(r,s)$ by
  $ [e_r e_s]=N_(r,s)e_(r+s). $ <eq:4-1-structure-constants>
  The elements $N_(r,s)$ for $r,s in Phi$ are called the structure constants of
  #L. They clearly depend upon the choice of the root vectors $e_r$. Our first
  task is to consider the relations between them.

  (i) Since $[e_s e_r]=-[e_r e_s]$, it is clear that $N_(s,r)=-N_(r,s)$ for all
  $r,s in Phi$.

  #metadata((kind: "anchor")) <eq:4-1-cyclic-derivation>
  (ii) Suppose $r_1,r_2,r_3$ are three roots such that $r_1+r_2+r_3=0$. By the
  Jacobi identity we have
  $
    [[e_(r_1)e_(r_2)]e_(r_3)]+[[e_(r_2)e_(r_3)]e_(r_1)]
    +[[e_(r_3)e_(r_1)]e_(r_2)]=0.
  $ <eq:4-1-jacobi-triple>
  #block(sticky: true)[Thus]
  $
    N_(r_1,r_2)[e_(-r_3)e_(r_3)]+N_(r_2,r_3)[e_(-r_1)e_(r_1)]
    +N_(r_3,r_1)[e_(-r_2)e_(r_2)]=0.
  $ <eq:4-1-jacobi-coroot-brackets>
  #block(sticky: true)[Hence]
  $ N_(r_1,r_2)h_(r_3)+N_(r_2,r_3)h_(r_1)+N_(r_3,r_1)h_(r_2)=0. $
  <eq:4-1-jacobi-coroots>
  #block(sticky: true)[It follows that]
  $
    frac(2N_(r_1,r_2)r_3, lr((r_3,r_3)))
    +frac(2N_(r_2,r_3)r_1, lr((r_1,r_1)))
    +frac(2N_(r_3,r_1)r_2, lr((r_2,r_2)))=0.
  $ <eq:4-1-jacobi-roots>
  #block(sticky: true)[Using the fact that $r_1+r_2+r_3=0$ we have]
  $
    lr(
      (frac(N_(r_2,r_3), lr((r_1,r_1)))
        -frac(N_(r_1,r_2), lr((r_3,r_3))))
    )r_1
    +lr(
      (frac(N_(r_3,r_1), lr((r_2,r_2)))
        -frac(N_(r_1,r_2), lr((r_3,r_3))))
    )r_2=0.
  $ <eq:4-1-two-independent-roots>
  Now $r_1,r_2$ are linearly independent. For otherwise $r_2=plus.minus r_1$ and
  $r_3=-2r_1$ or $0$, a contradiction. Therefore the coefficients of $r_1,r_2$
  in the above equation must be zero, and we have
  $
    frac(N_(r_1,r_2), lr((r_3,r_3)))
    =frac(N_(r_2,r_3), lr((r_1,r_1)))
    =frac(N_(r_3,r_1), lr((r_2,r_2))).
  $ <eq:4-1-cyclic-ratios>

  (iii) Suppose $r,s in Phi$ are linearly independent. By the Jacobi identity we
  have
  $
    [[e_r e_(-r)]e_s]+[[e_(-r)e_s]e_r]+[[e_s e_r]e_(-r)]=0.
  $ <eq:4-1-opposite-jacobi>
  #block(sticky: true)[Hence]
  $ [h_r e_s]+N_(-r,s)[e_(-r+s)e_r]+N_(s,r)[e_(r+s)e_(-r)]=0. $
  <eq:4-1-opposite-jacobi-expanded>

  #source(66, "53")
  #block(sticky: true)[
    (It is convenient here and throughout the exposition to assume that
    $N_(r,s)=0$ if $r,s in Phi$ but $r+s$ is not a root.) Thus
  ]
  $ A_(r s)e_s+N_(-r,s)N_(-r+s,r)e_s+N_(s,r)N_(r+s,-r)e_s=0. $
  <eq:4-1-jacobi-coefficients>
  Using the relations obtained in #book-ref(
    "eq",
    "4-1-cyclic-derivation",
    [(ii)],
  ) above, we have
  $
    A_(r s)+N_(r-s,-r)N_(-r+s,r)frac(lr((-r+s,-r+s)), lr((s,s)))
    +N_(s,r)N_(-r,-s)frac(lr((s,s)), lr((r+s,r+s)))=0.
  $ <eq:4-1-coefficients-ratios>
  #block(sticky: true)[We may rewrite this as]
  $
    N_(r,s)N_(-r,-s)frac(lr((s,s)), lr((r+s,r+s)))
    -N_(r,-r+s)N_(-r,r-s)frac(lr((-r+s,-r+s)), lr((s,s)))=A_(r s).
  $ <eq:4-1-coefficients-rearranged>
  #block(sticky: true)[We define $M_(r,s)$ for $r,s in Phi$ by]
  $ M_(r,s)=N_(r,s)N_(-r,-s)frac(lr((s,s)), lr((r+s,r+s))). $
  <eq:4-1-m-definition>
  #block(sticky: true)[Then the above equation becomes]
  $ M_(r,s)-M_(r,-r+s)=A_(r s). $ <eq:4-1-m-recurrence>
  We now consider the $r$-chain of roots through $s$ and apply this equation
  repeatedly. Let this $r$-chain be
  $ -p r+s,dots.c,s,dots.c,q r+s. $ <eq:4-1-root-chain>
  #block(sticky: true)[Then we have]
  $
              M_(r,s)-M_(r,-r+s) & =A_(r s), \
          M_(r,-r+s)-M_(r,-2r+s) & =A_(r,-r+s)=A_(r s)-2, \
                                 & dots.v \
    M_(r,-(p-1)r+s)-M_(r,-p r+s) & =A_(r,-(p-1)r+s)=A_(r s)-2(p-1), \
                    M_(r,-p r+s) & =A_(r,-p r+s)=A_(r s)-2p.
  $ <eq:4-1-telescoping-system>
  (The term $M_(r,-(p+1)r+s)$ does not appear in the last equation since
  $-(p+1)r+s$ is not a root.) Adding these equations we obtain
  $ M_(r,s)=(p+1)A_(r s)-p(p+1). $ <eq:4-1-telescoping-sum>
  #block(sticky: true)[
    However, $A_(r s)=p-q$, as in #section-ref("3.3"), thus
  ]
  $ M_(r,s)=-(p+1)q. $ <eq:4-1-m-product>
  #block(sticky: true)[Hence]
  $ N_(r,s)N_(-r,-s)=-(p+1)q frac(lr((r+s,r+s)), lr((s,s))). $
  <eq:4-1-n-product-lengths>

  #source(67, "54")
  This expression can be simplified by the use of the following lemma.

  #metadata((kind: "anchor")) <l:4-1-1>
  #block(sticky: true)[
    #smallcaps[Lemma 4.1.1.] _Suppose $r,s,r+s in Phi$. Then_
  ]
  $ frac(lr((r+s,r+s)), lr((s,s)))=frac(p+1, q). $ <eq:4-1-1>

  #smallcaps[Proof.] We consider separately the different possibilities for the
  $r$-chain through $s$, bearing in mind that the length of any $r$-chain is at
  most 4. We use the information given in #section-ref("3.4") about the relative
  lengths of roots inclined at a given angle. The various possibilities for the
  $r$-chain are shown below.

  #block(breakable: false)[#root-chains()] <fig:4-1-root-chains>

  The result of the lemma is clearly valid in all cases. #qed

  #block(sticky: true)[Applying this result we obtain]
  $ N_(r,s)N_(-r,-s)=-(p+1)^2. $ <eq:4-1-n-product>

  #block(sticky: true)[
    (iv) Finally we consider four roots $r_1,r_2,r_3,r_4$ such that
  ]
  $ r_1+r_2+r_3+r_4=0 $ <eq:4-1-four-roots>
  and such that no pair are equal and opposite. By the Jacobi identity we have
  $
    [[e_(r_1)e_(r_2)]e_(r_3)]+[[e_(r_2)e_(r_3)]e_(r_1)]
    +[[e_(r_3)e_(r_1)]e_(r_2)]=0.
  $ <eq:4-1-four-roots-jacobi>
  #block(sticky: true)[Thus]
  $
    N_(r_1,r_2)N_(r_1+r_2,r_3)+N_(r_2,r_3)N_(r_2+r_3,r_1)
    +N_(r_3,r_1)N_(r_3+r_1,r_2)=0.
  $ <eq:4-1-four-roots-n>
  Now by the formulae obtained in #book-ref(
    "eq",
    "4-1-cyclic-derivation",
    [(ii)],
  ) above we have
  $
    frac(N_(r_1+r_2,r_3), lr((r_4,r_4)))
    =frac(N_(r_3,r_4), lr((r_1+r_2,r_1+r_2)))
  $ <eq:4-1-four-roots-ratio>
  #source(68, "55")
  and there are corresponding formulae obtained by permuting the roots. Using
  these formulae we obtain
  $
    frac(N_(r_1,r_2)N_(r_3,r_4), lr((r_1+r_2,r_1+r_2)))
    +frac(N_(r_2,r_3)N_(r_1,r_4), lr((r_2+r_3,r_2+r_3)))
    +frac(N_(r_3,r_1)N_(r_2,r_4), lr((r_3+r_1,r_3+r_1)))=0.
  $ <eq:4-1-four-roots-identity>
  As usual we note that a term may be 0 if the corresponding vector is not a
  root. However, suppose $r_1+r_2 in Phi$. Then $r_3+r_4 in Phi$ since
  $ r_3+r_4=-(r_1+r_2). $ <eq:4-1-paired-sums>
  Thus the first term in the above formula is non-zero. Hence at least one of
  the other terms is non-zero. Thus either $r_2+r_3$ and $r_1+r_4$ are roots, or
  $r_3+r_1$ and $r_2+r_4$ are roots, or both.

  We summarize the results we have obtained in the following theorem.

  #metadata((kind: "anchor")) <th:4-1-2>
  #smallcaps[Theorem 4.1.2.] _The structure constants of a simple Lie algebra #L
  over $CC$ satisfy the following relations:_
  #enum(
    numbering: "(i)",
    indent: 1.1em,
    body-indent: 0.5em,
    [#metadata((kind: "anchor")) <eq:4-1-2-i>
      $N_(s,r)=-N_(r,s)$, $quad r,s in Phi$.],
    [
      $
        frac(N_(r_1,r_2), lr((r_3,r_3)))
        =frac(N_(r_2,r_3), lr((r_1,r_1)))
        =frac(N_(r_3,r_1), lr((r_2,r_2)))
      $ <eq:4-1-2-ii>
      _if $r_1,r_2,r_3 in Phi$ satisfy $r_1+r_2+r_3=0$._
    ],
    // E019: r+s must be a root, as required by Lemma 4.1.1.
    [#metadata((kind: "anchor")) <eq:4-1-2-iii>
      $N_(r,s)N_(-r,-s)=-(p+1)^2$, $quad r,s,r+s in Phi$.],
    [
      $
        frac(N_(r_1,r_2)N_(r_3,r_4), lr((r_1+r_2,r_1+r_2)))
        +frac(N_(r_2,r_3)N_(r_1,r_4), lr((r_2+r_3,r_2+r_3)))
        +frac(N_(r_3,r_1)N_(r_2,r_4), lr((r_3+r_1,r_3+r_1)))=0
      $ <eq:4-1-2-iv>
      _if $r_1,r_2,r_3,r_4 in Phi$ satisfy $r_1+r_2+r_3+r_4=0$ and if no pair
      are opposite._
    ],
  )
]

#[
  #import "main-defs.typ": L, book-ref, qed, section-ref, source
  == 4.2 The Chevalley Basis <sec:4-2>

  Formula #book-ref("eq", "4-1-2-iii", [(iii)]) of #book-ref(
    "th",
    "4-1-2",
    [Theorem 4.1.2],
  ) suggests that, by a sufficiently careful choice of the root vectors $e_r$,
  it might be possible to arrange that
  $ N_(r,s)=plus.minus(p+1) $ <eq:4-2-integral-constants>
  for all relevant pairs $r,s$ of roots. This is in fact so, and to prove it we
  use the isomorphism theorem for simple Lie algebras, stated in #book-ref(
    "th",
    "3-5-2",
    [3.5.2],
  ). In the notation of #book-ref("th", "3-5-2", [3.5.2]) we define
  $frak(L)'=frak(L)$ and $p'_i=-p_i$ for $i=1,2,dots.c,l$. Then it is clear that
  $A_(i j)=A'_(i j)$. We also define $e_(p'_i)=-e_(-p_i)$ and
  $e_(-p'_i)=-e_(p_i)$.

  #source(69, "56")
  #block(sticky: true)[Then]
  $ [e_(p'_i)e_(-p'_i)]=[e_(-p_i)e_(p_i)]=-h_(p_i)=h_(-p_i)=h_(p'_i), $
  <eq:4-2-opposite-simple-bracket>
  as required. Thus there is an isomorphism $theta$ of #L to itself, i.e. an
  automorphism of #L, such that
  $
     theta(e_(p_i)) & =-e_(-p_i), \
    theta(e_(-p_i)) & =-e_(p_i), \
     theta(h_(p_i)) & =-h_(p_i).
  $ <eq:4-2-chevalley-involution>
  Now $theta^2$ transforms $e_(p_i),e_(-p_i),h_(p_i)$ into themselves, so must
  be the identity by the uniqueness part of #book-ref("th", "3-5-2", [3.5.2]).
  Thus $theta$ has order 2.

  Now by #book-ref("l", "3-6-2", [3.6.2]) each root $r in Phi^+$ can be
  expressed as a sum of fundamental roots
  $ r=r_1+r_2+dots.c+r_k $ <eq:4-2-positive-root-sum>
  in such a way that $r_1+r_2+dots.c+r_a$ is a root for all $a<=k$. It follows
  that $[[e_(r_1)e_(r_2)]dots.c e_(r_k)] in frak(L)_r$ and is a non-zero scalar
  multiple of $e_r$. The image of this element under $theta$ is
  $[[-e_(-r_1),-e_(-r_2)]dots.c -e_(-r_k)]$, which is a non-zero scalar multiple
  of $e_(-r)$. Thus $e_r$ is transformed by $theta$ into a scalar multiple of
  $e_(-r)$.

  Let $theta(e_r)=lambda e_(-r)$. Then, since $theta$ has order 2,
  $theta(e_(-r))=lambda^(-1)e_r$. Hence
  $ theta(mu e_r)=mu lambda e_(-r)=mu^2 lambda(mu^(-1)e_(-r)). $
  <eq:4-2-root-rescaling>
  Now it is possible to choose $mu in CC$ such that $mu^2=-lambda^(-1)$. With
  such a choice of $mu$ we have $theta(mu e_r)=-mu^(-1)e_(-r)$ and
  $[mu e_r,mu^(-1)e_(-r)]=h_r$. We now alter our choice of the root vectors. By
  choosing $mu e_r$ as the root vector in $frak(L)_r$ and $mu^(-1)e_(-r)$ as the
  root vector in $frak(L)_(-r)$, and then renaming these $e_r,e_(-r)$
  respectively, we see that it is possible to choose $e_r in frak(L)_r$,
  $e_(-r) in frak(L)_(-r)$ such that $[e_r e_(-r)]=h_r$ and
  $theta(e_r)=-e_(-r)$.

  #block(sticky: true)[Now]
  $ [e_r e_s]=N_(r,s)e_(r+s) $ <eq:4-2-bracket>
  #block(sticky: true)[
    whenever $r,s,r+s in Phi$, and so applying $theta$ we have
  ]
  $ [-e_(-r),-e_(-s)]=-N_(r,s)e_(-r-s). $ <eq:4-2-involuted-bracket>
  It follows that $N_(-r,-s)=-N_(r,s)$. However $N_(r,s)N_(-r,-s)=-(p+1)^2$, and
  so $N_(r,s)=plus.minus(p+1)$.

  We can now state Chevalley's basis theorem for simple Lie algebras.

  #metadata((kind: "anchor")) <th:4-2-1>
  #block(sticky: true)[
    #smallcaps[Theorem 4.2.1.] _Let #L be a simple Lie algebra over $CC$ and_
  ]
  $ frak(L)=frak(H) ⊕ sum_(r in Phi) frak(L)_r $ <eq:4-2-1-cartan>
  #source(70, "57")
  #emph[
    be a Cartan decomposition of #L. Let $h_r in frak(H)$ be the co-root
    corresponding to the root $r$. Then, for each root $r in Phi$, an element
    $e_r$ can be chosen in $frak(L)_r$ such that
    // E020: spell out the root-sum condition and exclude opposite roots below.
    $
      [e_r e_(-r)] & =h_r, \
         [e_r e_s] & =plus.minus(p+1)e_(r+s), quad r+s in Phi,
    $ <eq:4-2-1-root-brackets>
    where $p$ is the greatest integer for which $s-p r in Phi$.

    The elements ${h_r,r in Pi; e_r,r in Phi}$ form a basis for #L, called a
    Chevalley basis. The basis elements multiply together as follows:
    $
         [h_r h_s] & =0, \
         [h_r e_s] & =A_(r s)e_s, \
      [e_r e_(-r)] & =h_r, \
         [e_r e_s] & =0              && quad "if" r+s in.not Phi, r+s!=0, \
         [e_r e_s] & =N_(r,s)e_(r+s) && quad "if" r+s in Phi,
    $ <eq:4-2-1-basis-products>
    where $N_(r,s)=plus.minus(p+1)$.

    The multiplication constants of the algebra with respect to the Chevalley
    basis are all integers.
  ]

  #smallcaps[Proof.] Since $A_(r s)$ and $N_(r,s)$ are integers, it only remains
  to prove that each co-root $h_r$ is a linear combination of the fundamental
  co-roots with integer coefficients. This follows from the fact that the
  co-roots $h_r$ for $r in Pi$ form a fundamental system of the dual root system
  (cf. #book-ref("p", "3-6-1", [3.6.1])). #qed

  Now a simple Lie algebra #L has many different Chevalley bases, and we
  consider the amount of freedom available in the choice of such a basis. In the
  first place, every Chevalley basis is defined relative to some Cartan
  subalgebra. If a Cartan subalgebra $frak(H)$ of #L is prescribed, then the
  root spaces $frak(L)_r$ are determined. The elements of the basis which lie in
  $frak(H)$ are defined relative to some fundamental system $Pi$ in $Phi$. If
  $Pi$ is prescribed, the fundamental co-roots $h_r$, $r in Pi$, are determined.
  The fundamental root vectors, $e_r$, $r in Pi$, may be chosen as arbitrary
  non-zero elements of the root spaces $frak(L)_r$, $r in Pi$. The remaining
  positive root vectors $e_r$, $r in Phi^+$, are now determined _to within a
  sign_ by $[e_r e_s]=plus.minus(p+1)e_(r+s)$, using #book-ref(
    "l",
    "3-6-2",
    [3.6.2],
  ). The relation $[e_r e_(-r)]=h_r$ then determines the basis vectors $e_r$ for
  $r in Phi^-$.

  #source(71, "58")
  #heading(level: 3)[#text(weight: "regular", style: "italic")[
    Systems of structure constants
  ]] <sec:4-2-structure-constants>

  Now every Chevalley basis determines a system of structure constants $N_(r,s)$
  given by $[e_r e_s]=N_(r,s)e_(r+s)$. Since $N_(r,s)=plus.minus(p+1)$, where
  $p$ is defined as before, the absolute value of $N_(r,s)$ is determined.
  However, different Chevalley bases will give different values for the signs of
  the $N_(r,s)$. We consider the extent to which these signs can be chosen
  arbitrarily in determining a system of structure constants. We show that for
  certain ordered pairs $(r,s)$ of roots the sign of $N_(r,s)$ may be chosen
  arbitrarily and that the remaining structure constants are then determined.

  Suppose we are given a total ordering on the space containing the roots, as in
  #section-ref("2.1"). An ordered pair $(r,s)$ of roots will be called a
  _special pair_ if $r+s in Phi$ and $0≺r≺s$. An ordered pair $(r,s)$ is called
  _extraspecial_ if $(r,s)$ is a special pair and if for all special pairs
  $(r_1,s_1)$ with $r+s=r_1+s_1$ we have $r≼r_1$. Then every root in $Phi^+$
  which is the sum of two roots in $Phi^+$ can be expressed uniquely as the sum
  of an extraspecial pair. Since by #book-ref("l", "3-6-2", [3.6.2]) every root
  in $Phi^+$ which is not in $Pi$ has this property, the extraspecial pairs are
  in 1–1 correspondence with the roots in $Phi^+-Pi$.

  Now given a Chevalley basis ${h_r,r in Pi;e_r,r in Phi}$, we may change the
  sign of any subset of ${e_r,r in Phi^+-Pi}$, and changing the signs of the
  $e_r$ for $r in Phi^-$ in a corresponding way to preserve the relation
  $[e_r e_(-r)]=h_r$, we obtain another Chevalley basis. Thus the signs of the
  structure constants $N_(r,s)$ for extraspecial pairs $(r,s)$ may be chosen
  arbitrarily. On the other hand, we show that if the $N_(r,s)$ are given for
  the extraspecial pairs they are determined for all pairs.

  #metadata((kind: "anchor")) <p:4-2-2>
  #smallcaps[Proposition 4.2.2.] _The signs of the structure constants $N_(r,s)$
  may be chosen arbitrarily for extraspecial pairs $(r,s)$, and then the
  structure constants for all pairs are uniquely determined._

  #smallcaps[Proof.] Let ${h_r,r in Pi;e_r,r in Phi}$ and
  ${h_r,r in Pi;e'_r,r in Phi}$ be two Chevalley bases giving rise to systems of
  structure constants $(N_(r,s))$, $(N'_(r,s))$. Thus $[e_r e_s]=N_(r,s)e_(r+s)$
  and $[e'_r e'_s]=N'_(r,s)e'_(r+s)$.

  Let $e'_r=lambda_r e_r$, where $lambda_r!=0 in CC$. Then
  $lambda_r lambda_s N_(r,s)=lambda_(r+s)N'_(r,s)$. Now suppose that
  $N_(r,s)=N'_(r,s)$ for all extraspecial pairs $(r,s)$. Then
  $lambda_r lambda_s=lambda_(r+s)$ for such pairs. By #book-ref(
    "l",
    "3-6-2",
    [3.6.2],
  ) it follows that if $r in Phi^+$ and $r=n_1 p_1+dots.c+n_l p_l$ then
  $ lambda_r=lambda_(p_1)^(n_1)lambda_(p_2)^(n_2)dots.c lambda_(p_l)^(n_l). $
  <eq:4-2-2-root-character>
  The same equation holds for negative roots since $lambda_(-r)=lambda_r^(-1)$.
  As a consequence of this we have $lambda_r lambda_s=lambda_(r+s)$ for all
  pairs $(r,s)$ of roots, and so #source(72, "59")$N_(r,s)=N'_(r,s)$ for all
  pairs. Thus the structure constants are uniquely determined by their values on
  the extraspecial pairs. #qed

  It is of interest to point out that the values of the structure constants
  $N_(r,s)$ can be derived from the structure constants on the extraspecial
  pairs by the relations #book-ref("eq", "4-1-2-i", [(i)]), #book-ref(
    "eq",
    "4-1-2-ii",
    [(ii)],
  ), #book-ref("eq", "4-1-2-iii", [(iii)]), #book-ref("eq", "4-1-2-iv", [(iv)])
  of #book-ref("th", "4-1-2", [4.1.2]). To prove this consider the set of
  ordered pairs $(r,s)$ of roots such that $r+s in Phi$. If $(r,s)$ is such a
  pair, so are the following twelve pairs of roots:
  $
       (r,s), & quad (s,r), \
    (s,-r-s), & quad (-r-s,s), \
    (-r-s,r), & quad (r,-r-s), \
     (-r,-s), & quad (-s,-r), \
    (-s,r+s), & quad (r+s,-s), \
    (r+s,-r), & quad (-r,r+s).
  $ <eq:4-2-twelve-pairs>
  Since $r+s+(-r-s)=0$, either two of $r,s,-r-s$ are positive or one is
  positive. It follows that of the above twelve ordered pairs of roots, exactly
  one is a special pair. Moreover relations #book-ref("eq", "4-1-2-i", [(i)]),
  #book-ref(
    "eq",
    "4-1-2-ii",
    [(ii)],
  ), #book-ref("eq", "4-1-2-iii", [(iii)]) of #book-ref("th", "4-1-2", [4.1.2])
  determine all the structure constants in terms of the $N_(r,s)$ for special
  pairs $(r,s)$.

  It remains to show that the $N_(r,s)$ for special pairs can be expressed in
  terms of the $N_(r,s)$ for extraspecial pairs. Suppose $(r,s)$ is a pair of
  roots which is special but not extraspecial. Then there is a unique
  extraspecial pair $(r_1,s_1)$ such that $r_1+s_1=r+s$. Since
  $r+s+(-r_1)+(-s_1)=0$, relation #book-ref("eq", "4-1-2-iv", [(iv)]) of
  #book-ref("th", "4-1-2", [4.1.2]) gives
  $
    frac(N_(r,s)N_(-r_1,-s_1), lr((r+s,r+s)))
    +frac(N_(s,-r_1)N_(r,-s_1), lr((s-r_1,s-r_1)))
    +frac(N_(-r_1,r)N_(s,-s_1), lr((-r_1+r,-r_1+r)))=0.
  $ <eq:4-2-reduction-identity>
  #block(sticky: true)[Now the roots $r,s,r_1,s_1$ are ordered by]
  $ 0≺r_1≺r≺s≺s_1. $ <eq:4-2-ordered-roots>
  // E021: nonzero terms only; order the two entries to obtain special pairs.
  #block(sticky: true)[
    For non-zero terms, the special pairs associated with the pairs
  ]
  $ (-r_1,-s_1), (s,-r_1), (r,-s_1), (-r_1,r), (s,-s_1) $
  <eq:4-2-associated-pairs>
  respectively are obtained by ordering the entries of
  $ (r_1,s_1), (r_1,s-r_1), (s_1-r,r), (r-r_1,r_1), (s_1-s,s). $
  <eq:4-2-positive-pairs>
  // E022: the first pair sums to r+s itself; only the last four have smaller
  // sum.
  However for each of the last four special pairs $(overline(r),overline(s))$ we
  have $overline(r)+overline(s)≺r+s$. Thus, by using relations #book-ref(
    "eq",
    "4-1-2-i",
    [(i)],
  ), #book-ref("eq", "4-1-2-ii", [(ii)]), #book-ref("eq", "4-1-2-iii", [(iii)]),
  #book-ref("eq", "4-1-2-iv", [(iv)]) of #book-ref("th", "4-1-2", [4.1.2]),
  $N_(r,s)$ can be expressed in terms of $N_(r_1,s_1)$ and various terms
  $N_(overline(r),overline(s))$, where $(overline(r),overline(s))$ is a special
  pair with #source(73, "60")$overline(r)+overline(s)≺r+s$. By using induction
  on the sum $r+s$ it can be seen that $N_(r,s)$ is determined by the values of
  the structure constants on the extraspecial pairs.
]

#[
  #import "main-defs.typ": qed, section-ref, source
  #let L = $frak(L)$
  #let ad = math.op("ad")

  == 4.3 The Exponential Map <sec:4-3>

  We shall now show how to construct certain automorphisms of a Lie algebra,
  using the exponential map. We recall that an automorphism of a Lie algebra #L
  is a non-singular linear map $theta$ of #L into itself such that
  $ [theta x,theta y]=theta[x,y]. $ <eq:4-3-automorphism>
  The set of all automorphisms of #L clearly forms a group.

  #metadata((kind: "anchor")) <l:4-3-1>
  #block(sticky: true)[
    #smallcaps[Lemma 4.3.1.] _Let #L be a Lie algebra over a field of
    characteristic $0$ and $delta$ be a derivation of #L which is nilpotent,
    i.e. satisfies $delta^n=0$ for some $n$. Then_
  ]
  $ exp delta=1+delta+frac(delta^2, 2!)+dots.c+frac(delta^(n-1), (n-1)!) $
  <eq:4-3-1-exponential>
  _is an automorphism of #L._

  #smallcaps[Proof.] $exp delta$ is a non-singular linear map, its inverse being
  $exp(-delta)$. Now we have
  $ delta[x y]=[delta x,y]+[x,delta y], quad x,y in frak(L). $
  <eq:4-3-1-derivation>
  #block(sticky: true)[Thus]
  $ delta^r[x y]=sum_(i=0)^r binom(r, i)[delta^i x,delta^(r-i)y]. $
  <eq:4-3-1-leibniz>
  $
    frac(delta^r, r!)[x y]
    &=sum_(i=0)^r lr([frac(delta^i, i!)x,frac(delta^(r-i), (r-i)!)y]) \
    &=sum_(i,j \ i+j=r)
    lr([frac(delta^i, i!)x,frac(delta^j, j!)y]).
  $ <eq:4-3-1-divided-leibniz>
  #block(sticky: true)[Therefore]
  $
    exp delta[x y]
    &=sum_(r>=0) sum_(i,j \ i+j=r)
    lr([frac(delta^i, i!)x,frac(delta^j, j!)y]) \
    &=sum_(i>=0) sum_(j>=0) lr([frac(delta^i, i!)x,frac(delta^j, j!)y]) \
    &=[exp delta dot x,exp delta dot y].
  $ <eq:4-3-1-bracket-preservation>
  #qed

  #source(74, "61")
  Now let #L be a simple Lie algebra over $CC$ with Cartan decomposition
  $ frak(L)=frak(H) ⊕ sum_(r in Phi) frak(L)_r $
  <eq:4-3-cartan>
  and Chevalley basis ${h_r,r in Pi;e_r,r in Phi}$. Then the map $ad e_r$ is a
  derivation of #L (cf. #section-ref("3.1")) and this derivation is in fact
  nilpotent. For we have
  $
    ad e_r dot frak(H)&=frak(L)_r, &&quad (ad e_r)^2 dot frak(H)=0, \
    ad e_r dot frak(L)_r&=0, \
    ad e_r dot frak(L)_(-r)&subset.eq frak(H),
    &&quad (ad e_r)^3 dot frak(L)_(-r)=0.
  $ <eq:4-3-nilpotent-on-root-spaces>
  $(ad e_r)^(q+1) dot frak(L)_s=0$ if $r,s$ are linearly independent, since
  $(q+1)r+s$ is not a root. Thus
  $ (ad e_r)^n dot frak(L)=0 $ <eq:4-3-nilpotent>
  for all sufficiently large values of $n$.

  Let $zeta in CC$. Then $ad(zeta e_r)=zeta ad e_r$ is also a nilpotent
  derivation of #L. Thus $exp(zeta ad e_r)$ is an automorphism of #L. We write
  $ x_r (zeta)=exp(zeta ad e_r). $ <eq:4-3-root-automorphism>
  We now consider the effect of the automorphism $x_r (zeta)$ on the elements of
  the Chevalley basis. We have
  $
       x_r (zeta) dot e_r & =e_r, \
    x_r (zeta) dot e_(-r) & =e_(-r)+zeta h_r-zeta^2 e_r, \
       x_r (zeta) dot h_r & =h_r-2 zeta e_r.
  $ <eq:4-3-action-root-triple>
  #block(sticky: true)[Also, if $r,s$ are linearly independent,]
  $ x_r (zeta) dot h_s=h_s-A_(s r)zeta e_r, $ <eq:4-3-action-coroot>
  $
    x_r (zeta) dot e_s & =e_s+N_(r,s)zeta e_(r+s)
                         +frac(1, 2!)N_(r,s)N_(r,r+s)zeta^2 e_(2r+s) \
                       & quad+dots.c+frac(1, q!)N_(r,s)N_(r,r+s)dots.c
                         N_(r,(q-1)r+s)zeta^q e_(q r+s).
  $ <eq:4-3-action-root-expansion>
  #block(sticky: true)[We write]
  $ M_(r,s,i)=frac(1, i!)N_(r,s)N_(r,r+s)dots.c N_(r,(i-1)r+s). $
  <eq:4-3-integral-coefficient>
  #block(sticky: true)[Then]
  $ x_r (zeta) dot e_s=sum_(i=0)^q M_(r,s,i)zeta^i e_(i r+s). $
  <eq:4-3-action-root-sum>
  #source(75, "62")
  (We define $M_(r,s,0)=1$.) Using the fact that $N_(r,s)=plus.minus(p+1)$ we
  see that
  $
    M_(r,s,i)=plus.minus frac((p+1)(p+2)dots.c(p+i), i!)
    =plus.minus binom(p+i, i).
  $ <eq:4-3-binomial-coefficient>
  In particular $M_(r,s,i)$ is an integer. Thus _the automorphism $x_r (zeta)$
  transforms each element of the Chevalley basis into a linear combination of
  basis elements, the coefficients being non-negative integral powers of $zeta$
  with rational integer coefficients._

  It is this property which enables us to define automorphisms of this type over
  an arbitrary field.
]

#[
  #import "main-defs.typ": L, book-ref, qed, source

  == 4.4 Algebras and Groups Over an Arbitrary Field <sec:4-4>

  Let #L be a simple Lie algebra over $CC$ with Chevalley basis
  $ {h_r,r in Pi;e_r,r in Phi}. $ <eq:4-4-chevalley-basis>
  We denote by $frak(L)_ZZ$ the subset of #L of all linear combinations of the
  basis elements with coefficients in the ring $ZZ$ of rational integers.
  $frak(L)_ZZ$ is an additive abelian group. By #book-ref(
    "th",
    "4-2-1",
    [4.2.1],
  ) the Lie product of two basis vectors lies in $frak(L)_ZZ$, thus $frak(L)_ZZ$
  is closed under Lie multiplication. $frak(L)_ZZ$ is therefore a Lie algebra
  over $ZZ$.

  #metadata((kind: "anchor")) <def:lie-algebra-base-change>
  Now let $K$ be any field. We form the tensor product of the additive group of
  $K$ with the additive group of $frak(L)_ZZ$, and define
  $ frak(L)_K=K ⊗ frak(L)_ZZ. $ <eq:4-4-base-change>
  Then $frak(L)_K$ is an additive abelian group. Let $1_K$ be the unit element
  of $K$. Then every element of $frak(L)_K$ can be written in the form
  $
    sum_(r in Pi) lambda_r (1_K ⊗ h_r)
    +sum_(r in Phi) mu_r (1_K ⊗ e_r),
  $ <eq:4-4-general-element>
  #block(sticky: true)[where $lambda_r,mu_r in K$. We write]
  $ overline(h)_r=1_K ⊗ h_r quad overline(e)_r=1_K ⊗ e_r. $
  <eq:4-4-reduced-vectors>
  #block(sticky: true)[Then $frak(L)_K$ is a vector space over $K$ with basis]
  $ {overline(h)_r,r in Pi;overline(e)_r,r in Phi}. $
  <eq:4-4-reduced-basis>
  We now define a Lie multiplication on $frak(L)_K$.

  #metadata((kind: "anchor")) <p:4-4-1>
  #block(sticky: true)[
    #smallcaps[Proposition 4.4.1.] _Let $x,y$ be any two elements of the
    Chevalley #source(76, "63")basis of #L. Then the multiplication on
    $frak(L)_K$ defined by_
  ]
  $ [1_K ⊗ x,1_K ⊗ y]=1_K ⊗ [x y] $ <eq:4-4-1-bracket>
  #emph[
    and extended by linearity makes $frak(L)_K$ into a Lie algebra over $K$. The
    multiplication constants of $frak(L)_K$ with respect to the basis
    ${overline(h)_r,r in Pi;overline(e)_r,r in Phi}$ are the multiplication
    constants of #L with respect to the basis
    $ {h_r,r in Pi;e_r,r in Phi} $ <eq:4-4-1-original-basis>
    interpreted as elements of the prime subfield of $K$.
  ]

  #smallcaps[Proof.] This is clear, since by #book-ref("th", "4-2-1", [4.2.1])
  the multiplication constants of #L are in $ZZ$. #qed

  Having introduced the Lie algebra $frak(L)_K$, we shall define automorphisms
  of $frak(L)_K$ analogous to the automorphisms $x_r (zeta)$ of #L. Let
  $A_r (zeta)$ be the matrix representing $x_r (zeta)$ with respect to the
  Chevalley basis of #L. We have seen that the coefficients of $A_r (zeta)$ have
  the form $a zeta^i$, where $a in ZZ$ and $i>=0$. Let $t$ be an element of $K$
  and $overline(A)_r (t)$ be the matrix obtained from $A_r (zeta)$ by replacing
  each coefficient $a zeta^i$ by $overline(a)t^i in K$, where $overline(a)$ is
  the element of the prime field of $K$ corresponding to $a in ZZ$. We now
  define $overline(x)_r (t)$ to be the linear map of $frak(L)_K$ into itself
  represented by the matrix $overline(A)_r (t)$ with respect to the basis
  ${overline(h)_r,r in Pi;overline(e)_r,r in Phi}$.

  #metadata((kind: "anchor")) <p:4-4-2>
  #smallcaps[Proposition 4.4.2.] _$overline(x)_r (t)$ is an automorphism of
  $frak(L)_K$ for each $r in Phi$, $t in K$._

  #smallcaps[Proof.] Observe first that $overline(x)_r (t)$ is non-singular.
  Since $x_r (zeta)x_r (-zeta)=1$, it follows immediately from the definitions
  that $overline(x)_r (t)overline(x)_r (-t)=1$. Thus $overline(x)_r (-t)$ is the
  inverse of $overline(x)_r (t)$.

  To show that $overline(x)_r (t)$ is an automorphism of $frak(L)_K$ we consider
  the effect of $overline(x)_r (t)$ on the basis of $frak(L)_K$. Let
  $v_1,v_2,dots$ be the Chevalley basis of #L and
  $overline(v)_1,overline(v)_2,dots$ be the corresponding basis of $frak(L)_K$.
  Suppose
  $
                        [v_i v_j] & =sum_k gamma_(i j k)v_k, \
    [overline(v)_i overline(v)_j] & =sum_k overline(gamma)_(i j k)overline(v)_k,
  $ <eq:4-4-2-structure-constants>
  where $gamma_(i j k) in ZZ$ and $overline(gamma)_(i j k)$ are the
  corresponding elements of the prime field of $K$. Now we have
  $
    x_r (zeta) dot v_i&=sum_j A_r (zeta)_(i j)v_j, \
    overline(x)_r (t) dot overline(v)_i
    &=sum_j overline(A)_r (t)_(i j)overline(v)_j.
  $ <eq:4-4-2-coordinate-actions>
  #source(77, "64")
  Thus $overline(x)_r (t)$ is an automorphism of $frak(L)_K$ if and only if
  $
    sum_(i',j') overline(A)_r (t)_(i i')overline(A)_r (t)_(j j')
    overline(gamma)_(i' j' k)
    =sum_(k') overline(gamma)_(i j k')overline(A)_r (t)_(k' k)
  $ <eq:4-4-2-automorphism-condition>
  for all $i,j,k$.

  However, $x_r (zeta)$ is an automorphism of #L for all $zeta in CC$. Thus
  $
    sum_(i',j') A_r (zeta)_(i i')A_r (zeta)_(j j')gamma_(i' j' k)
    -sum_(k') gamma_(i j k')A_r (zeta)_(k' k)
  $ <eq:4-4-2-integer-polynomial>
  is a polynomial in $ZZ[zeta]$ which vanishes for all $zeta in CC$. It is
  therefore identically zero. It follows that the polynomial
  $
    sum_(i',j') overline(A)_r (t)_(i i')overline(A)_r (t)_(j j')
    overline(gamma)_(i' j' k)
    -sum_(k') overline(gamma)_(i j k')overline(A)_r (t)_(k' k)
  $ <eq:4-4-2-reduced-polynomial>
  in $K[t]$ is identically zero. Thus $overline(x)_r (t)$ is an automorphism of
  $frak(L)_K$ for all $t in K$. #qed

  Now that we have established the results of #book-ref("p", "4-4-1", [4.4.1])
  and #book-ref("p", "4-4-2", [4.4.2]) we shall simplify the notation. We shall
  write $h_r$ for $overline(h)_r$, $e_r$ for $overline(e)_r$, $x_r (t)$ for
  $overline(x)_r (t)$, and $A_r (t)$ for $overline(A)_r (t)$. This omission of
  the bars will not lead to confusion or inconsistency since the objects
  originally called $h_r,e_r,x_r (t),A_r (t)$ are special cases of
  $overline(h)_r,overline(e)_r,overline(x)_r (t),overline(A)_r (t)$ when $K=CC$.

  #metadata((kind: "anchor")) <def:chevalley-group>
  We shall now define the Chevalley groups. The Chevalley group of type #L over
  the field $K$, denoted by $frak(L)(K)$, is defined to be the group of
  automorphisms of the Lie algebra $frak(L)_K$ generated by the $x_r (t)$ for
  all $r in Phi$, $t in K$.

  The generators of $frak(L)(K)$ operate on the elements of the Chevalley basis
  of $frak(L)_K$ according to the formulae:
  $
       x_r (t) dot e_r & =e_r,                  && quad r in Phi, \
    x_r (t) dot e_(-r) & =e_(-r)+t h_r-t^2 e_r, && quad r in Phi, \
       x_r (t) dot h_s & =h_s-A_(s r)t e_r,     && quad r in Phi,s in Pi,
  $ <eq:4-4-generators-root-triple>
  $ x_r (t) dot e_s=sum_(i=0)^q M_(r,s,i)t^i e_(i r+s) $
  <eq:4-4-generators-root-string>
  if $r,s in Phi$ are linearly independent.

  #metadata((kind: "anchor")) <p:4-4-3>
  #smallcaps[Proposition 4.4.3.] _The group $frak(L)(K)$ is determined up to
  isomorphism by the simple Lie algebra #L over $CC$ and the field $K$._

  #smallcaps[Proof.] We must show that $frak(L)(K)$ is independent of the choice
  of the #source(78, "65")Chevalley basis of #L. Let
  ${h_r,r in Pi;e_r,r in Phi}$ be a Chevalley basis of #L. We must show that any
  Chevalley basis of #L can be transformed by an automorphism of #L into one of
  the form ${h_r,r in Pi;plus.minus e_r,r in Phi}$. Firstly, since any two
  Cartan subalgebras of #L can be transformed into one another by some
  automorphism of #L (#book-ref("th", "3-5-2", [3.5.2])) we may restrict
  attention to Chevalley bases corresponding to a fixed Cartan subalgebra
  $frak(H)$. The isomorphism theorem #book-ref("th", "3-5-2", [3.5.2]) also
  shows that there is an automorphism of #L which transforms any set of
  fundamental roots into any other; and also that for a given system of
  fundamental roots there is an automorphism of #L which transforms any set of
  fundamental root vectors $e_r,r in Pi$, into any other. Thus we may restrict
  ourselves to Chevalley bases in which $frak(H)$, $Pi$ and the $e_r$ for
  $r in Pi$ are fixed. Since the structure constants $N_(r,s)$ are all
  determined to within a sign we see, using #book-ref("l", "3-6-2", [3.6.2]),
  that each root vector $e_r$ is determined to within a sign. Thus any Chevalley
  basis of #L can be transformed by an automorphism of #L into one of the form
  ${h_r,r in Pi;plus.minus e_r,r in Phi}$. It is now evident that the group
  generated by the elements $x_r (t)$ is independent of the Chevalley basis. For
  if $-e_r$ is chosen as a root vector instead of $e_r$, the generator $x_r (t)$
  is simply replaced by $x_r (-t)$, its inverse. Hence the isomorphism type of
  the group $frak(L)(K)$ depends only upon #L and $K$. #qed
]

#[
  #import "main-defs.typ": L, book-ref, qed, section-ref, source
  #let ad = math.op("ad")

  == 4.5 The Groups $A_1(K)$ <sec:4-5>

  The simplest examples of Chevalley groups are the groups $A_1(K)$. We shall
  show that these groups are isomorphic to the linear groups $P S L_2(K)$.

  We note first that the simple Lie algebra $A_1$ over $CC$ can be represented
  as the algebra of $2 times 2$ matrices of trace $0$ under Lie multiplication
  $[x y]=x y-y x$. For if we define
  $
    h_r=mat(1, 0; 0, -1), quad e_r=mat(0, 1; 0, 0), quad e_(-r)=mat(0, 0; 1, 0),
  $ <eq:4-5-sl2-basis>
  #block(sticky: true)[we have]
  $ [h_r e_r]=2e_r, quad [h_r e_(-r)]=-2e_(-r), quad [e_r e_(-r)]=h_r. $
  <eq:4-5-sl2-brackets>
  These are the relations satisfied by a Chevalley basis of the simple algebra
  $A_1$. Note that the root vectors $e_r,e_(-r)$ are represented by nilpotent
  matrices. We now require the following lemma.

  #metadata((kind: "anchor")) <l:4-5-1>
  #block(sticky: true)[
    #smallcaps[Lemma 4.5.1.] _Let #L be a simple Lie algebra over $CC$ and
    suppose we have a representation of #L by matrices under Lie multiplication.
    Suppose #source(79, "66")$y in frak(L)$ is represented by a nilpotent
    matrix. Then $ad y$ is a nilpotent derivation of #L and_
  ]
  $ exp(ad y) dot x=exp y dot x dot (exp y)^(-1) $
  <eq:4-5-1-conjugation>
  _for all $x in frak(L)$. Thus the image of $x$ under the automorphism
  $exp(ad y)$ is given by transforming by $exp y$._

  #block(sticky: true)[#smallcaps[Proof.] We have]
  $
                  ad y dot x & =[y x]=y x-x y, \
    frac((ad y)^2, 2!) dot x & =frac(1, 2)(y^2 x-2y x y+x y^2).
  $ <eq:4-5-1-first-powers>
  #block(sticky: true)[We show]
  $
    frac((ad y)^k, k!) dot x=sum_(i,j \ i+j=k) frac(y^i, i!)x frac((-y)^j, j!).
  $
  <eq:4-5-1-divided-power>
  #block(sticky: true)[
    This is true for $k=1,2$ and we prove it by induction. Assuming the above
    formula, by induction we have
  ]
  $
    frac((ad y)^(k+1), (k+1)!) dot x
    &=frac(1, k+1)sum_(i,j \ i+j=k)
    lr(
      (frac(y^(i+1), i!)x frac((-y)^j, j!)
        +frac(y^i, i!)x frac((-y)^(j+1), j!))
    ) \
    &=sum_(m,n \ m+n=k+1) frac(y^m, m!)x frac((-y)^n, n!)lr((frac(m+n, k+1))) \
    &=sum_(m,n \ m+n=k+1) frac(y^m, m!)x frac((-y)^n, n!).
  $ <eq:4-5-1-induction>
  Now $y$ is nilpotent and so $((ad y)^k/k!)x=0$ for sufficiently large values
  of $k$. Thus $ad y$ is a nilpotent derivation of #L. Also we have
  $
    exp(ad y) dot x
    &=sum_(k=0)^infinity frac((ad y)^k, k!)x \
    &=sum_(k=0)^infinity sum_(i,j \ i+j=k) frac(y^i, i!)x frac((-y)^j, j!) \
    &=sum_(i=0)^infinity sum_(j=0)^infinity frac(y^i, i!)x frac((-y)^j, j!) \
    &=exp y dot x dot (exp y)^(-1).
  $ <eq:4-5-1-exponential-conjugation>
  #qed

  #source(80, "67")
  #metadata((kind: "anchor")) <p:4-5-2>
  #smallcaps[Proposition 4.5.2.] _$A_1(K)$ is isomorphic to $P S L_2(K)$._

  #smallcaps[Proof.] We first apply #book-ref("l", "4-5-1", [4.5.1]) to the Lie
  algebra $A_1$ over $CC$. If $zeta in CC$ and $e_r,e_(-r)$ are the matrices
  defined #book-ref("eq", "4-5-sl2-basis", [above], highlight: false) we have
  $
      x_r (zeta) dot x & =exp(zeta e_r) dot x dot exp(zeta e_r)^(-1), \
    x_(-r)(zeta) dot x & =exp(zeta e_(-r)) dot x dot exp(zeta e_(-r))^(-1).
  $ <eq:4-5-2-root-actions>
  We now pass to the Lie algebra $frak(L)_K$ for an arbitrary field $K$.
  $frak(L)_K$ is isomorphic to the Lie algebra of $2 times 2$ matrices over $K$
  of trace $0$. The Chevalley group $frak(L)(K)$ is generated by the elements
  // E023: the original uses the Lie-algebra symbol L_K for the group here.
  $x_r (t),x_(-r)(t)$ as $t$ runs through $K$.
  #block(sticky: true)[
    Now $x_r (t)$ is given by transformation by
  ]
  $ exp(t e_r)=mat(1, t; 0, 1) $ <eq:4-5-2-upper-unipotent>
  #block(sticky: true)[and $x_(-r)(t)$ is given by transformation by]
  $ exp(t e_(-r))=mat(1, 0; t, 1). $ <eq:4-5-2-lower-unipotent>
  #block(sticky: true)[But the matrices]
  $ mat(1, t; 0, 1), quad mat(1, 0; t, 1) $ <eq:4-5-2-generators>
  generate $S L_2(K)$ as $t$ runs through $K$. (A proof of this well-known fact
  will be given in #section-ref("6.1").) Thus there is a surjective homomorphism
  $ S L_2(K) arrow.r A_1(K) $ <eq:4-5-2-surjection>
  under which the image of $m in S L_2(K)$ is the automorphism
  $x arrow.r m x m^(-1)$ of $frak(L)_K$. Under this homomorphism we have
  $
    mat(1, t; 0, 1) & arrow.r x_r (t), \
    mat(1, 0; t, 1) & arrow.r x_(-r)(t).
  $ <eq:4-5-2-generator-images>
  The kernel of the homomorphism consists of all $m in S L_2(K)$ such that $m$
  commutes with all $x in frak(L)_K$, and this is easily seen to be
  ${plus.minus I_2}$. Thus $A_1(K)$ is isomorphic to $P S L_2(K)$. #qed
]
