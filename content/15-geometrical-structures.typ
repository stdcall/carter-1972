#let chapter = [
  #[
    #import "main-defs.typ": book-ref, qed, source
    #let codim = math.op("codim")
    #let rank = math.op("rank")
    #let st = math.op("St")

    #source(287, "274")
    = Associated Geometrical Structures <ch:geometrical-structures>

    Certain geometrical structures, called buildings, on which groups with a
    #box[$(B,N)$-pair] operate as groups of automorphisms, have recently been
    introduced by J. Tits. We shall describe these structures here and
    demonstrate the connection with groups with a #box[$(B,N)$-pair]. Closely
    connected to these geometries are somewhat simpler structures on which Weyl
    groups (or more generally Coxeter groups) operate as groups of
    automorphisms. These structures are the Coxeter complexes, which we have
    described in earlier chapters. However, in order to describe the buildings
    we first need an axiomatic system which picks out the essential features of
    the Coxeter complex. A geometry satisfying these axioms will be called an
    _abstract Coxeter complex_. We shall introduce these ideas by means of a
    series of definitions of increasing complexity.

    == Chamber Complexes <sec:chamber-complexes>

    We consider a set $Theta$ endowed with a relation $subset.eq$ of partial
    ordering. $Theta$ is called a _simplex_ if $Theta$ is isomorphic to the set
    of all subsets of some set, partially ordered by inclusion. $Theta$ is
    called a _complex_ if:

    #enum(
      numbering: "(a)",
      [For each $A in Theta$ the set of elements $B in Theta$ such that
        $B subset.eq A$ forms a simplex.],
      [Each pair of elements $A,B in Theta$ has a greatest lower bound
        $A inter B$.],
    )

    It follows from (a), (b) that a complex $Theta$ contains a unique minimal
    element, which will be called $0$.

    We define the rank of each element of a complex $Theta$. Rank $A$ is the
    number of elements $B$ such that $B$ is minimal with respect to the
    properties $B subset.eq A$, $B != 0$. Thus the set of elements $B$ with
    $B subset.eq A$ is isomorphic to the set of subsets of a set with
    cardinality $rank A$.

    A subset $Theta'$ of $Theta$ with the induced partial ordering is called a
    _subcomplex_ if, for all $A in Theta'$, $B in Theta$ with $B subset.eq A$,
    we have $B in Theta'$. There exist subsets of a complex $Theta$ which are
    complexes, although not subcomplexes of $Theta$. For example, let
    $A in Theta$ and define $st A$ (the star of $A$) by:
    $ st A={B in Theta; B supset.eq A}. $ <eq:15-1-star>
    #source(288, "275")
    Then $st A$ is a complex contained in $Theta$ but not a subcomplex of
    $Theta$ (unless $A=0$).

    #block(sticky: true)[
      For any two elements $A,B in Theta$ with $A subset.eq B$ we define the
      codimension of $A$ in $B$ by
    ]
    $ codim_B A=rank_(st A) B. $ <eq:15-1-codimension>
    In particular $codim_B A=1$ if and only if $A != B$ and there is no element
    $X$ with $A subset X subset B$. Also $codim_B A=0$ if and only if $A=B$.

    A complex $Theta$ is called a _chamber complex_ if:

    #enum(
      numbering: "(a)",
      [Every element of $Theta$ is contained in a maximal element.],
      [Given any two maximal elements $C,C'$ of $Theta$ there exists a finite
        sequence
        $ C=C_0,C_1,C_2,...,C_m=C' $ <eq:15-1-chamber-sequence>
        of elements of $Theta$ such that
        $
          codim_(C_(i-1))(C_(i-1) inter C_i)
          =codim_(C_i)(C_(i-1) inter C_i)<=1
        $ <eq:15-1-chamber-adjacency>
        for $i=1,...,m$.],
    )

    The maximal elements of a chamber complex will be called chambers. The above
    condition on the codimension means that $C_(i-1)$ is either equal to $C_i$
    or that $C_(i-1) != C_i$ and the intersection has codimension $1$ in each.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-1-1>
      #smallcaps[Lemma 15.1.1.] _An element of a chamber complex has the same
      codimension in all the chambers containing it._
    ]

    #smallcaps[Proof.] Let $A in Theta$ be contained in two chambers $C,C'$.
    Then there exists a sequence
    $ C=C_0,C_1,...,C_m=C' $ <eq:15-1-1-sequence>
    as above. Let $B=C_0 inter C_1 inter dots inter C_m inter A$. Then
    $
      codim_(C_(i-1)) B=codim_(C_i) B quad "for" i=1,...,m
    $ <eq:15-1-1-successive-codimensions>
    and so
    $ codim_C B=codim_(C') B. $ <eq:15-1-1-equal-codimensions>
    Now it is readily verified that
    $codim_C (C_0 inter C_1 inter dots inter C_m)$ is finite and it follows that
    $codim_A B$ is finite also. Hence
    $
      codim_C A & =codim_C B-codim_A B \
                & =codim_(C') B-codim_A B=codim_(C') A.
    $ <eq:15-1-1-subtraction>
    #qed

    #source(289, "276")
    It follows from #book-ref("l", "15-1-1", [15.1.1]) that the terms of a
    sequence $C_0,C_1,...,C_m$ of the type described above are all chambers. A
    sequence of chambers of this type will be called a _gallery_. Two chambers
    $C,C'$ are said to be _adjacent_ if $codim(C inter C')=1$. Thus a gallery is
    a sequence of chambers in which every pair of consecutive chambers are
    either identical or adjacent.

    We now consider maps from one chamber complex to another. Let $Theta,Theta'$
    be chamber complexes. A map $alpha:Theta -> Theta'$ is called a _morphism_
    of chamber complexes if:

    #enum(
      numbering: "(a)",
      [$alpha(C)$ is a chamber of $Theta'$ for each chamber $C in Theta$.],
      [For each chamber $C in Theta$, $alpha$ induces an isomorphism between the
        simplexes determined by $C,alpha(C)$.],
    )

    It is clear that a morphism of chamber complexes preserves the partial
    ordering ($B subset.eq A$ implies $alpha(B) subset.eq alpha(A)$) and leaves
    invariant the rank of each element. A morphism of $Theta$ into itself is
    called an endomorphism, and an endomorphism which is invertible is called an
    automorphism.

    A chamber complex is said to be _thin_ if every element of codimension $1$
    is contained in exactly two chambers and _thick_ if every element of
    codimension $1$ is contained in at least three chambers.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-1-2>
      #smallcaps[Lemma 15.1.2.] _Let $Theta,Theta'$ be two chamber complexes in
      which each element of codimension $1$ is contained in at most two
      chambers, and let $alpha,beta$ be two morphisms of $Theta$ into $Theta'$
      injective on the set of chambers. Suppose there exists a chamber
      $C in Theta$ such that $alpha(A)=beta(A)$ for all $A subset.eq C$. Then
      $alpha=beta$._
    ]

    #smallcaps[Proof.] The elements $A$ satisfying $A subset.eq C$ will be
    called the _faces_ of $C$. Suppose there is a chamber $C' in Theta$ such
    that $alpha,beta$ do not coincide on the faces of $C'$. Let $Gamma$ be a
    gallery of minimal length joining $C$ to $C'$. Then
    $ Gamma={C=C_0,C_1,...,C_m=C'}. $ <eq:15-1-2-minimal-gallery>
    Now there exists an integer $i$ such that $alpha,beta$ coincide on the faces
    of $C_(i-1)$ but not on all faces of $C_i$. We have
    $
      beta(C_i) supset beta(C_(i-1) inter C_i)
      =alpha(C_(i-1) inter C_i).
    $ <eq:15-1-2-common-face>
    But $alpha(C_(i-1) inter C_i)$ is contained in only two chambers, which are
    $alpha(C_(i-1))$ and $alpha(C_i)$ since $alpha$ is injective on chambers.
    Thus $beta(C_i)=alpha(C_(i-1))$ or $beta(C_i)=alpha(C_i)$.

    Suppose $beta(C_i)=alpha(C_(i-1))$. Then $beta(C_i)=beta(C_(i-1))$,
    contradicting the fact that $beta$ is injective on chambers. ($C_(i-1),C_i$
    are distinct since $Gamma$ is a gallery of minimal length joining $C$ to
    $C'$.) Thus $beta(C_i)=alpha(C_i)$. Hence
    #source(290, "277")
    $alpha,beta$ coincide on $C_i$ and on all faces of the element
    $C_(i-1) inter C_i$ of codimension $1$ in $C_i$. Since the faces of $C_i$
    form a simplex and $alpha,beta$ are isomorphisms between the simplexes
    determined by $C_i$ and $alpha(C_i)$ it follows that $alpha,beta$ coincide
    on all faces of $C_i$, and we have a contradiction.
    #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #import "diagrams/foldings.typ": folding-panel
    #let abar = $overline(alpha)$
    #let bbar = $overline(beta)$
    #let dist = math.op("dist")

    == Foldings <sec:foldings>

    Let $Theta$ be a thin chamber complex. A _folding_ of $Theta$ is an
    endomorphism $alpha$ of $Theta$ satisfying:

    #enum(numbering: "(a)", [$alpha^2=alpha$ ($alpha$ is idempotent).], [Each
      chamber in $alpha(Theta)$ is the image under $alpha$ of exactly two
      chambers of $Theta$.])

    The idea of a folding is the key to the definition of an abstract Coxeter
    complex. We shall now elucidate some properties of foldings.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-2-1>
      #smallcaps[Lemma 15.2.1.] _Let $alpha$ be a folding of $Theta$. Then there
      exist adjacent chambers $C,C'$ of $Theta$ such that $C in alpha(Theta)$,
      $C' in.not alpha(Theta)$. If $C,C'$ are any two such chambers we have
      $alpha(C')=C$._
    ]

    #smallcaps[Proof.] Since $alpha$ is idempotent there exist chambers
    $C_1,C_2$ with $C_1 in alpha(Theta)$, $C_2 in.not alpha(Theta)$. Since
    $C_1,C_2$ can be joined by a gallery there exists a pair of adjacent
    chambers $C,C'$ in such a gallery with $C in alpha(Theta)$,
    $C' in.not alpha(Theta)$.

    Now all the faces of $C$ are in $alpha(Theta)$ and so $alpha$ acts as the
    identity on them. In particular $alpha(C inter C')=C inter C'$. Thus
    $alpha(C') supset C inter C'$. Since $Theta$ is thin this implies that
    $alpha(C')=C$ or $alpha(C')=C'$. But $C' in.not alpha(Theta)$, thus
    $alpha(C')=C$.
    #qed

    A set of chambers in a chamber complex is called _convex_ if every gallery
    of minimal length joining two chambers in the set has all its terms in the
    set.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-2-2>
      #smallcaps[Lemma 15.2.2.] _Let $alpha$ be a folding of $Theta$. Then the
      chambers in $alpha(Theta)$ form a convex set in $Theta$._
    ]

    #smallcaps[Proof.] Let $C,C'$ be two chambers in $alpha(Theta)$ and
    $ Gamma={C=C_0,C_1,...,C_m=C'} $ <eq:15-2-2-minimal-gallery>
    be a gallery of minimal length joining $C,C'$. Suppose $Gamma$ contains some
    #source(291, "278")
    term $C_i in.not alpha(Theta)$. Then we can find two consecutive terms
    $C_(j-1),C_j$ in $Gamma$ such that $C_(j-1) in alpha(Theta)$,
    $C_j in.not alpha(Theta)$. Now $alpha(Gamma)={alpha(C_0),...,alpha(C_m)}$ is
    also a gallery joining $C$ to $C'$. By #book-ref("l", "15-2-1", [15.2.1]) we
    have $alpha(C_j)=C_(j-1)$ and so
    $ alpha(C_(j-1))=alpha(C_j). $ <eq:15-2-2-collapsed-edge>
    Thus two consecutive terms of $alpha(Gamma)$ are the same, and by omitting
    one we could obtain a gallery joining $C$ to $C'$ of shorter length than
    $Gamma$, a contradiction.
    #qed

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-2-3>
      #smallcaps[Lemma 15.2.3.] _Let $alpha$ be a folding of $Theta$. Then the
      chambers not in $alpha(Theta)$ also form a convex set in $Theta$._
    ]

    #smallcaps[Proof.] To establish this result we introduce a map $abar$ on the
    set of chambers of $Theta$. If $C$ is a chamber not in $alpha(Theta)$ we
    define $abar(C)=C$; while if $C in alpha(Theta)$, $C$ is the image under
    $alpha$ of exactly two chambers. One of these is $C$ and the other is
    defined as $abar(C)$.

    Let $C,C'$ be two chambers not in $alpha(Theta)$ and
    $ Gamma={C=C_0,C_1,...,C_m=C'} $ <eq:15-2-3-minimal-gallery>
    be a gallery of minimal length joining $C,C'$. We show that $abar(Gamma)$ is
    also a gallery. To do this we must prove that the images under $abar$ of two
    adjacent chambers $D,D'$ are either adjacent or identical. This is clear if
    neither $D,D'$ is in $alpha(Theta)$. So suppose $D in alpha(Theta)$. Then
    $alpha(abar(D))=D$. Let $A$ be the face of $abar(D)$ such that
    $alpha(A)=D inter D'$. Let $D''$ be the chamber containing $A$ other than
    $abar(D)$.

    #align(center)[#folding-panel()] <fig:15-2-3-folding-panel>

    If $D'' in alpha(Theta)$, we have $A in alpha(Theta)$ and so $alpha(A)=A$.
    Then $abar(D)=D'$ since $Theta$ is thin and $abar(D) in.not alpha(Theta)$.
    Thus $abar(D')=D'$ and $abar(D)=abar(D')$.

    If $D'' in.not alpha(Theta)$, we have $alpha(D'') != D$ (since
    $D'' != abar(D)$). Thus $alpha(D'')=D'$ and $D''=abar(D')$. Hence
    $abar(D),abar(D')$ are adjacent.

    Thus $abar(D),abar(D')$ are either adjacent or identical and so
    $
      abar(Gamma)={abar(C_0),abar(C_1),...,abar(C_m)}
    $ <eq:15-2-3-image-gallery>
    is also a gallery joining $C,C'$. Suppose some term of $Gamma$ is in
    $alpha(Theta)$. Then we can find two consecutive terms $C_(i-1),C_i$ of
    $Gamma$ with $C_(i-1) in.not alpha(Theta)$, $C_i in alpha(Theta)$.
    #source(292, "279")
    Then $alpha(C_(i-1))=C_i$ by #book-ref("l", "15-2-1", [15.2.1]) and so
    $abar(C_i)=C_(i-1)$. Thus $abar(C_i)=abar(C_(i-1))$ and the gallery
    $abar(Gamma)$ has two consecutive terms which are equal. By omitting one of
    these we would obtain a gallery joining $C,C'$ which is shorter than
    $Gamma$, a contradiction.
    #qed

    #block(sticky: true)[
      Let $C,C'$ be chambers in a chamber complex $Theta$. The distance between
      $C,C'$ is defined as the shortest length of a gallery joining $C,C'$. Thus
      if $Gamma={C=C_0,C_1,...,C_m=C'}$ is a gallery for which $m$ is minimal we
      define
    ]
    $ dist C C'=m. $ <eq:15-2-distance>
    In particular, $dist C C'=0$ if and only if $C=C'$ and $dist C C'=1$ if and
    only if $C,C'$ are adjacent.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-2-4>
      #smallcaps[Lemma 15.2.4.] _Let $alpha$ be a folding of the thin chamber
      complex $Theta$ and $C,C'$ be adjacent chambers of $Theta$ such that
      $C in alpha(Theta)$, $C' in.not alpha(Theta)$. Then for any chamber $D$ of
      $Theta$ we have:_
      $
        dist C' D=dist C D+1 quad & "if" D in alpha(Theta), \
        dist C' D=dist C D-1 quad & "if" D in.not alpha(Theta).
      $ <eq:15-2-4-distance-split>
    ]

    #smallcaps[Proof.] Since $C,C'$ are adjacent it is clear that
    $ dist C D-1<=dist C' D<=dist C D+1. $ <eq:15-2-4-distance-bounds>
    Suppose $D in alpha(Theta)$ and $Gamma$ is a gallery of minimal length
    joining $D$ to $C'$. Then $Gamma$ contains two consecutive terms, one in
    $alpha(Theta)$ and the other not. By #book-ref("l", "15-2-1", [15.2.1])
    $alpha(Gamma)$ is a gallery joining $D$ to $C$ which contains two
    consecutive terms which are equal. Hence $dist C D<=dist C' D-1$, and we
    must have equality.

    If $D in.not alpha(Theta)$ we take a gallery $Gamma$ of minimal length
    joining $D$ to $C$. By the proof of #book-ref("l", "15-2-3", [15.2.3])
    $abar(Gamma)$ is a gallery joining $D$ to $C'$ which contains two
    consecutive terms which are equal. Hence $dist C' D<=dist C D-1$, and we
    again have equality.
    #qed

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-2-5>
      #smallcaps[Proposition 15.2.5.] _Let $alpha$ be a folding of $Theta$ and
      $C,C'$ be adjacent chambers of $Theta$ such that $C in alpha(Theta)$,
      $C' in.not alpha(Theta)$. Then $alpha$ is the only folding such that
      $alpha(C')=C$._
    ]

    #smallcaps[Proof.] We showed in #book-ref("l", "15-2-1", [15.2.1]) that
    $alpha(C')=C$. Let $beta$ be any folding of $Theta$ such that $beta(C')=C$.
    Then #book-ref("l", "15-2-4", [15.2.4]) implies that, for any chamber
    #source(293, "280")
    $D in Theta$, $D$ belongs to $alpha(Theta)$ if and only if $D$ belongs to
    $beta(Theta)$. Since $alpha(Theta),beta(Theta)$ are chamber complexes we
    have $alpha(Theta)=beta(Theta)$. $alpha$ and $beta$, being idempotent, both
    operate as the identity on $alpha(Theta)$.

    Let $abar(Theta)$ be the subcomplex of $Theta$ consisting of all faces of
    all chambers of the form $abar(D)$ for $D in Theta$. The chambers of form
    $abar(D)$ for $D in Theta$ are those which are not in $alpha(Theta)$, and so
    form a convex set by #book-ref("l", "15-2-3", [15.2.3]). Hence $abar(Theta)$
    is a chamber complex. Similarly $bbar(Theta)$ is a chamber complex. By
    #book-ref(
      "l",
      "15-2-4",
      [15.2.4],
    ) a chamber belongs to $abar(Theta)$ if and only if it belongs to
    $bbar(Theta)$, hence $abar(Theta)=bbar(Theta)$.

    Now consider the two morphisms:
    $
      abar(Theta) attach(arrow.r, t: alpha) Theta, quad
      abar(Theta) attach(arrow.r, t: beta) Theta.
    $ <eq:15-2-5-restricted-morphisms>
    Since $alpha,beta$ are foldings, they are injective on chambers when
    restricted to $abar(Theta)$. Moreover, $alpha,beta$ coincide on the chamber
    $C' in abar(Theta)$ and on all the faces of the element $C inter C'$. Thus
    $alpha,beta$ coincide on all faces of $C'$. By #book-ref(
      "l",
      "15-1-2",
      [15.1.2],
    ) it follows that $alpha,beta$ coincide on $abar(Theta)$. But
    $alpha(Theta) union abar(Theta)=Theta$, thus $alpha,beta$ coincide on
    $Theta$.
    #qed

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-2-6>
      #smallcaps[Proposition 15.2.6.] _Let $alpha$ be a folding of $Theta$ and
      $C,C'$ be adjacent chambers of $Theta$ such that $alpha(C')=C$. Suppose
      there is a folding $beta$ such that $beta(C)=C'$. Then $beta$ has the same
      property for any other pair of adjacent chambers of this type, viz., if
      $D,D'$ are adjacent and $alpha(D')=D$, then $beta(D)=D'$._
    ]

    #smallcaps[Proof.] By #book-ref("l", "15-2-4", [15.2.4]) a chamber is in
    $alpha(Theta)$ if and only if it is not in $beta(Theta)$. Thus
    $D' in beta(Theta)$, $D in.not beta(Theta)$, and so $beta(D)=D'$ by
    #book-ref(
      "l",
      "15-2-1",
      [15.2.1],
    ).
    #qed

    The folding $beta$ of #book-ref("p", "15-2-6", [15.2.6]) which, when it
    exists, is uniquely determined by $alpha$, is called the _opposite folding_
    of $alpha$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-2-7>
      #smallcaps[Proposition 15.2.7.] _Let $alpha,beta$ be opposite foldings of
      $Theta$. Then there exists an automorphism $rho$ of $Theta$ which
      coincides with $beta$ on $alpha(Theta)$ and with $alpha$ on $beta(Theta)$.
      Also, $rho^2$ is the identity._
    ]

    #smallcaps[Proof.] $alpha,beta$ both operate as the identity on
    $alpha(Theta) inter beta(Theta)$, so $rho$ is well-defined. It is clearly an
    endomorphism of $Theta$. Now $rho$ is injective on chambers. For if
    $rho(C_1)=rho(C_2) in alpha(Theta)$ we have $C_1,C_2 in beta(Theta)$ and
    $ alpha(C_1)=alpha(C_2), $ <eq:15-2-7-equal-images>
    whence $C_1=C_2$. The same applies if $rho(C_1)=rho(C_2) in beta(Theta)$. It
    follows that
    #source(294, "281")
    $rho^2$ is injective on chambers also. Let $C,C'$ be a pair of adjacent
    chambers such that $alpha(C')=C$ and $beta(C)=C'$. Then $rho^2$ fixes $C$
    and also fixes each face of $C inter C'$, hence $rho^2$ fixes each face of
    $C$. By #book-ref(
      "l",
      "15-1-2",
      [15.1.2],
    ) $rho^2$ is the identity. In particular $rho$ is invertible, so is an
    automorphism.
    #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let st = math.op("St")
    #let dist = math.op("dist")

    == Abstract Coxeter Complexes <sec:abstract-coxeter-complexes>

    An abstract Coxeter complex is a thin chamber complex $Sigma$ such that,
    given any pair $C,C'$ of adjacent chambers, there exists a folding $alpha$
    of $Sigma$ with $alpha(C')=C$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-3-1>
      #smallcaps[Lemma 15.3.1.] _Let $Sigma$ be an abstract Coxeter complex and
      $A$ be an element of $Sigma$. Then $st_Sigma A$ is also an abstract
      Coxeter complex._
    ]

    #smallcaps[Proof.] $st_Sigma A$ is certainly a complex. To show it is a
    chamber complex, let $C,C'$ be chambers containing $A$. There exists a
    gallery
    $ Gamma={C=C_0,C_1,...,C_m=C'} $ <eq:15-3-1-gallery>
    in $Sigma$ joining $C,C'$, where $m=dist C C'$. Let $alpha$ be the folding
    of $Sigma$ such that $alpha(C)=C_1$. Then
    $ dist C_1 C'=dist C C'-1, $ <eq:15-3-1-distance>
    hence $C' in alpha(Sigma)$ by #book-ref("l", "15-2-4", [15.2.4]). Thus all
    faces of $C inter C'$ are in $alpha(Sigma)$. Consider the minimal non-zero
    faces of $C$. These are all faces of $C inter C_1$ except one, which we call
    $V$. Now $V subset.eq C$ and so $alpha(V) subset.eq C_1$, hence
    $alpha(V) != V$. Thus $V in.not alpha(Sigma)$, and so $V$ cannot be a face
    of $C inter C'$. It follows that $C inter C' subset.eq C inter C_1$. Hence
    $A$ is contained in $C_1$. Using induction we see that $A$ is contained in
    each $C_i$. Thus $st A$ is a chamber complex. $st_Sigma A$ is certainly
    thin, so it remains only to check the existence of all possible foldings.

    Let $C,C'$ be adjacent chambers both containing $A$. There is a folding
    $alpha$ of $Sigma$ with $alpha(C')=C$. $alpha$ fixes $A$, so induces an
    idempotent endomorphism of $st_Sigma A$. The same applies to the opposite
    folding $beta$ of $alpha$. Let $D$ be any chamber in $alpha(Sigma)$
    containing $A$. Then $beta(D)$ also contains $A$, and
    $ alpha beta(D)=rho^2(D)=D $ <eq:15-3-1-opposite-folding>
    by #book-ref("p", "15-2-7", [15.2.7]). Thus the two chambers $D$ and
    $beta(D)$ which $alpha$ transforms into $D$ both contain $A$. Hence $alpha$
    induces a folding of $st_Sigma A$.
    #qed

    #source(295, "282")
    We shall now prove some general properties of abstract Coxeter complexes,
    showing first that such a complex can be ‘folded down’ into a single
    chamber.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-3-2>
      #smallcaps[Proposition 15.3.2.] _Let $Sigma$ be an abstract Coxeter
      complex, $C$ a chamber in $Sigma$ and $S(C)$ the simplex of all faces of
      $C$. Then there exists a unique idempotent morphism of $Sigma$ onto
      $S(C)$._
    ]

    _Note._ An idempotent morphism will be called a retraction.

    #smallcaps[Proof.] Let $Gamma={C=C_0,C_1,...,C_m}$ be any gallery beginning
    with $C$. We show there is an endomorphism $gamma$ of $Sigma$ leaving
    invariant all faces of $C$ such that $gamma(Gamma)={C,C,...,C}$. We use
    induction on the length $m$ of $Gamma$, the result being clear if $m=0$. If
    $C_1=C$ the result is clear by induction, so we assume $C_1 != C$. There is
    a folding $alpha$ of $Sigma$ with $alpha(C_1)=C$. Thus
    $alpha(Gamma)={C,C,...,alpha(C_m)}$. By induction there exists an
    endomorphism $delta$ leaving invariant all faces of $C$ such that
    $delta alpha(Gamma)={C,C,...,C}$. Then $gamma=delta alpha$ has the required
    properties.

    It follows that, given any finite set $C_i$ of chambers of $Sigma$, there
    exists an endomorphism $gamma$ of $Sigma$ leaving invariant all faces of $C$
    such that $gamma(C_i)=C$ for each $i$. For there exists a gallery beginning
    with $C$ and containing all the $C_i$.

    Now for each $A in Sigma$ there exists an endomorphism $gamma$ leaving
    invariant all faces of $C$ such that $gamma(A) in S(C)$. For if we choose a
    chamber $C'$ containing $A$ there is an endomorphism $gamma$ fixing all
    faces of $C$ with $gamma(C')=C$. We now show that the element
    $gamma(A) in S(C)$ is uniquely determined, i.e. that if $gamma,delta$ are
    endomorphisms of $Sigma$ leaving invariant all faces of $C$ such that
    $gamma(A) in S(C)$ and $delta(A) in S(C)$, then $gamma(A)=delta(A)$.

    Let $C'$ be a chamber containing $A$ and $Gamma={C=C_0,C_1,...,C_m=C'}$ be a
    gallery joining $C$ to $C'$. Consider the galleries $gamma(Gamma)$ and
    $delta(Gamma)$. There is an endomorphism $epsilon$ of $Sigma$ which leaves
    invariant all faces of $C$ and maps each chamber in $gamma(Gamma)$ and in
    $delta(Gamma)$ to $C$. Consider the endomorphisms $epsilon gamma$,
    $epsilon delta$ of $Sigma$. They agree on all faces of $C=C_0$. Suppose by
    induction that they agree on all faces of $C_(i-1)$. Then they agree on
    $C_i$ and on all faces of $C_(i-1) inter C_i$, thus (by the usual argument)
    they agree on all faces of $C_i$. In particular
    $epsilon gamma,epsilon delta$ agree on all faces of $C_m=C'$. Thus
    $epsilon gamma(A)=epsilon delta(A)$. Since $gamma(A),delta(A)$ are in $S(C)$
    this gives $gamma(A)=delta(A)$.

    We now define $rho_C (A)$ to be the common value $gamma(A)$ for all
    endomorphisms $gamma$ of $Sigma$ leaving invariant all faces of $C$ and such
    that $gamma(A) in S(C)$. It is clear that $rho_C$ is an endomorphism from
    $Sigma$ into $S(C)$ and that $rho_C$
    #source(296, "283")
    leaves invariant all faces of $C$. It is equally clear that $rho_C$ is the
    only endomorphism with this property.
    #qed

    The map $rho_C$ is called the retraction of $Sigma$ on to the simplex of
    faces of $C$.

    We now introduce an equivalence relation on $Sigma$. Given $A,B in Sigma$ we
    write $A tilde B$ if $rho_C (A)=rho_C (B)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-3-3>
      #smallcaps[Lemma 15.3.3.] _The equivalence relation defined on $Sigma$ is
      independent of the chamber $C$._
    ]

    #smallcaps[Proof.] Let $C'$ be another chamber of $Sigma$. We show that the
    equivalence relations for $C,C'$ are the same. Since any two chambers can be
    joined by a gallery we may assume $C,C'$ are adjacent. By #book-ref(
      "p",
      "15-2-7",
      [15.2.7],
    ) there exists an automorphism $delta$ of $Sigma$ such that $delta(C)=C'$.
    Also $delta$ maps each face of $C inter C'$ into itself. Thus $delta$
    coincides with $rho_(C')$ on each face of $C inter C'$. Since
    $delta(C)=rho_(C')(C)$, $delta$ coincides with $rho_(C')$ on each face of
    $C$. Similarly $delta^(-1)$ coincides with $rho_C$ on each face of $C'$.
    Thus $delta rho_C$ is an endomorphism of $Sigma$ into $S(C')$:
    $
      Sigma attach(arrow.r, t: rho_C) S(C)
      attach(arrow.r, t: delta) S(C')
    $ <eq:15-3-3-retraction-composition>
    and $delta rho_C$ leaves invariant each face of $C'$. Hence
    $delta rho_C=rho_(C')$. It follows that $rho_C (A)=rho_C (B)$ if and only if
    $rho_(C')(A)=rho_(C')(B)$.
    #qed

    We shall say that equivalent elements of $Sigma$ have the same type. It is
    clear that each chamber has exactly one face of each type.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-3-4>
      #smallcaps[Lemma 15.3.4.] _Let $Sigma$ be an abstract Coxeter complex and
      $C$ be a chamber of $Sigma$. Let $gamma$ be an endomorphism of $Sigma$
      leaving invariant the type of each face of $C$. Then $gamma$ preserves the
      type of each element of $Sigma$._
    ]

    #smallcaps[Proof.] Let $C'$ be another chamber of $Sigma$. We show that
    $gamma$ leaves invariant the type of each face of $C'$. Since any two
    chambers may be joined by a gallery we may assume that $C,C'$ are adjacent.
    Now $gamma$ leaves invariant the type of each face of $C inter C'$ and it
    also leaves invariant the type of $C'$. (All chambers have the same type.)
    Thus, since $gamma(C')$ has just one face of each type, $gamma$ leaves
    invariant the type of each face of $C'$.
    #qed

    Endomorphisms and automorphisms of the kind discussed in #book-ref(
      "l",
      "15-3-4",
      [15.3.4],
    ) will be called type-preserving.

    #source(297, "284")
    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-3-5>
      #smallcaps[Lemma 15.3.5.] _The automorphisms $rho$ defined in #book-ref(
        "p",
        "15-2-7",
        [15.2.7],
      ) are type-preserving._
    ]

    #smallcaps[Proof.] Let $alpha,beta$ be a pair of opposite foldings of
    $Sigma$ with respect to which $rho$ is defined. Let $C,C'$ be a pair of
    adjacent chambers such that $C in alpha(Sigma)$, $C' in beta(Sigma)$. Then
    $rho$ leaves invariant each face of $C inter C'$ and interchanges $C,C'$.
    Thus $rho$ preserves the type of $C$ and of each face of $C inter C'$, hence
    $rho$ preserves the type of each face of $C$. By #book-ref(
      "l",
      "15-3-4",
      [15.3.4],
    ) $rho$ is type-preserving.
    #qed

    #metadata((kind: "anchor")) <def:coxeter-complex-group>
    Let $W(Sigma)$ be the group generated by all the automorphisms of $Sigma$ of
    the kind described in #book-ref("p", "15-2-7", [15.2.7]).

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-3-6>
      #smallcaps[Proposition 15.3.6.] _Let $Sigma$ be an abstract Coxeter
      complex. Then $W(Sigma)$ is the group of all type-preserving automorphisms
      of $Sigma$._
    ]

    #smallcaps[Proof.] By #book-ref("l", "15-3-5", [15.3.5]) each element of
    $W(Sigma)$ is a type-preserving automorphism of $Sigma$. Conversely, let
    $delta$ be any type-preserving automorphism of $Sigma$. Let $C$ be a chamber
    of $Sigma$. Since any two chambers can be joined by a gallery it follows
    from #book-ref(
      "p",
      "15-2-7",
      [15.2.7],
    ) and the fact that $Sigma$ is a Coxeter complex that there exists
    $gamma in W(Sigma)$ such that $gamma(C)=delta(C)$. Thus $gamma^(-1) delta$
    is a type-preserving automorphism of $Sigma$ which fixes $C$. But a chamber
    $C$ has just one face of each type. Thus $gamma^(-1) delta$ fixes each face
    of $C$, so must be the identity, by #book-ref("l", "15-1-2", [15.1.2]).
    Hence $delta in W(Sigma)$.
    #qed

    Let $C$ be a chamber of the abstract Coxeter complex $Sigma$. Each chamber
    adjacent to $C$ intersects $C$ in a face of codimension $1$. Now the number
    of faces of codimension $1$ in $C$ is rank $C$ (which may be finite or
    infinite), and each such face is contained in just one chamber other than
    $C$. Thus there are rank $C$ chambers of $Sigma$ adjacent to $C$. Each of
    these chambers gives rise to an involutary type-preserving automorphism of
    $Sigma$ as in #book-ref(
      "p",
      "15-2-7",
      [15.2.7],
    ). These automorphisms will be called the reflections in the faces of
    codimension $1$ in $C$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:15-3-7>
      #smallcaps[Theorem 15.3.7.] _Let $Sigma$ be an abstract Coxeter complex
      and $C$ be a chamber of $Sigma$. Then the reflections in the faces of
      codimension $1$ in $C$ generate the group $W(Sigma)$. Moreover $W(Sigma)$
      is a Coxeter group with respect to this set of generators._ (cf.
      #book-ref(
        "def",
        "2-4-2",
        [2.4.2],
      ).)
    ]

    #smallcaps[Proof.] Let the reflections in the faces of codimension $1$ in
    $C$ be denoted by $w_i$, $i in I$; and let $H$ be the subgroup of $W(Sigma)$
    generated by
    #source(298, "285")
    the $w_i$. We show that for each chamber $D$ of $Sigma$ there exists
    $w in H$ such that $D=w(C)$. We do this by induction on $dist C D$, the
    result being clear if $D$ is identical with $C$ or adjacent to it. Otherwise
    there exists a chamber $E$ adjacent to $D$ such that
    $ dist C E=dist C D-1. $ <eq:15-3-7-induction-distance>
    By induction $E=w'(C)$ for some $w' in H$. Now $w'^(-1)(D)$ is adjacent to
    $C$, so has form $w_i (C)$ for some $i in I$. Thus $w'^(-1)(D)=w_i (C)$ and
    so $D=w'w_i (C)$, where $w'w_i in H$ as required.

    Let $w$ be any element of $W(Sigma)$. Then there exists $w' in H$ such that
    $w'(C)=w(C)$. Thus $w^(-1) w'$ is a type-preserving automorphism of $Sigma$
    fixing $C$, so must be the identity by #book-ref("l", "15-1-2", [15.1.2]).
    Thus $w in H$ and $H=W(Sigma)$.

    We now show that the reflections $w_i$ generate $W(Sigma)$ as a Coxeter
    group. Each element $w in W(Sigma)$ can be expressed as a product
    $ w=w_(i_1) w_(i_2) dots w_(i_k), quad i_alpha in I. $ <eq:15-3-7-word>
    Let $l(w)$ be the minimal length of any expression of $w$ in this form. We
    show that
    $ l(w)=dist(C, w(C)). $ <eq:15-3-7-length-distance>
    Suppose $l(w)=k$ and $w=w_(i_1) w_(i_2) dots w_(i_k)$ with $i_alpha in I$.
    Then
    $
      {C,w_(i_1)(C),w_(i_1) w_(i_2)(C),...,w_(i_1) w_(i_2) dots w_(i_k)(C)}
    $ <eq:15-3-7-word-gallery>
    is a gallery joining $C$ to $w(C)$ of length $k$. Thus $dist(C, w(C))<=k$
    and so $dist(C, w(C))<=l(w)$. Suppose conversely that $dist(C, w(C))=k$.
    Then there is a gallery
    $ Gamma={C=C_0,C_1,...,C_k=w(C)} $ <eq:15-3-7-shortest-gallery>
    joining $C$ to $w(C)$. Since $C,C_1$ are adjacent we have $C_1=w_(i_1)(C)$
    for some $i_1 in I$. Since $C_1,C_2$ are adjacent we have $C_2=w_(i_1)(C')$,
    where $C,C'$ are adjacent. Hence $C_2=w_(i_1) w_(i_2)(C)$ for some
    $i_2 in I$. Arguing in a similar way we see that
    $C_k=w_(i_1) w_(i_2) dots w_(i_k)(C)$ with each $i_alpha in I$. Hence
    $ w(C)=w_(i_1) w_(i_2) dots w_(i_k)(C), $ <eq:15-3-7-equal-chamber-images>
    and since $w$ and $w_(i_1) w_(i_2) dots w_(i_k)$ are both type-preserving we
    have
    $ w=w_(i_1) w_(i_2) dots w_(i_k). $ <eq:15-3-7-equal-automorphisms>
    Thus $l(w)<=dist(C, w(C))$, and so we have $l(w)=dist(C, w(C))$.

    We show next that if $l(w_(i_1) w_(i_2) dots w_(i_k))<k$ and
    $l(w_(i_2) dots w_(i_k))=k-1$, then there is some $j>=2$ such that
    $
      w_(i_2) dots w_(i_j)=w_(i_1) dots w_(i_(j-1)).
    $ <eq:15-3-7-exchange-condition>
    #source(299, "286")
    This will be sufficient, using a theorem of Matsumoto, to show that
    $W(Sigma)$ is a Coxeter group. Let $w=w_(i_1) w_(i_2) dots w_(i_k)$ and
    write
    $ C_r=w_(i_1) w_(i_2) dots w_(i_r)(C) $ <eq:15-3-7-prefix-chambers>
    for $r=1,2,...,k$. Then
    $
      dist(C_1, w(C)) & =dist(w_(i_1)(C), w_(i_1) dots w_(i_k)(C)) \
                      & =dist(C, w_(i_2) dots w_(i_k)(C)) \
                      & =l(w_(i_2) dots w_(i_k)) \
                      & =k-1.
    $ <eq:15-3-7-tail-distance>
    Also
    $ dist(C, w(C))=l(w)<=k-1. $ <eq:15-3-7-nonreduced-distance>
    Thus we have
    $ dist(C, w(C))<=dist(C_1, w(C)). $ <eq:15-3-7-distance-comparison>
    Let $alpha$ be the folding with $alpha(C_1)=C$. By #book-ref(
      "l",
      "15-2-4",
      [15.2.4],
    ) we have $w(C) in alpha(Sigma)$. Since $C_1 in.not alpha(Sigma)$, there
    exists $j>=2$ such that $C_(j-1) in.not alpha(Sigma)$ but
    $C_j in alpha(Sigma)$. Then $alpha(C_(j-1))=C_j$. By definition of $alpha$
    we have $alpha(C_(j-1))=w_(i_1)(C_(j-1))$, hence $w_(i_1)(C_(j-1))=C_j$.
    Thus we have
    $
      w_(i_1) dot w_(i_1) w_(i_2) dots w_(i_(j-1))(C)
      =w_(i_1) w_(i_2) dots w_(i_j)(C).
    $ <eq:15-3-7-boundary-reflection>
    Since all the automorphisms involved are type-preserving it follows that
    $
      w_(i_2) dots w_(i_(j-1))=w_(i_1) w_(i_2) dots w_(i_j),
    $ <eq:15-3-7-cancelled-word>
    whence
    $
      w_(i_1) dots w_(i_(j-1))=w_(i_2) dots w_(i_j).
    $ <eq:15-3-7-exchange-equality>
    The proof of #book-ref("th", "15-3-7", [15.3.7]) is completed by
    establishing the following result, due to Matsumoto.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:15-3-8>
      #smallcaps[Theorem 15.3.8.] _Let $W$ be a group generated by a set of
      involutions $w_i$. For each $w in W$ let $l(w)$ be the shortest length of
      any expression of $w$ as a product of the involutary generators. A product
      $w_(i_1) dots w_(i_k)$ is called reduced if $l(w_(i_1) dots w_(i_k))=k$.
      Suppose $W$ satisfies the condition that, whenever $w_(i_2) dots w_(i_k)$
      is reduced but $w_(i_1) dots w_(i_k)$ is not reduced, there exists an
      integer $j$ with $2<=j<=k$ such that
      $w_(i_2) dots w_(i_j)=w_(i_1) dots w_(i_(j-1))$. Then $W$ is generated by
      the $w_i$ as a Coxeter group._
    ]

    (The group $W(Sigma)$ considered above satisfies the hypotheses of this
    theorem.)

    #smallcaps[Proof.] Any relation between the generators $w_i$ can be
    expressed in the form
    $ w_(i_1) dots w_(i_r)=1. $ <eq:15-3-8-relation>
    #source(300, "287")
    We show first that any such relation is a consequence of relations of form
    $w_i^2=1$ and
    $ w_(j_1) dots w_(j_s)=w_(k_1) dots w_(k_s), $ <eq:15-3-8-reduced-relation>
    where both expressions are reduced. We prove this by induction on $r$. Since
    $w_(i_1) dots w_(i_r)$ is not reduced there exists $alpha$ such that
    $w_(i_(alpha+1)) dots w_(i_r)$ is reduced but $w_(i_alpha) dots w_(i_r)$ is
    not. Thus there exists an integer $j<=r$ such that
    $w_(i_alpha) dots w_(i_(j-1))=w_(i_(alpha+1)) dots w_(i_j)$. Both
    expressions in this equation are reduced. Using this relation and
    $w_(i_alpha)^2=1$ we deduce
    $
      w_(i_1) dots w_(i_r)
      =w_(i_1) dots w_(i_(alpha-1))
      w_(i_(alpha+1)) dots w_(i_(j-1)) w_(i_(j+1)) dots w_(i_r).
    $ <eq:15-3-8-two-letter-deletion>
    Since the expression on the right has fewer than $r$ terms the result
    follows by induction.

    We show next that each relation
    $
      w_(j_1) dots w_(j_s)=w_(k_1) dots w_(k_s),
    $ <eq:15-3-8-reduced-equality>
    where both expressions are reduced, is a consequence of the Coxeter
    relations $(w_i w_j)^(m_(i j))=1$. We again use induction on $s$. Since
    $w_(j_1) dots w_(j_s)$ is reduced but $w_(k_1) w_(j_1) dots w_(j_s)$ is not
    reduced, there exists $alpha>=1$ such that
    $
      w_(k_1) w_(j_1) dots w_(j_(alpha-1))=w_(j_1) dots w_(j_alpha).
    $ <eq:15-3-8-short-prefix>
    It follows that
    $
      w_(k_1) w_(j_1) dots w_(j_(alpha-1)) w_(j_(alpha+1)) dots w_(j_s)
      =w_(k_1) dots w_(k_s).
    $ <eq:15-3-8-shortened-equality>
    Both expressions in this equation are reduced, and by cancelling $w_(k_1)$
    we see by induction that this relation can be deduced from the Coxeter
    relations.

    We now distinguish two cases. Suppose $alpha<s$. Then
    $
      w_(k_1) w_(j_1) dots w_(j_(alpha-1))=w_(j_1) dots w_(j_alpha)
    $ <eq:15-3-8-prefix-induction>
    can be deduced from the Coxeter relations, by induction. Thus
    $
      w_(j_1) dots w_(j_s)
      =w_(k_1) w_(j_1) dots w_(j_(alpha-1)) w_(j_(alpha+1)) dots w_(j_s)
    $ <eq:15-3-8-replacement>
    can be deduced from the Coxeter relations, and therefore so can
    $ w_(j_1) dots w_(j_s)=w_(k_1) dots w_(k_s). $ <eq:15-3-8-first-case>
    Suppose $alpha=s$. Then we have
    $
      w_(j_1) dots w_(j_s)
      =w_(k_1) w_(j_1) dots w_(j_(s-1))=w_(k_1) dots w_(k_s).
    $ <eq:15-3-8-second-case>
    By induction, the relation
    $
      w_(k_1) w_(j_1) dots w_(j_(s-1))=w_(k_1) dots w_(k_s)
    $ <eq:15-3-8-cancel-first-generator>
    #source(301, "288")
    can be deduced from the Coxeter relations, so the required relation
    $ w_(j_1) dots w_(j_s)=w_(k_1) dots w_(k_s) $ <eq:15-3-8-required-relation>
    can be deduced from the Coxeter relations, provided that
    $
      w_(j_1) dots w_(j_s)=w_(k_1) w_(j_1) dots w_(j_(s-1))
    $ <eq:15-3-8-first-braid-step>
    can be deduced from these relations.

    We now repeat the argument. The relation
    $
      w_(j_1) dots w_(j_s)=w_(k_1) w_(j_1) dots w_(j_(s-1))
    $ <eq:15-3-8-repeated-braid-step>
    can be deduced from the Coxeter relations provided that
    $
      w_(k_1) w_(j_1) dots w_(j_(s-1))
      =w_(j_1) w_(k_1) w_(j_1) dots w_(j_(s-2))
    $ <eq:15-3-8-next-braid-step>
    can be deduced from these relations. Repeating the argument a number of
    times, we eventually have to show that
    $
      w_(j_1) w_(k_1) w_(j_1) dots=w_(k_1) w_(j_1) w_(k_1) dots
    $ <eq:15-3-8-alternating-braid>
    is a consequence of the Coxeter relations, which is obvious.
    #qed
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, qed, section-ref, source
    #let st = math.op("St")
    #let rank = math.op("rank")

    == The Complex $Sigma(W, Pi)$ <sec:weyl-coxeter-complex>

    We shall now show, as is to be expected, that the Coxeter complex as defined
    in #section-ref("coxeter-complex") is an abstract Coxeter complex.

    Let $Phi$ be a root system and $W$ be the Weyl group of $Phi$. Let $Pi$ be a
    fundamental system of roots in $Phi$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:15-4-1>
      #smallcaps[Theorem 15.4.1.] _The following two partially ordered sets are
      abstract Coxeter complexes which are isomorphic to one another:_
    ]
    #enum(
      numbering: "(i)",
      [_The Coxeter complex $Sigma$ of $W$ (defined as in #section-ref(
        "coxeter-complex",
      )), with partial order $prec.eq$ defined by $K_1 prec.eq K_2$ if and only
      if $K_1$ is contained in the closure $overline(K)_2$ of $K_2$._],
      [_The set $Sigma(W, Pi)$ of all cosets $w W_J$ for all $w in W$ and all
      subsets $J$ of $Pi$, with partial ordering $prec.eq$ defined by
      $K_1 prec.eq K_2$ if and only if $K_2$ is a subset of $K_1$._],
    )

    #smallcaps[Proof.] We show that $Sigma$ and $Sigma(W, Pi)$ are isomorphic as
    partially ordered sets, and then show that $Sigma(W, Pi)$ is an abstract
    Coxeter complex.

    We recall some facts about $Sigma$. Let $C$ be the chamber corresponding to
    the fundamental system $Pi$. Then the elements of $Sigma$ contained in the
    #source(302, "289")
    closure $overline(C)$ are the elements $C_J$ defined in #section-ref(
      "coxeter-complex",
    ). The stabilizer of $C_J$ under the action of $W$ on $Sigma$ is $W_J$, by
    #book-ref(
      "p",
      "2-6-1",
      [2.6.1],
    ). Moreover, each element of $Sigma$ can be expressed in the form $w(C_J)$
    for exactly one subset $J$ of $Pi$, by #book-ref("p", "2-6-3", [2.6.3]). Let
    $w_1,w_2$ be two elements of $W$. Then $w_1(C_J)=w_2(C_J)$ if and only if
    $w_1 W_J=w_2 W_J$. Thus the map
    $ w(C_J) arrow.r w W_J $ <eq:15-4-1-face-coset-map>
    is a bijection between $Sigma$ and $Sigma(W, Pi)$. We show that this
    bijection preserves the partial order relations.

    Suppose $w W_J succ.eq w' W_K$. Then $w W_J$ is a subset of $w' W_K$. It
    follows that $w'^(-1) w W_J$ is a subset of $W_K$, and so $w'^(-1) w in W_K$
    and $W_J$ is contained in $W_K$. This implies that $J$ is a subset of $K$,
    since the fundamental roots are linearly independent. Hence
    $w W_J succ.eq w' W_K$ if and only if $w'^(-1) w in W_K$ and $J$ is a subset
    of $K$.

    Now suppose $w(C_J) succ.eq w'(C_K)$. This means that $w'(C_K)$ is in the
    closure of $w(C_J)$, and so $w^(-1) w'(C_K)$ is in $overline(C)_J$. In
    particular $w^(-1) w'(C_K)$ is in $overline(C)$. However, the only elements
    of the complex contained in $overline(C)$ are those of the form $C_L$, for
    some subset $L$ of $Pi$, and if $w^(-1) w'(C_K)=C_L$ then we have $L=K$ by
    our earlier remarks. Thus $w^(-1) w' in W_K$ and $C_K$ is contained in
    $overline(C)_J$. It is clear from the definitions of $C_J,C_K$ that this
    implies that $J$ is a subset of $K$. Thus $w(C_J) succ.eq w'(C_K)$ if and
    only if $w^(-1) w' in W_K$ and $J$ is a subset of $K$.

    Thus we have shown that the bijection between $Sigma$ and $Sigma(W, Pi)$
    preserves the partial orderings $prec.eq$. We must now verify that
    $Sigma(W, Pi)$ (and hence $Sigma$ also) is an abstract Coxeter complex. We
    observe that the maximal elements of $Sigma(W, Pi)$ under the ordering
    $prec.eq$ are the elements of $W$. Two elements $w_1,w_2$ of $W$ are
    adjacent if and only if $w_2=w_1 w_r$ for some $r in Pi$. Since the
    fundamental reflections $w_r$ generate $W$, it follows that $Sigma(W, Pi)$
    is a chamber complex. $Sigma(W, Pi)$ is thin, because the elements of
    codimension $1$ are sets of the form ${w,w w_r}$ for some $w in W$,
    $r in Pi$. Thus each element of codimension $1$ is contained in two
    chambers. To show that $Sigma(W, Pi)$ is an abstract Coxeter complex it
    remains to prove the existence of all possible foldings.

    Let $w'$ and $w'w_r$ ($r in Pi$) be two adjacent chambers of $Sigma(W, Pi)$.
    We show there exists a folding $alpha$ such that $alpha(w'w_r)=w'$. Let
    $s=w'(r)$ and define
    $
      W_1 & ={w'' in W;w''^(-1)(s) in Phi^+}, \
      W_2 & ={w'' in W;w''^(-1)(s) in Phi^-}.
    $ <eq:15-4-1-chamber-halves>
    Thus $W=W_1 union W_2$ and $W_1 inter W_2$ is empty. Let $alpha$ be the map
    of
    $Sigma(W, Pi)$
    #source(303, "290")
    into itself given by
    $
      alpha(w W_J)=cases(
        w W_J & "if" w W_J subset.eq.not W_2,
        w_s w W_J & "if" w W_J subset.eq W_2.
      )
    $ <eq:15-4-1-coset-folding>
    $alpha$ clearly maps chambers into chambers. If $w in W_1$ we have
    $alpha(w W_J)=w W_J$ for all subsets $J$ of $Pi$. Thus $alpha$ operates as
    the identity on all the faces of the chamber $w$. Now suppose $w in W_2$.
    Then $alpha(w)=w_s w$, and
    $ alpha(w W_J)=w_s w W_J $ <eq:15-4-1-folded-negative-face>
    whenever $w W_J subset.eq W_2$. We show that $alpha(w W_J)=w_s w W_J$ even
    if $w W_J subset.eq.not W_2$ and this will prove that $alpha$ induces an
    isomorphism between the faces of $w$ and the faces of $w_s w$. Now
    $w in W_2$ and so $w^(-1)(s) in Phi^-$. Also $w W_J subset.eq.not W_2$, so
    there is some element $w_J in W_J$ such that $w w_J in W_1$. Then
    $w_J^(-1) w^(-1)(s) in Phi^+$, whence $w^(-1)(s) in W_J (Phi^+)$. Thus we
    have
    $
      w^(-1)(s) in Phi^- inter W_J (Phi^+)=Phi_J^-
    $ <eq:15-4-1-parabolic-root>
    by #book-ref("l", "9-4-1", [9.4.1]). It follows that
    $
      w_(w^(-1)(s))=w^(-1) w_s w in W_J.
    $ <eq:15-4-1-parabolic-reflection>
    Therefore
    $ alpha(w W_J)=w W_J=w_s w W_J. $ <eq:15-4-1-crossing-face>
    We have now shown that $alpha$ is an endomorphism of $Sigma(W, Pi)$.

    If $w in W_1$, $alpha$ operates as the identity on all faces of $w$. If
    $w in W_2$ then $alpha(w)=w_s w$ is in $W_1$. Thus $alpha$ operates as the
    identity on all faces of $alpha(w)$. Hence $alpha^2=alpha$ and $alpha$ is a
    folding. Finally $w'w_r in W_2$ and so
    $ alpha(w'w_r)=w_s w'w_r=w'. $ <eq:15-4-1-adjacent-image>
    Thus $alpha$ is a folding which maps $w'w_r$ to $w'$.
    #qed

    We determine next the group of type-preserving automorphisms of the abstract
    Coxeter complex $Sigma(W, Pi)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:15-4-2>
      #smallcaps[Proposition 15.4.2.] _The group of type-preserving
      automorphisms of $Sigma(W, Pi)$ is isomorphic to $W$._
    ]

    #smallcaps[Proof.] Let $alpha$ be the folding of $Sigma(W, Pi)$ which maps
    $w'w_r$ to $w'$. The effect of $alpha$ on the chambers is given by:
    $
      alpha(w)=cases(w & "if" w in W_1, w_s w & "if" w in W_2.)
    $ <eq:15-4-2-positive-folding>
    #source(304, "291")
    (The notation is as in #book-ref("th", "15-4-1", [15.4.1]).) By replacing
    $w'$ by $w'w_r$ we may determine the opposite folding $beta$ of $alpha$.
    $beta$ operates on the chambers by:
    $
      beta(w)=cases(w_s w & "if" w in W_1, w & "if" w in W_2.)
    $ <eq:15-4-2-negative-folding>
    Let $rho$ be the involutary automorphism of $Sigma(W, Pi)$ determined by
    $alpha$ and $beta$. Then
    $ rho(w)=w_s w $ <eq:15-4-2-left-reflection>
    for all $w in W$. Thus $rho$ operates on the elements of $W$ by
    left-multiplication by the reflection $w_s$. Now the automorphisms of this
    kind generate the whole group of type-preserving automorphisms of
    $Sigma(W, Pi)$, by #book-ref("p", "15-3-6", [15.3.6]). Since the Weyl group
    $W$ is generated by its reflections it follows that the group of
    type-preserving automorphisms is isomorphic to $W$.
    #qed

    We now show that $Sigma(W, Pi)$ is, to within isomorphism, the only abstract
    Coxeter complex whose group of type-preserving automorphisms is isomorphic
    to $W$.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:15-4-3>
      #smallcaps[Theorem 15.4.3.] _Let $W$ be a Weyl group and $Sigma$ be an
      abstract Coxeter complex whose group of type-preserving automorphisms
      $W(Sigma)$, when regarded as a Coxeter group as in #book-ref(
        "th",
        "15-3-7",
        [15.3.7],
      ), has the same relations as $W$ when generated by a system of fundamental
      reflections. Then $Sigma$ is isomorphic to $Sigma(W, Pi)$._
    ]

    #smallcaps[Proof.] Let $C$ be a chamber of $Sigma$. Then by #book-ref(
      "th",
      "15-3-7",
      [15.3.7],
    ) $W(Sigma)$ is generated as a Coxeter group by the reflections in the faces
    of codimension $1$ in $C$. In the present instance the number of such
    reflections is $l=rank W$. Let these reflections be $rho_1,rho_2,...,rho_l$.
    Then
    $ W tilde.eq W(Sigma)=lr(⟨rho_1,rho_2,...,rho_l⟩). $
    <eq:15-4-3-reflection-generators>
    Now $rank C=l$ and $C$ has faces $A_1,A_2,...,A_l$ of codimension $1$ in
    natural 1–1 correspondence with $rho_1,rho_2,...,rho_l$. Let $J$ be any
    subset of ${1,2,...,l}$ and
    $ C_J=inter.big_(i in J) A_i. $ <eq:15-4-3-fundamental-face>
    Then the elements $C_J$ are all faces of $C$, and every element of $Sigma$
    is expressible in the form $w(C_J)$ for some $w in W(Sigma)$ and some $J$.

    Consider the complex $st C_J$. This is also an abstract Coxeter complex by
    #book-ref("l", "15-3-1", [15.3.1]). The group of type-preserving
    automorphisms of $st C_J$ is
    #source(305, "292")
    isomorphic to the subgroup $W_J$ of $W(Sigma)$ generated by the elements
    $rho_i$ for $i in J$, also by #book-ref("th", "15-3-7", [15.3.7]). In
    particular, $W_J$ operates transitively on the chambers of $Sigma$
    containing $C_J$, and $abs(W_J)$ is the number of such chambers. Now $W_J$
    stabilizes $C_J$ since each of its generators has this property. Suppose the
    stabilizer $H$ of $C_J$ in $W$ were greater than $W_J$. Then $H$ would
    operate on the chambers containing $C_J$, and so the chambers $w(C)$ for
    $w in H$ could not all be distinct. However, this contradicts #book-ref(
      "l",
      "15-1-2",
      [15.1.2],
    ). Thus $W_J$ is the stabilizer of $C_J$ in $W$.

    #block(width: 100%, breakable: false)[
      Let $w_1,w_2 in W$. Then $w_1(C_J)=w_2(C_J)$ if and only if
      $w_1 W_J=w_2 W_J$. Thus the map
      $
         Sigma & arrow.r Sigma(W, Pi), \
        w(C_J) & arrow.r w W_J.
      $ <eq:15-4-3-complex-isomorphism>
    ]
    is a bijection. This bijection transforms the chamber $w(C)$ in $Sigma$ into
    the chamber $w$ in $Sigma(W, Pi)$. Moreover, it induces an isomorphism
    between the faces $w(C_J)$ of $w(C)$ and the faces $w W_J$ of $w$. Thus it
    is an isomorphism between $Sigma$ and $Sigma(W, Pi)$.
    #qed

    _Note._ We have shown that there is just one abstract Coxeter complex
    $Sigma$ (to within isomorphism) whose group $W(Sigma)$ of type-preserving
    automorphisms is isomorphic to $W$, if $W$ is a Weyl group. In general
    $W(Sigma)$ is a Coxeter group. Now there are Coxeter groups which are not
    Weyl groups. (A classification of the finite Coxeter groups is given in
    Bourbaki #bib-ref("bourbaki1968").) Although such groups will not be
    discussed in the present volume it is possible to extend the result
    mentioned above to all Coxeter groups. Given any Coxeter group $W$ there is,
    to within isomorphism, a unique abstract Coxeter complex whose group of
    type-preserving automorphisms is isomorphic to $W$.
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source

    == Buildings <sec:buildings>

    #metadata((kind: "anchor")) <def:15-5-building>
    A _building_ is a pair $(Omega,cal(A))$ where $Omega$ is a chamber complex
    and $cal(A)$ is a set of subcomplexes, called _apartments_, satisfying the
    following axioms:

    #metadata((kind: "anchor")) <def:15-5-b1>
    _B_ 1. $Omega$ is a thick chamber complex.

    #metadata((kind: "anchor")) <def:15-5-b2>
    _B_ 2. The apartments of $Omega$ are thin chamber complexes.

    #metadata((kind: "anchor")) <def:15-5-b3>
    _B_ 3. Given any two chambers $C,C'$ in $Omega$ there exists an apartment
    $Sigma in cal(A)$ such that $C in Sigma$ and $C' in Sigma$.

    #metadata((kind: "anchor")) <def:15-5-b4>
    _B_ 4. If $A,A'$ are elements of $Omega$ which are both contained in each of
    the
    #source(306, "293")
    apartments $Sigma,Sigma' in cal(A)$, there exists an isomorphism between
    $Sigma,Sigma'$ leaving invariant $A,A'$ and all their faces.

    It follows from these axioms that any two apartments of a building $Omega$
    are isomorphic. For let $Sigma,Sigma'$ be apartments and $C,C'$ be chambers
    with $C in Sigma$ and $C' in Sigma'$. Let $Gamma={C=C_0,C_1,...,C_m=C'}$ be
    a gallery joining $C,C'$. There exist apartments $Sigma_1$ containing
    $C_0,C_1$; $Sigma_2$ containing $C_1,C_2$; etc. By #book-ref(
      "def",
      "15-5-b4",
      [B4],
    ) we have
    $
      Sigma tilde.eq Sigma_1 tilde.eq Sigma_2 tilde.eq ... tilde.eq Sigma_m
      tilde.eq Sigma'.
    $ <eq:15-5-apartments-isomorphic>

    #block(sticky: true)[
      #metadata((kind: "anchor")) <ex:15-5-1>
      _Example 15.5.1. The building $Omega(G; B, N)$._
    ]
    Let $G$ be a group with a $(B,N)$-pair. Then there exist two subgroups $B,N$
    of $G$ such that:

    #metadata((kind: "anchor")) <def:15-5-bn1>
    _BN_ 1. $G$ is generated by $B$ and $N$.

    #metadata((kind: "anchor")) <def:15-5-bn2>
    _BN_ 2. $B inter N$ is a normal subgroup of $N$.

    #metadata((kind: "anchor")) <def:15-5-bn3>
    _BN_ 3. The group $W=N\/(B inter N)$ is generated by a set $w_i$ of
    involutions $(i in I)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <def:15-5-bn4>
      _BN_ 4. If $n_i in N$ maps to $w_i$ under the natural homomorphism, and if
      $n$ is an element of $N$, then
      $ B n_i B dot B n B subset.eq B n_i n B union B n B. $ <eq:15-5-bn4>
    ]

    #metadata((kind: "anchor")) <def:15-5-bn5>
    _BN_ 5. $n_i B n_i != B$, $i in I$.

    The subgroups of $G$ containing $B$ are in 1–1 correspondence with the
    subsets $J$ of $I$, by #book-ref("th", "8-3-2", [8.3.2]), and have the form
    $P_J=lr(⟨B,n_i;i in J⟩)$ by #book-ref("p", "8-3-1", [8.3.1]). Let $Omega$ be
    the set of left cosets $g P_J$ for all $g in G$ and all subsets $J$ of $I$.
    We introduce a partial ordering on $Omega$ which is the reverse of
    set-theoretical inclusion. Let $Sigma_0$ be the subset of $Omega$ which
    consists of the elements $n P_J$ for all $n in N$ and all $J$. Then
    $g Sigma_0$ is the set of cosets $g n P_J$ for all $n in N$ and all $J$, and
    we define $cal(A)$ to be the family of subsets $g Sigma_0$ of $Omega$ for
    all $g in G$. We shall show that $Omega$ is a building and that $cal(A)$ is
    a set of apartments in $Omega$. The building constructed in this way will be
    called $Omega(G; B, N)$.

    We show first that $Omega$ is a chamber complex. The maximal elements
    (chambers) of $Omega$ are the elements $g B$ and the elements of codimension
    $1$ are those of form $g P_J$, where $J$ is a 1-element subset of $I$. Thus
    $B$ and $n_i B$ are adjacent chambers if $i in I$. It follows that the
    chambers $B,n B$ can be joined by a gallery for all $n in N$. Let $g$ be any
    element of $G$. Since $G=B N B$ we have $g=b n b'$ with $b,b' in B$ and
    $n in N$. Thus $g B=b n B$. Now $B,n B$ can be joined by a gallery and so
    $b B,b n B$ can be joined by a gallery also. Thus $B,g B$ can be joined by a
    gallery. Let $g_1,g_2$ be arbitrary elements
    #source(307, "294")
    of $G$ and put $g=g_2^(-1)g_1$. Since $B,g B$ can be joined by a gallery it
    follows that $g_1 B,g_2 B$ can be joined also. Thus $Omega$ is a chamber
    complex.

    We now show that the chamber complex $Omega$ is thick. Consider the element
    $P_J=lr(⟨B,n_i⟩)$ of codimension $1$ in $Omega$, where $J={i}$. It is clear
    that $B$ and $n_i B$ are chambers containing $P_J$. However they are not the
    only chambers containing $P_J$. For if they were, $B$ would be a subgroup of
    index $2$ in $P_J$ and hence normal in $P_J$, and we would have
    $n_i B n_i=B$, which contradicts #book-ref("def", "15-5-bn5", [BN5]). It
    follows that $g B$ and $g n_i B$ are not the only chambers containing
    $g P_J$. Thus $Omega$ is thick.

    Now $P_J=B union B n_i B$ and the only cosets of $B inter N$ in
    $N inter P_J$ are $B inter N$ and $n_i (B inter N)$ by #book-ref(
      "p",
      "8-3-1",
      [8.3.1],
    ) and #book-ref("th", "8-3-4", [8.3.4]). Thus $B$ and $n_i B$ are the only
    chambers containing $P_J$ of the form $n B$ for $n in N$. It follows that
    $n B$ and $n n_i B$ are the only chambers in $Sigma_0$ containing $n P_J$.
    Thus $Sigma_0$ is thin, and hence all the other apartments of $Omega$ are
    thin also.

    We verify next that any two chambers of $Omega$ are contained in some
    apartment. Let $g_1 B,g_2 B$ be two chambers and let $g=g_1^(-1)g_2$. Since
    $G=B N B$ we have $g=b n b'$ for $b,b' in B$ and $n in N$. Thus $g B=b n B$.
    Now $B$ and $n B$ are in $Sigma_0$, and so $B$ and $g B$ are in $b Sigma_0$.
    It follows that $g_1 B$ and $g_2 B$ are in the apartment $g_1 b Sigma_0$.

    Finally, suppose we have two elements of $Omega$ and two apartments which
    each contain both these elements. By multiplying on the left by a suitable
    element of $G$ we may assume one of the apartments is $Sigma_0$ and that the
    elements are $P_J$ and $n P_K$, where $n in N$. Let the other apartment be
    $g Sigma_0$. We show there is an isomorphism between $Sigma_0$ and
    $g Sigma_0$ which leaves invariant $P_J,n P_K$ and all their faces. Since
    $P_J in g Sigma_0$ we have $g^(-1)P_J in Sigma_0$ and so $g^(-1)P_J=n'P_J$
    for some $n' in N$. Thus $g n'=p_J in P_J$, and $g Sigma_0=p_J Sigma_0$. Now
    $n P_K in p_J Sigma_0$ and so $p_J^(-1)n P_K=n'P_K$ for some $n' in N$. It
    follows that
    $ P_J n P_K=P_J n'P_K. $ <eq:15-5-1-double-cosets>
    We now require the following lemma.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-5-2>
      #smallcaps[Lemma 15.5.2.] _Let $G$ be a group with a $(B,N)$-pair. Then
      for each $n in N$ we have_
      $ P_J n P_K inter N=N_J n N_K. $ <eq:15-5-2-intersection>
    ]
    (The notation is as in #book-ref("p", "8-2-2", [8.2.2]).)

    #smallcaps[Proof.] Axiom #book-ref("def", "15-5-bn4", [BN4]) applied
    repeatedly shows that, for any subset $N_0$ of $N$, we have
    $ N_J B N_0 subset.eq B N_J N_0 B. $ <eq:15-5-2-left-inclusion>
    #source(308, "295")
    By inverting both sides we also obtain
    $ N_0 B N_J subset.eq B N_0 N_J B $ <eq:15-5-2-right-inclusion>
    for any subset $N_0$ of $N$. By applying these formulae we have
    $
      P_J n P_K inter N & = B N_J B n B N_K B inter N \
                        & subset.eq B N_J n B N_K B inter N \
                        & subset.eq B N_J n N_K B inter N \
                        & = N_J n N_K
    $ <eq:15-5-2-inclusion-chain>
    by #book-ref("p", "8-2-3", [8.2.3]). The reverse inclusion is obvious.
    #qed

    We can now complete the argument to show that $Omega(G; B, N)$ is a
    building. We have $P_J n P_K=P_J n'P_K$ and so, by #book-ref(
      "l",
      "15-5-2",
      [15.5.2],
    ), we obtain $N_J n N_K=N_J n'N_K$. Thus
    $ N_J n N_K n^(-1)=N_J n'N_K n^(-1) $ <eq:15-5-1-translated-cosets>
    and, in particular, we have
    $ N_J inter n'N_K n^(-1) != emptyset. $ <eq:15-5-1-nonempty-intersection>
    Let $overline(n) in N_J inter n'N_K n^(-1)$. We show that left
    multiplication by the element $p_J overline(n)$ gives an isomorphism from
    $Sigma_0$ to $g Sigma_0$ with the required properties. We have
    $ p_J overline(n) Sigma_0=p_J Sigma_0=g Sigma_0 $ <eq:15-5-1-apartment-map>
    and so we have an isomorphism from $Sigma_0$ to $g Sigma_0$.

    Also
    $ p_J overline(n) P_J=p_J P_J=P_J $ <eq:15-5-1-fixed-first-face>
    and
    $ p_J overline(n) dot n P_K=p_J n'P_K=n P_K. $ <eq:15-5-1-fixed-second-face>
    Thus this isomorphism fixes $P_J$ and $n P_K$ and clearly fixes also all
    faces of these two elements, since the faces are larger subsets of $G$. Thus
    axiom #book-ref("def", "15-5-b4", [B4]) has been established, and so
    $Omega(G; B, N)$ is a building.
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #import "diagrams/buildings.typ": retraction-scheme
    #let retr = math.op("retr")

    == Retractions onto an Apartment <sec:apartment-retractions>

    We have shown above that there is a building associated to each group with a
    $(B,N)$-pair, and have therefore established the existence of a large number
    of buildings. We shall now prove some further general properties
    #source(309, "296")
    of buildings, concentrating on the relationship between a building and its
    apartments.

    Let $Omega$ be a building, $Sigma$ an apartment of $Omega$ and $C$ a chamber
    in $Sigma$. For each element $A in Omega$ there exists an apartment $Sigma'$
    containing $A$ and $C$, by axiom #book-ref("def", "15-5-b3", [B3]). By
    #book-ref("def", "15-5-b4", [B4]) there is an isomorphism
    $Sigma' arrow.r Sigma$ which leaves invariant all faces of $C$. By
    #book-ref(
      "l",
      "15-1-2",
      [15.1.2],
    ) there is only one such isomorphism. The image of $A$ under this
    isomorphism is an element of $Sigma$ which is independent of the choice of
    $Sigma'$, by #book-ref("def", "15-5-b4", [B4]). This image will be called
    $retr_(Sigma,C)(A)$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:15-6-1>
      #smallcaps[Lemma 15.6.1.] _The map_
      $
        Omega & arrow.r Sigma, \
            A & arrow.r retr_(Sigma,C)(A)
      $ <eq:15-6-1-retraction>
      _is a retraction from $Omega$ onto $Sigma$._
    ]

    #smallcaps[Proof.] The map is clearly a morphism, and since it acts as the
    identity on $Sigma$ it is idempotent.
    #qed

    We use retractions of this kind to prove the following important result.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:15-6-2>
      #smallcaps[Theorem 15.6.2.] _The apartments of a building are abstract
      Coxeter complexes._
    ]

    #smallcaps[Proof.] Let $Sigma$ be an apartment of a building $Omega$. We
    know that $Sigma$ is a thin chamber complex and so must prove the existence
    of all possible foldings. Let $C,C'$ be adjacent chambers of $Sigma$ and let
    $A=C inter C'$. Since $Omega$ is thick there is a third chamber $C''$
    containing $A$. Let $Sigma'$ be an apartment containing $C,C''$. Let $alpha$
    be the map of $Sigma$ into itself given by
    $ alpha=retr_(Sigma,C') dot retr_(Sigma',C). $ <eq:15-6-2-folding-composite>
    The retractions are restricted to the apartments being considered, which are
    as shown below. #align(
      center,
    )[#retraction-scheme()] <fig:15-6-2-retractions>
    Then $alpha$ is an endomorphism of $Sigma$, and we have
    $
       alpha(C) & =retr_(Sigma,C')(C)=C, \
      alpha(C') & =retr_(Sigma,C')(C'')=C.
    $ <eq:15-6-2-adjacent-images>
    #source(310, "297")
    We may define similarly another endomorphism $beta$ of $Sigma$ by
    interchanging the rôles of $C,C'$. Thus $beta(C')=C'$ and $beta(C)=C'$.
    Furthermore $alpha$ and $beta$ both leave invariant all faces of $A$. We
    shall show that $alpha,beta$ are a pair of opposite foldings of $Sigma$,
    thus proving that $Sigma$ is an abstract Coxeter complex.

    We define a set $Gamma_(Sigma)(A)$ of galleries of $Sigma$. A gallery
    $Gamma$ of $Sigma$ lies in $Gamma_(Sigma)(A)$ if:

    #enum(
      numbering: "(a)",
      [The first term of $Gamma$ contains $A$.],
      [There is no gallery of $Sigma$ shorter than $Gamma$ whose first term
        contains $A$ and last term coincides with the last term of $Gamma$.],
    )

    Thus $Gamma_(Sigma)(A)$ is the set of galleries of $Sigma$ which start from
    a chamber containing $A$ and reach their destination as quickly as possible.
    We shall show that if $Gamma in Gamma_(Sigma)(A)$ then
    $alpha(Gamma) in Gamma_(Sigma)(A)$ also.

    Now
    $ alpha(Gamma)=retr_(Sigma,C') retr_(Sigma',C)(Gamma). $
    <eq:15-6-2-gallery-image>
    For a face $A$ and a chamber $D$, let $d(A,D)$ be the least length of a
    gallery from a chamber containing $A$ to $D$. This distance can be computed
    in any apartment containing $A$ and $D$: applying a retraction onto that
    apartment to a shorter gallery in $Omega$ would give a shorter gallery
    there, after removing any repetitions.

    A retraction $retr_(Theta,E)$ preserves distances from every face $A$ of its
    centre $E$. Indeed, choose an apartment containing $E$ and $D$. On this
    apartment the retraction is an isomorphism fixing $A$, and the preceding
    observation identifies the distances measured in the two apartments with
    $d(A,D)$ and $d(A,retr_(Theta,E)(D))$. Since $A$ is a face of both $C$ and
    $C'$, both retractions in the expression for $alpha$ preserve distance from
    $A$. Consequently
    $ d(A,alpha(D))=d(A,D). $ <eq:15-6-2-distance-preservation>
    If $Gamma in Gamma_(Sigma)(A)$ ends at $D$, its image starts at a chamber
    containing $A$ and ends at $alpha(D)$. The equality of distances shows that
    this image has no repetitions and is still of least length. Thus $alpha$
    maps $Gamma_(Sigma)(A)$ into itself. Similarly $Gamma_(Sigma)(A)$ is mapped
    into itself by $beta$.

    Let $Gamma={C=C_0,C_1,...,C_m}$ be a gallery in $Gamma_(Sigma)(A)$. We show
    by induction on $m$ that all faces of $C_m$ are invariant under $alpha$ and
    under $alpha beta$, but that $C_m$ is not fixed by $beta$. These facts are
    clear if $m=0$, since $alpha(C)=C$, $beta(C)=C'$ and
    $alpha beta(C)=alpha(C')=C$. Suppose therefore that $m>0$ and write
    $gamma=alpha$ or $alpha beta$. By induction $gamma$ fixes all faces of
    $C_(m-1)$. Now $gamma(C_m)$ contains $C_(m-1) inter C_m$, and so must be
    either $C_(m-1)$ or $C_m$. However, $gamma(C_m)=C_(m-1)$ would imply that
    $ gamma(Gamma)={C=gamma(C_0),gamma(C_1),...,C_(m-1),C_(m-1)} $
    <eq:15-6-2-collapsed-gallery>
    is not in $Gamma_(Sigma)(A)$, contrary to the fact that $alpha,beta$
    transform $Gamma_(Sigma)(A)$ into itself. Hence $gamma$ fixes $C_m$. It also
    fixes all faces of $C_(m-1) inter C_m$, and so it fixes all faces of $C_m$.

    #source(311, "298")
    Now suppose by way of contradiction that $beta(C_m)=C_m$. Then we have
    $ beta(Gamma)={C'=beta(C_0),...,C_m} in Gamma_(Sigma)(A) $
    <eq:15-6-2-opposite-gallery>
    and so $beta$ fixes all the faces of $C_m$. In particular $beta$ fixes
    $C_(m-1) inter C_m$. Hence $beta(C_(m-1))$ is either $C_(m-1)$ or $C_m$.
    However, $beta(C_(m-1))=C_(m-1)$ is false by induction, and
    $beta(C_(m-1))=C_m$ contradicts the fact that
    $beta(Gamma) in Gamma_(Sigma)(A)$. Thus we have a contradiction, and hence
    $beta(C_m) != C_m$.

    We are now able to show that $alpha,beta$ are a pair of opposite foldings of
    $Sigma$. We show first that $alpha$ is idempotent. Let $D$ be a chamber in
    $Sigma$ and let $Gamma in Gamma_(Sigma)(A)$ be a gallery whose last term is
    $D$. Then $alpha(Gamma)$ is also a gallery in $Gamma_(Sigma)(A)$ and has
    first term $C$ and last term $alpha(D)$. Thus $alpha$ fixes all the faces of
    $alpha(D)$, as shown above. Hence $alpha^2=alpha$.

    We now show that each chamber in $alpha(Sigma)$ is the image of just two
    chambers in $Sigma$. Let $D$ be a chamber in $alpha(Sigma)$ and let
    $D=alpha(E)$, where $E in Sigma$. Now we have shown above that for each
    chamber $E in Sigma$, either $alpha(E)=E$ and $beta(E) != E$, or
    $alpha(E) != E$ and $beta(E)=E$. If $alpha(E)=E$ then $E=D$. If
    $alpha(E) != E$ then $beta(E)=E$ and $beta alpha(E)=E$, as shown above. Thus
    $ E=beta(alpha(E))=beta(D). $ <eq:15-6-2-second-preimage>
    Hence there are just two chambers in $Sigma$ such that $alpha(E)=D$, viz.,
    $D$ and $beta(D)$. Therefore $alpha$ is a folding. It follows by symmetry
    that $beta$ is also a folding, and by definition that $alpha,beta$ are
    opposite foldings. Thus $Sigma$ is an abstract Coxeter #box[complex.#qed]

    #block(sticky: true)[
      #metadata((kind: "anchor")) <def:15-6-3>
      _Definition 15.6.3._ Let $A,A'$ be two elements of a building $Omega$.
      Then $A,A'$ are said to have the same type in $Omega$ if they have the
      same type in any apartment containing $A,A'$.
    ]

    We observe that this condition is independent of the apartment chosen. For
    let $Sigma_1,Sigma_2$ be two apartments containing $A,A'$. Let $C,C'$ be
    chambers of $Sigma_1$ containing $A,A'$ respectively. Let $gamma$ be the
    retraction of $Sigma_1$ onto the simplex $S(C)$ defined in #book-ref(
      "p",
      "15-3-2",
      [15.3.2],
    ). Then $A,A'$ have the same type in $Sigma_1$ if and only if $gamma(A')=A$.
    Now by #book-ref("def", "15-5-b4", [B4]) there exists an isomorphism
    $delta:Sigma_1 arrow.r Sigma_2$ which leaves $A$ and $A'$ invariant. Thus
    the retraction of $Sigma_2$ onto the simplex $S(delta(C))$ is given by
    $ delta(X) arrow.r delta gamma(X), quad X in Sigma_1. $
    <eq:15-6-3-conjugate-retraction>
    $A$ and $A'$ have the same type in $Sigma_2$ if and only if $A'$ is mapped
    to $A$ under this retraction, which holds if and only if $gamma(A')=A$.
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, qed, source
    #import "diagrams/buildings.typ": building-correspondence
    #let retr = math.op("retr")

    #source(312, "299")
    == Groups of Type-Preserving Automorphisms <sec:type-preserving-automorphisms>

    We shall be concerned with groups of type-preserving automorphisms of a
    building $Omega$, and first give an example in the building $Omega(G; B, N)$
    constructed from a group $G$ with a $(B,N)$-pair.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <p:15-7-1>
      #smallcaps[Proposition 15.7.1.] _In the building $Omega(G; B, N)$, the
      group $G$ operates by left multiplication as a group of type-preserving
      automorphisms which is transitive on the pairs $(C,Sigma)$, where $C$ is a
      chamber and $Sigma$ is an apartment containing $C$._
    ]

    #smallcaps[Proof.] We use the notation of #book-ref(
      "ex",
      "15-5-1",
      [15.5.1],
    ). The elements of $Omega$ are cosets of the form $g P_J$. Consider the
    apartment $Sigma_0$ of $Omega$. The elements of $Sigma_0$ have form $n P_J$,
    where $n in N$, and the map
    $ n P_J arrow.r P_J $ <eq:15-7-1-type-retraction>
    is an idempotent morphism from $Sigma_0$ to the simplex of faces of the
    chamber $B$. It is therefore the retraction described in #book-ref(
      "p",
      "15-3-2",
      [15.3.2],
    ). Thus $n_1 P_J$ and $n_2 P_K$ have the same type if and only if $J=K$.
    Similarly in the apartment $Sigma=g Sigma_0$ of $Omega$, the elements
    $g n_1 P_J$ and $g n_2 P_K$ have the same type if and only if $J=K$. We now
    consider any two elements $g_1 P_J$ and $g_2 P_K$ of $Omega$. They have the
    same type in $Omega$ if and only if they have the same type in some
    apartment containing both. Thus $g_1 P_J$ and $g_2 P_K$ have the same type
    if and only if $J=K$. It is now clear that the map of $Omega$ into itself
    given by
    $ g P_J arrow.r x g P_J, quad x in G, $ <eq:15-7-1-left-action>
    is a type-preserving automorphism of $Omega$.

    Let $C$ be a chamber and $Sigma$ an apartment of $Omega$ containing $C$.
    Then $Sigma=g Sigma_0$ for some $g in G$, and $C=g n B$ for some $n in N$.
    Let $x=g n$. Then $C=x B$ and $Sigma=x Sigma_0$. Thus the element $x$ of $G$
    transforms the pair $(B,Sigma_0)$ into the pair $(C,Sigma)$. It follows that
    $G$ operates transitively on the pairs $(C,Sigma)$ with $C in Sigma$.
    #qed

    We shall now prove a converse of this result, namely that a group of
    type-preserving automorphisms of a building which is transitive on the pairs
    $(C,Sigma)$ with $C in Sigma$ is a group with a $(B,N)$-pair.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:15-7-2>
      #smallcaps[Theorem 15.7.2.] _Let $(Omega,cal(A))$ be a building and $G$ be
      a group of type-preserving automorphisms of $Omega$ which is transitive on
      the pairs $(C,Sigma)$ with_
    ]
    #source(313, "300")
    _$C in Sigma$, where $C$ is a chamber and $Sigma$ an apartment of $Omega$.
    Let $C_0,Sigma_0$ be a fixed chamber and apartment with $C_0 in Sigma_0$,
    let $B$ be the stabilizer of $C_0$ in $G$ and $N$ be the stabilizer of
    $Sigma_0$. Then the subgroups $B,N$ form a $(B,N)$-pair in $G$. Moreover,
    $W=N\/(B inter N)$ is isomorphic to the group $W(Sigma)$ of type-preserving
    automorphisms of each apartment $Sigma$ of $Omega$._

    #smallcaps[Proof.] We verify the last assertion first. $N$ operates on
    $Sigma_0$ as a group of type-preserving automorphisms. The transitivity
    hypothesis shows that $N$ operates transitively on the chambers of
    $Sigma_0$. Thus $N$ induces on $Sigma_0$ the full group $W(Sigma_0)$ of
    type-preserving automorphisms, by #book-ref("l", "15-1-2", [15.1.2]). Thus
    we have an epimorphism $N arrow.r W(Sigma_0)$ with kernel $B inter N$. For a
    type-preserving automorphism of $Sigma_0$ which fixes $C_0$ must be the
    identity, again by #book-ref("l", "15-1-2", [15.1.2]). Thus $N\/(B inter N)$
    is isomorphic to $W(Sigma_0)$. This is isomorphic to $W(Sigma)$ for any
    apartment $Sigma$, since any two apartments are isomorphic.

    We now show that the subgroups $B,N$ satisfy the axioms for a $(B,N)$-pair.
    It has already been verified that $B inter N$ is normal in $N$ and that
    $N\/(B inter N)$ is generated by a set of involutions. We choose for the set
    $I$ of generating involutions the reflections of $Sigma_0$ in the faces of
    codimension $1$ in $C_0$ (see #book-ref("th", "15-3-7", [15.3.7])).

    Let $g in G$ and let $Sigma$ be an apartment containing $C_0$ and $g(C_0)$.
    Then $C_0$ is contained in $Sigma$ and $g^(-1)(Sigma)$, so the transitivity
    condition shows there exists $b_1 in B$ such that
    $g^(-1)(Sigma)=b_1(Sigma)$. Also, since $C_0$ is in $Sigma_0$ and $Sigma$,
    there exists $b_2 in B$ such that $b_2(Sigma_0)=Sigma$. Thus
    $g^(-1)b_2(Sigma_0)=b_1 b_2(Sigma_0)$ and it follows that
    $b_2^(-1)g b_1 b_2 in N$. Hence $g in B N B$ and we have $G=B N B$.

    Let $n_i$ be an element of $N$ which induces on $Sigma_0$ a generating
    involution $w_i$ of $W$ $(i in I)$. We show $n_i B n_i != B$. Suppose this
    is false, so that $n_i B=B n_i$. Then we have
    $ B dot n_(i)(C_0)=n_i dot B(C_0)=n_(i)(C_0). $ <eq:15-7-2-fixed-neighbour>
    Thus $B$ stabilizes both $C_0$ and $n_(i)(C_0)$. Now $C_0$ and $n_(i)(C_0)$
    are adjacent chambers and, since $Omega$ is thick, there is a third chamber
    $C'$ containing $C_0 inter n_(i)(C_0)$. Let $Sigma$ be an apartment
    containing $C_0$ and $C'$. By transitivity there exists $b in B$ such that
    $b(Sigma_0)=Sigma$. Since $B$ stabilizes both $C_0$ and $n_(i)(C_0)$ we see
    that $C_0,n_(i)(C_0),C'$ are all in $Sigma$. This contradicts the fact that
    $Sigma$ is thin.

    Finally we check the axiom
    $ B n_i B dot B n B subset.eq B n_i n B union B n B. $ <eq:15-7-2-bn4>
    Given elements $n_i,n in N$ and $b in B$ we consider the adjacent chambers
    $C_0$ and $n_(i)(C_0)$. Let $A=C_0 inter n_(i)(C_0)$. The element $b$ fixes
    $C_0$ and is type-preserving,
    #source(314, "301")
    so fixes all faces of $C_0$. In particular $b A=A$ and $b n_i C_0$ contains
    $A$. Thus the chambers $n C_0,n n_i C_0$ and $n b n_i C_0$ all contain
    $n A$.

    Consider the set of galleries whose first term is $C_0$ and last term is a
    chamber containing $n A$. Let $Gamma$ be such a gallery with as few terms as
    possible and let
    $ Gamma={C_0,C_1,...,C_m}. $ <eq:15-7-2-shortest-gallery>
    Let $Sigma$ be an apartment containing $C_0$ and $n b n_i C_0$. Then there
    exists $b_1 in B$ such that $b_1 Sigma=Sigma_0$.

    Now $Sigma$ contains $C_0$ and $n A$, and we show that $Sigma$ contains each
    term of the gallery $Gamma$. Suppose this is false, and let $C_i$ be the
    first term in $Gamma$ not in $Sigma$. Let $D$ be the chamber of $Sigma$
    other than $C_(i-1)$ containing $C_(i-1) inter C_i$. Then
    $
      retr_(Sigma,D)(C_(i-1)) & =C_(i-1), \
          retr_(Sigma,D)(C_i) & =C_(i-1)
    $ <eq:15-7-2-gallery-collapse>
    and $retr_(Sigma,D)(Gamma)$ is a gallery whose first term is $C_0$, whose
    last term contains $n A$, and which has two consecutive terms identical.
    This contradicts the fact that the length of $Gamma$ is minimal. Thus
    $Sigma$ contains each term of $Gamma$. Similarly $Sigma_0$ contains $C_0$
    and $n A$, so contains each term of $Gamma$.

    We shall show by induction on $i$ that $b_1 C_i=C_i$. This is clear if
    $i=0$. Assume inductively that $b_1 C_(i-1)=C_(i-1)$. Then
    $b_(1)(C_(i-1) inter C_i)=C_(i-1) inter C_i$ since $b_1$ is type-preserving.
    Thus $b_1 C_i$ contains $C_(i-1) inter C_i$. Now $C_i in Sigma$ and
    $b_1 C_i in Sigma_0$. The two chambers of $Sigma_0$ containing
    $C_(i-1) inter C_i$ are $C_(i-1)$ and $C_i$. Now $b_1 C_i != C_(i-1)$ since
    $b_1$ is bijective, hence $b_1 C_i=C_i$. In particular $b_1 C_m=C_m$. Since
    $b_1$ is type-preserving we have also $b_1 n A=n A$.

    Now $n b n_i C_0$ is a chamber in $Sigma$ which contains $n A$ and so
    $b_1 n b n_i C_0$ is a chamber in $Sigma_0$ which contains $n A$. Thus
    $b_1 n b n_i C_0$ is either $n C_0$ or $n n_i C_0$. If
    $b_1 n b n_i C_0=n C_0$ we have $n b n_i in B n B$, and if
    $b_1 n b n_i C_0=n n_i C_0$ we have $n b n_i in B n n_i B$. Thus
    $ n B n_i subset.eq B n n_i B union B n B. $ <eq:15-7-2-right-bn-inclusion>
    By taking inverses it follows that
    $ n_i B n subset.eq B n_i n B union B n B. $ <eq:15-7-2-left-bn-inclusion>
    Thus $G$ has a $(B,N)$-pair.
    #qed

    _Note._ The above proof shows clearly the geometrical meaning of the axiom
    #book-ref("def", "15-5-bn4", [BN4]). It was shown that some element of $B$
    transforms the chamber $n b n_i C_0$ into a chamber of $Sigma_0$ containing
    $n C_0 inter n n_i C_0$, which must therefore be either $n C_0$ or
    $n n_i C_0$.

    #source(315, "302")
    The relation between the algebraic and geometric structures discussed in
    this chapter may be summarized in the following scheme.

    #block(width: 100%, breakable: false)[
      #align(center)[#building-correspondence()]
    ] <fig:15-7-structure-scheme>

    J. Tits has recently carried out a detailed investigation of the buildings
    of the various different types. In particular he has shown that a finite
    building whose associated Coxeter group is an indecomposable Weyl group of
    rank at least $3$ must be a building $Omega(G; B, N)$, where $G$ is a finite
    Chevalley group or twisted group. Tits is able to deduce from this that the
    only finite simple groups with a $(B,N)$-pair of rank at least $3$ are the
    finite Chevalley groups and twisted groups which have this property (see
    Tits #bib-ref("bib335-238")).
  ]
]

// Preview this file in the context of the complete book.
#context { include "main.typ" }
