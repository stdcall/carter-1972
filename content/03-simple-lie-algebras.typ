#let chapter = [
  #[
    #import "main-defs.typ": L, bib-ref, book-ref, source
    #let ad = math.op("ad")
    #let tr = math.op("tr")
    #source(46, "33")
    = Simple Lie Algebras <ch:simple-lie-algebras>

    The simple groups with which we are concerned in this volume are defined as
    groups of automorphisms of Lie algebras. Before introducing them we need
    certain introductory material on Lie algebras, in particular a knowledge of
    the structure of simple Lie algebras over the complex field. Each such Lie
    algebra determines a root system and a Weyl group, to which the results of
    the preceding chapter apply. In the present chapter we summarize the
    properties of Lie algebras which we shall need. Proofs of all the properties
    which we describe can be found, for example, in Jacobson’s book #bib-ref(
      "jacobson1962",
    ).

    == Lie Algebras and Subalgebras <sec:lie-algebras-and-subalgebras>

    A Lie algebra is a vector space #L over a field $K$ on which a product
    operation $[x y]$ is defined satisfying the following axioms:
    #enum(
      numbering: "(i)",
      indent: 1.1em,
      body-indent: 0.5em,
      [#metadata((kind: "anchor")) <def:3-1-lie-i>
        $[x y]$ is bilinear for $x,y in frak(L)$.],
      [#metadata((kind: "anchor")) <def:3-1-lie-ii>
        $[x x]=0$ for $x in frak(L)$.],
      [#metadata((kind: "anchor")) <def:3-1-lie-iii>
        $[[x y] z]+[[y z] x]+[[z x] y]=0$ for $x,y,z in frak(L)$.],
    )
    #block(sticky: true)[
      #book-ref("def", "3-1-lie-iii", [Axiom (iii)]) is called the Jacobi
      identity. We note that $[[x y] z]$ is not necessarily equal to
      $[x [y z]]$, thus Lie multiplication is not in general associative. As a
      simple consequence of axioms #book-ref("def", "3-1-lie-i", [(i)]),
      #book-ref(
        "def",
        "3-1-lie-ii",
        [(ii)],
      ) we have
    ]
    $
      0=[x+y, x+y] & =[x x]+[x y]+[y x]+[y y] \
                   & =[x y]+[y x].
    $ <eq:3-1-anticommutativity>
    Thus $[y x]=-[x y]$ and Lie multiplication is anticommutative. In the
    present work we shall be concerned only with finite-dimensional Lie
    algebras.

    Let #L be a Lie algebra and $frak(M),frak(N)$ be subspaces of #L. We define
    $[frak(M) frak(N)]$ to be the subspace of #L spanned by all elements of form
    $[x y]$ for $x in frak(M)$, $y in frak(N)$. Since $[y x]=-[x y]$ it is clear
    that $[frak(N) frak(M)]=[frak(M) frak(N)]$. Thus multiplication of subspaces
    is commutative.

    A subalgebra of #L is a subspace $frak(M)$ such that
    $[frak(M) frak(M)] subset.eq frak(M)$, and an ideal of #L is a subspace
    $frak(M)$ such that $[frak(M) frak(L)] subset.eq frak(M)$. Since
    $[frak(M) frak(L)]=[frak(L) frak(M)]$ there is no distinction in the theory
    of Lie algebras between left ideals and right ideals. Every ideal is
    two-sided.

    #source(47, "34")
    #block(sticky: true)[
      For each element $x$ of a Lie algebra #L we define a map $ad x$ of #L into
      itself by
    ]
    $ ad x dot y=[x y], quad y in frak(L). $ <eq:3-1-adjoint-map>
    #block(sticky: true)[
      $ad x$ is a linear map, and also satisfies the condition
    ]
    $
      ad x dot [y z] & =[x [y z]]=[[x y] z]+[y [x z]] \
                     & =[ad x dot y,z]+[y,ad x dot z].
    $ <eq:3-1-inner-derivation>
    #block(sticky: true)[
      A linear map $delta$ of #L into itself satisfying
    ]
    $
      delta [y z]=[delta y,z]+[y,delta z], quad y,z in frak(L),
    $ <eq:3-1-derivation>
    #block(sticky: true)[
      is called a derivation of #L. Thus $ad x$ is a derivation of #L for each
      $x$. We note further that
    ]
    $ ad x dot ad y-ad y dot ad x=ad [x y]. $ <eq:3-1-adjoint-bracket>
    #block(sticky: true)[For, given $z in frak(L)$, we have]
    $
      (ad x dot ad y-ad y dot ad x) dot z & =[x [y z]]-[y [x z]] \
                                          & =[[x y] z]=ad [x y] dot z.
    $ <eq:3-1-adjoint-bracket-proof>

    #block(sticky: true)[
      An important rôle in the theory of Lie algebras is played by a scalar
      product called the Killing form. For each $x,y in frak(L)$ we define the
      scalar product $(x,y)$ by
    ]
    $ (x,y)=tr(ad x dot ad y). $ <eq:3-1-killing-form>
    As the trace of the linear map $ad x dot ad y$, $(x,y)$ is an element of the
    field $K$. The scalar product defined in this way is certainly bilinear, and
    is also symmetric, since $tr(theta phi)=tr(phi theta)$ for any two linear
    maps $theta,phi$ of #L into itself.

    #block(sticky: true)[
      After these introductory definitions we turn to a consideration of the
      simple Lie algebras over the complex field $CC$. A Lie algebra is said to
      be simple if it has no ideals other than itself and the zero subspace. The
      1-dimensional Lie algebra over any field is certainly simple and is called
      a trivial algebra. We are concerned with simple non-trivial Lie algebras,
      and we begin with an example which illustrates clearly the main features
      of the general theory. We observe first that any associative algebra can
      be made into a Lie algebra by defining the Lie multiplication by
    ]
    $ [x y]=x y-y x. $ <eq:3-1-associative-bracket>
    #block(sticky: true)[For $[x y]$ is clearly bilinear, $[x x]=0$ and]
    $
      [[x y] z]+[[y z] x]+[[z x] y] & =(x y-y x)z-z(x y-y x)+(y z-z y)x \
                                    & quad-x(y z-z y)+(z x-x z)y-y(z x-x z) \
                                    & =0.
    $ <eq:3-1-associative-jacobi>

    #source(48, "35")
    #block(sticky: true)[
      Consider the algebra of all $(l+1) times (l+1)$ matrices over $CC$. This
      algebra has dimension $(l+1)^2$ and may be made into a Lie algebra as
      described above. The matrices of trace $0$ form a subalgebra of this Lie
      algebra of dimension $(l+1)^2-1=l(l+2)$. For we have
    ]
    $
           tr(x+y) & =tr x+tr y=0, \
      tr(lambda x) & =lambda tr x=0, quad lambda in CC, \
          tr [x y] & =tr(x y-y x)=0.
    $ <eq:3-1-traceless-subalgebra>
    The Lie algebra of all $(l+1) times (l+1)$ matrices of trace $0$ is in fact
    simple.
  ]

  #[
    #import "main-defs.typ": L, bib-ref, source
    #let H = $frak(H)$
    // Section opening shares source p.35 with lie-algebras.typ.
    == The Cartan Decomposition <sec:cartan-decomposition>

    The classification of the simple Lie algebras over $CC$ was obtained by W.
    Killing #bib-ref("killing1888") and E. Cartan #bib-ref("cartan1952"). This
    classification is achieved by decomposing such an algebra with respect to a
    certain type of subalgebra, now called a Cartan subalgebra. A subalgebra #H
    of the Lie algebra #L is called a Cartan subalgebra if it satisfies the
    following two conditions:
    #enum(
      numbering: "(i)",
      indent: 1.1em,
      body-indent: 0.5em,
      [$underbrace([[[frak(H) frak(H)] frak(H)] dots.c], r)=0$ for some $r$.],
    )
    Subalgebras satisfying this condition are called nilpotent.
    #enum(
      numbering: "(i)",
      start: 2,
      indent: 1.1em,
      body-indent: 0.5em,
      [If $[x h] in frak(H)$ for all $h in frak(H)$ then $x in frak(H)$.],
    )
    This condition means that #H is not contained as an ideal in any larger
    subalgebra of #L.

    It can be shown that any Lie algebra over $CC$ has Cartan subalgebras and
    any two Cartan subalgebras are isomorphic. In fact, given any two Cartan
    subalgebras of #L, there is an automorphism of #L which transforms one into
    the other. The dimension of the Cartan subalgebras of #L is called the rank
    of #L, and will usually be denoted by $l$.

    If the algebra #L is simple over $CC$ the Cartan subalgebras actually
    satisfy $[frak(H) frak(H)]=0$, although this is not true in general for
    non-simple algebras. Thus for a simple Lie algebra, Lie multiplication
    inside a Cartan subalgebra is trivial.

    #block(sticky: true)[
      Let #L be simple over $CC$ and #H be a Cartan subalgebra of #L. Then #L
      can be decomposed into a direct sum of #H with a number of 1-dimensional
      subspaces all invariant under multiplication by #H. Thus
    ]
    $
      frak(L)=frak(H) ⊕ frak(L)_(r_1) ⊕ frak(L)_(r_2) ⊕ dots.c ⊕ frak(L)_(r_k),
    $ <eq:3-2-cartan-decomposition>
    #source(49, "36")where $dim frak(L)_(r_i)=1$ and
    $[frak(H) frak(L)_(r_i)]=frak(L)_(r_i)$, for each $i$. This is called a
    Cartan decomposition of #L.

    #block(sticky: true)[
      For example, if #L is the algebra of all $(l+1) times (l+1)$ matrices of
      trace $0$, it is easy to see that the diagonal matrices of trace $0$ form
      a Cartan subalgebra #H. Then we have
    ]
    $ frak(L)=frak(H) ⊕ sum_(i!=j) CC e_(i j), $ <eq:3-2-matrix-decomposition>
    #block(sticky: true)[
      where $e_(i j)$ is the elementary matrix with $1$ in the $(i,j)$ position
      and $0$ elsewhere. This direct decomposition is a Cartan decomposition.
      For let $h=op("diag")(lambda_0,lambda_1,dots.c,lambda_l)$. Then
    ]
    $
      [h e_(i j)]=h e_(i j)-e_(i j)h=(lambda_i-lambda_j)e_(i j).
    $ <eq:3-2-diagonal-action>
    Hence the 1-dimensional subspace $CC e_(i j)$ is invariant under #H.
  ]

  #[
    #import "main-defs.typ": L, book-ref, source
    #let H = $frak(H)$
    #let ad = math.op("ad")
    // Section opening shares source p.36 with cartan.typ.
    == The Roots of a Simple Lie Algebra <sec:roots-of-simple-lie-algebras>

    #block(sticky: true)[Let #L be a simple Lie algebra over $CC$ and]
    $
      frak(L)=frak(H) ⊕ frak(L)_(r_1) ⊕ dots.c ⊕ frak(L)_(r_k)
    $ <eq:3-3-cartan-decomposition>
    #block(sticky: true)[
      be a Cartan decomposition of #L. In each 1-dimensional subspace
      $frak(L)_r$ we choose a non-zero element $e_r$. Then, for each
      $h in frak(H)$, $[h e_r]$ is a scalar multiple of $e_r$, and we write
    ]
    $ [h e_r]=r(h)e_r. $ <eq:3-3-root-action>
    The map $r:frak(H) arrow.r CC$ defined in this way is certainly linear, so
    is an element of the dual space of #H. The maps $r_1,r_2,dots.c,r_k$ from #H
    into $CC$ are called the roots of #L and the subspaces
    $frak(L)_(r_1),frak(L)_(r_2),dots.c,frak(L)_(r_k)$ are called the
    root-spaces of #L (relative to the given Cartan subalgebra #H). This
    terminology originated from the fact that $r(h)$ is a root of the
    characteristic equation of the map $ad h$. The roots $r_1,r_2,dots.c,r_k$
    are in fact all distinct and all non-zero. Thus the zero map is not a root.

    Although the roots are defined as elements of the dual space of #H they can,
    by considering the Killing form, be regarded as elements of #H itself. It
    can be shown that the Killing form of a Lie algebra #L is non-singular if
    and only if #L is semi-simple, i.e. has no proper ideal in which the Lie
    multiplication is trivial. In particular every simple non-trivial algebra is
    semi-simple, and so the Killing form of #L remains non-singular when
    restricted to the Cartan subalgebra #H (although the Killing form of #H
    itself is identically zero). Thus each element of the dual space of #H
    #source(50, "37")is expressible in the form $h arrow.r.bar (x,h)$ for a
    unique element $x in frak(H)$. The element $x$ associated with the map
    $h arrow.r.bar r(h)$ may be identified with the root $r$. Thus $r$ can be
    regarded either as an element of #H or an element of its dual space; the
    relation between these two being given by
    $ r(h)=(r,h), quad h in frak(H). $ <eq:3-3-root-identification>

    Considering the roots as elements of #H, let $Phi$ be the finite subset of
    #H obtained in this way. It can be shown that $Phi$ spans #H, and that if we
    choose any subset of $Phi$ which is a basis for #H then each element of
    $Phi$ is a linear combination of the roots in this subset with rational
    coefficients. Also $(r,s)$ is rational for all $r,s in Phi$. We denote by
    $frak(H)_RR$ the set of all elements of #H which are linear combinations of
    elements of $Phi$ with real coefficients. By the preceding remarks it is
    evident that $frak(H)_RR$ is a real vector space of the same dimension as
    the complex dimension of #H. Also one can show that, if $x in frak(H)_RR$,
    then $(x,x)>=0$ and $(x,x)=0$ only if $x=0$. Thus the Killing form is
    positive definite on $frak(H)_RR$ and so $frak(H)_RR$ may be regarded as a
    Euclidean space. In particular we can define the length of an element
    $x in frak(H)_RR$ by
    $ abs(x)=sqrt((x,x)) $ <eq:3-3-root-norm>
    #block(sticky: true)[and the angle $theta$ between $x,y in frak(H)_RR$ by]
    $ (x,y)=abs(x) abs(y) cos theta. $ <eq:3-3-root-angle>

    #block(sticky: true)[
      Now it is shown in the theory of simple Lie algebras that the subset $Phi$
      of the Euclidean space $frak(H)_RR$ forms a system of roots in the sense
      defined in #book-ref("def", "2-1-1", [2.1.1]). In particular,
      $2(r,s)\/(r,r)$ is a rational integer for all $r,s in Phi$. We give an
      interpretation of this integer. Suppose $r,s$ are linearly independent.
      Since $Phi$ is finite there exist integers $p,q>=0$ such that
      $i r+s in Phi$ for $-p<=i<=q$ but $-(p+1)r+s$ and $(q+1)r+s$ are not in
      $Phi$. The sequence of roots
    ]
    $ -p r+s,dots.c,s,dots.c,q r+s $ <eq:3-3-root-chain>
    #block(sticky: true)[
      will be called the $r$-chain of roots through $s$. Now the reflection
      $w_r$ in the hyperplane orthogonal to $r$ can be shown to permute the
      elements of $Phi$. In fact it has the effect of inverting each $r$-chain
      of roots. In particular it transforms $-p r+s$ into $q r+s$ and so
      $-p r+s$, $q r+s$ are mirror images in the hyperplane orthogonal to $r$.
      Hence
    ]
    $ ((-p r+s)+(q r+s),r)=0. $ <eq:3-3-chain-midpoint>
    #source(51, "38")
    #block(sticky: true)[It follows that]
    $ frac(2(r,s), lr((r,r)))=p-q. $ <eq:3-3-chain-integer>
    #block(sticky: true)[#metadata((kind: "anchor")) <def:cartan-integer>
      For each pair of roots $r,s in Phi$ we define]
    $ A_(r s)=frac(2(r,s), lr((r,r))). $ <eq:3-3-cartan-integer>
    #block(sticky: true)[
      Thus $A_(r s)$ is a rational integer which satisfies $A_(r s)=p-q$ and
    ]
    $ w_r (s)=s-A_(r s)r. $ <eq:3-3-reflection>

    #block(sticky: true)[
      #metadata((kind: "anchor")) <def:fundamental-roots>
      By #book-ref("p", "2-1-2", [2.1.2]) the root system $Phi$ contains a
      subsystem $Pi$ which is a system of fundamental roots. We shall denote
      such a subsystem by
    ]
    $ Pi={p_1,p_2,dots.c,p_l}. $ <eq:3-3-fundamental-roots>
    Every root in $Phi$ is an integral combination of roots in $Pi$ with
    coefficients which are all non-negative or all non-positive and we denote by
    $Phi^+,Phi^-$ the sets of positive and negative roots with respect to the
    fundamental system $Pi$.

    #block(sticky: true)[
      We illustrate the situation by means of an example. Let #L be the Lie
      algebra of all $(l+1) times (l+1)$ matrices of trace $0$. We have seen
      that the diagonal matrices in #L form a Cartan subalgebra #H, and that
    ]
    $ frak(L)=frak(H) ⊕ sum_(i!=j) CC e_(i j) $ <eq:3-3-matrix-decomposition>
    #block(sticky: true)[
      is a Cartan decomposition. Let $h$ be the diagonal matrix
    ]
    $ op("diag")(lambda_0,lambda_1,dots.c,lambda_l). $ <eq:3-3-diagonal-matrix>
    #block(sticky: true)[Then]
    $ [h e_(i j)]=(lambda_i-lambda_j)e_(i j) $ <eq:3-3-matrix-root>
    #block(sticky: true)[
      and so the root corresponding to the subspace $CC e_(i j)$ is the map
      $h arrow.r.bar lambda_i-lambda_j$ of #H into $CC$. Let
      $p_1,p_2,dots.c,p_l$ be the roots defined by
    ]
    $
      p_1: h & arrow.r.bar lambda_0-lambda_1, \
      p_2: h & arrow.r.bar lambda_1-lambda_2, \
      p_l: h & arrow.r.bar lambda_(l-1)-lambda_l.
    $ <eq:3-3-type-a-fundamental-roots>
    #block(sticky: true)[
      Then $p_1,p_2,dots.c,p_l$ form a system of fundamental roots, and the
      other roots have form
    ]
    $ plus.minus(p_(i+1)+dots.c+p_j), quad i<j. $ <eq:3-3-type-a-roots>
    The positive roots of this Lie algebra are therefore the sums of consecutive
    fundamental roots.
  ]

  #[
    #import "diagrams/dynkin.typ": classification, numbered-chain
    #import "main-defs.typ": L, chapter-ref, figure-ref, section-ref, source
    #source(52, "39")
    == The Dynkin Diagram <sec:dynkin-diagram>
    Let $p_i,p_j$ be distinct fundamental roots of a simple Lie algebra #L and
    $theta_(i j)$ be the angle between them. Since $-p_i+p_j$ is not a root,
    $p_j$ is the first member of the #box[$p_i$-chain] of roots through it.
    Using the relation
    $ frac(2(r,s), lr((r,r)))=p-q, $ <eq:3-4-1>
    derived in #section-ref("roots-of-simple-lie-algebras"), and noting that
    $p=0$, we see that $(p_i,p_j)<=0$. Thus the angle between two distinct
    fundamental roots is obtuse.

    There are only a few possibilities for the value of this angle. For
    $2(p_i,p_j)\/(p_i,p_i)$ and $2(p_j,p_i)\/(p_j,p_j)$ are both integers, and
    so
    $ frac(4(p_i,p_j)^2, (p_i,p_i)(p_j,p_j))=4 cos^2 theta_(i j) $ <eq:3-4-2>
    is an integer also. Since $0<=cos^2 theta_(i j)<=1$, we have
    $4 cos^2 theta_(i j)=0,1,2,3$ or $4$. Since $theta_(i j)$ is obtuse,
    $theta_(i j)$ is one of $pi\/2$, $2pi\/3$, $3pi\/4$, $5pi\/6$ or $pi$. The
    fact that $p_i,p_j$ are linearly independent excludes the possibility
    $theta_(i j)=pi$. Thus $theta_(i j)=pi\/2$, $2pi\/3$, $3pi\/4$ or $5pi\/6$.
    We define an integer $n_(i j)$ by $n_(i j)=4 cos^2 theta_(i j)$. Thus
    $n_(i j)=0,1,2$ or $3$ if $i!=j$. $n_(i j)$ admits a factorization
    $
      n_(i j)=frac(2(p_i,p_j), lr((p_i,p_i))) dot
      frac(2(p_j,p_i), lr((p_j,p_j)))
    $ <eq:3-4-3>
    into a product of two non-positive integers. We consider this factorization
    in the different cases which can arise.
    #enum(
      numbering: "(a)",
      indent: 1.1em,
      body-indent: 0.5em,
      [If $n_(i j)=1$ the factorization must be $1=-1 dot -1$. Thus
        $(p_i,p_i)=(p_j,p_j)$ and the roots $p_i,p_j$ have the same length.],
      [If $n_(i j)=2$ the factorization must be $2=-1 dot -2$. Thus one of
        $p_i,p_j$ is $sqrt(2)$ times as long as the other.],
      [If $n_(i j)=3$ the factorization must be $3=-1 dot -3$. Thus one of
        $p_i,p_j$ is $sqrt(3)$ times as long as the other.],
      [If $n_(i j)=0$ we obtain no information about the relative lengths of
        $p_i,p_j$.],
    )
    #block(breakable: false)[
      We observe that the #box[$p_i$-chain] of roots through $p_j$ has length 1,
      2, 3 or 4. For
      $ frac(2(p_i,p_j), lr((p_i,p_i)))=p-q, $ <eq:3-4-4>
    ]
    where $p,q$ are the integers defined as before by the #box[$p_i$-chain] of
    roots through $p_j$. We have seen that
    $ frac(2(p_i,p_j), lr((p_i,p_i)))=0,-1,-2 "or" -3; $ <eq:3-4-5>
    #source(53, "40")
    furthermore $p=0$ since $p_j$ begins the #box[$p_i$-chain] through it. Hence
    $q<=3$, and so the #box[$p_i$-chain] through $p_j$ contains at most four
    roots.

    #block(breakable: false)[
      The same argument shows in fact that any #box[$r$-chain] has at most four
      roots. For let $s$ be the first root in some #box[$r$-chain]. Then
      $ frac(2(r,s), lr((r,r)))=p-q $ <eq:3-4-6>
    ]
    and, as before, this must take one of the values $0,-1,-2,-3$. Since $p=0$
    we have $q<=3$, and so the #box[$r$-chain] has at most four roots.

    We now define the Dynkin diagram of the Lie algebra #L. This is a graph with
    $l$ nodes, one associated with each fundamental root $p_i$, such that the
    #box[$i$th] node is joined to the #box[$j$th] node by a bond of strength
    $n_(i j)$.

    For example, in the Lie algebra of all $(l+1) times (l+1)$ matrices of trace
    0 it can be shown that the fundamental roots $p_1,p_2,dots.c,p_l$ all have
    the same length. Consecutive roots $p_i,p_(i+1)$ are inclined at an angle
    $2pi\/3$ whereas fundamental roots which are not consecutive are orthogonal
    to one another. Thus the Dynkin diagram of this algebra is #align(
      center,
      numbered-chain(),
    ) <fig:3-4-chain>

    Now the possible Dynkin diagrams of simple Lie algebras can be enumerated,
    using the classical results of Killing and Cartan. It can be shown that the
    Dynkin diagram of a simple Lie algebra must be a connected graph.
    Furthermore the only connected graphs which can be Dynkin diagrams of simple
    Lie algebras are the ones in the #figure-ref(
      "3-4-classification",
      body: [following list],
      highlight: false,
    ) #align(center, classification()) <fig:3-4-classification>
    The diagrams are usually named as shown, the suffix denoting the rank (i.e.
    the number of nodes in the graph). The reason that the second type #source(
      54,
      "41",
    )of diagram is given two different names is that the Dynkin diagram does not
    always determine the simple Lie algebra to within isomorphism. Consider the
    problem of recovering the configuration formed by the fundamental roots from
    a knowledge of the Dynkin diagram. In the diagram #align(
      center,
      numbered-chain(double: true),
    ) <fig:3-4-chain-bc>
    it is evident that the corresponding fundamental roots
    $p_1,p_2,dots.c,p_(l-1)$ all have the same length, but $p_l$ is either
    $sqrt(2)$ times shorter or $sqrt(2)$ times longer than the remainder. If
    $p_l$ is shorter the system of fundamental roots is said to have type $B_l$,
    and if $p_l$ is longer the system has type $C_l$. If $l=2$ there is no
    distinction between $B_l,C_l$ as we can obtain either by numbering the nodes
    suitably. For the same reason there is only one fundamental root system of
    type $G_2$ and one of type $F_4$, since the diagrams are symmetric. In all
    remaining cases the Dynkin diagram contains only single bonds—thus all the
    fundamental roots have the same length and the configuration formed by the
    fundamental roots is uniquely determined by the diagram.

    Now it is possible to recover the complete system of roots (as linear
    combinations of the fundamental roots) from a knowledge of the relative
    lengths of the fundamental roots and the angles between them. For if we know
    the configuration formed by the fundamental roots, we know the fundamental
    reflections $w_r$, $r in Pi$. Since the fundamental reflections generate
    $W$, the Weyl group is known. Finally, each root is the image of some
    fundamental root under an element of the Weyl group, thus the complete root
    system is determined.

  ]

  #[
    #import "main-defs.typ": L, bib-ref, book-ref, source
    #let H = $frak(H)$
    #let ad = math.op("ad")
    #heading(level: 2)[
      The Existence and Isomorphism Theorems
    ] <sec:existence-and-isomorphism-theorems>

    We have seen that every simple Lie algebra over $CC$ determines a root
    system, and we now consider which root systems arise from simple Lie
    algebras, and to what extent a simple Lie algebra is determined by its root
    system.

    #block(sticky: true)[
      A root system $Phi$ is said to be indecomposable if it cannot be
      decomposed into two non-empty complementary subsets $Phi_1,Phi_2$ such
      that $(r,s)=0$ for all $r in Phi_1$, $s in Phi_2$. Two root systems
      $Phi_1,Phi_2$ are said to be equivalent if there exists a bijection
      $alpha:Phi_1 arrow.r Phi_2$ such that
    ]
    $ (alpha(r),alpha(s))=lambda(r, s), quad r,s in Phi_1, $
    <eq:3-5-equivalent-roots>
    where $lambda$ is some positive real number independent of $r,s$.

    #source(55, "42")
    Now the root system determined by a simple Lie algebra is indecomposable.
    This follows from the fact that the Dynkin diagram of a simple Lie algebra
    is connected, using #book-ref("p", "2-1-8", [2.1.8]).

    #metadata((kind: "anchor")) <th:3-5-1>
    #smallcaps[Theorem 3.5.1] (Existence theorem). _Let $Phi$ be an
    indecomposable root system. Then there exists a simple Lie algebra over $CC$
    which has a root system equivalent to $Phi$._

    A proof of the existence theorem using the concepts we have outlined can be
    found in Tits #bib-ref("tits1966existence").

    #block(sticky: true)[
      We now consider the relation between two simple Lie algebras which have
      equivalent root systems. We first describe some properties concerning the
      multiplication of the root spaces in a Cartan decomposition. Let
    ]
    $ frak(L)=frak(H) ⊕ sum_(r in Phi) frak(L)_r $
    <eq:3-5-cartan-decomposition>
    be a Cartan decomposition of #L. Then, for any pair of roots $r,s in Phi$ we
    have:
    #enum(
      numbering: "(i)",
      indent: 1.1em,
      body-indent: 0.5em,
      [$[frak(L)_r frak(L)_s]=frak(L)_(r+s)$, if $r+s in Phi$.],
      [$[frak(L)_r frak(L)_s]=0$, if $r+s in.not Phi$, $r+s!=0$.],
      [#metadata((kind: "anchor")) <eq:3-5-bracket-iii>
        $[frak(L)_r frak(L)_(-r)]=CC r$.],
      [$[frak(H) frak(L)_r]=frak(L)_r$.],
    )
    #block(sticky: true)[
      In #book-ref("eq", "3-5-bracket-iii", [(iii)]) $r$ is interpreted as an
      element of #H. Instead of considering the root $r in frak(H)$ it is often
      convenient to take a scalar multiple $h_r$ of $r$, defined by
    ]
    $ h_r=frac(2r, lr((r,r))). $ <eq:3-5-coroot>
    #block(sticky: true)[Since we have]
    $ [h_r e_s]=frac(2(r,s), lr((r,r)))e_s=A_(r s)e_s, $
    <eq:3-5-coroot-action>
    it is evident that $ad h_r$ transforms $e_s$ into an integral multiple of
    itself. By #book-ref("eq", "3-5-bracket-iii", [property (iii)]) above we can
    find, for each $e_r!=0 in frak(L)_r$, an element $e_(-r) in frak(L)_(-r)$
    such that $[e_r e_(-r)]=h_r$.

    We can now state the isomorphism theorem for simple Lie algebras.

    #metadata((kind: "anchor")) <th:3-5-2>
    #smallcaps[Theorem 3.5.2] (Isomorphism theorem).
    #emph[
      Let $frak(L),frak(L)'$ be simple Lie algebras over $CC$ with Cartan
      subalgebras $frak(H),frak(H)'$ of the same dimension $l$. Let
      $p_1,p_2,dots.c,p_l$, and $p'_1,p'_2,dots.c,p'_l$ be sets of fundamental
      roots for #source(56, "43")$frak(L),frak(L)'$ and let
      $
        A_(i j)=frac(2(p_i,p_j), lr((p_i,p_i))), quad
        A'_(i j)=frac(2(p'_i,p'_j), lr((p'_i,p'_i))).
      $ <eq:3-5-cartan-matrices>
      #block(sticky: true)[Let]
      $ h_(p_i)=frac(2p_i, lr((p_i,p_i))), $ <eq:3-5-simple-coroot>
      and let $e_(p_i) in frak(L)_(p_i)$, $e_(-p_i) in frak(L)_(-p_i)$ be chosen
      so that $[e_(p_i) e_(-p_i)]=h_(p_i)$. Define $h_(p'_i),e_(p'_i),e_(-p'_i)$
      similarly in $frak(L)'$.

      Suppose $A_(i j)=A'_(i j)$ for all $i,j$. Then there is a unique
      isomorphism $theta:frak(L) arrow.r frak(L)'$ such that
      $theta(h_(p_i))=h_(p'_i)$, $theta(e_(p_i))=e_(p'_i)$,
      $theta(e_(-p_i))=e_(-p'_i)$.

      In particular any two simple Lie algebras over $CC$ with equivalent root
      systems are isomorphic.
    ]

    A proof of the isomorphism theorem can be found in Jacobson #bib-ref(
      "jacobson1962",
    ), p. 127.
  ]

  #[
    #import "main-defs.typ": (
      L, V, bib-ref, book-ref, figure-ref, qed, section-ref, source,
    )
    #import "diagrams/dynkin.typ": fundamental, low-rank-roots, standard

    #heading(level: 2)[
      Description of the Simple Lie Algebras
    ] <sec:description-of-simple-lie-algebras>

    It follows from what has been said in #section-ref("dynkin-diagram") and
    #book-ref("sec", "existence-and-isomorphism-theorems") that the simple Lie
    algebras over $CC$ are the ones shown in the ‘standard list’ exhibited
    below. We have given for each algebra the dimension, the rank, the number
    $N$ of positive roots, the order of the Weyl group, and the Dynkin diagram.

    #block(breakable: false)[
      #set text(size: 11pt)
      #set par(first-line-indent: 0pt)
      #table(
        columns: (21mm, 21mm, 10mm, 19mm, 26mm, 1fr),
        align: center + horizon,
        inset: (x: 1pt, y: 4pt),
        stroke: none,
        table.hline(stroke: 0.6pt),
        table.header(
          [$frak(L)$],
          [$dim frak(L)$],
          [rank\ $frak(L)$],
          [$N$],
          [$abs(W)$],
          [Dynkin\ diagram],
        ),
        table.hline(stroke: 0.3pt),
        [$A_l$ ($l>=1$)], [$l(l+2)$], [$l$], [$1/2 l(l+1)$], [$(l+1)!$],
        standard("A", unit: 8mm),
        [$B_l$ ($l>=2$)], [$l(2l+1)$], [$l$], [$l^2$], [$2^l dot l!$],
        standard("B", unit: 8mm),
        [$C_l$ ($l>=3$)], [$l(2l+1)$], [$l$], [$l^2$], [$2^l dot l!$],
        standard("C", unit: 8mm),
        [$D_l$ ($l>=4$)], [$l(2l-1)$], [$l$], [$l(l-1)$], [$2^(l-1) dot l!$],
        standard("D", unit: 8mm),
        [$G_2$], [14], [2], [6], [12], standard("G", unit: 8mm),
        [$F_4$], [52], [4], [24], [$2^7 dot 3^2$], standard("F", unit: 8mm),
        [$E_6$], [78], [6], [36], [$2^7 dot 3^4 dot 5$],
        standard("E6", unit: 8mm),
        [$E_7$], [133], [7], [63], [$2^10 dot 3^4 dot 5 dot 7$],
        standard("E7", unit: 8mm),
        [$E_8$], [248], [8], [120], [$2^14 dot 3^5 dot 5^2 dot 7$],
        standard("E8", unit: 8mm),
        table.hline(stroke: 0.6pt),
      )
    ] <fig:3-6-standard-list>

    The matrix $(A_(i j))$ defined in #book-ref("th", "3-5-2", [3.5.2]) is
    called the Cartan matrix of #L. The isomorphism theorem shows that the
    Cartan matrix determines the Lie algebra #L. The Cartan matrices of the
    individual simple algebras #source(57, "44")are shown below.

    // Ellipses make the original open middle of each general-rank matrix
    // explicit.
    $
      A_l: mat(
        2, -1, 0, dots.c, 0, 0, 0;
        -1, 2, -1, dots.down, dots.v, dots.v, dots.v;
        0, -1, 2, dots.down, 0, dots.v, dots.v;
        dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
        dots.v, dots.v, 0, dots.down, 2, -1, 0;
        dots.v, dots.v, dots.v, dots.down, -1, 2, -1;
        0, dots.c, dots.c, dots.c, 0, -1, 2;
      ),
    $ <eq:3-6-cartan-a>
    $
      B_l: mat(
        2, -1, 0, dots.c, 0, 0, 0;
        -1, 2, -1, dots.down, dots.v, dots.v, dots.v;
        0, -1, 2, dots.down, 0, dots.v, dots.v;
        dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
        dots.v, dots.v, 0, dots.down, 2, -1, 0;
        dots.v, dots.v, dots.v, dots.down, -1, 2, -1;
        0, dots.c, dots.c, dots.c, 0, -2, 2;
      ),
    $ <eq:3-6-cartan-b>
    $
      C_l: mat(
        2, -1, 0, dots.c, 0, 0, 0;
        -1, 2, -1, dots.down, dots.v, dots.v, dots.v;
        0, -1, 2, dots.down, 0, dots.v, dots.v;
        dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
        dots.v, dots.v, 0, dots.down, 2, -1, 0;
        dots.v, dots.v, dots.v, dots.down, -1, 2, -2;
        0, dots.c, dots.c, dots.c, 0, -1, 2;
      ),
    $ <eq:3-6-cartan-c>
    $
      D_l: mat(
        2, -1, 0, dots.c, 0, 0, 0;
        -1, 2, -1, dots.down, dots.v, dots.v, dots.v;
        0, -1, 2, dots.down, 0, dots.v, dots.v;
        dots.v, dots.down, dots.down, dots.down, -1, 0, 0;
        0, dots.c, 0, -1, 2, -1, -1;
        0, dots.c, dots.c, 0, -1, 2, 0;
        0, dots.c, dots.c, 0, -1, 0, 2;
      ),
    $ <eq:3-6-cartan-d>
    #source(58, "45")
    $ G_2: mat(2, -1; -3, 2), $ <eq:3-6-cartan-g>
    $
      F_4: mat(2, -1, 0, 0; -1, 2, -1, 0; 0, -2, 2, -1; 0, 0, -1, 2),
    $ <eq:3-6-cartan-f>
    $
      E_6: mat(
        2, -1, 0, 0, 0, 0;
        -1, 2, -1, 0, 0, 0;
        0, -1, 2, -1, -1, 0;
        0, 0, -1, 2, 0, 0;
        0, 0, -1, 0, 2, -1;
        0, 0, 0, 0, -1, 2;
      ),
    $ <eq:3-6-cartan-e6>
    $
      E_7: mat(
        2, -1, 0, 0, 0, 0, 0;
        -1, 2, -1, 0, 0, 0, 0;
        0, -1, 2, -1, 0, 0, 0;
        0, 0, -1, 2, -1, -1, 0;
        0, 0, 0, -1, 2, 0, 0;
        0, 0, 0, -1, 0, 2, -1;
        0, 0, 0, 0, 0, -1, 2;
      ),
    $ <eq:3-6-cartan-e7>
    $
      E_8: mat(
        2, -1, 0, 0, 0, 0, 0, 0;
        -1, 2, -1, 0, 0, 0, 0, 0;
        0, -1, 2, -1, 0, 0, 0, 0;
        0, 0, -1, 2, -1, 0, 0, 0;
        0, 0, 0, -1, 2, -1, -1, 0;
        0, 0, 0, 0, -1, 2, 0, 0;
        0, 0, 0, 0, -1, 0, 2, -1;
        0, 0, 0, 0, 0, 0, -1, 2;
      ).
    $ <eq:3-6-cartan-e8>

    We also give a description of the indecomposable root systems. We begin with
    the systems of rank 1 and 2, viz., systems of type $A_1,A_2,B_2,G_2$.
    #figure-ref(
      "1",
    ) shows the roots expressed as integral combinations of fundamental roots.

    In order to describe the root systems of higher rank it is convenient to use
    an orthonormal basis of the vector space containing the roots.

    (i) Type $A_l$. Let $e_0,e_1,dots.c,e_l$ be an orthonormal basis of a
    Euclidean space of dimension $l+1$, and let #V be the subspace of vectors
    $ sum_(i=0)^l lambda_i e_i "with" sum_(i=0)^l lambda_i=0. $
    <eq:3-6-space-a>
    #source(59, "46")
    #figure(
      [#block[#low-rank-roots() #align(center)[Figure 1]] <fig:1>],
      caption: none,
      placement: top,
    )

    #block(sticky: true)[
      Then the following vectors in #V form a fundamental system of type $A_l$.
    ]
    #align(center, fundamental("A")) <fig:3-6-roots-a>
    #block(sticky: true)[The full system of roots with the above fundamental
      system is given by]
    $ Phi={e_i-e_j; i!=j, quad i,j=0,1,dots.c,l}. $ <eq:3-6-roots-a>

    #source(60, "47")
    #block(sticky: true)[
      (ii) Type $B_l$. Let $e_1,e_2,dots.c,e_l$ be an orthonormal basis of a
      Euclidean space #V. The following vectors form a fundamental system of
      type $B_l$.
    ]
    #align(
      center,
      fundamental("B"),
    ) <fig:3-6-roots-b>
    #block(sticky: true)[The full system of roots with the above fundamental
      system is given by]
    $
      Phi=lr(
        { mat(
            delim: #none, align: #left,
            plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=1\,2\,dots.c\,l;
            plus.minus e_i, i=1\,2\,dots.c\,l;
          ) }
      ).
    $ <eq:3-6-roots-b>

    #block(breakable: false)[
      (iii) Type $C_l$. Let $e_1,e_2,dots.c,e_l$ be an orthonormal basis for #V.
      Then the following vectors form a fundamental system of type $C_l$.
      #align(
        center,
        fundamental("C"),
      ) <fig:3-6-roots-c>
      #block(sticky: true)[The full system of roots with this fundamental system
        is given by]
      $
        Phi=lr(
          { mat(
              delim: #none, align: #left,
              plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=1\,2\,dots.c\,l;
              plus.minus 2e_i, i=1\,2\,dots.c\,l;
            ) }
        ).
      $ <eq:3-6-roots-c>
    ]

    #block(sticky: true)[
      (iv) Type $D_l$. Let $e_1,e_2,dots.c,e_l$ be an orthonormal basis for #V.
      The following vectors form a fundamental system of type $D_l$.
    ]
    #align(
      center,
      fundamental("D"),
    ) <fig:3-6-roots-d>
    #block(sticky: true)[The full system of roots with this fundamental system
      is given by]
    $ Phi={plus.minus e_i plus.minus e_j; i!=j, quad i,j=1,2,dots.c,l}. $
    <eq:3-6-roots-d>

    (v) Type $G_2$. This has already been described.

    #block(sticky: true)[
      (vi) Type $F_4$. Let $e_1,e_2,e_3,e_4$ be an orthonormal basis for #V. The
      following vectors form a fundamental system of type $F_4$.
    ]
    #align(
      center,
      fundamental("F"),
    ) <fig:3-6-roots-f>
    #block(sticky: true)[The full system of roots is]
    $
      Phi=lr(
        { mat(
            delim: #none, align: #left,
            plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=1\,2\,3\,4;
            plus.minus e_i, i=1\,2\,3\,4;
            1/2(plus.minus e_1 plus.minus e_2 plus.minus e_3 plus.minus e_4), ;
          ) }
      ).
    $ <eq:3-6-roots-f>

    #source(61, "48")
    (vii) It is convenient to describe next the root system of type $E_8$. The
    systems $E_7,E_6$ are then easily obtainable as subsystems.

    #block(sticky: true)[
      Let $e_1,e_2,e_3,e_4,e_5,e_6,e_7,e_8$ be an orthonormal basis for #V. The
      following vectors form a fundamental system of type $E_8$.
    ]
    #align(
      center,
      fundamental("E8"),
    ) <fig:3-6-roots-e8>
    #block(sticky: true)[The full root system is]
    $
      Phi=lr(
        { mat(
            delim: #none, align: #left,
            plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=1\,2\,dots.c\,8;
            1/2 sum_(i=1)^8 epsilon_i e_i,
            epsilon_i=plus.minus 1\, quad product_(i=1)^8 epsilon_i=1;
          ) }
      ).
    $ <eq:3-6-roots-e8>

    #block(sticky: true)[
      (viii) Let $e_i$ ($i=1,2,dots.c,8$) be as in (vii). Then we have a
      fundamental system of type $E_7$ given by
    ]
    #align(
      center,
      fundamental("E7"),
    ) <fig:3-6-roots-e7>
    These vectors lie in the subspace of elements
    $ sum_(i=1)^8 lambda_i e_i "satisfying" lambda_1=lambda_8. $
    <eq:3-6-space-e7>
    #block(sticky: true)[The full root system is]
    $
      Phi=lr(
        { mat(
            delim: #none, align: #left,
            plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=2\,3\,4\,5\,6\,7;
            plus.minus(e_1+e_8), ;
            1/2 sum_(i=1)^8 epsilon_i e_i,
            epsilon_i=plus.minus 1\, quad epsilon_1=epsilon_8=1\,
            quad product_(i=1)^8 epsilon_i=1;
            -1/2 sum_(i=1)^8 epsilon_i e_i,
            epsilon_i=plus.minus 1\, quad epsilon_1=epsilon_8=1\,
            quad product_(i=1)^8 epsilon_i=1;
          ) }
      ).
    $ <eq:3-6-roots-e7>

    #source(62, "49")
    #block(sticky: true)[
      (ix) Let $e_i$ ($i=1,2,dots.c,8$) be as in (vii). Then we have a
      fundamental system of type $E_6$ given by
    ]
    #align(
      center,
      fundamental("E6"),
    ) <fig:3-6-roots-e6>
    These vectors lie in the 6-dimensional subspace of elements
    $ sum_(i=1)^8 lambda_i e_i "satisfying" lambda_1=lambda_2=lambda_8. $
    <eq:3-6-space-e6>
    #block(sticky: true)[The full root system is]
    $
      Phi=lr(
        { mat(
            delim: #none, align: #left,
            plus.minus e_i plus.minus e_j, i!=j\, quad i\,j=3\,4\,5\,6\,7;
            1/2 sum_(i=1)^8 epsilon_i e_i,
            epsilon_i=plus.minus 1\, quad epsilon_1=epsilon_2=epsilon_8=1\,
            quad product_(i=1)^8 epsilon_i=1;
            -1/2 sum_(i=1)^8 epsilon_i e_i,
            epsilon_i=plus.minus 1\, quad epsilon_1=epsilon_2=epsilon_8=1\,
            quad product_(i=1)^8 epsilon_i=1;
          ) }
      ).
    $ <eq:3-6-roots-e6>

    For further information about these indecomposable root systems, the reader
    is referred to Jacobson’s book #bib-ref("jacobson1962").

    Let $Phi$ be any indecomposable root system. For each root $r in Phi$ define
    $ h_r=frac(2r, lr((r,r))). $ <eq:3-6-coroot>
    $h_r$ is called the co-root corresponding to $r$ (cf. #section-ref(
      "existence-and-isomorphism-theorems",
    )). Let $Phi^*$ be the set of co-roots $h_r$ for all $r in Phi$.

    #metadata((kind: "anchor")) <p:3-6-1>
    #smallcaps[Proposition 3.6.1.] _$Phi^*$ is also a root system. Moreover if
    $Phi$ contains roots of two different lengths, $r$ is a short root of $Phi$
    if and only if $h_r$ is a long root of $Phi^*$._

    #block(sticky: true)[
      #smallcaps[Proof.] We show that $Phi^*$ satisfies the axioms for a root
      system (#book-ref("def", "2-1-1", [2.1.1])). Since $h_r$ is a scalar
      multiple of $r$ we have $w_r=w_(h_r)$. Thus
    ]
    $
      w_(h_r)(h_s)=w_r lr((frac(2s, lr((s,s)))))
      =frac(2w_(r)(s), lr((w_(r)(s),w_(r)(s))))=h_(w_(r)(s)).
    $ <eq:3-6-coroot-reflection>
    Also we have
    $ frac(2(h_r,h_s), lr((h_r,h_r)))=frac(2(s,r), lr((s,s))), $
    <eq:3-6-coroot-integer>
    which is an integer. Thus $Phi^*$ is a root system.

    #source(63, "50")
    Now $(h_r,h_r)=4\/(r,r)$ and so $(r,r)<(s,s)$ if and only if
    $(h_r,h_r)>(h_s,h_s)$. Thus $r$ is a short root in $Phi$ if and only if
    $h_r$ is a long root in $Phi^*$. #qed

    $Phi^*$ is called the dual root system of $Phi$. It is clear that
    $Phi^(**) = Phi$. It is readily verified that the dual of a root system of
    type $B_l$ is a system of type $C_l$ and that $G_2$ and $F_4$ are self-dual
    systems. Since $B_2=C_2$ this is a self-dual system also. The duality is
    trivial for systems whose roots all have the same length.

    We remark that if $Pi$ is a fundamental system in $Phi$ then $Pi^*$ is a
    fundamental system in $Phi^*$.

    We conclude the present chapter by giving two lemmas which will be useful in
    the development to follow.

    #metadata((kind: "anchor")) <l:3-6-2>
    #smallcaps[Lemma 3.6.2.] _Any positive root $r in Phi^+$ can be expressed as
    a sum of fundamental roots_
    $ r=p_(i_1)+p_(i_2)+dots.c+p_(i_k) $ <eq:3-6-partial-root-sums>
    _in such a way that $p_(i_1)+p_(i_2)+dots.c+p_(i_a)$ is a root for all
    $a<=k$._

    #block(sticky: true)[#smallcaps[Proof.] Let]
    $ r=sum_(i=1)^l n_i p_i $ <eq:3-6-positive-root-coordinates>
    be the expression of $r$ as an integral combination of fundamental roots.
    Then
    $ (r,r)=lr((r,sum_(i=1)^l n_i p_i))=sum_(i=1)^l n_i (r,p_i). $
    <eq:3-6-positive-pairing>
    Now $(r,r)>0$ and $n_i>=0$ for each $i$. Thus there is some $i$ for which
    $(r,p_i)>0$. Suppose $r$ is not a fundamental root. Then $r,p_i$ are
    linearly independent, and $r$ cannot be the first member of the
    #box[$p_i$-chain] of roots through it, thus $r-p_i$ is a root. By repeating
    this process we obtain the required expression for $r$ as a sum of
    fundamental roots. #qed

    #metadata((kind: "anchor")) <l:3-6-3>
    #smallcaps[Lemma 3.6.3.] _Let $r,s$ be roots such that $r+s$ is a root. Then
    the integral combinations of $r,s$ which are roots (i.e. the elements of
    $Phi$ of form $i r+j s$ with $i,j in ZZ$) form a root system of type $A_2$,
    $B_2$ or $G_2$._

    #smallcaps[Proof.] The elements of $Phi$ of form $i r+j s$, with
    $i,j in ZZ$, satisfy the axioms #book-ref("def", "2-1-1", [2.1.1]) for a
    root system in the 2-dimensional space they generate. This 2-dimensional
    system is indecomposable, since it contains two independent non-orthogonal
    roots, so must have type $A_2$, $B_2$ or $G_2$. #qed
  ]
]

#import "chapter-preview.typ": chapter-preview
#chapter-preview(3, chapter)
