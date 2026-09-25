#import "statements.typ": corollary, lemma, proof, proposition, theorem

#[
  #import "main-defs.typ": ix, mathclap, nx, source

  #source(158, "145")
  = The Exponents of the Weyl Group <ch:exponents>

  In the present chapter we shall show that the set of integers $d_1,dots,d_l$
  occurring in the multiplicative formula for the order of the finite Chevalley
  groups can be obtained in three essentially different ways. They have been
  defined as the degrees of the basic polynomial invariants of the Weyl group,
  but we shall show that they can also be defined in terms of the eigenvalues of
  the Coxeter elements of the Weyl group and also in terms of the partition of
  the positive roots into roots of a given height. This latter definition gives
  a particularly simple way of calculating the integers in the individual cases.

  The present chapter may be regarded as a digression from the main theme of
  this book, and the reader primarily interested in the properties of the
  Chevalley groups and twisted groups may prefer to omit it at a first reading,
  referring to @cor:degrees-and-exponents and @p:exponent-table for a knowledge
  of the numbers $d_1,dots,d_l$ in the individual groups. The equivalent
  definitions of these integers are nevertheless of considerable interest, and
  it is probable that their significance is not yet fully understood.

  == A Theorem of Weyl <sec:weyl-exponent-theorem>

  We prove first a well known factorization theorem of Weyl. In order to do this
  we derive some properties of the vector #nx(
    "S-weight-sum",
    [$S$],
    group: "latin-s",
    definition: [@eq:weyl-exponent-theorem-half-sum],
  )[The sum of the fundamental weights]$
    S=1/2 sum_(r in Phi^+) r.
  $ <eq:weyl-exponent-theorem-half-sum>

  #lemma()[
    #block(sticky: true)[
      If $p_i in Pi$ then $w_(p_i) (S)=S-p_i$.
    ]
  ] <l:simple-reflection-weyl-vector>

  #proof[
    This is evident from the fact that $w_(p_i)$ transforms $p_i$ into $-p_i$
    and permutes the other positive roots.
  ]

  #lemma()[
    #block(sticky: true)[
      $S$ lies in the fundamental chamber.
    ]

    #source(159, "146")
  ] <l:weyl-vector-in-chamber>

  #proof[
    #block(sticky: true)[
      It follows from @l:simple-reflection-weyl-vector that
    ]
    $ frac(2(p_i,S), lr((p_i,p_i)))=1 $ <eq:weyl-vector-in-chamber-pairing>
    for all $p_i in Pi$. Thus $(p_i,S)>0$ for all $p_i$.
  ]

  #lemma()[
    #block(sticky: true)[
      Let $q_1,dots,q_l$ #ix("fundamental weights")be the fundamental weights.
      Then $S=q_1+dots+q_l$.
    ]
  ] <l:weyl-vector-fundamental-weights>

  #proof[
    #block(sticky: true)[
      $S$ is certainly a linear combination
    ]
    $
      sum_(i=1)^l lambda_i q_i
    $ <eq:weyl-vector-fundamental-weights-expansion>
    #block(sticky: true)[of $q_1,dots,q_l$. However]
    $
      lr((frac(2p_i, lr((p_i,p_i))),q_j))=
      cases(1 "if" i=j, 0 "if" i!=j),
    $ <eq:weyl-vector-fundamental-weights-duality>
    #block(sticky: true)[
      as in section @sec:diagonal-subgroup. Thus
    ]
    $
      lr((frac(2p_i, lr((p_i,p_i))),S))=lambda_i
    $ <eq:weyl-vector-fundamental-weights-coefficients>
    and therefore $lambda_i=1$ for $i=1,dots,l$.
  ]

  #lemma()[
    #block(width: 100%, breakable: false)[
      Let $w in W$. Then
      $ w(S)=S-sum_(r in Omega) r, $ <eq:weyl-vector-inversion-sum-inversions>
      where $Omega$ is a subset of $Phi^+$ with $abs(Omega)=l(w)$.
    ]
  ] <l:weyl-vector-inversion-sum>

  #proof[
    #block(sticky: true)[
      Let $Omega$ be the set of roots in $Phi^+$ which are not in $w(Phi^+)$.
      Then
    ]
    $
      S-w(S)=1/2 sum_(r in Omega) r
      -1/2 sum_(mathclap(-w(r) in Omega)) w(r)=sum_(r in Omega) r.
    $ <eq:weyl-vector-inversion-sum-half-sum-difference>
    Moreover, $abs(Omega)=l(w^(-1))=l(w)$, using @th:length-and-inversions.
  ]

  #lemma()[
    #block(width: 100%, breakable: false)[
      Let $Omega$ be any subset of $Phi^+$. Then if
      $ S-sum_(r in Omega) r $ <eq:dominant-root-subset-sum-chamber-weight>
      lies in the fundamental chamber, $Omega$ is empty.
    ]

    #source(160, "147")
  ] <l:dominant-root-subset-sum>

  #proof[
    #block(sticky: true)[ Let]
    $ x=sum_(r in Omega) r $ <eq:dominant-root-subset-sum-root-sum>
    #block(sticky: true)[and $p_i in Pi$. Then]
    $
      lr((S-x,frac(2p_i, lr((p_i,p_i)))))=1-frac(2(x,p_i), lr((p_i,p_i)))>0.
    $ <eq:dominant-root-subset-sum-integral-pairing>
    Since $2(x,p_i) slash (p_i,p_i)$ is an integer this means that
    $2(x,p_i) slash (p_i,p_i)<=0$. Therefore $(x,p_i)<=0$ for all $p_i in Pi$.
    However, $x$ is a sum of positive roots and so
    $
      x=sum_(i=1)^l lambda_i p_i,
    $ <eq:dominant-root-subset-sum-positive-coordinates>
    #block(sticky: true)[with each $lambda_i>=0$. Hence we have]
    $
      (x,x)=sum_(i=1)^l lambda_i (x,p_i)<=0.
    $ <eq:dominant-root-subset-sum-norm>
    It follows that $(x,x)=0$, whence $x=0$ and $Omega$ is empty.
  ]

  #lemma()[
    #block(width: 100%, breakable: false)[
      Let $Omega$ be a subset of $Phi^+$. Then
      $ S-sum_(r in Omega) r $ <eq:root-subset-sum-orbit-weight>
      is either in one of the reflecting hyperplanes or is a transform $w(S)$ of
      $S$ by some element of the Weyl group.
    ]
  ] <l:root-subset-sum-orbit>

  #proof[
    #block(sticky: true)[ Suppose]
    $ S-sum_(r in Omega) r $ <eq:root-subset-sum-orbit-regular-weight>
    #block(sticky: true)[is not in any reflecting hyperplane. Then]
    $ S-sum_(r in Omega) r $ <eq:root-subset-sum-orbit-chamber-weight>
    #block(sticky: true)[
      lies in some chamber. By @cor:simply-transitive-chamber-action there
      exists $w in W$ such that
    ]
    $ w lr((S-sum_(r in Omega) r)) $ <eq:root-subset-sum-orbit-transform>
    #block(sticky: true)[is in the fundamental chamber. However]
    $
      w lr((S-sum_(r in Omega) r))=S-sum_(r in Omega_1) r
    $ <eq:root-subset-sum-orbit-transformed-subset>
    #source(161, "148")
    for some other subset $Omega_1$ of $Phi^+$. (This follows from the
    definition of $S$ and the fact that $w$ permutes the roots.) Thus by
    @l:dominant-root-subset-sum $Omega_1$ is empty and so
    #block(width: 100%, breakable: false)[
      $ S-sum_(r in Omega) r $ <eq:root-subset-sum-orbit-orbit-weight>
      is a transform of $S$.
    ]
  ]

  #metadata((kind: "anchor")) <def:multiplicative-weights>#nx(
    "e-Q",
    [$e(Q)$],
    group: "latin-e",
    after: "e-r",
    definition: [@def:multiplicative-weights],
  )[A multiplicative group isomorphic to the additive group $Q$] As usual we
  denote by $Q$ the set of integral combinations
  $ sum_(i=1)^l n_i q_i $ <eq:weyl-exponent-theorem-weight-lattice>
  #ix("fundamental weights")of the fundamental weights. $Q$ is an additive
  abelian group. It will be more convenient in the following discussion to
  regard $Q$ as a multiplicative group instead, and so we define $e(Q)$ to be a
  multiplicative group isomorphic to $Q$. The elements of $e(Q)$ have form
  $
    product_(i=1)^l e(q_i)^(n_i)
  $ <eq:weyl-exponent-theorem-multiplicative-weights>
  #block(sticky: true)[and the map $e$ from $Q$ to $e(Q)$ satisfies]
  $
    e(a+b) & =e(a) dot e(b), quad a,b in Q, \
     e(-a) & =e(a)^(-1).
  $ <eq:weyl-exponent-theorem-exponential-rules>

  #metadata((kind: "anchor")) <def:rational-group-algebra>#nx(
    "A",
    [$A$],
    group: "latin-a",
    definition: [@def:rational-group-algebra],
  )[The rational group algebra of $e(Q)$] Let $A$ be the rational group algebra
  of $e(Q)$. The elements of $A$ are finite sums
  $ sum_x lambda_x e(x), $ <eq:weyl-exponent-theorem-group-algebra>
  where $x in Q$ and $lambda_x in QQ$. The natural operation of $W$ on $Q$ can
  be transferred in the obvious way to an operation on $e(Q)$ and then extended
  by linearity to give an operation of $W$ on $A$, thus making $A$ into a
  $W$-#ix("alternating elements")module. We consider the alternating elements of
  $A$, viz., those which satisfy
  $ w(a)=det w dot a $ <eq:weyl-exponent-theorem-alternating-elements>
  #block(sticky: true)[
    for all $w in W$. We denote by $theta$ the linear map of $A$ into itself
    given by
  ]
  $
    theta=sum_(w in W) det w dot w.
  $ <eq:weyl-exponent-theorem-alternating-operator>

  #lemma()[
    #block(sticky: true)[
      The image of $A$ under $theta$ is the set of all alternating elements of
      $A$.
    ]

    #source(162, "149")
  ] <l:alternating-group-algebra>

  #proof[
    #block(sticky: true)[
      Let $w in W$ and $a in A$. Then we have
    ]
    $
      w dot theta(a) & =w dot sum_(w' in W) det w' dot w'(a) \
                     & =det w dot sum_(w' in W) det(w w') dot w w'(a) \
                     & =det w dot theta(a).
    $ <eq:alternating-group-algebra-alternating-image>
    Thus $theta(a)$ is alternating.

    #block(sticky: true)[
      Now let $a$ be any alternating element of $A$. Then
    ]
    $
      theta(a)=sum_(w in W) det w dot w(a)=sum_(w in W) a=abs(W)a.
    $ <eq:alternating-group-algebra-scalar-action>
    #block(sticky: true)[Thus]
    $ theta lr((1/abs(W) a))=a $ <eq:alternating-group-algebra-preimage>
    and so $a$ lies in $theta(A)$.
  ]

  #ix("Weyl’s theorem")We now prove a theorem of Weyl giving a factorization of
  the expression $theta(e(S))$.

  #theorem()[
    #block(width: 100%, breakable: false)[
      $
        theta(e(S))=e(-S) dot product_(r in Phi^+) (e(r)-1).
      $ <eq:weyl-denominator-formula-weyl-denominator>
    ]
  ] <th:weyl-denominator-formula>

  Before proving this theorem we give an example to illustrate it. Suppose the
  root system $Phi$ is of type $A_2$, with fundamental roots $p_1,p_2$. Then
  $S=1/2(p_1+p_2+(p_1+p_2))=p_1+p_2$. Let $e(p_1)=X$ and $e(p_2)=Y$. Then
  $
    theta(e(S))=X Y-X+Y^(-1)-X^(-1) Y^(-1)+X^(-1)-Y
  $ <eq:weyl-denominator-formula-a2-alternating-sum>
  #block(sticky: true)[and we have the factorization]
  $
    & X Y-X+Y^(-1)-X^(-1) Y^(-1)+X^(-1)-Y \
    & quad=X^(-1) Y^(-1)(X Y-1)(X-1)(Y-1).
  $ <eq:weyl-denominator-formula-a2-factorization>

  #proof[
    #block(sticky: true)[ Let]
    $ a=e(-S) dot product_(r in Phi^+) (e(r)-1). $
    <eq:weyl-denominator-formula-product>
    #source(163, "150")
    #block(sticky: true)[
      We show that $a$ is an alternating element of $A$. For each $p_i in Pi$ we
      have
    ]
    $
      w_(p_i) (a) & =e(-w_(p_i) (S)) dot product_(r in Phi^+)
                    (e(w_(p_i) (r))-1) \
                  & =e(p_i-S) dot product_(r in Phi^+) (e(r)-1)
                    dot (e(-p_i)-1)/(e(p_i)-1) \
                  & =e(-S) dot product_(r in Phi^+) (e(r)-1)
                    dot e(p_i) dot (e(-p_i)-1)/(e(p_i)-1) \
                  & =-a.
    $ <eq:weyl-denominator-formula-simple-reflection>
    It follows that $w(a)=det w dot a$ for all $w in W$ and so $a$ is
    alternating.

    #block(sticky: true)[We now multiply out the product in $a$. We have]
    // E041: both subset sums range over positive roots, as does the product.
    $
      a & =e(S) dot product_(r in Phi^+) (1-e(-r)) \
        & =e(S) dot sum_(Omega subset.eq Phi^+) (-1)^abs(Omega)
          e lr((-sum_(r in Omega) r)) \
        & =sum_(Omega subset.eq Phi^+) (-1)^abs(Omega)
          e lr((S-sum_(r in Omega) r)).
    $ <eq:weyl-denominator-formula-subset-expansion>
    #block(sticky: true)[
      Now $a$ is alternating, and so $theta(a)=abs(W)a$. Thus
    ]
    $
      a=1/abs(W) sum_(Omega subset.eq Phi^+) (-1)^abs(Omega)
      theta lr((e lr((S-sum_(r in Omega) r)))).
    $ <eq:weyl-denominator-formula-averaged-subsets>
    #block(sticky: true)[Now if]
    $ S-sum_(r in Omega) r $ <eq:weyl-denominator-formula-singular-weight>
    #block(sticky: true)[lies in some reflecting hyperplane $H_s$ we have]
    $
      theta lr((e lr((S-sum_(r in Omega) r))))=0.
    $ <eq:weyl-denominator-formula-singular-cancellation>
    #block(sticky: true)[
      For $w$ and $w w_s$ give contributions to the sum
    ]
    $
      sum_w det w e lr((w lr((S-sum_(r in Omega) r))))
    $ <eq:weyl-denominator-formula-paired-terms>
    which are equal and opposite. Thus we need only consider subsets $Omega$ of
    $Phi^+$ such that
    $ S-sum_(r in Omega) r $ <eq:weyl-denominator-formula-regular-weight>
    does not lie in any reflecting hyperplane, and so has the form $w'(S)$ for
    some $w' in W$ by @l:root-subset-sum-orbit. In such a case we have
    $abs(Omega)=l(w')$ by @l:weyl-vector-inversion-sum.

    #source(164, "151")
    #block(sticky: true)[Thus]
    $
      a & =1/abs(W) sum_(w' in W) (-1)^(l(w')) theta(e(w'(S))) \
        & =1/abs(W) sum_(w' in W) det w' dot theta w'(e(S))
    $ <eq:weyl-denominator-formula-orbit-sum>
    #block(sticky: true)[since]
    $ (-1)^(l(w'))=det w'. $ <eq:weyl-denominator-formula-parity>
    #block(sticky: true)[Hence]
    $
      a & =1/abs(W) sum_(w' in W) theta(e(S)) \
        & =theta(e(S)),
    $ <eq:weyl-denominator-formula-averaging-conclusion>
    #block(sticky: true)[since]
    $ theta w'=det w' dot theta. $ <eq:weyl-denominator-formula-right-action>
    This completes the proof of Weyl’s theorem.
  ]

]

#[
  #import "main-defs.typ": ix, mathclap, nx, source

  == A Theorem of Macdonald <sec:macdonald-theorem>

  #ix("Macdonald’s theorem")Now the elements of $e(Q)$ are uniquely expressible
  in the form
  $ product_(i=1)^l e(q_i)^(n_i), $ <eq:macdonald-theorem-weight-monomial>
  where $n_i in ZZ$. We may introduce a total ordering on $e(Q)$ by means of the
  first difference in the exponents $n_1,dots,n_l$. Let $x,y$ be two non-zero
  elements of $A$. Then
  $
    x & =lambda e(q_1)^(m_1) dots e(q_l)^(m_l)+"lower terms in" e(Q), \
    y & =mu e(q_1)^(n_1) dots e(q_l)^(n_l)+"lower terms in" e(Q),
  $ <eq:macdonald-theorem-leading-monomials>
  #block(sticky: true)[where $lambda!=0$, $mu!=0$. Hence]
  $
    x y=lambda mu e(q_1)^(m_1+n_1) dots e(q_l)^(m_l+n_l)
    +"lower terms in" e(Q)
  $ <eq:macdonald-theorem-leading-product>
  and so $x y!=0$. This shows that $A$ is an integral domain.

  Let $F$ be the field of fractions of $A$ and $F[t]$ be the polynomial ring
  over $F$ in the indeterminate $t$. The following remarkable identity in $F[t]$
  is due to I. G. Macdonald.

  #theorem()[
    #block(width: 100%, breakable: false)[
      $
        sum_(w in W) lr((product_(r in Phi^+) (1-t e(-w(r)))/(1-e(-w(r)))))
        =sum_(w in W) t^(l(w)).
      $ <eq:macdonald-identity-macdonald-identity>
    ]
  ] <th:macdonald-identity>

  #source(165, "152")
  We again illustrate this theorem by an example before proving it. Suppose
  $Phi$ has type $A_1$ and that $r$ is the single positive root. Then
  Macdonald’s identity states that
  $
    (1-t e(-r))/(1-e(-r))+(1-t e(r))/(1-e(r))=1+t.
  $ <eq:macdonald-identity-a1-example>

  #proof[
    #block(sticky: true)[ We again consider the element]
    $ a=e(-S) dot product_(r in Phi^+) (e(r)-1). $
    <eq:macdonald-identity-denominator>
    #block(sticky: true)[Since $a$ is an alternating element we have]
    $
      w(a)=det w dot a & =e(-w(S)) dot product_(r in Phi^+) (e(w(r))-1) \
                       & =e(w(S)) dot product_(r in Phi^+) (1-e(-w(r))).
    $ <eq:macdonald-identity-alternating-denominator>
    #block(sticky: true)[Thus we have]
    $
      product_(r in Phi^+) (1-e(-w(r)))=e(-w(S)) dot det w dot a.
    $ <eq:macdonald-identity-denominator-transform>
    #block(sticky: true)[It follows that]
    $
      & sum_(w in W) lr((product_(r in Phi^+) (1-t e(-w(r)))/(1-e(-w(r))))) \
      & =1/a sum_(w in W) lr(
          (
            det w e(w(S)) dot product_(r in Phi^+) (1-t e(-w(r)))
          )
        ) \
      & =1/a sum_(w in W) det w e(w(S)) dot
        sum_(Omega subset.eq Phi^+) (-t)^abs(Omega)
        dot e lr((w lr((-sum_(r in Omega) r)))) \
      & =1/a sum_(Omega subset.eq Phi^+) (-t)^abs(Omega)
        sum_(w in W) det w dot e lr((w lr((S-sum_(r in Omega) r)))) \
      & =1/a sum_(Omega subset.eq Phi^+) (-t)^abs(Omega)
        theta lr((e lr((S-sum_(r in Omega) r)))).
    $ <eq:macdonald-identity-subset-expansion>
    #block(sticky: true)[
      As in the proof of @th:weyl-denominator-formula we have
    ]
    $
      theta lr((e lr((S-sum_(r in Omega) r))))=0
    $ <eq:macdonald-identity-singular-cancellation>
    #block(sticky: true)[if]
    $ S-sum_(r in Omega) r $ <eq:macdonald-identity-singular-weight>
    #source(166, "153")
    #block(sticky: true)[lies in any reflecting hyperplane. Moreover if]
    $ S-sum_(r in Omega) r $ <eq:macdonald-identity-regular-weight>
    does not lie in any reflecting hyperplane, it has the form $w'(S)$, where
    $w'$ is an element of $W$ with $l(w')=abs(Omega)$ (see
    @l:root-subset-sum-orbit and @l:weyl-vector-inversion-sum). #block(
      sticky: true,
    )[Using this information we have]
    $
      & sum_(w in W) lr((product_(r in Phi^+) (1-t e(-w(r)))/(1-e(-w(r))))) \
      & =1/a sum_(w' in W) (-t)^(l(w')) theta(e(w'(S))) \
      & =1/a sum_(w' in W) t^(l(w')) dot det w' dot theta w'(e(S)) \
      & =1/a sum_(w' in W) t^(l(w')) dot theta(e(S)),
    $ <eq:macdonald-identity-orbit-sum>
    since $(-1)^(l(w'))=det w'$ and $theta w'=det w' dot theta$. But
    $a=theta(e(S))$ by @th:weyl-denominator-formula and so the result follows.
  ]

  #block(sticky: true)[Now the polynomial]
  $ sum_(w in W) t^(l(w)) $ <eq:macdonald-theorem-length-polynomial>
  has been considered in Macdonald’s identity as an element of $F[t]$, where $F$
  is #nx("QQ", [$QQ$], group: "latin-q")[The field of rationals]the field of
  fractions of the rational group algebra of $e(Q)$, and a factorization of this
  polynomial has been obtained in $F[t]$. However, one can make use of this
  factorization in $F[t]$ to obtain a factorization of
  $ sum_(w in W) t^(l(w)) $ <eq:macdonald-theorem-rational-length-polynomial>
  in the very much smaller domain $QQ[t]$.

  #theorem()[
    #block(width: 100%, breakable: false)[
      $
        sum_(w in W) t^(l(w))=product_(r in Phi^+)
        (t^(h(r)+1)-1)/(t^(h(r))-1),
      $ <eq:poincare-root-height-product-height-product>
      where $h(r)$ #ix("height of a root")is the height of the root $r$.
    ]
  ] <th:poincare-root-height-product>

  #proof[
    Let $P$ be the additive group generated by the fundamental roots
    $p_1,dots,p_l$ and $e(P)$ be the corresponding multiplicative group. Let $h$
    be the homomorphism from $P$ into $ZZ$ taking value 1 at each
    #source(167, "154")
    fundamental root. $h$ is called the height function. Then there is a
    homomorphism
    $
      e(x) arrow t^(-h(x))
    $ <eq:poincare-root-height-product-height-homomorphism>
    from $e(P)$ into the infinite cyclic group generated by an element $t$.

    Let $B$ be the rational group algebra of $e(P)$. Since $P$ is a subgroup of
    $Q$ (see section @sec:diagonal-subgroup), $B$ is a subalgebra of $A$. The
    above homomorphism from $e(P)$ into $chevron(t)$ extends to an algebra
    homomorphism from $B$ into $QQ[t,1 slash t]$, the set of rational
    combinations of the powers of $t$. ($QQ[t,1 slash t]$ is the rational group
    algebra of the infinite cyclic group $chevron(t)$.) This algebra
    homomorphism may itself be extended to an algebra homomorphism from the
    polynomial ring $B[t]$ into $QQ[t,1 slash t]$ under which $t$ is mapped into
    $t$. For since $t$ is an indeterminate over $B$, its image may be chosen
    arbitrarily in $QQ[t,1 slash t]$ and an algebra homomorphism is then
    uniquely defined. We denote this homomorphism by $psi$. Then
    $psi:B[t] arrow QQ[t,1 slash t]$ satisfies
    $
      psi(e(r)) & =t^(-h(r)), quad r in Phi, \
         psi(t) & =t.
    $ <eq:poincare-root-height-product-specialization>
    #block(sticky: true)[Now Macdonald’s identity]
    $
      sum_(w in W) lr((product_(r in Phi^+) (1-t e(-w(r)))/(1-e(-w(r)))))
      =sum_(w in W) t^(l(w))
    $ <eq:poincare-root-height-product-macdonald-identity>
    may be interpreted as an identity in $B[t]$. For we may remove the
    denominators to obtain an identity in $A[t]$, and then observe that all the
    elements of $Q$ appearing in this identity are in $P$. We now apply the
    algebra homomorphism $psi$ to both sides, and obtain an identity
    $
      sum_(w in W) lr(
        (product_(r in Phi^+)
          (1-t^(1+h(w(r))))/(1-t^(h(w(r)))))
      )=sum_(w in W) t^(l(w)).
    $ <eq:poincare-root-height-product-specialized-sum>
    However if $w!=1$ there is some $r in Phi^+$ such that $h(w(r))=-1$. Thus
    the contributions to the left-hand side from all non-identity elements of
    $W$ are zero. Hence
    $
      product_(r in Phi^+) (1-t^(1+h(r)))/(1-t^(h(r)))=sum_(w in W) t^(l(w))
    $ <eq:poincare-root-height-product-identity-term>
    and the theorem is proved.
  ]

  Now it is clear that in general a large number of terms in the product
  $ product_(r in Phi^+) (t^(h(r)+1)-1)/(t^(h(r))-1) $
  <eq:macdonald-theorem-height-factors>
  #source(168, "155")
  will cancel, and in order to see which terms remain after cancellation we
  consider the number of positive roots of a given height. Let $k_i$ be the
  number of roots of height $i$. Then inspection of the root systems (see
  section @sec:description-of-simple-lie-algebras) shows that
  $ l=k_1>=k_2>=k_3>=dots. $ <eq:macdonald-theorem-height-partition>
  Now $(k_1,k_2,dots)$ is a partition of $N$. The dual partition of $N$ has $l$
  parts and will be denoted by $(m_1,m_2,dots,m_l)$.

  #nx(
    "m-1-dots-m-l",
    [$m_1,dots,m_l$],
    group: "latin-m",
    after: "M-r-s-i",
  )[The exponents of the Weyl group]#theorem()[
    #block(width: 100%, breakable: false)[
      $
        sum_(w in W) t^(l(w))=product_(i=1)^l lr(((t^(m_i+1)-1)/(t-1))).
      $ <eq:poincare-exponent-product-exponent-product>
    ]
  ] <th:poincare-exponent-product>

  #proof[
    #block(sticky: true)[ All the terms in the expression]
    $ product_(r in Phi^+) (t^(h(r)+1)-1)/(t^(h(r))-1) $
    <eq:poincare-exponent-product-height-product>
    cancel with the exception of terms $t^(m_1+1)-1$, $t^(m_2+1)-1$, $dots$,
    $t^(m_l+1)-1$ in the numerator and $(t-1)^l$ in the #ix(
      "degrees of basic invariants",
    )denominator.
  ]

  #ix("duality of exponents")#corollary()[
    #block(sticky: true)[
      The degrees of the basic polynomial invariants of $W$ are given by
      $d_i=m_i+1$, $i=1,dots,l$.
    ]
  ] <cor:degrees-and-exponents>

  #proof[
    This follows from @th:poincare-polynomial-factorization and
    @th:poincare-exponent-product.
  ]

  It is easy to determine the integers $m_1,dots,m_l$ in the individual cases by
  inspecting the root systems.

  #proposition()[
    #block(sticky: true)[
      The integers $m_1,dots,m_l$ are as follows:
    ]
    #align(center)[
      #table(
        columns: (auto, auto),
        align: (left, left),
        inset: (x: 10pt, y: 4pt),
        stroke: none,
        table.hline(stroke: 0.6pt),
        table.header([], [$m_1,m_2,dots,m_l$]),
        table.hline(stroke: 0.4pt),
        [$A_l$], [$1,2,dots,l$],
        [$B_l$], [$1,3,5,dots,2l-1$],
        [$C_l$], [$1,3,5,dots,2l-1$],
        [$D_l$], [$1,3,5,dots,2l-3,l-1$],
        [$G_2$], [$1,5$],
        [$F_4$], [$1,5,7,11$],
        [$E_6$], [$1,4,5,7,8,11$],
        [$E_7$], [$1,5,7,9,11,13,17$],
        [$E_8$], [$1,7,11,13,17,19,23,29$],
        table.hline(stroke: 0.6pt),
      )
    ]

    #source(169, "156")
  ] <p:exponent-table>

  #proof[
    Calculate the numbers $k_1,k_2,dots$ from section
    @sec:description-of-simple-lie-algebras and form the dual partition.
  ]

  It will be observed that the integers $m_1,dots,m_l$ determined in
  @p:exponent-table satisfy a condition of duality. If the $m_i$ are arranged in
  increasing order we have
  $ m_1+m_l=m_2+m_(l-1)=dots=1+h(R), $ <eq:macdonald-theorem-exponent-duality>
  where $R$ #nx("R", [$R$], group: "latin-r", after: "RR")[The root of maximum
    height]is the (unique) root of maximum height. We have not yet seen any
  reason why this duality should exist. However, this becomes clear by giving an
  entirely different definition of the $m_i$, based on properties of the
  ‘Coxeter elements’ of the #ix("Coxeter element")Weyl group. The approach via
  Coxeter elements will also explain another property of the integers $m_i$
  observable from @p:exponent-table, the fact that they exhibit a definite
  tendency to be prime.
]

#[
  #import "main-defs.typ": ix, nx, source
  #import "diagrams/coxeter-circle.typ": coxeter-circle

  == The Class of Coxeter Elements <sec:coxeter-elements>

  A Coxeter element of the Weyl group $W$ is an element of form
  $ w_(r_1) w_(r_2) dots w_(r_l), $ <eq:coxeter-elements-coxeter-element>
  where $r_1,r_2,dots,r_l$ is a fundamental system in $Phi$.

  #ix("Coxeter’s theorem")#theorem()[
    #block(sticky: true)[
      The Coxeter elements of $W$ form a conjugacy class in $W$.
    ]
  ] <th:coxeter-elements-conjugate>

  #proof[
    #block(sticky: true)[
      It is clear that any conjugate of a Coxeter element is a Coxeter element.
      For
    ]
    $
      w w_(r_1) dots w_(r_l) w^(-1)=w_(w(r_1)) dots w_(w(r_l))
    $ <eq:coxeter-elements-conjugate-conjugation>
    and if $r_1,dots,r_l$ is a fundamental system so is $w(r_1),dots,w(r_l)$. In
    showing that any two Coxeter elements are conjugate it is sufficient to
    consider Coxeter elements corresponding to a fixed fundamental system, since
    any two fundamental systems are equivalent under the Weyl group
    (@th:fundamental-systems-conjugate). We take the fundamental system
    $Pi={p_1,dots,p_l}$ and consider the Coxeter elements corresponding to this.
    $w_(p_1) w_(p_2) dots w_(p_l)$ is one such element and the others are
    obtained by changing the order of the factors. The fact that they are all
    conjugate follows from the following lemma.

    #source(170, "157")
    #lemma()[
      #block(sticky: true)[
        Suppose the fundamental roots $p_1,dots,p_l$ are written round a circle,
        as shown in @fig:3[Figure 3]. Then any permutation of $p_1,dots,p_l$ may
        be obtained by performing a succession of interchanges $(p_i p_j)$,
        where $p_i,p_j$ are not joined in the Dynkin diagram and are adjacent on
        the circle, and then reading clockwise around the circle beginning from
        a suitable point.
      ]
    ] <l:circular-order-interchanges>

    #figure(
      [#coxeter-circle() #align(center)[Figure 3]],
      caption: none,
    ) <fig:3>

    #proof[
      We use induction on $l$. The result is clear if $l=1$ or $l=2$, since no
      interchanges have to be carried out at all. Thus we assume $l>=3$. Now the
      Dynkin diagram contains some node joined to at most one other node. Let
      $p_l$ correspond to such a node. On omitting $p_l$ from the circle we may
      by induction obtain any permutation of $p_1,dots,p_(l-1)$ by interchanging
      adjacent pairs not joined in the Dynkin diagram and then reading round
      from a suitable point. We show that all these interchanges can be carried
      out even when $p_l$ is present. It is sufficient to show that $p_i,p_j$
      can be interchanged if $p_i,p_j$ are not joined in the Dynkin diagram and
      if $p_l$ is adjacent to both. (See @fig:4[Figure 4].)

      #figure(
        [#coxeter-circle(detail: true) #align(center)[Figure 4]],
        caption: none,
      ) <fig:4>

      Now $p_l$ is not joined in the Dynkin diagram to at least one of
      $p_i,p_j$— assume without loss of generality that $p_l$ is not joined to
      $p_i$. Then by interchanging $p_i,p_l$ and then $p_i,p_j$ we have
      succeeded in interchanging the order of $p_i,p_j$ when $p_l$ is removed.
      Thus we may make the required arrangement of all the roots other than
      $p_l$. But then $p_l$, since it is joined
      #source(171, "158")
      to at most one other node in the Dynkin diagram, may be moved around the
      circle by a succession of steps in either a clockwise or an anticlockwise
      direction into its required position.
    ]

    Now given any arrangement of the roots $p_1,dots,p_l$ around the circle and
    any starting point on the circle, a Coxeter element $w_(r_1) dots w_(r_l)$
    is determined. $r_1$ is the starting point, and $r_1,r_2,dots,r_l$ appear
    clockwise around the circle starting from $r_1$. If we take the same
    arrangement around the circle, but a different starting point, we obtain a
    conjugate Coxeter element. If we change the arrangement around the circle by
    interchanging adjacent roots not linked in the Dynkin diagram, the Coxeter
    element is unchanged since the corresponding reflections commute. (If we
    have interchanged the first and last terms, a conjugate Coxeter element is
    obtained.) Thus @l:circular-order-interchanges shows that any Coxeter
    element of the form $w_(r_1) dots w_(r_l)$ can be obtained from
    $w_(p_1) dots w_(p_l)$ by a succession of operations which either leave the
    element unchanged or give a conjugate element. This completes the proof of
    @th:coxeter-elements-conjugate.
  ]

  The conjugacy class containing the Coxeter elements of $W$ is called the
  Coxeter class.
]

#[
  #import "main-defs.typ": ix, mathclap, nx, source
  #import "diagrams/coxeter-plane.typ": coxeter-plane

  == A Dihedral Subgroup of the Weyl Group <sec:dihedral-subgroup>

  #ix("dihedral subgroup of Weyl group")We shall obtain further information
  about the Coxeter elements by showing that each Coxeter element can be
  embedded in a dihedral subgroup of $W$ which operates faithfully on a certain
  2-dimensional subspace of $frak(V)$.

  #lemma()[
    #block(sticky: true)[
      The set of fundamental roots $p_1,dots,p_l$ may be divided into two
      disjoint subsets, each of which contains roots which are all orthogonal to
      one another.
    ]
  ] <l:orthogonal-bipartition>

  #proof[
    Remove a node from the Dynkin diagram which is joined to at most one other
    node, and use induction on the number of nodes.
  ]

  #block(sticky: true)[
    We suppose that the fundamental system $Pi={p_1,dots,p_l}$ is decomposed as
    in @l:orthogonal-bipartition into two subsets
  ]
  $ p_1,dots,p_k; quad p_(k+1),dots,p_l. $ <eq:dihedral-subgroup-bipartition>

  #source(172, "159")
  Let $f_1,dots,f_l$ be vectors of unit length in the directions of
  $p_1,dots,p_l$ so that $p_i=abs(p_i) f_i$. Then $f_1,dots,f_l$ is a basis for
  $frak(V)$, although not an orthonormal basis. However, there is a uniquely
  determined dual basis $hat(f)_1,dots,hat(f)_l$ satisfying
  $
    (f_i,hat(f)_j)=cases(1 "if" i=j, 0 "if" i!=j).
  $ <eq:dihedral-subgroup-dual-basis>
  Let $(f_i,f_j)=m_(i j)$ and $M$ be the $l times l$ matrix $M=(m_(i j))$. Then
  $(hat(f)_i,hat(f)_j)=(M^(-1))_(i j)$. Now $M$ is a symmetric matrix whose
  diagonal coefficients are $1$ and whose non-diagonal coefficients are
  non-positive (@cor:fundamental-root-inner-products). Thus $I-M$ is a symmetric
  matrix whose coefficients are all non-negative. This matrix plays a useful
  role in deriving the properties of the Coxeter elements.

  #block(sticky: true)[
    Let $lambda$ be a non-zero eigenvalue of $I-M$ and
  ]
  $ u=mat(xi_1; dots.v; xi_l) $ <eq:dihedral-subgroup-eigenvector>
  #block(sticky: true)[be a corresponding eigenvector. Then]
  $ (I-M)u=lambda u $ <eq:dihedral-subgroup-eigen-equation>
  and, since $I-M$ is symmetric, $lambda$ is real and $xi_1,dots,xi_l$ may be
  chosen real. We define two elements $a,b$ of $frak(V)$ by
  $
    a=sum_(i=1)^k xi_i hat(f)_i, quad
    b=sum_(i=k+1)^l xi_i hat(f)_i.
  $ <eq:dihedral-subgroup-plane-vectors>

  #lemma()[
    #block(sticky: true)[
      (i) $(a,a)=(b,b)$.

      (ii) The angle $theta$ between $a,b$ is given by $cos theta=lambda$.
    ]
  ] <l:coxeter-plane-angle>

  #proof[
    #block(sticky: true)[
      $M$ may be written in the form of a block matrix
    ]
    $ M=mat(I_k, A; A', I_(l-k)), $ <eq:coxeter-plane-angle-gram-blocks>
    #block(sticky: true)[
      where $A$ is a certain $k times (l-k)$ matrix and $A'$ is the transpose of
      $A$. $M^(-1)$, which is also symmetric, may be written in the form
    ]
    $ M^(-1)=mat(B, C; C', D). $ <eq:coxeter-plane-angle-inverse-blocks>

    #source(173, "160")
    #block(sticky: true)[If we write]
    $ u=mat(u^1; u^2) $ <eq:coxeter-plane-angle-eigenvector-blocks>
    #block(sticky: true)[the equation $(I-M)u=lambda u$ gives]
    $
      -A u^2=lambda u^1, quad -A' u^1=lambda u^2.
    $ <eq:coxeter-plane-angle-block-eigen>
    #block(sticky: true)[It follows that]
    $ -B A u^2=lambda B u^1, quad -D A' u^1=lambda D u^2. $
    <eq:coxeter-plane-angle-multiplied-blocks>
    #block(sticky: true)[Now since $M^(-1) M=I_l$ we have]
    $ B A+C=0, quad C'+D A'=0. $ <eq:coxeter-plane-angle-inverse-relations>
    #block(sticky: true)[Therefore]
    $
      (*) quad C u^2=lambda B u^1, quad C' u^1=lambda D u^2.
    $ <eq:coxeter-plane-angle-star>
    #block(sticky: true)[However]
    $
      (a,a) & =sum_(i,j=1)^k xi_i xi_j (M^(-1))_(i j)=(u^1)' B u^1, \
      (b,b) & =sum_(#mathclap($i,j=k+1$))^l xi_i xi_j
              (M^(-1))_(i j)=(u^2)' D u^2.
    $ <eq:coxeter-plane-angle-norms>
    #block(sticky: true)[
      The equations (@eq:coxeter-plane-angle-star[$*$]) now show
    ]
    $
      (u^1)' B u^1 & =lambda^(-1) dot (u^1)' C u^2 \
                   & =lambda^(-1) dot (u^2)' C' u^1=(u^2)' D u^2.
    $ <eq:coxeter-plane-angle-equal-norms>
    #block(sticky: true)[Therefore]
    $ (a,a)=(b,b). $ <eq:coxeter-plane-angle-norm-result>
    #block(sticky: true)[The angle between $a,b$ is given by]
    $
      abs(a) dot abs(b) dot cos theta&=(a,b)
      =sum_(i=1)^k sum_(j=k+1)^l xi_i xi_j (M^(-1))_(i j) \
      &=(u^1)' C u^2=lambda (u^1)' B u^1=lambda dot (a,a).
    $ <eq:coxeter-plane-angle-angle>
    Since $(a,a)=(b,b)$ we have $cos theta=lambda$.
  ]

  #block(sticky: true)[We now define elements $w_1,w_2$ of $W$ by]
  $
    w_1=w_(p_1) dots w_(p_k), quad w_2=w_(p_(k+1)) dots w_(p_l).
  $ <eq:dihedral-subgroup-involutions>
  Then $w_1,w_2$ are involutions, being products of reflections with respect to
  mutually orthogonal roots. Their product $w=w_1 w_2$ is a Coxeter element. We
  consider the group $lr(chevron.l w_1, w_2 chevron.r)$ generated by $w_1,w_2$.
  This is a dihedral
  #source(174, "161")
  subgroup of $W$, since it is generated by two involutions. This dihedral group
  operates in a particularly simple way on the 2-dimensional subspace of
  $frak(V)$ containing the points $a$ and $b$.

  #proposition()[
    #block(sticky: true)[
      Let $lambda$ be a non-zero eigenvalue of $I-M$ and $u$ a corresponding
      eigenvector. Let $a,b$ be the vectors defined above and $Gamma$ be the
      circle with centre the origin passing through $a$ and $b$ (see
      @fig:5[Figure 5]). Then the group $lr(chevron.l w_1, w_2 chevron.r)$
      operates on the points of $Gamma$. In particular $w_1$ is the reflection
      in the line $O b$, $w_2$ is the reflection in the line $O a$ and $w$ is a
      rotation around $Gamma$ through an angle $2theta$, where
      $cos theta=lambda$.
    ]
  ] <p:dihedral-circle-action>

  #figure(
    [#block[#coxeter-plane() #align(center)[Figure 5]] <fig:5>],
    caption: none,
    placement: top,
  )

  #proof[
    It was shown in @l:coxeter-plane-angle that $lambda B u^1-C u^2=0$ and this
    implies that $(hat(f)_i,lambda a-b)=0$ for $i=1,dots,k$. Thus $lambda a-b$
    is a linear combination of $f_(k+1),dots,f_l$, so also a linear combination
    of $p_(k+1),dots,p_l$. Hence $w_2 (lambda a-b)=-(lambda a-b)$. However,
    $w_2 (a)=a$ and, since $cos theta=lambda$, $lambda a$ is the projection of
    $b$ on $O a$. Thus $w_2$ leaves $Gamma$ invariant and operates on it as the
    reflection in the line $O a$.

    Similarly it was shown that $C' u^1-lambda D u^2=0$ and this implies that
    $(hat(f)_i,a-lambda b)=0$ for $i=k+1,dots,l$. Thus $a-lambda b$ is a linear
    combination of $p_1,dots,p_k$ and so $w_1 (a-lambda b)=-(a-lambda b)$. Also
    $w_1 (b)=b$ and $lambda b$ is the projection of $a$ on $O b$. Thus $w_1$
    leaves $Gamma$ invariant and operates on it as the reflection in the line
    $O b$.

    Finally, since $O a$ and $O b$ are inclined at an angle $theta$, $w=w_1 w_2$
    is a rotation through $2theta$. The whole dihedral group
    $lr(chevron.l w_1, w_2 chevron.r)$ therefore operates on $Gamma$ in an
    obvious way.
  ]

]

#[
  #import "main-defs.typ": ix, nx, source
  #import "diagrams/coxeter-plane.typ": coxeter-plane

  == Eigenvalues of the Coxeter Elements <sec:coxeter-element-eigenvalues>

  Before applying the results of section @sec:dihedral-subgroup to give further
  information about the Coxeter elements, we state and prove a classical result
  on real
  #source(175, "162")
  symmetric matrices which we #ix("Frobenius–Perron theorem")shall need, known
  as the Frobenius–Perron theorem.

  A real symmetric matrix $M=(m_(i j))$ is called positive semi-definite if
  $x M x'>=0$ for all $x in RR^l$, and indecomposable if it is impossible to
  split up the set $1,2,dots,l$ into two non-empty complementary subsets $I,J$
  such that $m_(i j)=0$ whenever $i in I,j in J$.

  #proposition()[
    #block(sticky: true)[
      Let $M$ be a real symmetric matrix such that $m_(i j)<=0$ for all $i!=j$,
      and suppose that $M$ is positive semi-definite and indecomposable. Then
      the eigenvalues of $M$ are all real and non-negative. The smallest
      eigenvalue has multiplicity $1$ and has an eigenvector whose coefficients
      are all positive.
    ]
  ] <p:smallest-cartan-eigenvalue>

  #proof[
    The eigenvalues of $M$ are real since $M$ is symmetric, and non-negative
    since $M$ is positive semi-definite. There is an orthogonal matrix $T$ such
    that $T M T'$ is a diagonal matrix whose coefficients are the eigenvalues of
    $M$, by a well-known theorem of linear algebra.

    Let $frak(V)_0$ be the null-space of $M$, i.e. the set of $x in RR^l$ such
    that $x M=0$. $frak(V)_0$ is also the set of $x in RR^l$ such that
    $x M x'=0$, as is easily seen by considering the diagonal matrix $T M T'$.
    We shall show that $dim frak(V)_0<=1$. Suppose $dim frak(V)_0>0$ and let
    $x=(alpha_1,alpha_2,dots,alpha_l)$ be a non-zero vector in $frak(V)_0$. Let
    $y=(abs(alpha_1),abs(alpha_2),dots,abs(alpha_l))$. Then we have
    $ 0<=y M y'<=x M x'=0, $ <eq:smallest-cartan-eigenvalue-absolute-value>
    #block(sticky: true)[
      since $m_(i j)<=0$ if $i!=j$. It follows that $y M y'=0$ and so
      $y in frak(V)_0$. Thus $frak(V)_0$ contains a non-zero vector whose
      coordinates are all non-negative, and we have
    ]
    $
      sum_(i=1)^l abs(alpha_i) m_(i j)=0.
    $ <eq:smallest-cartan-eigenvalue-null-vector>
    Let $I$ be the set of $i$ with $alpha_i!=0$ and $J$ be the set of $i$ with
    $alpha_i=0$. Suppose $j in J$. Then all the terms $abs(alpha_i) m_(i j)$ in
    the above sum are non-positive, and so $abs(alpha_i) m_(i j)=0$ for all $i$.
    If $i in I$ we have $abs(alpha_i)!=0$ and hence $m_(i j)=0$. Thus
    $m_(i j)=0$ for all $i in I,j in J$. However, $M$ is indecomposable and $I$
    is non-empty, therefore $J$ must be empty. Thus each coefficient of $x$ is
    non-zero. Since this holds for each non-zero vector in $frak(V)_0$ we must
    have $dim frak(V)_0<=1$. Furthermore if $dim frak(V)_0=1$, then $frak(V)_0$
    contains a vector whose coefficients are all positive.

    Let $mu$ be the smallest eigenvalue of $M$. Then $M-mu I$ satisfies the
    hypotheses of the proposition, as can be seen by considering again the
    diagonal
    #source(176, "163")
    matrix $T M T'$. $M-mu I$ is singular, so its null-space has dimension $1$
    and contains a vector whose coefficients are all positive. Thus $mu$ occurs
    as eigenvalue of $M$ with multiplicity $1$, and has an eigenvector whose
    coefficients are all positive.
  ]

  We apply the Frobenius–Perron theorem to the situation discussed in
  @p:dihedral-circle-action. Let $M=(m_(i j))$ be the matrix defined by
  $m_(i j)=(f_i,f_j)$. Then $M$ is positive definite, since the Killing form is
  positive definite (section @sec:roots-of-simple-lie-algebras). Moreover
  $m_(i j)<=0$ when $i!=j$ by @cor:fundamental-root-inner-products.

  #corollary()[
    #block(sticky: true)[
      If the vectors $a,b$ are chosen as in section @sec:dihedral-subgroup with
      respect to the largest eigenvalue of $I-M$, then each point of the circle
      $Gamma$ lying strictly between $a$ and $b$ is in the fundamental chamber.
    ]
  ] <cor:coxeter-circle-chamber-arc>

  #proof[
    The eigenvector $(xi_1,dots,xi_l)$ corresponding to the smallest eigenvalue
    of $M$ corresponds to the largest eigenvalue of $I-M$. Thus we may assume
    each $xi_i>0$.

    #block(sticky: true)[Now we have]
    $ a=sum_(i=1)^k xi_i hat(f)_i, quad b=sum_(i=k+1)^l xi_i hat(f)_i; $
    <eq:coxeter-circle-chamber-arc-positive-vectors>
    #block(sticky: true)[
      thus every point $c$ on $Gamma$ strictly between $a$ and $b$ has the form
    ]
    $
      c=sum_(i=1)^l lambda_i hat(f)_i,
    $ <eq:coxeter-circle-chamber-arc-chamber-vector>
    where $lambda_i>0$ for $i=1,dots,l$. This means that $(c,f_i)>0$ and so
    $(c,p_i)>0$ for each $i$. Thus $c$ lies in the fundamental chamber.
  ]

  We are now in a position to acquire #ix("order, of Coxeter elements")further
  information about the Coxeter elements.

  #theorem()[
    #block(sticky: true)[
      The order of the Coxeter elements is $2N slash l$.
    ]
  ] <th:coxeter-number-root-count>

  #proof[
    Let $w$ be a Coxeter element and $h$ be the order of $w$. Let $Gamma$ be the
    circle defined in section @sec:dihedral-subgroup with respect to the largest
    eigenvalue of $I-M$. Then $w$ operates as a rotation on $Gamma$. Now the
    cyclic group $lr(chevron.l w chevron.r)$ generated by $w$ operates
    faithfully on $Gamma$. For if an element of $W$ operates trivially on
    $Gamma$ it fixes some point in the fundamental chamber by
    @cor:coxeter-circle-chamber-arc, so is the identity by
    @cor:simply-transitive-chamber-action. Thus $w$ has order $h$ on $Gamma$.

    #source(177, "164")
    #figure(
      [#block[#coxeter-plane(reflected: true) #align(center)[Figure
          6]] <fig:6>],
      caption: none,
      placement: top,
    )

    Let $c$ be the point on $Gamma$ which is the reflection of $b$ in $O a$ (see
    @fig:6[Figure 6]). Then the angle between $O b$ and $O c$ is $2theta$. Since
    $w$ is a rotation through $2theta$, there exists an integer $i>0$ such that
    $w^i (a)$ lies on the arc $b c$. Let $i$ be the least such positive integer.
    If $w^i (a)$ lies between $a$ and $b$, both $a$ and $w^i (a)$ lie in
    $overline(C)$, the closure of the fundamental chamber
    (@cor:coxeter-circle-chamber-arc). Thus $w^i (a)=a$ by
    @cor:closed-chamber-fundamental-region. On the other hand, if $w^i (a)$ lies
    between $a$ and $c$ it is evident that $w^i (b)$ lies between $a$ and $b$.
    Thus both $b$ and $w^i (b)$ lie in $overline(C)$, and so $w^i (b)=b$. In
    either case we have $w^i=1$ since $lr(chevron.l w chevron.r)$ operates
    faithfully on $Gamma$. Hence $i=h$ and $theta=pi slash h$.

    #block(sticky: true)[Now]
    $ a=sum_(i=1)^k xi_i hat(f)_i $ <eq:coxeter-number-root-count-a>
    and so $a$ is orthogonal to the roots $p_(k+1),dots,p_l$ and their
    negatives. We show that these are the only roots orthogonal to $a$. Suppose
    $ sum_(i=1)^l eta_i f_i $ <eq:coxeter-number-root-count-root>
    #block(sticky: true)[is a root orthogonal to $a$. Then]
    $ sum_(i=1)^k xi_i eta_i=0. $ <eq:coxeter-number-root-count-orthogonality>
    #block(sticky: true)[
      Since each $xi_i>0$ and all $eta_i$ have the same sign, this implies that
    ]
    $
      eta_1=eta_2=dots=eta_k=0.
    $ <eq:coxeter-number-root-count-zero-coefficients>
    #block(sticky: true)[Thus the root]
    $ sum_(i=1)^l eta_i f_i $ <eq:coxeter-number-root-count-parabolic-root>
    is a linear combination of $p_(k+1),dots,p_l$. By @p:parabolic-root-system
    the roots which are linear combinations of $p_(k+1),dots,p_l$ form a system
    in which $p_(k+1),dots,p_l$
    #source(178, "165")
    is a fundamental system. Since $p_(k+1),dots,p_l$ are mutually orthogonal,
    the only such roots are $plus.minus p_i$. Thus $a$ lies in exactly $l-k$
    reflecting hyperplanes.

    Since $a$ lies in $l-k$ reflecting hyperplanes the same is true of all
    transforms $w^i (a)$, $i=1,2,dots$. Similarly $b$ and all its transforms
    $w^i (b)$ lie in exactly $k$ reflecting hyperplanes. However, each
    reflecting hyperplane intersects the plane of $Gamma$ in a line meeting
    $Gamma$ at one of the transforms $w^i (a)$ or $w^i (b)$. For otherwise there
    would be a reflecting hyperplane intersecting $Gamma$ at a point strictly
    between $a$ and $b$, contrary to the fact that such points lie in the
    fundamental chamber. Now there are $h$ transforms of $a$ and $h$ transforms
    of $b$ alternating round $Gamma$. Thus the total number of reflecting
    hyperplanes is
    $
      1/2 [(l-k)h+k h]=1/2 l h
    $ <eq:coxeter-number-root-count-hyperplane-count>
    since each hyperplane meets $Gamma$ in two points. Thus $N=1/2 l h$, and so
    $h=2N slash l$, as required.
  ]

  #corollary()[
    #block(sticky: true)[
      A Coxeter element $w$ has an eigenvalue $upright(e)^(2pi i slash h)$.
    ]
  ] <cor:primitive-coxeter-eigenvalue>

  #proof[
    As $w$ operates on $Gamma$ as a rotation through $2pi slash h$, $w$ has an
    eigenvalue $upright(e)^(2pi i slash h)$ in the plane of $Gamma$.
  ]

  #corollary()[
    #block(sticky: true)[
      A Coxeter element $w$ has an eigenvector $v$ with eigenvalue
      $upright(e)^(2pi i slash h)$ such that $v$ is not orthogonal to any root.
    ]
  ] <cor:regular-coxeter-eigenvector>

  #proof[
    Let $v$ be an eigenvector with eigenvalue $upright(e)^(2pi i slash h)$ lying
    in the plane of $Gamma$. Since $w$ operates as a rotation in this plane $v$
    is not real, so $v!=overline(v)$. Suppose $(v,r)=0$, where $r in Phi$. Then
    $(overline(v),r)=0$ since $r$ is real, and it follows that $r$ is orthogonal
    to every vector in the plane of $Gamma$. Since this plane contains points in
    the fundamental chamber we have a contradiction. Thus $v$ is not orthogonal
    to any root.
  ]

  #proposition()[
    #block(sticky: true)[
      A Coxeter element has no eigenvalue $1$.
    ]
  ] <p:coxeter-element-no-fixed-vector>

  #proof[
    #block(sticky: true)[
      This is much easier to prove than the preceding results. Suppose a Coxeter
      element $w$ fixes a vector $v$. Then
    ]
    $
      w_(p_1) w_(p_2) dots w_(p_l) (v)=v
    $ <eq:coxeter-element-no-fixed-vector-fixed-vector>
    #block(sticky: true)[and so]
    $
      w_(p_2) dots w_(p_l) (v)=w_(p_1) (v).
    $ <eq:coxeter-element-no-fixed-vector-first-reflection>

    #source(179, "166")
    Now $w_(p_2) dots w_(p_l) (v)-v$ is a linear combination of $p_2,dots,p_l$
    and $w_(p_1) (v)-v$ is a scalar multiple of $p_1$. Since $p_1,p_2,dots,p_l$
    are linearly independent we have
    $
      w_(p_2) dots w_(p_l) (v)=w_(p_1) (v)=v.
    $ <eq:coxeter-element-no-fixed-vector-independence>
    Thus $v$ is orthogonal to $p_1$ and $w_(p_2) dots w_(p_l)$ fixes $v$.
    Repeating the argument we see that $v$ is orthogonal to $p_1,p_2,dots,p_l$,
    hence $v=0$. Thus $w$ fixes no non-zero vector and so has no eigenvalue $1$.
  ]

]

#[
  #import "main-defs.typ": bib-ref, ix, nx, source

  == A Theorem of Coleman <sec:coleman-theorem>

  #ix("Coleman’s theorem")We now prove a theorem of #ix(
    "eigenvalues of Coxeter element",
  )Coleman relating the eigenvalues of the Coxeter elements to the degrees of
  the basic invariants.

  #theorem()[
    #block(sticky: true)[
      Let the eigenvalues of a Coxeter element be
    ]
    $
      zeta^(m_1),zeta^(m_2),dots,zeta^(m_l),
    $ <eq:coxeter-eigenvalues-invariant-degrees-eigenvalues>
    where $zeta=upright(e)^(2pi i slash h)$ and $m_1,m_2,dots,m_l$ are positive
    integers less than $h$. Then the degrees of the basic invariants
    $I_1,I_2,dots,I_l$ of $W$ are
    $
      m_1+1,m_2+1,dots,m_l+1.
    $ <eq:coxeter-eigenvalues-invariant-degrees-degrees>
  ] <th:coxeter-eigenvalues-invariant-degrees>

  #proof[
    The eigenvalues of a Coxeter element $w$ are $h$th roots of unity, where $h$
    is the order of $w$, so are powers of $zeta$. By
    @p:coxeter-element-no-fixed-vector $zeta^0$ is not an eigenvalue, so the
    eigenvalues are of form $zeta^(m_i)$, where $0<m_i<h$. Let $f_1,dots,f_l$ be
    a basis for the complexification $frak(V)_CC$ of $frak(V)$ such that
    $
      w(f_i)=zeta^(m_i) f_i.
    $ <eq:coxeter-eigenvalues-invariant-degrees-eigenbasis>
    #block(sticky: true)[Let]
    $
      x_1 e_1+dots+x_l e_l=y_1 f_1+dots+y_l f_l,
    $ <eq:coxeter-eigenvalues-invariant-degrees-coordinates>
    where $e_1,dots,e_l$ is an orthonormal basis of $frak(V)$. Then
    $y_1,dots,y_l$ are linear functions in $x_1,dots,x_l$ and vice versa. Now we
    may assume that $m_1=1$ by @cor:primitive-coxeter-eigenvalue and that $f_1$
    is not orthogonal to any root by @cor:regular-coxeter-eigenvector.
    #block(sticky: true)[Let]
    $
      J=abs(frac(partial (I_1,dots,I_l), partial (y_1,dots,y_l)))
    $ <eq:coxeter-eigenvalues-invariant-degrees-jacobian>
    #ix("Jacobian")be the Jacobian determinant of a set of basic polynomial
    invariants of $W$ expressed in terms of $y_1,dots,y_l$. By
    @th:jacobian-factorization $J$ factorizes into a product
    #source(180, "167")
    of linear factors representing the reflecting hyperplanes. Since $f_1$ is
    not in any reflecting hyperplane, $J!=0$ at $(y_1,0,dots,0)$. Thus we may
    choose the numbering of the invariants $I_1,dots,I_l$ so that
    $partial I_i slash partial y_i!=0$ at $(y_1,0,dots,0)$.
    #block(sticky: true)[Thus we have]
    $
      frac(partial I_i, partial y_i)=mu_i y_1^(d_i-1)
      +"terms involving" y_j "with" j>1.
    $ <eq:coxeter-eigenvalues-invariant-degrees-derivative-term>
    #block(sticky: true)[Hence]
    $
      I_i=lambda_i y_1^(d_i-1) y_i+"terms involving different monomials,"
    $ <eq:coxeter-eigenvalues-invariant-degrees-monomial>
    where $lambda_i!=0$.

    #block(sticky: true)[
      We now apply $w$ and use the fact that $I_i$ is an invariant. Let
    ]
    $
      y=y_1 f_1+dots+y_l f_l.
    $ <eq:coxeter-eigenvalues-invariant-degrees-point>
    #block(sticky: true)[Then]
    $
      w^(-1) (y)=y_1 zeta^(-m_1) f_1+dots+y_l zeta^(-m_l) f_l.
    $ <eq:coxeter-eigenvalues-invariant-degrees-inverse-point>
    #block(sticky: true)[
      Since for any polynomial $P(y)$ we have $(w(P))(y)=P(w^(-1) (y))$ it
      follows that
    ]
    $
      w(y_i)=y_i dot zeta^(-m_i).
    $ <eq:coxeter-eigenvalues-invariant-degrees-dual-action>
    #block(sticky: true)[Hence]
    $
      w(I_i) & =lambda_i zeta^(1-d_i-m_i) y_1^(d_i-1) y_i \
             & quad +"terms involving different monomials."
    $ <eq:coxeter-eigenvalues-invariant-degrees-invariant-action>
    #block(sticky: true)[
      But $w(I_i)=I_i$ and, since $lambda_i!=0$, we obtain
    ]
    $
      zeta^(1-d_i-m_i)=1.
    $ <eq:coxeter-eigenvalues-invariant-degrees-congruence-before>
    Now $zeta^(h-m_i)$ occurs as an eigenvalue of $w$ whenever $zeta^(m_i)$
    does, since $w$ is a real transformation. We now renumber the basis vectors
    $f_1,dots,f_l$ so that the eigenvalue $zeta^(m_i)$ is replaced by
    $zeta^(h-m_i)$. With this new numbering we have
    $
      zeta^(1-d_i+m_i-h)=1
    $ <eq:coxeter-eigenvalues-invariant-degrees-renumbered>
    #block(sticky: true)[and therefore]
    $
      zeta^(d_i-1)=zeta^(m_i).
    $ <eq:coxeter-eigenvalues-invariant-degrees-congruence>
    It follows that $d_i-1 equiv m_i mod h$.

    Now the numbers $h-m_i$, $i=1,dots,l$, are a permutation of the numbers
    $m_i$, $i=1,dots,l$. (We have again used @p:coxeter-element-no-fixed-vector
    here.) Thus
    $
      sum_(i=1)^l (h-m_i)=sum_(i=1)^l m_i,
    $ <eq:coxeter-eigenvalues-invariant-degrees-conjugate-sum>
    #source(181, "168")
    #block(sticky: true)[which gives]
    $
      sum_(i=1)^l m_i=1/2 l h.
    $ <eq:coxeter-eigenvalues-invariant-degrees-half-sum>
    #block(sticky: true)[
      But $1/2 l h=N$ by @th:coxeter-number-root-count, and so
    ]
    $
      sum_(i=1)^l m_i=N.
    $ <eq:coxeter-eigenvalues-invariant-degrees-exponent-sum>
    #block(sticky: true)[Also we have]
    $
      sum_(i=1)^l (d_i-1)=N
    $ <eq:coxeter-eigenvalues-invariant-degrees-degree-sum>
    by @th:degree-product-and-sum. Since $d_i-1 equiv m_i mod h$ and $0<m_i<h$,
    these equations imply that $d_i-1=m_i$ for $i=1,dots,l$.
  ]

  Coleman’s theorem shows that one can determine the degrees of the basic
  invariants of $W$ merely by looking at the operation of a Coxeter element on
  $frak(V)$. This is one of several indications that the class of Coxeter
  elements is of particular significance in the Weyl group. It appears to be the
  conjugacy class which is ‘as far removed as possible’ from the unit class.

  // Compact the closing displays while retaining the normal paragraph
  // spacing.
  #show math.equation.where(block: true): set block(
    above: 0.7em,
    below: 0.7em,
  )

  #corollary()[
    #block(sticky: true)[
      Let $k_i$ be the number of positive roots of height $i$ and let
      $(m_1,m_2,dots,m_l)$ be the partition of $N$ dual to the partition
      $(k_1,k_2,dots)$. #ix("eigenvalues of Coxeter element")Then the
      eigenvalues of a Coxeter element are
    ]
    $
      zeta^(m_1),zeta^(m_2),dots,zeta^(m_l),
    $ <eq:coxeter-eigenvalues-root-heights-spectrum>
    where $zeta=upright(e)^(2pi i slash h)$.
  ] <cor:coxeter-eigenvalues-root-heights>

  #proof[
    This follows from @cor:degrees-and-exponents and
    @th:coxeter-eigenvalues-invariant-degrees.
  ]

  #block(sticky: true)[The duality]
  $ m_1+m_l=m_2+m_(l-1)=dots $ <eq:coleman-theorem-duality>
  now follows immediately from the fact that $w$ is a real transformation. Since
  the common value of these sums is $1+h(R)$, where $R$ is the highest root, we
  also obtain the following result.

  #corollary()[
    #block(sticky: true)[
      The following three integers are #ix("order, of Coxeter elements")equal:
    ]
    #enum(
      numbering: "(i)",
      [The order $h$ of the Coxeter elements,],
      [$2N slash l$,],
      [$1+h(R)$, where $R$ is the highest root.],
    )
  ] <cor:coxeter-number-highest-root>

  #source(182, "169")
  _Note._ The equivalence of (i) and (iii) can be shown directly by an argument
  of Steinberg #bib-ref("steinberg1959reflection").

  The integers $m_1,dots,m_l$ #ix("exponents of Weyl group")are called the
  exponents of the Weyl group. We have now obtained three equivalent definitions
  for these exponents. They can also be defined in terms of the topology of the
  corresponding Lie group, i.#ix("Betti numbers")e. in terms of the Betti
  numbers of the compact Lie group with Weyl group $W$. The Betti numbers #ix(
    "Poincaré polynomial",
  )are the coefficients of the Poincaré polynomial of this Lie group, which
  factorizes as
  $ product_(i=1)^l (1+t^(2m_i+1)) $ <eq:coleman-theorem-poincare-polynomial>
  (cf. Bott #bib-ref("bott1956")).

  G. Lusztig has pointed out that Macdonald’s identity @th:macdonald-identity
  can be #ix("Lefschetz fixed point formula")derived analytically by using a
  Lefschetz fixed point formula due to Atiyah and Bott.
]
