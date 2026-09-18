#let chapter = [
  #[
    #import "main-defs.typ": book-ref, qed, source

    #let rbar = $overline(r)$

    #source(229, "216")
    = The Twisted Simple Groups <ch:twisted-simple-groups>

    We have shown that the Chevalley groups of type $A_l,B_l,C_l,D_l$ can be
    identified with certain classical groups. However only some of the classical
    groups can be interpreted as Chevalley groups. Even over a finite field
    there are classical groups which are not Chevalley groups, for example the
    unitary groups (cf. section #book-ref("sec", "unitary-groups")) and the
    second class of orthogonal groups in even dimension (cf. section #book-ref(
      "sec",
      "orthogonal-groups",
    )). We shall describe in this chapter how to construct certain additional
    simple groups, the so-called ‘twisted types’; some of which can be
    identified with classical groups. Every classical group over a finite field
    can be interpreted as a Chevalley group or as a twisted group. In general,
    the classical groups which are Chevalley groups or twisted groups are the
    linear and symplectic groups, and the orthogonal and unitary groups
    corresponding to forms whose Witt index is sufficiently large. The remaining
    classical groups can be interpreted as ‘non-split’ groups of Lie type, but
    the discussion of such groups is beyond the scope of the present volume. In
    addition to the extra classical groups, we obtain as twisted groups several
    new families of exceptional groups.

    The twisted simple groups were discovered independently by Steinberg, Tits
    and Hertzig. The development we shall give follows Steinberg’s approach.

    == The Reflection Subgroup $W^1$ <sec:twisted-reflection-subgroup>

    The twisted groups will be obtained as certain subgroups of the Chevalley
    groups $G=frak(L)(K)$. The twisted groups only exist in the cases when the
    Dynkin diagram of $frak(L)$ has a non-trivial symmetry. It will be shown
    that the twisted groups are also groups with a $(B,N)$-pair and that the
    Weyl group $W^1$ of this $(B,N)$-pair is a reflection group which is a
    subgroup of the Weyl group $W$ of $G$.

    Before discussing the twisted groups themselves, we shall therefore first
    consider the Weyl group $W$ in order to describe how the reflection subgroup
    $W^1$ arises. $W$ operates as usual as a Euclidean reflection group on an
    $l$-dimensional space $frak(V)$.

    #source(230, "217")
    Let $rho$ be a non-trivial symmetry of the Dynkin diagram of $frak(L)$. Then
    there is a unique isometry $tau$ of $frak(V)$ such that $tau(r)$ is a
    positive multiple of $rho(r)=rbar$ for all fundamental roots $r in Pi$.
    $tau$ satisfies the conditions:
    $ tau(r)=rbar quad "if all the roots of" frak(L) "have the same length." $
    <eq:13-1-simply-laced-isometry>
    $
      tau(r)=cases(
        frac(1, sqrt(2))rbar & "if" r "is short,",
        sqrt(2)rbar & "if" r "is long,"
      ) quad "for" frak(L)=B_2 "or" F_4.
    $ <eq:13-1-double-bond-isometry>
    $
      tau(r)=cases(
        frac(1, sqrt(3))rbar & "if" r "is short,",
        sqrt(3)rbar & "if" r "is long,"
      ) quad "for" frak(L)=G_2.
    $ <eq:13-1-triple-bond-isometry>
    It is clear that the order of $tau$ as an isometry of $frak(V)$ is equal to
    the order of $rho$ as a permutation of $Pi$.

    #metadata((kind: "anchor")) <def:13-1-fixed-space>
    _Definition._ We denote by $frak(V)^1$ the set of $v in frak(V)$ such that
    $tau(v)=v$.

    For each $v in frak(V)$ we denote by $v^1$ the projection of $v$ on to the
    subspace $frak(V)^1$. Then $v^1$ is the average of the vectors in the orbit
    of $v$ under $tau$. For this average is certainly in $frak(V)^1$, but since
    $ (v,x)=(tau(v),x)=(tau^2(v),x)=dots $ <eq:13-1-orbit-average>
    for $x in frak(V)^1$, the average has the same scalar product with $x$ as
    $v$ does.

    We now consider the relation between $tau$ and $W$. Since $tau(r)$ is a
    positive multiple of $rbar$ for all $r in Pi$ we have
    $ tau w_r tau^(-1)=w_rbar, quad r in Pi. $ <eq:13-1-conjugate-reflection>
    Since the fundamental reflections generate $W$, this shows that $tau$
    normalizes $W$ in the group of all isometries of $frak(V)$.

    #metadata((kind: "anchor")) <def:13-1-fixed-weyl-group>
    _Definition._ We denote by $W^1$ the set of $w in W$ such that
    $tau w tau^(-1)=w$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:13-1-1>
      #smallcaps[Lemma 13.1.1.] _$W^1$ operates faithfully on $frak(V)^1$._
    ]

    #smallcaps[Proof.] Let $w in W^1$ and $v in frak(V)^1$. Then
    $ tau dot w(v)=w tau(v)=w(v). $ <eq:13-1-invariant-space>
    Thus $w(v) in frak(V)^1$, and so $W^1$ transforms $frak(V)^1$ into itself.

    #source(231, "218")
    Now suppose $w in W^1$ and $w!=1$. Then there exists a root $r in Phi^+$
    such that $w(r) in Phi^-$. However, the transforms of $r$ by the powers of
    $tau$ are also positive, thus $r^1>0$. Similarly $w(r^1)=w(r)^1<0$. Thus $w$
    transforms some positive element of $frak(V)^1$ into a negative element, so
    cannot be the identity. #qed

    We now show that $W^1$ is generated by elements of order $2$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-1-2>
      #smallcaps[Proposition 13.1.2.] _Let $J$ be an orbit of $Pi$ under $rho$.
      Let $W_J$ be the subgroup of $W$ generated by the elements $w_r$ for
      $r in J$. Let $w_0^J$ be the element of $W_J$ which transforms every
      positive root in $Phi_J$ into a negative root. Then $w_0^J in W^1$, and
      $W^1$ is generated by the elements $w_0^J$ for the different $rho$-orbits
      of $Pi$._
    ]

    #smallcaps[Proof.] Since $tau w_r tau^(-1)=w_rbar in W_J$ for all $r in J$,
    we have $tau w tau^(-1) in W_J$ for all $w in W_J$. Thus
    $tau w_0^J tau^(-1) in W_J$. However, $tau$ preserves the sign of each root;
    thus
    $ tau w_0^J tau^(-1)(Phi_J^+)=Phi_J^-. $ <eq:13-1-longest-element>
    Hence $tau w_0^J tau^(-1)=w_0^J$, and it follows that $w_0^J in W^1$.

    Now let $w in W^1$ with $w!=1$. Then there exists a root $r in Pi$ such that
    $w(r) in Phi^-$. Let $J$ be the $rho$-orbit of $Pi$ containing $r$. Then
    $w(s) in Phi^-$ for all $s in J$ since $tau$ preserves the sign of each
    root. However $w_0^J$ changes the signs of all roots in $Phi_J$ but of none
    in $Phi-Phi_J$. Hence
    $ l(w w_0^J)=l(w)-l(w_0^J). $ <eq:13-1-length-reduction>

    We show that $W^1$ is generated by the elements $w_0^J$ by induction on
    $l(w)$. If $w in W^1$, $w!=1$, choose $J$ as above. Then by induction we
    have
    $ w w_0^J=w_0^(J_1)w_0^(J_2)dots w_0^(J_k) $ <eq:13-1-inductive-word>
    for certain orbits $J_i$ of $Pi$. Thus
    $ w=w_0^(J_1)w_0^(J_2)dots w_0^(J_k)w_0^J $ <eq:13-1-generator-word>
    as required. #qed

    We show next that the elements $w_0^J$ are reflections when restricted to
    $frak(V)^1$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:13-1-3>
      #smallcaps[Lemma 13.1.3.] _$w_0^J$ coincides with $w_(r^1)$ on $frak(V)^1$
      for each root $r in J$._
    ]

    #source(232, "219")
    #smallcaps[Proof.] Let $r,s in J$. Since $r,s$ are in the same $rho$-orbit
    of $Pi$, $r^1$ is a positive multiple of $s^1$. It follows that the
    projections $r^1$ for $r in Phi_J^+$ are all positive multiples of one
    another. Now
    $ w_0^J (r^1)=w_0^J (r)^1 $ <eq:13-1-projected-longest>
    and $w_0^J (r) in Phi_J^-$ for all $r in Phi_J^+$. Thus $w_0^J (r^1)$ is a
    negative multiple of $r^1$ and, being an isometry, $w_0^J$ must transform
    $r^1$ into $-r^1$. Now let $v in frak(V)^1$ satisfy $(r^1,v)=0$. Then
    $(s^1,v)=0$ for all $s in J$ and so $(s,v)=0$ also. Hence $w_0^J (v)=v$.
    Thus $w_0^J$ coincides with the reflection $w_(r^1)$ on $frak(V)^1$. #qed

    #block(sticky: true)[
      #metadata((kind: "anchor")) <cor:13-1-4>
      #smallcaps[Corollary 13.1.4.] _The reflections $w_(r^1)$ of $frak(V)^1$,
      for all $r in Pi$, generate the group $W^1$ of isometries of $frak(V)^1$._
    ]
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source

    // Source232 continues below13.1; its page anchor is in twisted-
    // reflections.typ.
    == The System $Phi^1$ in $frak(V)^1$ <sec:twisted-root-system>

    We have seen that $W^1$ may be regarded as a reflection group operating on
    $frak(V)^1$. We denote by $Phi^1$ the set of vectors $r^1 in frak(V)^1$ for
    all $r in Phi$; and by $Pi^1$ the set of vectors $r^1 in frak(V)^1$ for all
    $r in Pi$. We shall show that $Phi^1$ behaves rather like a root system for
    $W^1$ and that $Pi^1$ behaves like a fundamental system of $Phi^1$. However,
    both in $Phi^1$ and $Pi^1$ there can be positive multiples of a vector
    distinct from the vector itself. In order to control this situation we
    introduce an equivalence relation on $Phi$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:13-2-1>
      #smallcaps[Lemma 13.2.1.] _The sets $w(Phi_J^+)$ form a partition of $Phi$
      as $w$ runs through the elements of $W^1$ and $J$ runs through the
      $rho$-orbits of $Pi$. $r$ and $s$ are in the same set if and only if $r^1$
      is a positive multiple of $s^1$._
    ]

    #smallcaps[Proof.] We show first that each root is in some set $w(Phi_J^+)$.
    Let $w_0$ be the element of $W$ which transforms every positive root into a
    negative root. Since $tau$ preserves this sign of each root,
    $tau w_0 tau^(-1)$ transforms every positive root into a negative root. Thus
    $tau w_0 tau^(-1)=w_0$ and $w_0 in W^1$.

    Let $r in Phi^+$. Then $w_0 (r) in Phi^-$ and by #book-ref(
      "p",
      "13-1-2",
      [13.1.2],
    ) we have $w_0=w_0^(J_1)dots w_0^(J_k)$ for certain $rho$-orbits $J_i$ of
    $Pi$. Thus there exists an integer $i$ such that
    $
               w_0^(J_(i+1))dots w_0^(J_k)(r) & in Phi^+, \
      w_0^(J_i)w_0^(J_(i+1))dots w_0^(J_k)(r) & in Phi^-.
    $ <eq:13-2-sign-change>

    #source(233, "220")
    However the only positive roots transformed by $w_0^(J_i)$ into negative
    roots are those in $Phi_(J_i)^+$, and therefore
    $w_0^(J_(i+1))dots w_0^(J_k)(r) in Phi_(J_i)^+$. Thus
    $
       r & in w_0^(J_k)dots w_0^(J_(i+1))(Phi_(J_i)^+), \
      -r & in w_0^(J_k)dots w_0^(J_(i+1))w_0^(J_i)(Phi_(J_i)^+).
    $ <eq:13-2-covering-sets>
    Hence every root is in one of the given sets.

    Now if $r,s$ are two roots in $Phi_J^+$, we have seen that $r^1$ is a
    positive multiple of $s^1$. Transforming by $w in W^1$ we see that
    $w(r^1)=w(r)^1$ is a positive multiple of $w(s^1)=w(s)^1$.

    Suppose conversely that $r,s in Phi$ and that $r^1$ is a positive multiple
    of $s^1$. Now we have shown that $r in w(Phi_J^+)$ for a suitable element
    $w in W^1$ and a suitable subset $J$ of $Pi$. Then $w^(-1)(r) in Phi_J^+$
    and so $w^(-1)(r)^1$ is a positive element which is a linear combination of
    roots in $J$. However
    $ w^(-1)(r)^1=w^(-1)(r^1)=w^(-1)(lambda s^1)=lambda w^(-1)(s)^1 $
    <eq:13-2-proportional-projections>
    for some $lambda>0$, and so $w^(-1)(s)^1$ is a positive vector which is a
    linear combination of roots in $J$. The same must be true of $w^(-1)(s)$ as
    $J$ is a $rho$-orbit. Hence $w^(-1)(s) in Phi_J^+$ and $s in w(Phi_J^+)$.
    Thus $s$ is contained in each of the given sets in which $r$ is contained.
    Therefore the given sets cover $Phi$ and any two of them either coincide or
    have no elements in common. #qed

    We can now describe the extent to which $Phi^1$ and $Pi^1$ act as a root
    system and fundamental system for $W^1$ acting on $frak(V)^1$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-2-2>
      #smallcaps[Proposition 13.2.2.] _(i) $Phi^1$ spans $frak(V)^1$._
    ]

    _(ii) Every element of $Phi^1$ is a linear combination of elements of $Pi^1$
    with coefficients all non-negative or all non-positive._

    _(iii) A basis of $frak(V)^1$ may be obtained by picking one element of
    $Pi^1$ out of each set of positive multiples._

    _(iv) If $r^1 in Phi^1$ then there is an element of $W^1$ which coincides
    with $w_(r^1)$ on $frak(V)^1$._

    _(v) If $r^1,s^1 in Phi^1$ then $w_(r^1)(s^1) in Phi^1$._

    #smallcaps[Proof.] Since $Phi$ spans $frak(V)$ it follows immediately that
    $Phi^1$ spans $frak(V)^1$. Since each element of $Phi$ is a linear
    combination of elements of $Pi$ with coefficients all non-negative or all
    non-positive, the same is true for $Phi^1$ and $Pi^1$. Let $J_1,dots,J_k$ be
    the $rho$-orbits of $Pi$. If we pick out one element of $Pi^1$ from each set
    of positive multiples we obtain a set $r_1^1,r_2^1,dots,r_k^1$, where
    $r_i in Phi_(J_i)^+$ by #book-ref("l", "13-2-1", [13.2.1]). These elements
    are linearly independent, so form a basis for $frak(V)^1$.

    #source(234, "221")
    Let $r^1 in Phi^1$. We show there is an element of $W^1$ which coincides
    with $w_(r^1)$ on $frak(V)^1$. Now $r$ is contained in one of the sets
    $w(Phi_J^+)$ of #book-ref("l", "13-2-1", [13.2.1]). We may assume that
    $r=w(s)$, where $s in J$, $w in W^1$, since $r^1$ will be changed only by a
    positive multiple by taking $s in J$, and $w_(r^1)$ will be unchanged. Then
    $ r^1=w(s)^1=w(s^1). $ <eq:13-2-projected-conjugate>
    Now $w_(s^1)$ coincides with an element of $W^1$ on $frak(V)^1$ by
    #book-ref(
      "l",
      "13-1-3",
      [13.1.3],
    ). Hence
    $ w_(r^1)=w w_(s^1)w^(-1) $ <eq:13-2-reflection-conjugate>
    coincides with an element of $W^1$ on $frak(V)^1$ also.

    Finally, let $r^1,s^1 in Phi^1$. There is an element $w in W^1$ such that
    $w_(r^1)$ coincides with $w$ on $frak(V)^1$. Hence we have
    $ w_(r^1)(s^1)=w(s^1)=w(s)^1 in Phi^1 $ <eq:13-2-reflection-closure>
    and the proof is complete. #qed
  ]

  #[
    #import "main-defs.typ": book-ref, source
    #import "diagrams/folded-weyl.typ": folding-table, numbered-symmetry

    // Source234 continues below13.2; its anchor is in projected-roots.typ.
    == The Structure of $W^1$ <sec:twisted-weyl-group-structure>

    We now describe the structure of $W^1$ in the individual cases which arise.
    Let $r_1,dots,r_k$ be a set of roots, one from each $rho$-orbit of $Pi$.
    Then $r_1^1,dots,r_k^1$ are linearly independent vectors in $frak(V)^1$ and
    $W^1$, considered as a group of isometries of $frak(V)^1$, is generated by
    $w_(r_1^1),dots,w_(r_k^1)$. By considering the angles between the vectors
    $r_1^1,dots,r_k^1$ it is usually possible to identify $W^1$ with one of the
    Weyl groups of rank $k$.

    === Type $A_l$ <sec:twisted-weyl-type-a>

    Let the fundamental roots be $p_1,dots,p_l$, numbered as in the #book-ref(
      "fig",
      "13-3-a",
      [diagram],
      highlight: false,
    ).

    #figure(numbered-symmetry("A"), caption: none, outlined: false) <fig:13-3-a>

    Suppose $l$ is odd and write $l=2k-1$. Then the vectors $r_1^1,dots,r_k^1$
    are
    $
      frac(1, 2)(p_1+p_(2k-1)), quad frac(1, 2)(p_2+p_(2k-2)), quad dots, quad
      frac(1, 2)(p_(k-1)+p_(k+1)), quad p_k.
    $ <eq:13-3-a-odd>
    These form a fundamental system of type $C_k$. Thus $W^1$ is isomorphic to
    $W(C_k)$.

    #source(235, "222")
    Suppose $l$ is even and write $l=2k$. Then the vectors $r_1^1,dots,r_k^1$
    are
    $
      frac(1, 2)(p_1+p_(2k)), quad frac(1, 2)(p_2+p_(2k-1)), quad dots, quad
      frac(1, 2)(p_k+p_(k+1)),
    $ <eq:13-3-a-even>
    which form a fundamental system of type $B_k$. Thus $W^1$ is isomorphic to
    $W(B_k)$.

    === Type $D_l$ <sec:twisted-weyl-type-d>

    The symmetry in this case is as shown in the #book-ref(
      "fig",
      "13-3-d",
      [diagram],
      highlight: false,
    ).

    #figure(numbered-symmetry("D"), caption: none, outlined: false) <fig:13-3-d>

    #block(sticky: true)[The vectors $r_1^1,dots,r_k^1$ are:]
    $ p_1,p_2,p_3,dots,p_(l-2),quad frac(1, 2)(p_(l-1)+p_l). $ <eq:13-3-d>
    These form a fundamental system of type $B_(l-1)$. Thus $W^1$ is isomorphic
    to $W(B_(l-1))$.

    === Type $E_6$ <sec:twisted-weyl-type-e6>

    The symmetry is as shown in the #book-ref(
      "fig",
      "13-3-e6",
      [diagram],
      highlight: false,
    ).

    #figure(
      numbered-symmetry("E6"),
      caption: none,
      outlined: false,
    ) <fig:13-3-e6>

    #block(sticky: true)[The vectors $r_1^1,dots,r_k^1$ are:]
    $ frac(1, 2)(p_1+p_6),quad frac(1, 2)(p_2+p_5),quad p_3,p_4. $ <eq:13-3-e6>
    These form a fundamental system of type $F_4$, thus $W^1$ is isomorphic to
    $W(F_4)$.

    === Type $D_4$ <sec:twisted-weyl-type-d4>

    This time the symmetry has order $3$.

    #figure(
      numbered-symmetry("D4"),
      caption: none,
      outlined: false,
    ) <fig:13-3-d4>

    #source(236, "223")
    #block(sticky: true)[The vectors $r_1^1,dots,r_k^1$ are:]
    $ p_1,quad frac(1, 3)(p_2+p_3+p_4). $ <eq:13-3-d4>
    These form a fundamental system of type $G_2$. Thus $W^1$ is isomorphic to
    $W(G_2)$.

    === Type $B_2$ <sec:twisted-weyl-type-b2>

    In this case $k=1$ and so $W^1$ is isomorphic to $W(A_1)$, a cyclic group of
    order $2$.

    === Type $G_2$ <sec:twisted-weyl-type-g2>

    $k=1$ in this case also, and so $W^1$ is isomorphic to $W(A_1)$.

    === Type $F_4$ <sec:twisted-weyl-type-f4>

    The situation here is a little more complicated. Suppose $p_1,p_2$ are the
    long fundamental roots and $p_3,p_4$ the short ones, as shown in the
    #book-ref(
      "fig",
      "13-3-f4",
      [diagram],
      highlight: false,
    ).

    #figure(
      numbered-symmetry("F4"),
      caption: none,
      outlined: false,
    ) <fig:13-3-f4>

    #block(sticky: true)[Then the vectors $r_1^1,dots,r_k^1$ may be taken as:]
    $ frac(1, 2)(p_1+sqrt(2)p_4),quad frac(1, 2)(p_2+sqrt(2)p_3). $ <eq:13-3-f4>
    The angle between these two vectors is given by
    $
      cos theta=frac(
        (p_1+sqrt(2)p_4,p_2+sqrt(2)p_3),
        abs(p_1+sqrt(2)p_4) dot abs(p_2+sqrt(2)p_3)
      ).
    $ <eq:13-3-f4-angle-definition>
    #block(sticky: true)[Now it is readily verified that]
    $
      (p_1+sqrt(2)p_4,p_2+sqrt(2)p_3) & =-abs(p_1)^2, \
                  abs(p_1+sqrt(2)p_4) & =sqrt(2)abs(p_1), \
                  abs(p_2+sqrt(2)p_3) & =2abs(p_1)sin(pi slash 8).
    $ <eq:13-3-f4-inner-products>
    #block(sticky: true)[Hence]
    $ cos theta=frac(-1, 2sqrt(2)sin(pi slash 8)). $ <eq:13-3-f4-cosine>
    But $2sin(pi slash 8)cos(pi slash 8)=sin(pi slash 4)=1 slash sqrt(2)$, and
    so
    $ cos theta=-cos(pi slash 8)=cos(7pi slash 8). $ <eq:13-3-f4-angle>
    Thus $theta=7pi slash 8$.

    #source(237, "224")
    It follows that in this case $W^1$ is not one of the Weyl groups of the
    simple root systems. It is generated by two reflections in a plane in axes
    inclined at $7pi slash 8$, and is therefore a dihedral group of order $16$.

    #heading(level: 3)[] <sec:folded-diagram-classification>

    The type of $W^1$ can conveniently be memorized by identifying nodes in the
    Dynkin diagram corresponding to fundamental roots in the same $rho$-orbit.
    The Dynkin diagram of $W^1$ is given in the #book-ref(
      "fig",
      "13-3-folding-table",
      [following table],
      highlight: false,
    ).

    #figure(folding-table(), caption: none, outlined: false)
    <fig:13-3-folding-table>
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let rbar = $overline(r)$

    #source(238, "225")
    == Definition of the Twisted Groups <sec:twisted-group-definition>

    Let $G$ be the Chevalley group $frak(L)(K)$ and $rho$ be a non-trivial
    symmetry of the Dynkin diagram of $frak(L)$. We suppose that $K$ is a
    perfect field of characteristic $2$ if $frak(L)=B_2$ or $F_4$ and that $K$
    is perfect of characteristic $3$ if $frak(L)=G_2$. Thus there is a graph
    automorphism $g$ of $G$ such that
    $ g(X_r)=X_rbar $ <eq:13-4-graph-action>
    for all $r in Pi$, where $rbar=rho(r)$ (see #book-ref(
      "p",
      "12-2-3",
      [12.2.3],
    ), #book-ref("p", "12-3-3", [12.3.3]) and #book-ref(
      "p",
      "12-4-1",
      [12.4.1],
    )). Now $g$ commutes with each field automorphism $f$ of $G$. For if all the
    roots have the same length we have
    $
      g f(x_r (t)) & =g dot x_r (f(t))=x_rbar (f(t))
                     =f dot x_rbar (t)=f g(x_r (t))
    $ <eq:13-4-commuting-simply-laced>
    for $r in Pi$; whereas if $frak(L)=B_2,G_2$ or $F_4$ we have
    $
      g f(x_r (t)) & =g dot x_r (f(t))=x_rbar (f(t)^(lambda(rbar))) \
                   & =x_rbar (f(t^(lambda(rbar)))) \
                   & =f dot x_rbar (t^(lambda(rbar)))=f g dot (x_r (t))
    $ <eq:13-4-commuting-exceptional>
    for $r in Pi$.

    Let $n$ be the order of the symmetry $rho$. Then $n$ is either $2$ or $3$.
    If all the roots of $frak(L)$ have the same length then
    $ g^n dot x_r (t)=x_r (t), quad r in Pi, $ <eq:13-4-graph-order>
    and so $g^n=1$. Otherwise $frak(L)=B_2,G_2$ or $F_4$ and $n=2$. In this case
    $
      g^2 dot x_r (t) & =g dot x_rbar (t^(lambda(rbar))) \
                      & =x_r (t^(lambda(r)lambda(rbar)))=x_r (t^p),
    $ <eq:13-4-graph-square>
    where $p$ is the characteristic of $K$. Thus $g^2$ is the field automorphism
    which raises every coefficient to the $p$th power.

    Let $sigma$ be the automorphism of $G$ defined by $sigma=g f$, and suppose
    that a non-trivial field automorphism $f$ is chosen so that $sigma^n=1$—then
    $sigma$ will have the same order as $rho$. Since $sigma^n=g^n f^n$ the
    condition to be satisfied by $f$ may be stated as follows:

    $f^n=1$ if all the roots of $frak(L)$ have the same length;

    $p f^2=1$ if $frak(L)=B_2,G_2$ or $F_4$, where $p$ is interpreted as the
    $p$th-power map on $K$.

    #metadata((kind: "anchor")) <p:13-4-1>
    #smallcaps[Proposition 13.4.1.] _Let $G=frak(L)(K)$ be a Chevalley group
    whose Dynkin diagram has a non-trivial symmetry $rho$. Assume that $K$ is
    perfect of characteristic $2$ if $frak(L)=B_2$ or $F_4$, and that $K$ is
    perfect of characteristic $3$ if $frak(L)=G_2$. Let $g$ be the graph
    automorphism corresponding to $rho$ and $f$ be a non-trivial
    #source(239, "226")
    field automorphism chosen so that $sigma=g f$ satisfies $sigma^n=1$, where
    $n$ is the order of $rho$. Then we have_
    $
      sigma(U)=U, quad sigma(V)=V, quad sigma(H)=H, quad sigma(N)=N
    $ <eq:13-4-invariant-subgroups>
    _and $sigma$ operates on $N slash H tilde.eq W$ according to the formula
    $sigma(w_r)=w_rbar$ for all $r in Pi$._

    #smallcaps[Proof.] It is clear from the definition of $sigma$ that
    $sigma(U)=U$ and $sigma(V)=V$. Thus $sigma(U H)=U H$ and $sigma(V H)=V H$
    since $U H$ is the normalizer of $U$ and $V H$ is the normalizer of $V$.
    Also $sigma(H)=H$ since $H=U H inter V H$. Now $N$ is the subgroup of $G$
    generated by $H$ and the elements $n_r$ for $r in Pi$. Also
    $
      sigma(n_r) & =sigma(x_r (1)x_(-r)(-1)x_r (1)) \
                 & =x_rbar (1)x_(-rbar)(-1)x_rbar (1)=n_rbar
    $ <eq:13-4-weyl-representatives>
    for $r in Pi$. Hence $sigma(N)=N$. It follows that $sigma$ induces an
    automorphism of $N slash H tilde.eq W$ such that $sigma(w_r)=w_rbar$ for all
    $r in Pi$. #qed

    The twisted groups are defined as certain subgroups of the Chevalley groups
    which are fixed elementwise by automorphisms $sigma$ of the type considered
    in #book-ref("p", "13-4-1", [13.4.1]). Let $G$ be a Chevalley group
    admitting an automorphism $sigma$ as in #book-ref("p", "13-4-1", [13.4.1]).
    Then $sigma$ fixes $U,V,H$ and $N$. We define subgroups
    $U^1,V^1,G^1,H^1,N^1$ as follows:

    #block(sticky: true)[
      #metadata((kind: "anchor")) <def:13-4-2>
      _Definition 13.4.2._ (i) $U^1$ is the set of elements $x in U$ such that
      $sigma(x)=x$.
    ]

    (ii) $V^1$ is the set of elements $x in V$ such that $sigma(x)=x$.

    (iii) $G^1$ is the subgroup of $G$ generated by $U^1$ and $V^1$.

    (iv) $H^1$ is the intersection of $G^1$ and $H$.

    (v) $N^1$ is the intersection of $G^1$ and $N$.

    We shall show that $G^1$ is (apart from a few exceptional cases) a simple
    group and that the subgroups $U^1,V^1,H^1,N^1$ play analogous rôles in $G^1$
    to the subgroups $U,V,H,N$ of $G$. Although every element of $G^1$ is fixed
    by $sigma$, $G^1$ is not necessarily the subgroup of all $sigma$-invariant
    elements of $G$.

    Now the operation of $sigma$ on $W$ is the same as the operation of
    transformation by the isometry $tau$ determined by the symmetry $rho$. Thus
    the subgroup $W^1$ consisting of all elements $w in W$ such that
    $sigma(w)=w$ is just the subgroup considered in section #book-ref(
      "sec",
      "twisted-reflection-subgroup",
    ). We shall show that $W^1$ plays the rôle of the Weyl group of $G^1$.
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let rbar = $overline(r)$
    #let rbarbar = $overline(overline(r))$

    #source(240, "227")
    == Existence of a $(B,N)$-pair in the Twisted Groups <sec:twisted-bn-pair>

    It was shown in #book-ref("l", "13-2-1", [13.2.1]) that the subsets
    $w(Phi_J^+)$ form a partition of $Phi$ as $w$ runs through $W^1$ and $J$
    runs through the #box[$rho$-orbits] of $Pi$. We shall now look at the
    individual equivalence classes a little more closely. The roots in the
    equivalence class $w(Phi_J^+)$ are the positive roots in the system
    $w(Phi_J)$ with respect to the fundamental system $w(J)$. The type of this
    root system is the same as the type of the fundamental system $J$. The
    various possibilities for the type of $J$ may easily be obtained by
    inspection of the Dynkin diagrams, and are as follows.

    If $frak(L)=A_(2k-1),D_l$ or $E_6$, each $rho$-orbit $J$ of $Pi$ has type
    $A_1$ or $A_1 times A_1$. If $frak(L)=A_(2k)$, $J$ has type $A_1 times A_1$
    or $A_2$. If $frak(L)=D_4$, $J$ has type $A_1$ or
    $ A_1 times A_1 times A_1. $ <eq:13-5-triple-type>
    If $frak(L)=B_2$, $J$ has type $B_2$. If $frak(L)=G_2$, $J$ has type $G_2$.
    Finally, if $frak(L)=F_4$, $J$ has type $A_1 times A_1$ or $B_2$.

    Thus every equivalence class $S$ in $Phi$ may be regarded as a positive
    system of type $A_1$, $A_1 times A_1$, $A_1 times A_1 times A_1$, $A_2$,
    $B_2$ or $G_2$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:13-5-1>
      #smallcaps[Lemma 13.5.1.] _Let $S$ be one of the equivalence classes in
      $Phi$ defined in #book-ref("l", "13-2-1", [13.2.1]). Let $X_S$ be the
      subgroup of $G$ generated by the subgroups $X_r$ for all $r in S$. Then_
    ]
    $ X_S=product_(r in S) X_r, $ <eq:13-5-1-factorization>
    _where the product is taken over the roots in $S$ in any order. Also
    $sigma(X_S)=X_S$, and the subgroup $X_S^1$ of elements of $X_S$ fixed by
    $sigma$ satisfies $X_S^1!=1$._

    #smallcaps[Proof.] We have seen that $S$ is the positive system, with
    respect to some ordering, of some root system contained in $Phi$. The
    subgroup $X_S$ therefore plays the rôle of $U$ in the Chevalley group
    corresponding to this subsystem of $Phi$. The factorization
    $ X_S=product_(r in S) X_r $ <eq:13-5-1-root-product>
    therefore follows from the results of chapter #book-ref(
      "ch",
      "unipotent-subgroups",
    ). For each $r in S$ we have
    $ sigma(X_r)=X_rbar $ <eq:13-5-1-root-action>
    for some $rbar in S$, thus it follows that $sigma(X_S)=X_S$.

    Now consider the subgroup $X_S^1$ of $sigma$-invariant elements of $X_S$. If
    $S$ is of type $A_1$ or $A_2$, there is a root $r in S$ such that $r=rbar$.
    // E055: the exceptional duality has no fixed root; use its commuting orbit.
    #source(241, "228")
    If $S$ is of type $B_2$ or $G_2$, let $r$ be its highest long root. Then
    $rbar$ is the highest short root, and the subgroups $X_r$ and $X_rbar$
    commute. We have
    $
      sigma dot x_r (1)=x_rbar (1), quad
      sigma dot x_rbar (1)=x_r (1),
    $ <eq:13-5-1-exceptional-orbit>
    and therefore
    $
      sigma dot (x_r (1)x_rbar (1))
      =x_rbar (1)x_r (1)=x_r (1)x_rbar (1).
    $ <eq:13-5-1-exceptional-fixed>
    By uniqueness of the root factorization this is a non-unit element of
    $X_S^1$. If $S$ is of type $A_1$ or $A_2$ we have instead
    $ sigma dot x_r (1)=x_rbar (gamma_r), quad gamma_r=plus.minus 1, $
    <eq:13-5-1-fixed-root-sign>
    by #book-ref("p", "12-2-3", [12.2.3]). If $gamma_r=1$, $x_r (1)$ is the
    required non-unit element of $X_S^1$. If $gamma_r=-1$, then $sigma$ has
    order $2$ (since $sigma$ cannot have order $3$) and therefore $f$ has order
    $2$ also. Now there is an element $t!=0 in K$ such that $f(t)=-t$. Thus
    $ sigma dot x_r (t)=x_r (-f(t))=x_r (t) $ <eq:13-5-1-trace-zero>
    and $x_r (t)$ is the required element.

    Now suppose $S$ is of type $A_1 times A_1$ or $A_1 times A_1 times A_1$.
    Then we have
    $ sigma dot x_r (1)=x_rbar (gamma_r), quad gamma_r=plus.minus 1, $
    <eq:13-5-1-orbit-sign>
    for any root $r in S$, by #book-ref("p", "12-2-3", [12.2.3]) and #book-ref(
      "p",
      "12-3-3",
      [12.3.3],
    ). We consider the elements
    // E056: restore gamma_r in the third parameter, as in the following proof.
    $
      x_r (1)x_rbar (gamma_r), quad
      x_r (1)x_rbar (gamma_r)x_rbarbar (gamma_r gamma_rbar)
    $ <eq:13-5-1-orbit-products>
    when $S$ has type $A_1 times A_1$, $A_1 times A_1 times A_1$ respectively.
    Now
    $
      x_r (1) & arrow.r^sigma x_rbar (gamma_r)
                arrow.r^sigma x_r (gamma_r gamma_rbar), \
      x_r (1) & arrow.r^sigma x_rbar (gamma_r)
                arrow.r^sigma x_rbarbar (gamma_r gamma_rbar)
                arrow.r^sigma x_r (gamma_r gamma_rbar gamma_rbarbar)
    $ <eq:13-5-1-sign-cycles>
    in the two above cases, and so we have $gamma_r gamma_rbar=1$ and
    $gamma_r gamma_rbar gamma_rbarbar=1$ respectively. Thus
    $
      sigma dot x_r (1)x_rbar (gamma_r) & =x_rbar (gamma_r)
                                          x_r (gamma_r gamma_rbar) \
                                        & =x_r (1)x_rbar (gamma_r),
    $ <eq:13-5-1-two-cycle-fixed>
    $
      sigma dot x_r (1)x_rbar (gamma_r)x_rbarbar (gamma_r gamma_rbar)
      & =x_rbar (gamma_r)x_rbarbar (gamma_r gamma_rbar)
      x_r (gamma_r gamma_rbar gamma_rbarbar) \
      & =x_r (1)x_rbar (gamma_r)x_rbarbar (gamma_r gamma_rbar)
    $ <eq:13-5-1-three-cycle-fixed>
    and so we have a non-unit element of $X_S$ fixed by $sigma$ in each case.
    #qed

    The elements of $X_S^1$ will be described in detail in #book-ref(
      "p",
      "13-6-3",
      [13.6.3],
    ).

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-5-2>
      #smallcaps[Proposition 13.5.2.] _(i) For each $w in W^1$ there exists
      $n_w in N^1$ such that $n_w$ corresponds to $w$ under the natural
      homomorphism from $N$ into $W$._
    ]

    _(ii) $N^1 slash H^1$ is isomorphic to $W^1$._

    #smallcaps[Proof.] (i) Since by #book-ref("p", "13-1-2", [13.1.2]) $W^1$ is
    generated by the elements $w_0^J$ for all #box[$rho$-orbits] $J$ of $Pi$, it
    is sufficient to prove the existence of elements $n_w in N^1$ with
    $w=w_0^J$. Now one of the equivalence classes of $Phi$ defined in #book-ref(
      "l",
      "13-2-1",
      [13.2.1],
    ) is $w_0^J (Phi_J^+)=Phi_J^-$. Let $S=Phi_J^-$. Then by #book-ref(
      "l",
      "13-5-1",
      [13.5.1],
    ) there is a non-unit element $x in X_S^1$. We express this element in
    canonical form #book-ref("cor", "8-4-4", [8.4.4]), and obtain
    $ x=u' n_w u, quad u' in U, quad u in U_w^-. $ <eq:13-5-2-bruhat>

    #source(242, "229")
    (We have chosen the representative $n_w$ here, as we may do, so that no
    element of $H$ appears in the expression for $x$.) Now $w!=1$, for $w=1$
    would imply that $x in U H inter V=1$. Since $sigma(x)=x$ we have
    $ u' n_w u=sigma(u')sigma(n_w)sigma(u). $ <eq:13-5-2-bruhat-image>
    Comparing the double cosets $B n B$ containing these elements we obtain
    $sigma(w)=w$, then $w in W^1$. Now $x$ is an element of the Chevalley group
    generated by the subgroups $X_r$ for all $r in Phi_J$. Thus the element $w$
    occurring in the above decomposition of $x$ must be in $W_J$. Since $w!=1$,
    $w$ transforms some root in $J$ into a negative root. But $J$ is a
    $rho$-orbit of $Pi$ and $w in W^1$. Thus $w$ transforms all roots in $J$
    into negative roots. Hence $w=w_0^J$, the only element of $W_J$ transforming
    all roots in $J$ into negative roots.

    We can now show that $n_w$ is the representative we require. We have
    $
      sigma(U_w^-)=sigma(U inter n_w^(-1)V n_w)
      =U inter n_w^(-1)V n_w=U_w^-,
    $ <eq:13-5-2-invariant-unipotent>
    since $w in W^1$. Thus in the decompositions
    $ x=u' n_w u=sigma(u')sigma(n_w)sigma(u) $ <eq:13-5-2-uniqueness>
    we have $u',sigma(u') in U$ and $u,sigma(u) in U_w^-$. By the uniqueness of
    such a decomposition we have $sigma(u')=u'$ and $sigma(u)=u$. Hence
    $
      n_w=(u')^(-1)x u^(-1) in G^1 inter N=N^1
    $ <eq:13-5-2-fixed-representative>
    by #book-ref("def", "13-4-2", [13.4.2]), and so $n_w$ is the required
    element.

    (ii) Consider the natural homomorphism from $N$ to $W$. Each element of
    $N^1$ is fixed by $sigma$, so is transformed into an element of $W$ fixed by
    $sigma$, i.e. an element of $W^1$. However for each $w in W^1$ there is an
    element $n_w in N^1$ which maps onto $w$, as shown in (i). Thus the image of
    $N^1$ under the above homomorphism is $W^1$. There is therefore a
    homomorphism from $N^1$ onto $W^1$ with kernel $N^1 inter H=H^1$. Hence
    $H^1$ is normal in $N^1$ and $N^1 slash H^1$ is isomorphic to $W^1$. #qed

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-5-3>
      #smallcaps[Proposition 13.5.3.] _Each element of $G^1$ has a unique
      expression $g=u' h n_w u$, where $u' in U^1$, $h in H^1$, $w in W^1$,
      $n_w in N^1$ and $u in (U_w^-)^1$, the set of $sigma$-invariant elements
      of $U_w^-$._
    ]

    #smallcaps[Proof.] By #book-ref("cor", "8-4-4", [8.4.4]) we may write
    $ g=u' h n_w u, $ <eq:13-5-3-bruhat>
    where $u' in U$, $h in H$, $w in W$, $u in U_w^-$. Since $sigma(g)=g$ we
    have
    $ u' h n_w u=sigma(u')sigma(h)sigma(n_w)sigma(u). $ <eq:13-5-3-bruhat-image>
    #source(243, "230")
    Comparing the double cosets containing both elements we have $sigma(w)=w$,
    thus $w in W^1$. Hence $n_w$ may be chosen to lie in $N^1$. Also
    $sigma(u') in U$, $sigma(h) in H$, $sigma(u) in U_w^-$. By uniqueness of the
    canonical form we have
    $
      sigma(u')=u', quad sigma(h)=h, quad sigma(u)=u.
    $ <eq:13-5-3-fixed-factors>
    Thus $u' in U^1$ and $u in (U_w^-)^1$. Finally
    $ h=(u')^(-1)g u^(-1)n_w^(-1) in G^1 inter H=H^1 $ <eq:13-5-3-fixed-torus>
    by #book-ref("def", "13-4-2", [13.4.2]). Thus $g$ has an expression of the
    required form, and the uniqueness is clear. #qed

    We shall now establish the existence of a $(B,N)$-pair in the group $G^1$.
    We define $B^1=G^1 inter B$. Then it follows from #book-ref(
      "p",
      "13-5-3",
      [13.5.3],
    ) that $B^1=U^1 H^1$ and that $H^1$ is in the normalizer of $U^1$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:13-5-4>
      #smallcaps[Theorem 13.5.4.] _The subgroups $B^1,N^1$ form a $(B,N)$-pair
      in $G^1$._
    ]

    #smallcaps[Proof.] We verify the axioms $B N 1$–$B N 5$ given in section
    #book-ref("sec", "bn-pairs"). By #book-ref("p", "13-5-3", [13.5.3]) we have
    $G^1=B^1 N^1 B^1$, thus $B^1$ and $N^1$ generate $G^1$. Also
    $
      B^1 inter N^1=G^1 inter B inter N=G^1 inter H=H^1.
    $ <eq:13-5-4-intersection>
    Thus $B^1 inter N^1$ is normal in $N^1$, and the factor group
    $N^1 slash (B^1 inter N^1)$ is isomorphic to $W^1$, so is generated by a set
    of elements $w_0^J$ of order $2$. The elements $w_0^J in W^1$ play the rôle
    of the fundamental reflections, as $J$ runs over the #box[$rho$-orbits] of
    $Pi$. We show next that $n(w_0^J)B^1 n(w_0^J)^(-1)!=B^1$. Let $S$ be the
    equivalence class $Phi_J^+$ of $Phi$. Then by #book-ref(
      "l",
      "13-5-1",
      [13.5.1],
    ) there exists $x in X_S^1$ with $x!=1$. Now
    $
      n(w_0^J)x n(w_0^J)^(-1)
      in n(w_0^J)X_S^1 n(w_0^J)^(-1)=X_(-S)^1.
    $ <eq:13-5-4-conjugated-root-group>
    Thus $n(w_0^J)x n(w_0^J)^(-1)$ is a non-unit element of $V^1$, so cannot be
    in $B^1$ since $B^1 inter V^1=1$.

    #block(sticky: true)[Finally we must show that]
    $
      B^1 n(w_0^J)B^1 dot B^1 n B^1
      subset.eq B^1 n(w_0^J)n B^1 union B^1 n B^1
    $ <eq:13-5-4-double-coset-aim>
    for all $n in N^1$ and all #box[$rho$-orbits] $J$ of $Pi$. The element
    $w_0^J$ can be expressed as a product of reflections corresponding to roots
    in $J$. Let
    $
      w_0^J=w_(r_1)w_(r_2) dots w_(r_k), quad r_i in J.
    $ <eq:13-5-4-reflections>
    Then by #book-ref("p", "8-2-1", [8.2.1]) we have
    $
      B n(w_(r_i))B dot B n B
      subset.eq B n(w_(r_i))n B union B n B
    $ <eq:13-5-4-original-bn>
    #source(244, "231")
    and by applying this repeatedly we see that $B^1 n(w_0^J)B^1 dot B^1 n B^1$
    is in a union of double cosets $B n(w)n B$, where $w$ is an element of the
    form $w_(s_1)w_(s_2) dots w_(s_h)$ and $(s_1,s_2,dots,s_h)$ is a subsequence
    of $(r_1,r_2,dots,r_k)$. Also, by #book-ref("p", "13-5-3", [13.5.3]), $G^1$
    intersects $B n_w B$ in $B^1 n_w B^1$ if $w in W^1$, and in the empty set if
    $w in.not W^1$. Thus $B^1 n(w_0^J)B^1 dot B^1 n B^1$ is in a union of double
    cosets of form $B^1 n(w)n B^1$, where $w in W^1 inter W_J$. However, the
    only elements in $W^1 inter W_J$ are $1$ and $w_0^J$. For every non-unit
    element of $W^1$ in $W_J$ transforms some root in $J$ into a negative root,
    so transforms each root in $J$ into a negative root since $J$ is a
    $rho$-orbit of $Pi$. It must therefore be $w_0^J$. Thus
    $
      B^1 n(w_0^J)B^1 dot B^1 n B^1
      subset.eq B^1 n(w_0^J)n B^1 union B^1 n B^1
    $ <eq:13-5-4-double-coset-conclusion>
    and all the axioms for a $(B,N)$-pair are satisfied. #qed

    The results on parabolic subgroups proved in section #book-ref(
      "sec",
      "parabolic-subgroups",
    ) are now valid for the twisted group $G^1$. The parabolic subgroups of
    $G^1$ are the subgroups containing $B^1$ together with the conjugates of
    these subgroups. It follows from #book-ref("th", "8-3-4", [8.3.4]) that
    there are exactly $2^k$ subgroups of $G^1$ containing $B^1$, where $k$ is
    the number of #box[$rho$-orbits] of $Pi$.
  ]

  #[
    #import "main-defs.typ": book-ref, mathclap, qed, source
    #let rbar = $overline(r)$
    #let rbarbar = $overline(overline(r))$
    #let sbar = $overline(s)$
    #let ribar = $overline(r)_i$
    #let tbar = $overline(t)$
    #let tbarbar = $overline(overline(t))$
    #let ubar = $overline(u)$
    #let vbar = $overline(v)$

    == The Subgroup $U^1$ <sec:twisted-unipotent-subgroup>

    We shall now describe in detail the elements of the subgroup $U^1$ of $G^1$,
    and of the related subgroups $V^1$, $(U_w^-)^1$ and $X_S^1$.

    #metadata((kind: "anchor")) <p:13-6-1>
    #smallcaps[Proposition 13.6.1.] _$U^1=product X_S^1$, where the product is
    taken over all equivalence classes $S$ which are in $Phi^+$. (The terms in
    the product may be taken in any order.) Each element of $U^1$ has a unique
    expression as a product of elements of $X_S^1$ taken in this order. Similar
    results hold for $V^1$ and for $(U_w^-)^1$ for each $w in W^1$. We have
    $V^1=product X_S^1$ with uniqueness, taken over all equivalence classes $S$
    which are in $Phi^-$, and $(U_w^-)^1=product X_S^1$ with uniqueness, taken
    over all equivalence classes $S$ such that $S$ is in $Phi^+$ and $w(S)$ is
    in $Phi^-$._

    #smallcaps[Proof.] The equivalence classes $S$ in $Phi^+$ form a partition
    of $Phi^+$. Thus
    $
      product_(mathclap(S subset Phi^+)) X_S
      =product_(r in Phi^+) X_r=U.
    $ <eq:13-6-1-partition-product>
    Also each element of $U$ has a unique expression of the form
    $ u=product_(mathclap(S subset Phi^+)) x_S $ <eq:13-6-1-unique-product>
    #source(245, "232")
    with $x_S in X_S$. Now $sigma(X_S)=X_S$ for each equivalence class $S$. Thus
    $sigma(u)=u$ if and only if $sigma(x_S)=x_S$ for each $S$. If $u in U^1$ we
    therefore have $x_S in X_S^1$, and so
    $ U^1=product_(mathclap(S subset Phi^+)) X_S^1, $ <eq:13-6-1-fixed-product>
    as required.

    Similar proofs can be given for $V^1$ and for $(U_w^-)^1$. #qed

    In order to give descriptions of the elements of $X_S^1$ which are as simple
    as possible, it is useful to make a choice of the Chevalley basis of
    $frak(L)$ with respect to which the constants $gamma_r=plus.minus 1$
    introduced in #book-ref(
      "p",
      "12-2-3",
      [12.2.3],
    ) can be given explicitly.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <l:13-6-2>
      #smallcaps[Lemma 13.6.2.] _Let $frak(L)$ be a simple Lie algebra all of
      whose roots have the same length, and let $r->rbar$ be the map of $Phi$
      into itself arising from a non-trivial symmetry of the Dynkin diagram of
      $frak(L)$. Then it is possible to choose a Chevalley basis of $frak(L)$ in
      such a way that the automorphism of $frak(L)$ determined by_
    ]
    $ h_r->h_rbar, quad e_r->e_rbar, quad e_(-r)->e_(-rbar) quad (r in Pi) $
    <eq:13-6-2-simple-images>
    _satisfies $e_r->gamma_r e_rbar$, where $gamma_r=1$ unless the equivalence
    class $S$ containing $r$ has type $A_2$ and $r=rbar$, in which case
    $gamma_r=-1$._

    #smallcaps[Proof.] We observe first that, given a Chevalley basis, the
    changing of sign of any set of root vectors $e_r$, $r in Phi^+$, does not
    affect the property of being a Chevalley basis, provided the signs of the
    corresponding negative root vectors $e_r$, $r in Phi^-$, are changed also.

    Suppose the given symmetry has order $2$. Then the square of the
    automorphism transforms $h_r,e_r$ into themselves for all $r in Pi$, so is
    the identity. Thus, for each $r in Phi$ we have
    $ e_r->gamma_r e_rbar->gamma_r gamma_rbar e_r=e_r $
    <eq:13-6-2-two-cycle>
    and so $gamma_r gamma_rbar=1$. Thus $gamma_r=gamma_rbar$. Suppose $r!=rbar$.
    If $e_r->-e_rbar$ and $e_rbar->-e_r$ we may change the sign of one of
    $e_r,e_rbar$ but not the other. Then $gamma_r=gamma_rbar=1$.

    Now suppose instead that $r=rbar$ and $r=s+sbar$ for some $s in Phi$. Then
    $ [e_s e_sbar]=N_(s,sbar)e_r. $ <eq:13-6-2-a2-bracket>
    Applying the automorphism we have
    $ gamma_s gamma_sbar [e_sbar e_s]=N_(s,sbar)gamma_r e_r $
    <eq:13-6-2-a2-image>
    #source(246, "233")
    and, since $gamma_s gamma_sbar=1$, this implies that $gamma_r=-1$. Note here
    that the equivalence class $S$ containing $r$ is $S={s,sbar,r}$, which has
    type $A_2$.

    Now suppose that $r in Phi^+$, $r=rbar$, but $r$ is not expressible in the
    form $r=s+sbar$. Then by inspection of the root systems (described in
    section #book-ref("sec", "description-of-simple-lie-algebras")) it can be
    seen that there is either a fundamental root $r_i=ribar in Pi$ such that
    $r-r_i in Phi$, or a pair of fundamental roots $r_i,ribar in Pi$ such that
    $r-r_i$, $r-ribar$, $r-r_i-ribar in Phi$, or $r$ is itself in $Pi$. If
    $r in Pi$ then $gamma_r=1$. In the first case we have
    $ [e_(r-r_i),e_(r_i)]=N_(r-r_i,r_i)e_r. $ <eq:13-6-2-first-induction>
    Using induction on the height we may assume $e_(r-r_i)->e_(r-r_i)$. Since
    $e_(r_i)->e_(r_i)$, we have $e_r->e_r$, and so $gamma_r=1$. In the second
    case we have
    $
      [[e_(r-r_i-ribar),e_(r_i)]e_ribar]
      =N_(r-r_i-ribar,r_i)N_(r-ribar,ribar)e_r.
    $ <eq:13-6-2-second-induction>
    By induction on the height we may assume $e_(r-r_i-ribar)->e_(r-r_i-ribar)$.
    // E057: simple root vectors are interchanged, not individually fixed.
    Since $e_(r_i)->e_ribar$ and $e_ribar->e_(r_i)$ we have $e_r->e_r$. Thus
    $gamma_r=1$ in this case also. We have shown that $gamma_r=1$ for all
    positive roots $r$ with $r=rbar$, $r!=s+sbar$, and it follows immediately
    that $gamma_r=1$ for all negative roots $r$ with this property also.

    Finally suppose the given symmetry has order $3$. If $r=rbar$ then
    $e_r->gamma_r e_r$, where $gamma_r^3=1$. Hence $gamma_r=1$. If $r!=rbar$
    then
    $
      e_r->gamma_r e_rbar->gamma_r gamma_rbar e_rbarbar
      ->gamma_r gamma_rbar gamma_rbarbar e_r=e_r.
    $ <eq:13-6-2-three-cycle>
    Thus $gamma_r gamma_rbar gamma_rbarbar=1$. If two of
    $gamma_r,gamma_rbar,gamma_rbarbar$ are $-1$ we can, by changing the sign of
    one of the root vectors $e_r,e_rbar,e_rbarbar$, arrange matters so that
    $ gamma_r=gamma_rbar=gamma_rbarbar=1. $ <eq:13-6-2-normalized-signs>
    #qed

    If all the roots of $frak(L)$ have the same length, we shall assume that a
    Chevalley basis for $frak(L)$ is chosen as in #book-ref(
      "l",
      "13-6-2",
      [13.6.2],
    ), where this is relevant. We can now describe the elements in the subgroups
    $X_S^1$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-6-3>
      #smallcaps[Proposition 13.6.3.] _Let $S$ be an equivalence class in $Phi$.
      Then the elements in the subgroup $X_S^1$ are as shown below. (For the
      field automorphism $f$ we write $f(t)=tbar$ if all the roots of $frak(L)$
      have the same length, and $f(t)=t^theta$ otherwise.)_
    ]

    _(i) If $S={r}$ has type $A_1$ then $X_S^1$ consists of the elements
    $x_r (t)$ with $t=tbar$._

    _(ii) If $S={r,rbar}$ has type $A_1 times A_1$, where $r,rbar$ have the same
    length, then $X_S^1$ consists of the elements $x_r (t)x_rbar (tbar)$ for all
    $t in K$._

    _(iii) If $S={r,rbar,rbarbar}$ has type $A_1 times A_1 times A_1$ then
    $X_S^1$ consists of the elements $x_r (t)x_rbar (tbar)x_rbarbar (tbarbar)$
    for all $t in K$._

    #source(247, "234")
    _(iv) If $S={r,rbar,r+rbar}$ has type $A_2$ then $X_S^1$ consists of the
    elements $x_r (t)x_rbar (tbar)x_(r+rbar)(u)$, where
    $u+ubar=-N_(r,rbar)t tbar$._

    _(v) If $S={r,rbar}$ has type $A_1 times A_1$, where $r$ is short and $rbar$
    is long, then $X_S^1$ consists of the elements $x_r (t^theta)x_rbar (t)$ for
    all $t in K$._

    #block(sticky: true)[
      _(vi) If $S={a,b,a+b,2a+b}$ has type $B_2$ then $X_S^1$ consists of the
      elements_
    ]
    $
      x_a (t^theta)x_b (t)x_(a+b)(t^(theta+1)+u)x_(2a+b)(u^(2theta))
    $ <eq:13-6-3-b2-elements>
    _for all $t,u in K$._

    #block(sticky: true)[
      _(vii) If $S={a,b,a+b,2a+b,3a+b,3a+2b}$ has type $G_2$ then $X_S^1$
      consists of the elements_
    ]
    $
      x_a (t^theta)x_b (t)x_(a+b)(t^(theta+1)+u^theta)
      x_(2a+b)(t^(2theta+1)+v^theta)x_(3a+b)(u)x_(3a+2b)(v)
    $ <eq:13-6-3-g2-elements>
    _for all $t,u,v in K$. (The structure constants here have been chosen as in
    section #book-ref("sec", "graph-automorphism-g2").)_

    #smallcaps[Proof.] (i) Since $sigma dot x_r (t)=x_r (tbar)$, $X_S^1$ is as
    stated.

    #block(sticky: true)[(ii) Since]
    $
      sigma dot x_r (t)x_rbar (u)
      =x_rbar (tbar)x_r (ubar)=x_r (ubar)x_rbar (tbar),
    $ <eq:13-6-3-pair-image>
    the $sigma$-invariant elements are those for which $u=tbar$.

    #block(sticky: true)[(iii) Since]
    $
      sigma dot x_r (t)x_rbar (u)x_rbarbar (v)
      & =x_rbar (tbar)x_rbarbar (ubar)x_r (vbar) \
      & =x_r (vbar)x_rbar (tbar)x_rbarbar (ubar),
    $ <eq:13-6-3-triple-image>
    the $sigma$-invariant elements are those for which $u=tbar$, $v=tbarbar$.

    #block(sticky: true)[(iv) Since]
    $
      sigma dot x_r (t)x_rbar (v)x_(r+rbar)(u)
      & =x_rbar (tbar)x_r (vbar)x_(r+rbar)(-ubar) \
      & =x_r (vbar)x_rbar (tbar)x_(r+rbar)(-N_(r,rbar)tbar vbar-ubar),
    $ <eq:13-6-3-a2-image>
    the $sigma$-invariant elements are those for which $v=tbar$ and
    $u+ubar=-N_(r,rbar)t tbar$.

    (v) Here $K$ has characteristic $2$ and $2theta^2=1$. Now
    $
      sigma dot x_r (u)x_rbar (t)
      =x_rbar (u^(2theta))x_r (t^theta)=x_r (t^theta)x_rbar (u^(2theta)).
    $ <eq:13-6-3-unequal-pair-image>
    Thus the $sigma$-invariant elements are those for which $u=t^theta$.

    (vi) In this case also $K$ has characteristic $2$ and $2theta^2=1$. We have
    $
      & sigma dot x_a (t_a)x_b (t_b)x_(a+b)(t_(a+b))x_(2a+b)(t_(2a+b)) \
      & =x_b (t_a^(2theta))x_a (t_b^theta)
        x_(2a+b)(t_(a+b)^(2theta))x_(a+b)(t_(2a+b)^theta) \
      & =x_a (t_b^theta)x_b (t_a^(2theta))
        x_(a+b)(t_a^(2theta)t_b^theta+t_(2a+b)^theta) \
      & quad times x_(2a+b)(t_a^(2theta)t_b^(2theta)+t_(a+b)^(2theta)),
    $ <eq:13-6-3-b2-image>
    #source(248, "235")
    using the commutator formula. Thus the $sigma$-invariant elements are those
    for which
    $
           t_a & =t_b^theta, quad t_b=t_a^(2theta), \
       t_(a+b) & =t_a^(2theta)t_b^theta+t_(2a+b)^theta, \
      t_(2a+b) & =t_a^(2theta)t_b^(2theta)+t_(a+b)^(2theta).
    $ <eq:13-6-3-b2-fixed-equations>
    Putting $t=t_b$, $u=t_(2a+b)^theta$, we obtain the required form.

    (vii) In this case $K$ has characteristic $3$ and $3theta^2=1$. We choose
    the structure constants as in section #book-ref(
      "sec",
      "graph-automorphism-g2",
    ). Then
    $
      & sigma dot x_a (t_a)x_b (t_b)x_(a+b)(t_(a+b))x_(2a+b)(t_(2a+b))
        x_(3a+b)(t_(3a+b))x_(3a+2b)(t_(3a+2b)) \
      & =x_b (t_a^(3theta))x_a (t_b^theta)x_(3a+b)(t_(a+b)^(3theta))
        x_(3a+2b)(t_(2a+b)^(3theta)) \
      & quad times x_(a+b)(t_(3a+b)^theta)x_(2a+b)(t_(3a+2b)^theta) \
      & =x_a (t_b^theta)x_b (t_a^(3theta))x_(a+b)(t_a^(3theta)t_b^theta)
        x_(2a+b)(t_a^(3theta)t_b^(2theta)) \
      & quad times x_(3a+b)(-t_a^(3theta)t_b^(3theta))
        x_(3a+2b)(-t_a^(6theta)t_b^(3theta)) \
      & quad times x_(3a+b)(t_(a+b)^(3theta))x_(3a+2b)(t_(2a+b)^(3theta))
        x_(a+b)(t_(3a+b)^theta) \
      & quad times x_(2a+b)(t_(3a+2b)^theta) \
      & =x_a (t_b^theta)x_b (t_a^(3theta))
        x_(a+b)(t_a^(3theta)t_b^theta+t_(3a+b)^theta) \
      & quad times x_(2a+b)(t_a^(3theta)t_b^(2theta)+t_(3a+2b)^theta)
        x_(3a+b)(-t_a^(3theta)t_b^(3theta)+t_(a+b)^(3theta)) \
      & quad times x_(3a+2b)(-t_a^(6theta)t_b^(3theta)+t_(2a+b)^(3theta)).
    $ <eq:13-6-3-g2-image>
    Thus the $sigma$-invariant elements are those for which
    $
            t_a & =t_b^theta, quad t_b=t_a^(3theta), \
        t_(a+b) & =t_a^(3theta)t_b^theta+t_(3a+b)^theta, \
       t_(2a+b) & =t_a^(3theta)t_b^(2theta)+t_(3a+2b)^theta, \
       t_(3a+b) & =-t_a^(3theta)t_b^(3theta)+t_(a+b)^(3theta), \
      t_(3a+2b) & =-t_a^(6theta)t_b^(3theta)+t_(2a+b)^(3theta).
    $ <eq:13-6-3-g2-fixed-equations>
    Putting $t=t_b$, $u=t_(3a+b)$, $v=t_(3a+2b)$, we obtain the required
    elements.
    #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let rbar = $overline(r)$
    #let rbarbar = $overline(overline(r))$
    #let tbar = $overline(t)$
    #let tbarbar = $overline(overline(t))$
    #let t1bar = $overline(t)_1$
    #let ubar = $overline(u)$

    The subgroups $X_S^1$ of the twisted groups are of importance because they
    are the analogue of the root subgroups of the Chevalley groups. We describe
    next the way in which the elements in a subgroup $X_S^1$ combine together.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-6-4>
      #smallcaps[Proposition 13.6.4.] _(i) If $S={r}$ has type $A_1$ and we
      write $x_S (t)=x_r (t)$ then_
    ]
    $ x_S (t_1)x_S (t_2)=x_S (t_1+t_2). $ <eq:13-6-4-a1-product>

    #block(sticky: true)[
      _(ii) If $S={r,rbar}$ has type $A_1 times A_1$, where $r,rbar$ have the
      same length, and we write $x_S (t)=x_r (t)x_rbar (tbar)$ then_
    ]
    $ x_S (t_1)x_S (t_2)=x_S (t_1+t_2). $ <eq:13-6-4-pair-product>

    #block(sticky: true)[
      _(iii) If $S={r,rbar,rbarbar}$ has type $A_1 times A_1 times A_1$ and we
      write_
    ]
    $ x_S (t)=x_r (t)x_rbar (tbar)x_rbarbar (tbarbar) $
    <eq:13-6-4-triple-parametrization>
    _then_
    $ x_S (t_1)x_S (t_2)=x_S (t_1+t_2). $ <eq:13-6-4-triple-product>

    #source(249, "236")
    #block(sticky: true)[
      _(iv) If $S={r,rbar,r+rbar}$ has type $A_2$ and we write_
    ]
    $ x_S (t,u)=x_r (t)x_rbar (tbar)x_(r+rbar)(u), $
    <eq:13-6-4-a2-parametrization>
    _where $u+ubar=-N_(r,rbar)t tbar$, then_
    $
      x_S (t_1,u_1)x_S (t_2,u_2)
      =x_S (t_1+t_2,u_1+u_2-N_(r,rbar)t1bar t_2).
    $ <eq:13-6-4-a2-product>

    #block(sticky: true)[
      _(v) If $S={r,rbar}$ has type $A_1 times A_1$, where $r$ is short and
      $rbar$ long and if we write $x_S (t)=x_r (t^theta)x_rbar (t)$ then_
    ]
    $ x_S (t_1)x_S (t_2)=x_S (t_1+t_2). $ <eq:13-6-4-unequal-pair-product>

    #block(sticky: true)[
      _(vi) If $S={a,b,a+b,2a+b}$ has type $B_2$ and we write_
    ]
    $
       alpha(t) & =x_a (t^theta)x_b (t)x_(a+b)(t^(theta+1)), \
        beta(u) & =x_(a+b)(u)x_(2a+b)(u^(2theta)), \
      x_S (t,u) & =alpha(t)beta(u)
    $ <eq:13-6-4-b2-parametrization>
    _then_
    $
      x_S (t_1,u_1)x_S (t_2,u_2)
      =x_S (t_1+t_2,u_1+u_2+t_1^theta t_2).
    $ <eq:13-6-4-b2-product>

    #block(sticky: true)[
      _(vii) If $S={a,b,a+b,2a+b,3a+b,3a+2b}$ has type $G_2$ and we write_
    ]
    $
         alpha(t) & =x_a (t^theta)x_b (t)x_(a+b)(t^(theta+1))
                    x_(2a+b)(t^(2theta+1)), \
          beta(u) & =x_(a+b)(u^theta)x_(3a+b)(u), \
         gamma(v) & =x_(2a+b)(v^theta)x_(3a+2b)(v), \
      x_S (t,u,v) & =alpha(t)beta(u)gamma(v)
    $ <eq:13-6-4-g2-parametrization>
    _then_
    $
      & x_S (t_1,u_1,v_1)x_S (t_2,u_2,v_2) \
      & =x_S lr(
          (t_1+t_2,u_1+u_2-t_1 t_2^(3theta),
            v_1+v_2-t_2 u_1+t_1 t_2^(3theta+1)-t_1^2 t_2^(3theta))
        ).
    $ <eq:13-6-4-g2-product>

    #smallcaps[Proof.] These are all straightforward consequences of the
    commutator formula #book-ref("th", "5-2-2", [5.2.2]). #qed

    We have seen earlier that the Chevalley group $G$ is generated by the root
    subgroups $X_r,X_(-r)$ for all $r in Pi$. We now prove an analogue of this
    result for the twisted groups.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:13-6-5>
      #smallcaps[Proposition 13.6.5.] _$G^1$ is generated by the subgroups
      $X_(Phi_J^+)^1$, $X_(Phi_J^-)^1$ for all #box[$rho$-orbits] $J$ of $Pi$._
    ]

    #source(250, "237")
    #smallcaps[Proof.] $G^1$ is generated by $U^1$ and $V^1$ by #book-ref(
      "def",
      "13-4-2",
      [13.4.2],
    ). $U^1$ is generated by the subgroups $X_S^1$ for all equivalence classes
    $S$ in $Phi^+$, by #book-ref("p", "13-6-1", [13.6.1]), and $V^1$ is
    generated by the $X_S^1$ for all $S$ in $Phi^-$. Thus $G^1$ is generated by
    the subgroups $X_S^1$ for all equivalence classes $S$ of $Phi$.

    Now each equivalence class $S$ has the form $w(Phi_J^+)$ for some $w in W^1$
    and some $rho$-orbit $J$ of $Pi$ (#book-ref("l", "13-2-1", [13.2.1])). For
    each $w in W^1$, let $n_w$ be an element of $N^1$ chosen as in #book-ref(
      "p",
      "13-5-2",
      [13.5.2],
    ). Let $G_sigma$ be the set of $sigma$-invariant elements of $G$. Then we
    have
    $
      n_w X_S^1 n_w^(-1)
      =n_w (X_S inter G_sigma)n_w^(-1)
      =X_(w(S)) inter G_sigma=X_(w(S))^1
    $ <eq:13-6-5-conjugated-classes>
    since $n_w in G_sigma$. Thus $G^1$ is generated by the subgroups
    $X_(Phi_J^+)^1$ and the elements $n_w$ for all $w in W^1$. However, $W^1$ is
    generated by the elements $w_0^J$ for all #box[$rho$-orbits] $J$ of $Pi$.
    Thus $G^1$ is generated by the $X_(Phi_J^+)^1$ and elements $n(w_0^J)$ for
    all $J$. Now consider the subgroup $chevron.l X_(Phi_J^+)^1,X_(Phi_J^-)^1
    chevron.r$. This is by #book-ref("def", "13-4-2", [13.4.2]) a twisted group
    whose Weyl group is, by #book-ref("p", "13-1-2", [13.1.2]),
    $chevron.l w_0^J chevron.r$. By #book-ref("p", "13-5-2", [13.5.2]) this
    twisted group contains an element $n(w_0^J) in N$ mapping to $w_0^J$. Thus
    $G^1$ is generated by the subgroups $X_(Phi_J^+)^1$, $X_(Phi_J^-)^1$ for all
    $J$.
  ]

  #[
    #import "main-defs.typ": book-ref, qed, section-ref, source
    #let rbar = $overline(r)$
    #let rbarbar = $overline(overline(r))$
    #let tbar = $overline(t)$
    #let tbarbar = $overline(overline(t))$
    #let ubar = $overline(u)$
    #let lbar = $overline(lambda)$
    #let lbarbar = $overline(overline(lambda))$

    == The Subgroup $H^1$ <sec:twisted-diagonal-subgroup>

    We now turn to a discussion of the subgroup $H^1=H inter G^1$. It turns out
    to be quite troublesome to decide which elements of $H$ are contained in
    this subgroup. We begin by describing the operation of $sigma$ on $H$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:13-7-1>
      #block(sticky: true)[
        #smallcaps[Lemma 13.7.1.] _If all the roots of $frak(L)$ have the same
        length then_
      ]
      $ sigma dot h_r (t)=h_rbar (tbar). $ <eq:13-7-1-equal-lengths>
      _If there are roots of different lengths then_
      $ sigma dot h_r (t)=h_rbar (t^(lambda(rbar)theta)). $
      <eq:13-7-1-unequal-lengths>
    ]

    #smallcaps[Proof.] Suppose all the roots have the same length. Then
    $ sigma dot x_r (t)=x_rbar (gamma_r tbar), $
    <eq:13-7-1-root-image>
    where $gamma_r=plus.minus 1$. Thus
    $
      sigma dot n_r (t) & =sigma(x_r (t)x_(-r)(-t^(-1))x_r (t)) \
                        & =x_rbar (gamma_r tbar)x_(-rbar)(-gamma_(-r)tbar^(-1))
                          x_rbar (gamma_r tbar) \
                        & =n_rbar (gamma_r tbar)
    $ <eq:13-7-1-weyl-image>
    #source(251, "238")
    since $gamma_r gamma_(-r)=1$. Therefore
    $
      sigma dot h_r (t) & =sigma(n_r (t) dot n_r (-1))
                          =n_rbar (gamma_r tbar)n_rbar (gamma_r)^(-1) \
                        & =h_rbar (gamma_r tbar)n_rbar (1)n_rbar (1)^(-1)
                          h_rbar (gamma_r)^(-1)=h_rbar (tbar).
    $ <eq:13-7-1-torus-image>

    Now suppose there are roots of different lengths. Then
    $ sigma dot x_r (t)=x_rbar (t^(lambda(rbar)theta)). $
    <eq:13-7-1-exceptional-root-image>
    #block(sticky: true)[Thus]
    $
      sigma dot n_r (t) & =sigma(x_r (t)x_(-r)(-t^(-1))x_r (t)) \
                        & =x_rbar (t^(lambda(rbar)theta))
                          x_(-rbar)((-t^(-1))^(lambda(rbar)theta))
                          x_rbar (t^(lambda(rbar)theta)) \
                        & =n_rbar (t^(lambda(rbar)theta))
    $ <eq:13-7-1-exceptional-weyl-image>
    since $(-1)^(lambda(rbar))=-1$. (The latter statement is trivial if $K$ has
    characteristic 2, whereas if $K$ has characteristic 3 $lambda(rbar)$ is
    either 1 or 3.) Therefore
    $
      sigma dot h_r (t) & =sigma dot (n_r (t)n_r (-1)) \
                        & =n_rbar (t^(lambda(rbar)theta))n_rbar (-1)
                          =h_rbar (t^(lambda(rbar)theta)).
    $ <eq:13-7-1-exceptional-torus-image>
    #qed

    Now the subgroup $H$ of $G$ consists of elements $h(chi)$, where $chi$ is a
    $K$-character of $P$, the additive group generated by the fundamental roots
    $p_1,...,p_l$. The $K$-characters $chi$ which give rise to elements of $H$
    are those which can be extended to $K$-characters of $Q$, the additive group
    generated by the fundamental weights $q_1,...,q_l$, by #book-ref(
      "th",
      "7-1-1",
      [7.1.1],
    ). We shall prove an analogue of this result for the subgroup $H^1$ of $G^1$
    in the case when all the roots have the same length. In such a case the
    symmetry $rho$ of the Dynkin diagram determines an isometry $tau$ of
    $frak(V)$, the real vector space generated by $Phi$, such that
    $tau(p_i)=p_(rho(i))$. $tau$ transforms every root into a root and we have
    $tau(r)=rbar$. Now $tau$ transforms the fundamental co-roots by
    $tau(h_(p_i))=h_(p_(rho(i)))$. Since $q_1,...,q_l$ is the basis of $frak(V)$
    dual to the basis $h_(p_1),...,h_(p_l)$ (see #section-ref(
      "diagonal-subgroup",
    )), we have $tau(q_i)=q_(rho(i))$. Thus $tau$ permutes the fundamental
    weights in the same way that it permutes the fundamental roots. In
    particular we have $tau(Q)=Q$. We write
    $ tau(a)=overline(a) $ <eq:13-7-weight-conjugation>
    for each $a in Q$.

    #metadata((kind: "anchor")) <def:13-7-self-conjugate>
    _Definition._ Suppose all the roots of $frak(L)$ have the same length. A
    $K$-character $chi$ of $P$ (or $Q$) is said to be self-conjugate if
    $chi(overline(a))=overline(chi(a))$ for all $a in P$ (or $Q$).

    #metadata((kind: "anchor")) <th:13-7-2>
    #smallcaps[Theorem 13.7.2.] _Suppose all the roots of $frak(L)$ have the
    same length. Then $h(chi) in H^1$ if and only if $chi$ is a self-conjugate
    $K$-character of $P$ which can be extended to a self-conjugate $K$-character
    of $Q$._

    #source(252, "239")
    #smallcaps[Proof.] Let $h(chi) in H$. By #book-ref("th", "7-1-1", [7.1.1])
    $chi$ may be regarded as a $K$-character of $Q$. Let $chi(q_i)=lambda_i$.
    Then we have
    $ chi=chi_(p_1,lambda_1)chi_(p_2,lambda_2) dots chi_(p_l,lambda_l) $
    <eq:13-7-2-character-product>
    as in #book-ref("th", "7-1-1", [7.1.1]), where $chi_(r,lambda)$ is the
    $K$-character of $Q$ defined by
    $ chi_(r,lambda)(a)=lambda^(2(r,a)\/(r,r)), quad a in Q. $
    <eq:13-7-2-root-character>

    We consider which $K$-characters $chi$ of $Q$ are self-conjugate. The
    necessary and sufficient condition for this is that
    $chi(overline(q)_i)=overline(chi(q_i))$ for $i=1,...,l$. Now
    $ chi(overline(q)_i)=chi(q_(rho(i)))=lambda_(rho(i)), $
    <eq:13-7-2-weight-values>
    #block(sticky: true)[
      thus we require $lambda_(rho(i))=overline(lambda)_i$ for all $i$. Thus
      every self-conjugate $K$-character of $Q$ is a product of characters
      corresponding to the #box[$rho$-orbits] $J$ of $Pi$, and these characters
      have the form:
    ]
    // E058: the third parameter in the printed triple lacks its double bar.
    #block(width: 100%, breakable: false)[
      $
        chi_(r,lambda), thin lambda=lbar, & quad "if" J={r}, \
        chi_(r,lambda)chi_(rbar,lbar), & quad "if" J={r,rbar}, \
        chi_(r,lambda)chi_(rbar,lbar)chi_(rbarbar,lbarbar),
        & quad "if" J={r,rbar,rbarbar}.
      $ <eq:13-7-2-orbit-characters>
    ]
    Let $H^2$ be the group of automorphisms of $frak(L)_K$ of the form $h(chi)$,
    where $chi$ is a self-conjugate character of $Q$. We recall from
    #section-ref(
      "diagonal-subgroup",
    ) that $h_r (t)=h(chi_(r,t))$. Thus $H^2$ is generated by elements
    corresponding to the #box[$rho$-orbits] $J$ of $Pi$ as follows:
    $
                         h_r (t), thin t=tbar, & quad "if" J={r}, \
                         h_r (t)h_rbar (tbar), & quad "if" J={r,rbar}, \
      h_r (t)h_rbar (tbar)h_rbarbar (tbarbar), & quad "if" J={r,rbar,rbarbar}.
    $ <eq:13-7-2-orbit-torus-generators>
    We shall show that $H^2$ is contained in $H^1$ by showing that each of these
    generators of $H^2$ lies in $H^1$.

    Let $S=Phi_J^+$, where $J$ is a $rho$-orbit of $Pi$. If $S$ has type $A_1$
    and $t=tbar$, then $x_r (t)$ and $x_(-r)(-t^(-1))$ are in $G^1$. Hence
    $n_r (t)=x_r (t)x_(-r)(-t^(-1))x_r (t) in G^1$ and
    $h_r (t)=n_r (t)n_r (-1) in G^1$. If $S$ has type $A_1 times A_1$ or
    $A_1 times A_1 times A_1$, a similar argument shows that
    $h_r (t)h_rbar (tbar)$ or $h_r (t)h_rbar (tbar)h_rbarbar (tbarbar)$ are in
    $G^1$, since each of $X_r,X_(-r)$ commutes with each of $X_rbar,X_(-rbar)$
    and each of $X_rbarbar,X_(-rbarbar)$.

    // E062: the rank-two subgroup may retain central scalars in the ambient
    // group.
    Suppose $S$ has type $A_2$. Here things are not so simple, for the subgroup
    $chevron.l X_r,X_rbar,X_(-r),X_(-rbar) chevron.r$ of $G$ is a homomorphic
    image of $upright("SL")_3 (K)$. As in #book-ref("th", "11-3-2", [11.3.2]),
    there is a homomorphism from $upright("SL")_3 (K)$ onto
    $chevron.l X_r,X_rbar,X_(-r),X_(-rbar) chevron.r$
    #source(253, "240")
    such that
    $
      I+t e_12 & -> x_r (t), \
      I+t e_23 & -> x_rbar (t), \
      I+t e_13 & -> x_(r+rbar)(t), \
      I+t e_21 & -> x_(-r)(t), \
      I+t e_32 & -> x_(-rbar)(t), \
      I+t e_31 & -> x_(-r-rbar)(t).
    $ <eq:13-7-2-sl3-root-matrices>
    #block(sticky: true)[Matrix multiplication shows that]
    $
      mat(0, t, 0; -t^(-1), 0, 0; 0, 0, 1)
      & -> x_r (t)x_(-r)(-t^(-1))x_r (t)=n_r (t), \
      mat(1, 0, 0; 0, 0, t; 0, -t^(-1), 0)
      & -> x_rbar (t)x_(-rbar)(-t^(-1))x_rbar (t)=n_rbar (t), \
      mat(t, 0, 0; 0, t^(-1), 0; 0, 0, 1)
      & -> n_r (t)n_r (-1)=h_r (t), \
      mat(1, 0, 0; 0, t, 0; 0, 0, t^(-1))
      & -> n_rbar (t)n_rbar (-1)=h_rbar (t), \
      mat(t, 0, 0; 0, t^(-1)tbar, 0; 0, 0, tbar^(-1))
      & -> h_r (t)h_rbar (tbar).
    $ <eq:13-7-2-sl3-torus-matrices>
    Now $x_r (t)x_rbar (tbar)x_(r+rbar)(u)$ is in $G^1$ whenever
    $u+ubar=-t tbar$, by #book-ref("p", "13-6-3", [13.6.3]) (iv). (We have
    chosen the structure constants so that $N_(r,rbar)=1$ in order to obtain the
    matrix representation in the above form.) Also
    $ x_(-r)(t)x_(-rbar)(tbar)x_(-r-rbar)(u) $
    <eq:13-7-2-negative-a2-element>
    is in $G^1$ whenever $u+ubar=t tbar$, since $N_(-r,-rbar)=-1$.

    #source(254, "241")
    #block(sticky: true)[Now we have]
    $
      mat(1, t, -ubar; 0, 1, tbar; 0, 0, 1)
      & -> x_r (t)x_rbar (tbar)x_(r+rbar)(u), \
      mat(1, 0, 0; t, 1, 0; u, tbar, 1)
      & -> x_(-r)(t)x_(-rbar)(tbar)x_(-r-rbar)(u).
    $ <eq:13-7-2-unitary-matrices>
    #block(sticky: true)[
      Suppose $lambda,t$ are elements of $K$ satisfying
      $lambda^(-1)+lbar^(-1)=t tbar$. Then the matrices
    ]
    $
      mat(1, lambda t, lambda; 0, 1, lbar tbar; 0, 0, 1), quad
      mat(1, 0, 0; -tbar, 1, 0; lbar^(-1), -t, 1), quad
      mat(1, lbar t, lambda; 0, 1, lambda tbar; 0, 0, 1)
    $ <eq:13-7-2-three-unitary-factors>
    #block(sticky: true)[
      are mapped into elements of $G^1$. Thus their product (from left to right)
    ]
    $ mat(0, 0, lambda; 0, -lambda^(-1)lbar, 0; lbar^(-1), 0, 0) $
    <eq:13-7-2-unitary-weyl-product>
    is mapped into an element of $G^1$. This holds for a given $lambda$ whenever
    there exists $t in K$ such that $t tbar=lambda^(-1)+lbar^(-1)$. We show in
    the #book-ref("l", "13-7-3", [following lemma], highlight: false) that each
    element $lambda != 0$ of $K$ is expressible in the form
    $lambda=lambda_1 overline(lambda)_2^(-1)$, where $lambda_1,lambda_2$ are
    such that the above equation can be solved for $t$. Thus
    $
      & mat(lambda, 0, 0; 0, lambda^(-1)lbar, 0; 0, 0, lbar^(-1)) \
      & =mat(
          0, 0, lambda_1; 0, -lambda_1^(-1)overline(lambda)_1, 0;
          overline(lambda)_1^(-1), 0, 0
        )
        mat(
          0, 0, lambda_2; 0, -lambda_2^(-1)overline(lambda)_2, 0;
          overline(lambda)_2^(-1), 0, 0
        )
    $ <eq:13-7-2-unitary-torus-product>
    is mapped into an element of $G^1$. Hence
    $h_r (lambda)h_rbar (lbar) in G^1$, as required.

    // E059: inverse parameters require nonzero elements in the lemma.
    #metadata((kind: "anchor")) <l:13-7-3>
    #smallcaps[Lemma 13.7.3.] _Let $K$ be a field admitting an automorphism of
    order 2. Let $italic("L")$ be the subset of $K^ast$ consisting of elements
    $lambda$ such that there exists $t in K$ with
    $t tbar=lambda^(-1)+lbar^(-1)$. Then each element $lambda in K^ast$ is
    expressible in the form $lambda=lambda_1 overline(lambda)_2^(-1)$, where
    $lambda_1,lambda_2 in italic("L")$._

    #source(255, "242")
    #smallcaps[Proof.] Suppose $lambda != lbar$. Define $lambda_1=lambda-lbar$,
    $lambda_2=(lbar-lambda)/lbar$. Then
    $
      lambda_1^(-1)+overline(lambda)_1^(-1)=0 quad "and" quad
      lambda_2^(-1)+overline(lambda)_2^(-1)=1.
    $ <eq:13-7-3-nonfixed-parameters>
    Thus $lambda_1,lambda_2 in italic("L")$ and
    $lambda=lambda_1 overline(lambda)_2^(-1)$.

    Now suppose $lambda=lbar$. There exists $mu in K$ such that $mu != 0$ and
    $overline(mu)=-mu$. Define $lambda_1=lambda mu$, $lambda_2=overline(mu)$.
    Then $lambda_1^(-1)+overline(lambda)_1^(-1)=0$ and
    $lambda_2^(-1)+overline(lambda)_2^(-1)=0$. Thus
    $lambda_1,lambda_2 in italic("L")$ and
    $lambda=lambda_1 overline(lambda)_2^(-1)$. #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let rbar = $overline(r)$
    #let tbar = $overline(t)$
    #let ubar = $overline(u)$

    We now return to the proof of #book-ref("th", "13-7-2", [13.7.2]). We have
    now shown that $H^2$ is a subgroup of $H^1$ in all cases, and shall now
    prove that $H^1$ is contained in $H^2$.

    Let $N^2$ be the subgroup of $N^1$ generated by $H^2$ and the elements
    $n_w$, chosen as in #book-ref("p", "13-5-2", [13.5.2]), for all $w in W^1$.
    We have
    $ n_w h(chi)n_w^(-1)=h(chi'), $ <eq:13-7-2-character-conjugation>
    where $chi'(r)=chi(w^(-1)(r))$, by #book-ref("th", "7-2-2", [7.2.2]).
    Suppose $h(chi) in H^2$. Then $chi$ is a self-conjugate character of $Q$.
    Thus, for all $a in Q$, we have
    $
      chi'(overline(a)) & =chi(w^(-1)(overline(a)))
                          =chi(overline(w^(-1)(a))) \
                        & =overline(chi(w^(-1)(a)))=overline(chi'(a))
    $ <eq:13-7-2-conjugate-character-fixed>
    and so $chi'$ is also a self-conjugate character of $Q$. Thus $n_w$
    normalizes $H^2$, and so $H^2$ is normal in $N^2$. Also $N^1=H^1 N^2$ and
    $H^1 inter N^2=H^2$. Thus
    $
      N^2 / H^2=N^2 / (H^1 inter N^2)
      tilde.eq (H^1 N^2) / H^1=N^1 / H^1 tilde.eq W^1.
    $ <eq:13-7-2-second-weyl-quotient>
    We next define $B^2=U^1 H^2$. Since $H^2$ normalizes $U^1$, $B^2$ is a
    subgroup of $G^1$. We shall show that for each $rho$-orbit $J$ of $Pi$
    $ X_(Phi_J^-)^1 subset.eq B^2 union B^2 n(w_0^J)B^2. $
    <eq:13-7-2-negative-class-bruhat>
    Since all the roots have the same length, $J$ has type $A_1$,
    $A_1 times A_1$, $A_1 times A_1 times A_1$ or $A_2$. If $J$ has type $A_1$
    the elements of $X_(Phi_J^-)^1$ have form $x_(-r)(t)$, where $t=tbar$. Now
    $
      x_(-r)(t)=x_r (t^(-1))h_r (-t^(-1))n_r x_r (t^(-1)), quad t != 0,
    $ <eq:13-7-2-rank-one-factorization>
    and we may choose $n(w_0^J)=n_r$. Since $h_r (-t^(-1)) in H^2$ we have
    $ x_(-r)(t) in B^2 union B^2 n(w_0^J)B^2 $
    <eq:13-7-2-rank-one-bruhat>
    whenever $t=tbar$.

    If $J$ has type $A_1 times A_1$ we have
    $
      & x_(-r)(t)x_(-rbar)(tbar) \
      & =x_r (t^(-1))x_rbar (tbar^(-1))h_r (-t^(-1))h_rbar (-tbar^(-1))
        dot \
      & quad n_r n_rbar x_r (t^(-1))x_rbar (tbar^(-1))
    $ <eq:13-7-2-pair-factorization>
    #block(sticky: true)[
      and we may choose $n(w_0^J)=n_r n_rbar$. Also
      $h_r (-t^(-1))h_rbar (-tbar^(-1)) in H^2$ and so
    ]
    $ x_(-r)(t)x_(-rbar)(tbar) in B^2 union B^2 n(w_0^J)B^2. $
    <eq:13-7-2-pair-bruhat>

    #source(256, "243")
    A similar argument works if $J$ has type $A_1 times A_1 times A_1$.

    #block(sticky: true)[
      If $J$ has type $A_2$ we again make use of the homomorphism from
      $upright("SL")_3 (K)$ to
      $chevron.l X_r,X_rbar,X_(-r),X_(-rbar) chevron.r$. Under this homomorphism
    ]
    $
      mat(1, 0, 0; t, 1, 0; u, tbar, 1)
      -> x_(-r)(t)x_(-rbar)(tbar)x_(-r-rbar)(u).
    $
    <eq:13-7-2-negative-unitary-matrix>
    #block(sticky: true)[Now we have]
    $
      & mat(1, 0, 0; t, 1, 0; u, tbar, 1) \
      & =mat(1, tbar ubar^(-1), u^(-1); 0, 1, t u^(-1); 0, 0, 1)
        mat(ubar^(-1), 0, 0; 0, ubar u^(-1), 0; 0, 0, u) \
      & quad dot mat(0, 0, 1; 0, -1, 0; 1, 0, 0)
        mat(1, tbar u^(-1), u^(-1); 0, 1, t ubar^(-1); 0, 0, 1).
    $ <eq:13-7-2-unitary-bruhat-matrices>
    Suppose $u+ubar=t tbar$. Then we have seen that the images of all the
    matrices in this equation are in $G^1$, except for
    $ mat(0, 0, 1; 0, -1, 0; 1, 0, 0). $ <eq:13-7-2-unitary-weyl-matrix>
    Thus the image of this matrix is in $G^1$ also. However, this image is in
    $N$ and corresponds to the element $w_0^J$ of $W$. Thus we may choose this
    image as $n(w_0^J)$. Since the image of
    $ mat(ubar^(-1), 0, 0; 0, ubar u^(-1), 0; 0, 0, u) $
    <eq:13-7-2-unitary-diagonal-factor>
    #block(sticky: true)[
      is $h_r (ubar^(-1))h_rbar (u^(-1)) in H^2$ we have
    ]
    $ x_(-r)(t)x_(-rbar)(tbar)x_(-r-rbar)(u) in B^2 union B^2 n(w_0^J)B^2 $
    <eq:13-7-2-unitary-bruhat>
    #block(sticky: true)[
      whenever $u+ubar=t tbar$. Thus
    ]
    $ X_(Phi_J^-)^1 subset.eq B^2 union B^2 n(w_0^J)B^2 $
    <eq:13-7-2-all-negative-classes-bruhat>
    in all cases.

    It now follows exactly as in #book-ref("p", "8-1-4", [8.1.4]) that
    $B^2 union B^2 n(w_0^J)B^2$ is a subgroup of $G^1$ for each $rho$-orbit $J$
    of $Pi$. Repeating the argument of #book-ref("p", "8-1-5", [8.1.5]) we then
    have
    $
      B^2 n B^2 dot B^2 n(w_0^J)B^2
      subset.eq B^2 n n(w_0^J)B^2 union B^2 n B^2
    $
    <eq:13-7-2-double-coset-product>
    #source(257, "244")
    for each $n in N^2$. It then follows as in #book-ref("p", "8-2-2", [8.2.2])
    that $B^2 N^2 B^2$ is a subgroup of $G^1$. However $X_(Phi_J^+)^1$ and
    $X_(Phi_J^-)^1$ are contained in $B^2 N^2 B^2$ for all #box[$rho$-orbits]
    $J$ of $Pi$ and these subgroups generate $G^1$ by #book-ref(
      "p",
      "13-6-5",
      [13.6.5],
    ). Thus $G^1=B^2 N^2 B^2$.

    It is now easy to show that $H^1$ is contained in $H^2$. Let $h in H^1$.
    Then
    $ h in B^2 N^2 B^2=U^1 H^2 N^2 H^2 U^1=U^1 N^2 U^1. $
    <eq:13-7-2-h-bruhat>
    Thus we may write $h=u'n u$, where $u,u' in U^1$ and $n in N^2$. Hence
    $
      n=(u')^(-1)h u^(-1) & in B^1 inter N^2=B^1 inter N^1 inter N^2 \
                          & =H^1 inter N^2=H^2.
    $ <eq:13-7-2-h-intersection>
    Thus $(u')^(-1) dot h u^(-1)h^(-1) dot h in H^2$. It follows that
    $(u')^(-1) dot h u^(-1)h^(-1)=1$ and $h in H^2$. This completes the proof.
    #qed
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, qed, section-ref, source
    #let rbar = $overline(r)$
    #let pbar = $overline(p)$

    We now discuss the subgroup $H^1$ in the cases where there are roots of
    different lengths. Then $frak(L)$ has type $B_2$, $G_2$ or $F_4$.

    #metadata((kind: "anchor")) <th:13-7-4>
    #block(sticky: true)[
      #smallcaps[Theorem 13.7.4.] _Suppose $frak(L)$ contains roots of two
      different lengths. Then the elements $h(chi) in H$ which are fixed by
      $sigma$ are the ones for which_
    ]
    $ chi(rbar)=chi(r)^(lambda(rbar)theta), quad r in Pi. $
    <eq:13-7-4-fixed-character-condition>
    _If $frak(L)$ has type $B_2$ or $F_4$, then an element $h(chi)$ lies in
    $H^1$ if and only if it is fixed by $sigma$. The same holds if $frak(L)$ has
    type $G_2$ provided the field $K$ is finite._

    (It is not known whether $H^1$ coincides with the set of $sigma$-invariant
    elements of $H$ if $frak(L)$ has type $G_2$ and $K$ is infinite.)

    #smallcaps[Proof.] We first describe the elements $h(chi)$ which are fixed
    by $sigma$. As before, $chi$ is a $K$-character of $Q$ and we have
    $ chi=chi_(p_1,t_1)chi_(p_2,t_2) dots chi_(p_l,t_l), $
    <eq:13-7-4-character-decomposition>
    #block(sticky: true)[
      where $chi(q_i)=t_i$. Thus
    ]
    $ h(chi)=product_(i=1)^l h_(p_i)(t_i). $
    <eq:13-7-4-torus-decomposition>
    #block(sticky: true)[Hence]
    $
      sigma dot h(chi) & =product_i h_(pbar_i)(t_i^(lambda(pbar_i)theta)) \
                       & =h lr(
                           (product_i
                             chi_(pbar_i,t_i^(lambda(pbar_i)theta)))
                         ).
    $ <eq:13-7-4-torus-image>
    Thus $h(chi)$ is $sigma$-invariant if and only if
    $ chi=product_i chi_(pbar_i,t_i^(lambda(pbar_i)theta)). $
    <eq:13-7-4-fixed-character>
    Comparing the values of these two characters at $q_(rho(i))$ we obtain
    $ t_(rho(i))=t_i^(lambda(pbar_i)theta). $
    <eq:13-7-4-orbit-parameters>

    #source(258, "245")
    #block(sticky: true)[Thus]
    $ chi(q_(rho(i)))=chi(q_i)^(lambda(pbar_i)theta). $
    <eq:13-7-4-weight-condition>
    We show that an analogous result holds if the fundamental weights $q_i$ are
    replaced by the fundamental roots $p_i$. We recall from #section-ref(
      "diagonal-subgroup",
    ) that
    $ p_i=sum_(j=1)^l A_(j i)q_j. $ <eq:13-7-4-root-weight-expansion>
    #block(sticky: true)[Thus]
    $
      chi(p_(rho(i)))
      & =chi lr((sum_j A_(rho(j)rho(i))q_(rho(j)))) \
      & =product_j chi(q_(rho(j)))^(A_(rho(j),rho(i))) \
      & =product_j chi(q_j)^(A_(rho(j),rho(i))lambda(p_(rho(j)))theta) \
      & =product_j chi(q_j)^(A_(j i)lambda(p_(rho(i)))theta) \
      & =chi(p_i)^(lambda(p_(rho(i)))theta)
    $ <eq:13-7-4-root-condition-calculation>
    #block(sticky: true)[since]
    $
      A_(j i)=A_(rho(i),rho(j))
      =A_(rho(j),rho(i)) lambda(p_(rho(j)))/lambda(p_(rho(i))).
    $ <eq:13-7-4-cartan-symmetry>
    (We recall that $rho$ interchanges long and short roots.) Thus
    $ chi(p_(rho(i)))=chi(p_i)^(lambda(p_(rho(i)))theta). $
    <eq:13-7-4-root-condition>
    Hence $h(chi)$ is $sigma$-invariant if and only if
    $ chi(rbar)=chi(r)^(lambda(rbar)theta), quad r in Pi. $
    <eq:13-7-4-root-character-criterion>

    Now every element $h(chi)$ in $H^1$ is fixed by $sigma$, and we consider
    whether the converse is true. It is evident that the group of elements
    $h(chi)$ fixed by $sigma$ is generated by the elements of form
    $h(chi_(r,t)chi_(rbar,t^(lambda(rbar)theta)))$ for each $rho$-orbit
    ${r,rbar}$ of $Pi$. If $frak(L)$ has type $B_2$ or $G_2$ there is just one
    $rho$-orbit of $Pi$ and if $frak(L)$ has type $F_4$ there are two
    #box[$rho$-orbits]. If $frak(L)$ has type $B_2$ or $F_4$ the
    #box[$rho$-orbits] have type $A_1 times A_1$ or $B_2$.

    Suppose $J={r,rbar}$ is a $rho$-orbit of type $A_1 times A_1$. Then we have
    $
      & x_r (t)x_rbar (t^(lambda(rbar)theta))
        x_(-r)(-t^(-1))x_(-rbar)(-(t^(lambda(rbar)theta))^(-1)) \
      & quad dot x_r (t)x_rbar (t^(lambda(rbar)theta))
        =n_r (t)n_rbar (t^(lambda(rbar)theta))
    $ <eq:13-7-4-orthogonal-weyl-product>
    and this is an element of $G^1$. Putting $t=-1$ we have
    $n_r (-1)n_rbar (-1)$ is in $G^1$. (Recall that $K$ has characteristic 2.)
    Thus
    $
      & n_r (t)n_rbar (t^(lambda(rbar)theta))n_r (-1)n_rbar (-1) \
      & =h_r (t)h_rbar (t^(lambda(rbar)theta))
        =h(chi_(r,t)chi_(rbar,t^(lambda(rbar)theta)))
    $ <eq:13-7-4-orthogonal-torus-product>
    and this is an element of $G^1 inter H=H^1$.

    #source(259, "246")
    Now suppose that $J={a,b}$ is a $rho$-orbit of type $B_2$, where $a$ is a
    short root and $b$ is long. We show that
    $h(chi_(a,t)chi_(b,t^(2theta))) in H^1$ by means of a matrix representation.
    The subgroup of $G$ generated by $X_a,X_b,X_(-a),X_(-b)$ is isomorphic to
    the Chevalley group $B_2 (K)=C_2 (K)$. Then by #book-ref(
      "th",
      "11-3-2",
      [11.3.2],
    ) (iii) there is a homomorphism from $upright("Sp")_4 (K)$ into
    $chevron.l X_a,X_b,X_(-a),X_(-b) chevron.r$ under which
    $
         I+t(e_12-e_(-2,-1)) & -> x_a (t), \
                I+t e_(2,-2) & -> x_b (t), \
      I+t(e_(1,-2)+e_(2,-1)) & -> x_(a+b)(t), \
                I+t e_(1,-1) & -> x_(2a+b)(t), \
         I-t(e_(-1,-2)-e_21) & -> x_(-a)(t), \
                I+t e_(-2,2) & -> x_(-b)(t), \
      I+t(e_(-1,2)+e_(-2,1)) & -> x_(-(a+b))(t), \
                I+t e_(-1,1) & -> x_(-(2a+b))(t).
    $ <eq:13-7-4-sp4-root-matrices>
    Since $K$ has characteristic 2 the signs are irrelevant and the map is in
    fact an isomorphism. It may be checked by a straightforward matrix
    multiplication that, under this isomorphism, we have
    $
      mat(
        t, 0, 0, 0; 0, t^(2theta-1), 0, 0; 0, 0, t^(-1), 0; 0, 0, 0,
        t^(1-2theta)
      )
      -> h_a (t)h_b (t^(2theta)).
    $ <eq:13-7-4-sp4-torus-matrix>
    Define
    $ u_1 (t)=x_a (t^theta)x_b (t)x_(a+b)(t^(theta+1)) $
    <eq:13-7-4-sp4-u>
    #block(sticky: true)[and]
    $ v_2 (t)=x_(-(a+b))(t^theta)x_(-(2a+b))(t). $
    <eq:13-7-4-sp4-v>
    Then $u_1 (t),v_2 (t)$ lie in $G^1$ for all $t in K$, by #book-ref(
      "p",
      "13-6-4",
      [13.6.4],
    ) (vi). We may now verify that
    $
      A=mat(
        1, t^(1-theta), t, 0; 0, 1, t^theta, t^(2theta-1);
        0, 0, 1, 0; 0, 0, t^(1-theta), 1
      )
      -> u_1 (t^(2theta-1)),
    $ <eq:13-7-4-sp4-a-matrix>
    $
      B=mat(
        1, 0, 0, 0;
        0, 1, 0, 0;
        t^(-1), t^(-theta), 1, 0;
        t^(-theta), 0, 0, 1
      )
      -> v_2 (t^(-1)).
    $ <eq:13-7-4-sp4-b-matrix>

    #source(260, "247")
    Now $A B A^(-1)$ is the matrix
    $
      mat(
        0, 0, t, 0; 0, 0, 0, t^(2theta-1); t^(-1), 0, 0, 0; 0,
        t^(1-2theta), 0, 0
      )
    $ <eq:13-7-4-sp4-conjugate>
    and so the image of this matrix is in $G^1$. Putting $t=1$, the image of
    $ mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) $
    <eq:13-7-4-sp4-weyl-matrix>
    is in $G^1$. Multiplying these two matrices together we see that
    $ h_a (t)h_b (t^(2theta)) in G^1, $ <eq:13-7-4-sp4-torus-membership>
    and so is in $H^1$, as required. Thus $H^1$ coincides with the set of
    $sigma$-invariant elements of $H$ when $frak(L)$ has type $B_2$ or $F_4$.

    Finally suppose $frak(L)$ has type $G_2$. As we lack a matrix representation
    of conveniently small degree (the smallest has degree 7) we argue in a
    different manner. We assume in this case that the field $K$ is finite. We
    define two elements $u(t),u_0 in U^1$ as follows:
    $
      u(t) & =x_(2a+b)(t^theta)x_(3a+2b)(t), \
       u_0 & =x_a (1)x_b (1)x_(a+b)(1)x_(2a+b)(1).
    $ <eq:13-7-4-g2-u-elements>
    The fact that these elements are in $U^1$ follows from #book-ref(
      "p",
      "13-6-4",
      [13.6.4],
    ) (vii). Consider the effect of these elements on the element $e_(-3a-2b)$
    of a Chevalley basis. We have
    // E060: the first printed left subscript has +2b instead of -2b.
    $
      u(t) dot e_(-3a-2b) & =-t^2 e_(3a+2b)+a_1, \
       u_0 dot e_(-3a-2b) & =N_(b,3a+b)M_(2a+b,-3a-2b,3)e_(3a+2b)+a_2,
    $ <eq:13-7-4-g2-highest-coefficients>
    #block(sticky: true)[
      where $a_1,a_2$ are linear combinations of elements of the Chevalley basis
      other than $e_(3a+2b)$. Using the structure constants given at the end of
      #section-ref("graph-automorphism-g2") we have
      $N_(b,3a+b)M_(2a+b,-3a-2b,3)=1$, hence
    ]
    $ u_0 dot e_(-3a-2b)=e_(3a+2b)+a_2. $
    <eq:13-7-4-g2-unit-coefficient>
    Now $G^1=B^1 N^1 B^1=U^1 N^1 U^1$ and we have similarly $G^1=V^1 N^1 V^1$.
    Let $t != 0$ and $u(t)=v'n v$, with $v,v' in V^1$ and $n in N^1$. Then
    $ v'n v dot e_(-3a-2b)=-t^2 e_(3a+2b)+a_1 $
    <eq:13-7-4-g2-opposite-bruhat>
    #source(261, "248")
    and it follows that
    $
      n dot e_(-3a-2b)=-t^2 e_(3a+2b)
      +"terms involving different" e_r "'s."
    $ <eq:13-7-4-g2-monomial-coefficient>
    #block(sticky: true)[
      If we argue in a similar manner for $u_0$ we have $u_0=v'_0 n_0 v_0$,
      where
    ]
    $ v_0,v'_0 in V^1, quad n_0 in N^1 $ <eq:13-7-4-g2-base-bruhat>
    #block(sticky: true)[and]
    $
      n_0 dot e_(-3a-2b)=e_(3a+2b)+"terms involving different" e_r "'s."
    $ <eq:13-7-4-g2-base-coefficient>
    // E061: singular subject requires element, not the printed elements.
    Now $n$ and $n_0$ are elements of $N^1$ corresponding to the element $w_0$
    of $W^1$. For $w_0$ is the only non-unit element of $W^1$. Thus $n,n_0$
    operate monomially on the root vectors and we have
    $
        n dot e_(-3a-2b) & =-t^2 e_(3a+2b), \
      n_0 dot e_(-3a-2b) & =e_(3a+2b).
    $ <eq:13-7-4-g2-monomial-images>
    Also $n_0^(-1) dot n$ must be an element of $H^1$ satisfying
    $ n_0^(-1)n dot e_(-3a-2b)=-t^2 e_(-3a-2b). $
    <eq:13-7-4-g2-torus-coefficient>
    // E059: a torus parameter must be nonzero.
    However, the $sigma$-invariant elements of $H$ are those of the form
    $h_a (u^theta)h_b (u)$ for all $u in K^ast$. Such an element operates on
    $e_(-3a-2b)$ as follows:
    $
      h_a (u^theta)h_b (u) dot e_(-3a-2b)
      & =(u^theta)^(A_(a,-3a-2b))u^(A_(b,-3a-2b))e_(-3a-2b) \
      & =u^(-1)e_(-3a-2b).
    $ <eq:13-7-4-g2-torus-action>
    We now compare coefficients and see that
    $ n_0^(-1)n=h_a ((-t^(-2))^theta)h_b (-t^(-2)). $
    <eq:13-7-4-g2-torus-identification>
    #block(sticky: true)[Thus]
    $ h_a ((-t^(-2))^theta)h_b (-t^(-2)) in H^1. $
    <eq:13-7-4-g2-negative-squares>
    #block(sticky: true)[
      Putting $t=1$ we have
    ]
    $ h_a ((-1)^theta)h_b (-1) in H^1 $ <eq:13-7-4-g2-minus-one>
    and by multiplying these two elements we obtain
    $ h_a ((t^(-2))^theta)h_b (t^(-2)) in H^1. $ <eq:13-7-4-g2-squares>
    Thus the group of $sigma$-invariant elements of $H$ will be generated by
    elements of $H^1$ provided the multiplicative group of $K$ is generated by
    the squares in $K$ and the element $-1$.

    Now $K$ is assumed finite and so the non-zero squares in $K$ form a subgroup
    of the multiplicative group of $K$ of index 2. The multiplicative group is
    therefore generated by the squares together with any single
    #source(262, "249")
    non-square. We show that $-1$ is a non-square. Suppose $t^2=-1$. Then
    $t^(2theta)=(-1)^theta=-1$. Thus $t^(2theta)=t^2$ and so
    $t^theta=plus.minus t$. Hence $t^(theta^2)=t$ and
    $ t^(3theta^2)=t^3=-t. $ <eq:13-7-4-nonsquare-contradiction>
    But the automorphism $theta$ of $K$ satisfies $3theta^2=1$. Hence
    $t^(3theta^2)=t$ and we have a contradiction. This completes the proof. #qed

    It is not known whether the result of #book-ref("th", "13-7-4", [13.7.4])
    holds if $frak(L)=G_2$ and $K$ is infinite. For further information on the
    situation in this case see Ree #bib-ref("ree1961twisted") and Steinberg
    #bib-ref(
      "steinberg1967lectures",
    ).
  ]
]

#import "chapter-preview.typ": chapter-preview
#chapter-preview(13, chapter)
