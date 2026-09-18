#let chapter = [
  #import "main-defs.typ": (
    V, bib-ref, chapter-ref, equation-ref, section-ref, source,
  )
  #source(14, "1")
  = The Classical Simple Groups <ch:classical-simple-groups>
  == Introduction <sec:introduction>
  The theory of finite simple groups is at present at an extremely interesting
  stage of development. Until about 1955 the only known finite simple groups
  were the cyclic groups of prime order, the alternating groups, the families of
  classical simple groups over a finite field discovered by Jordan #bib-ref(
    "jordan1870",
  ) and investigated by Dickson #bib-ref("dickson1958") and Dieudonné #bib-ref(
    "dieudonne1948",
    "dieudonne1955",
  ), some finite analogues of the simple Lie groups of type $G_2$ discovered by
  Dickson #bib-ref(
    "dickson1901",
    "dickson1905",
  ), and the five ‘sporadic’ simple groups of Mathieu #bib-ref(
    "mathieu1861",
    "mathieu1873",
  ).

  Since that time the families of classical simple groups have been described in
  a unified way by means of the Lie theory, following the fundamental work of
  Chevalley #bib-ref("chevalley1955"). The groups obtained by Chevalley’s method
  include Dickson’s groups of type $G_2$ and also other groups, previously
  unknown, of types $F_4$, $E_6$, $E_7$ and $E_8$.

  Further families of simple groups of Lie type, which may be obtained by
  modifications of Chevalley’s procedure, were later discovered by Steinberg,
  Tits, Hertzig, Suzuki and Ree. In fact all the infinite families of finite
  simple groups known at the time of writing, with the exception of the cyclic
  and alternating groups, may be regarded as groups of Lie type over finite
  fields.

  In addition, the five Mathieu groups have been supplemented by the discovery
  during the last few years of several new ‘sporadic’ simple groups, and it
  seems not at all unlikely that these will be followed by others.

  At the same time, classification theorems for simple groups have been proved
  of increasing strength. Following the Feit-Thompson theorem, proving that
  every non-cyclic simple group has even order, results have been established by
  Brauer, Gorenstein, Suzuki, Walter and others classifying simple groups in
  many cases where the Sylow 2-subgroup or the centralizer of an involution is
  assumed to be known. These results impose severe restrictions on the structure
  of simple groups as yet undiscovered. In fact it is not at all clear whether
  the simple groups known at present constitute ‘almost all’ the simple groups
  which exist, or whether there are large numbers of such groups still to be
  discovered.

  #source(15, "2")
  Now the simple groups of Lie type have many structural features in common and
  our purpose in this volume is to describe some of the properties of these Lie
  families in a unified way, following Chevalley, Steinberg, Tits and others. In
  order to do this some knowledge of root systems and Euclidean reflection
  groups is required, and also some knowledge of the simple Lie algebras over
  the complex field. The results about reflection groups have been developed
  from first principles in #chapter-ref("weyl-groups"), and the results we shall
  require about Lie algebras have been collected together in #chapter-ref(
    "simple-lie-algebras",
  ). With this introductory material, we begin in #chapter-ref(
    "chevalley-groups",
  ) an exposition of the properties of Chevalley groups, regarded as groups of
  automorphisms of Lie algebras. The properties of the Lie families of simple
  groups are to a large extent independent of the field over which the groups
  are defined, and this field will usually be an arbitrary one. However we do
  specialize from time to time to the complex field or a finite field.

  In the present introductory chapter we shall describe the classical groups of
  non-singular linear transformations of a vector space.

  == The Linear Groups <sec:linear-groups>
  Let #V be a vector space of dimension $n$ over a field $K$. The group of all
  non-singular linear transformations of #V into itself is called the general
  linear group $italic("GL")_n (K)$. The transformations of determinant 1 form a
  normal subgroup $italic("SL")_n (K)$, the special linear group. The factor
  group $italic("GL")_n (K)\/italic("SL")_n (K)$ is isomorphic to the
  multiplicative group of non-zero elements of $K$. The centre $Z$ of
  $italic("GL")_n (K)$ consists of all transformations of form $T(x)=lambda x$
  for $lambda in K$ with $lambda != 0$. The factor group $italic("GL")_n (K)\/Z$
  is the projective general linear group $italic("PGL")_n (K)$. It operates on
  the projective space of dimension $n-1$ associated with #V. The centre of
  $italic("SL")_n (K)$ is the subgroup $Z inter italic("SL")_n (K)$, and the
  factor group $italic("SL")_n (K)\/Z inter italic("SL")_n (K)$ is the
  projective special linear group $italic("PSL")_n (K)$.

  The projective special linear groups are generally simple. In fact
  $italic("PSL")_n (K)$ is a simple group for all $n >= 2$, except for the
  groups $italic("PSL")_2(2)$ and $italic("PSL")_2(3)$ (cf. Huppert #bib-ref(
    "huppert1967",
  ), p. 182). The finite simple groups in this family are obtained by taking for
  $K$ the Galois field $italic("GF")(q)$, where $q$ is some power of a prime.
  The projective special linear group over this field is denoted by
  $italic("PSL")_n (q)$ and its order is given by
  $
    abs(italic("PSL")_n (q)) = frac(1, lr((n,q-1)))
    q^(n(n-1)/2)(q^2-1)(q^3-1) dots.c (q^n-1).
  $ <eq:1-2-1>

  #source(16, "3")
  == The Symplectic Groups <sec:symplectic-groups>
  #block()[
    We now suppose that the vector space #V is endowed with a non-singular
    bilinear scalar product which associates with each pair $x, y$ of elements
    of #V an element $(x, y)$ of $K$.
    #block(sticky: true)[
      We assume that this scalar product is skew-symmetric, so that
    ]
    $ (y,x)=-(x,y) $ <eq:1-3-1>
  ]
  for all $x,y in frak(V)$. A space endowed with a scalar product of this type
  is called a symplectic space.

  Consider the non-singular linear transformations of #V into itself which are
  isometries, i.e. which satisfy the condition
  $ (T x,T y)=(x,y) $ <eq:1-3-2>
  for all $x,y in frak(V)$. The isometries form a subgroup of
  $italic("GL")_n (K)$ called the symplectic group $italic("Sp")_n (K)$. Now
  this group is, to within isomorphism, independent of the choice of the scalar
  product. In fact any non-singular skew-symmetric scalar product can be
  represented, with respect to a suitable basis, by the matrix
  $
    A=mat(
      0, 1, , , , , ;
      -1, 0, , , , 0, ;
      , , 0, 1, , , ;
      , , -1, 0, , , ;
      , , , , dots.down, , ;
      , 0, , , , 0, 1;
      , , , , , -1, 0;
    ).
  $ <eq:1-3-3>
  In particular, the dimension of any non-singular symplectic space is even.
  With respect to the above basis the symplectic transformations are represented
  by matrices $T$ satisfying the condition
  $ T' A T=A. $ <eq:1-3-4>

  Now a symplectic transformation necessarily has determinant 1. (cf. Dieudonné
  #bib-ref(
    "dieudonne1948",
  )). The centre $Z$ of $italic("Sp")_n (K)$ consists of the transformations
  #source(
    17,
    "4",
  )$T x=lambda x$, where $lambda=plus.minus 1$. The factor group
  $italic("Sp")_n (K)\/Z$ is called the projective symplectic group
  $italic("PSp")_n (K)$.

  #block()[
    The projective symplectic groups are generally simple. In fact they are all
    simple except for $italic("PSp")_2(2)$, $italic("PSp")_2(3)$,
    $italic("PSp")_4(2)$. The symplectic transformations of a 2-dimensional
    space are just those of determinant 1, therefore we have
    $
      & italic("Sp")_2(K)=italic("SL")_2(K), \
      & italic("PSp")_2(K)=italic("PSL")_2(K).
    $ <eq:1-3-isomorphisms>
  ]
  #block(breakable: false)[
    The finite symplectic groups are denoted by $italic("Sp")_n (q)$, and the
    orders of the finite symplectic groups are given by the formula
    $
      abs(italic("PSp")_(2l)(q))=frac(1, lr((2,q-1))) q^(l^2)(q^2-1)(q^4-1)
      dots.c (q^(2l)-1).
    $ <eq:1-3-5>
  ]

  == The Orthogonal Groups <sec:orthogonal-groups>
  We assume now that #V is a vector space of dimension $n$ over a field $K$ of
  characteristic not equal to 2. (The orthogonal groups over fields of
  characteristic 2 must be defined in a different way, which we describe in
  #section-ref("orthogonal-groups-characteristic-two").) We assume that there is
  defined on #V a non-singular bilinear scalar product which is symmetric, so
  that
  $ (y,x)=(x,y) $ <eq:1-4-1>
  for all $x,y in frak(V)$. This scalar product determines a quadratic form $f$
  given by
  $ f(x)=(x,x). $ <eq:1-4-2>
  #block(breakable: false)[
    Conversely, the quadratic form determines the scalar product by the formula
    $ (x,y)=1/2(f(x+y)-f(x)-f(y)). $ <eq:1-4-3>
  ]
  (We have used here the fact that the characteristic of $K$ is not 2.) The
  non-singular linear transformations of #V which are isometries form a group
  $O_n (K,f)$, the orthogonal group associated with the quadratic form $f$. In
  contrast to the symplectic group, the structure of the group $O_n (K,f)$ does
  depend upon which quadratic form is taken.

  The number of inequivalent quadratic forms which exist on #V is dependent on
  the field $K$. The most important invariant of a quadratic #source(
    18,
    "5",
  )form is its index, which is defined in the following way. A subspace
  $frak(U)$ of #V is called isotropic if
  $ (x,y)=0 $ <eq:1-4-isotropic>
  for all $x,y in frak(U)$. It was proved by Witt that the maximal isotropic
  subspaces of #V all have the same dimension (cf. Dieudonné #bib-ref(
    "dieudonne1948",
  )), and this dimension is called the index of $f$. We shall denote the index
  of $f$ by $nu$. $nu$ cannot be greater than $1/2 n$, and we say that a form
  $f$ has maximal index if $nu=1/2 n$ when $n$ is even and $nu=1/2(n-1)$ when
  $n$ is odd.

  The determinant of an orthogonal transformation is $plus.minus 1$ and the
  orthogonal transformations of determinant 1 form a subgroup
  $italic("SO")_n (K,f)$, the special orthogonal group of $f$. The centre $Z$ of
  $O_n (K,f)$ consists of the transformations $T x=lambda x$ where
  $lambda=plus.minus 1$, provided $n>2$, and
  $ Z inter italic("SO")_n (K,f) $ <eq:1-4-centre>
  is the centre of $italic("SO")_n (K,f)$. Factoring by the centre we obtain the
  corresponding projective groups
  $
     italic("PO")_n (K,f) & = O_n (K,f)\/Z, \
    italic("PSO")_n (K,f) & = italic("SO")_n (K,f)\/Z inter italic("SO")_n (K,f).
  $ <eq:1-4-projective>

  One might expect, by analogy with the symplectic groups, that the groups
  $italic("PSO")_n (K,f)$ are generally simple. This is not so, however, and it
  is necessary to descend to a smaller subgroup. We denote by $Omega_n (K,f)$
  the commutator subgroup of $O_n (K,f)$. Since
  $O_n (K,f)\/italic("SO")_n (K,f)$ is abelian, $Omega_n (K,f)$ is a subgroup of
  $italic("SO")_n (K,f)$. We define the corresponding projective group
  $
    P Omega_n (K,f)=Omega_n (K,f)\/Z inter Omega_n (K,f).
  $ <eq:1-4-projective-omega>
  Then the groups $P Omega_n (K,f)$ are generally simple. In fact
  $P Omega_n (K,f)$ is simple provided $n>=5$ and $nu>=1$. It is not generally
  true that $P Omega_n (K,f)$ is simple if $n=4$, or if $n>=5$ and $nu=0$.

  We now describe the families of finite simple orthogonal groups. Let $K$ be
  the finite field $italic("GF")(q)$ and #V be an $n$-dimensional vector space
  over $K$. We distinguish between the cases when $n$ is odd and even. Suppose
  first that $n$ is odd, and let $n=2l+1$. Then there are just two inequivalent
  non-singular symmetric scalar products on #V, which can be represented
  #source(
    19,
    "6",
  )by the matrices $A$ and $epsilon A$, where $epsilon$ is a non-square in $K$
  and
  $
    A=mat(1, 0, dots.c, 0; 0, 0, , I_l; dots.v, , , ; 0, I_l, , 0).
  $ <eq:1-4-odd-form>
  These two scalar products give rise to the same orthogonal group
  $O_(2l+1)(q)$, and the order of the associated simple group is given by
  $
    abs(P Omega_(2l+1)(q))=frac(1, lr((2,q-1))) q^(l^2)(q^2-1)(q^4-1) dots.c
    (q^(2l)-1).
  $ <eq:1-4-odd-order>
  Note that this is the same as the order of the group $italic("PSp")_(2l)(q)$,
  although the two groups are in general not isomorphic.

  Now suppose $n$ is even and let $n=2l$. There are again just two inequivalent
  non-singular symmetric scalar products on #V, but this time they give rise to
  distinct orthogonal groups. These scalar products can be represented by the
  matrices
  $
    mat(0, I_l; I_l, 0), quad mat(
      0, , I_(l-1), 0, 0;
      , , , dots.v, dots.v;
      I_(l-1), , 0, 0, 0;
      0, dots.c, 0, 1, 0;
      0, dots.c, 0, 0, -epsilon;
    ),
  $ <eq:1-4-even-forms>
  where $epsilon$ is a non-square in $K$. The first of these gives rise to a
  quadratic form of maximal index $l$, and the second has a quadratic form of
  index $l-1$. We shall denote the corresponding orthogonal groups by
  $O_(2l)^+(q)$ and $O_(2l)^-(q)$ respectively. The orders of the associated
  simple groups are #source(20, "7")given by
  $
    abs(P Omega_(2l)^+(q)) & = frac(1, lr((4,q^l-1)))
                             q^(l(l-1))(q^2-1)(q^4-1) dots.c
                             (q^(2l-2)-1)(q^l-1), \
    abs(P Omega_(2l)^-(q)) & = frac(1, lr((4,q^l+1)))
                             q^(l(l-1))(q^2-1)(q^4-1) dots.c
                             (q^(2l-2)-1)(q^l+1).
  $ <eq:1-4-even-orders>

  == The Unitary Groups <sec:unitary-groups>
  We now consider a vector space #V of dimension $n$ over a field $K$ and
  suppose $lambda arrow overline(lambda)$ is an automorphism of $K$ of order 2.
  Suppose #V is endowed with a non-singular Hermitian scalar product $(x,y)$.
  Thus $(x,y)$ is linear in $x$, conjugate linear in $y$, and
  $ (y,x)=overline(lr((x,y))). $ <eq:1-5-hermitian>
  This scalar product determines a Hermitian form $f$ given by
  $ f(x)=(x,x). $ <eq:1-5-form>
  The values $f(x)$ of the form lie in the fixed field $K_0$ of the involutary
  automorphism of $K$. The non-singular linear transformations of #V which are
  isometries with respect to this scalar product form a group $U_n (K,f)$, the
  unitary group associated with the Hermitian form $f$. The structure of
  $U_n (K,f)$ again depends upon the choice of the Hermitian form $f$. The index
  $nu$ of $f$ is again defined as the dimension of the maximal isotropic
  subspaces of #V.

  The unitary transformations of determinant 1 form a subgroup
  $italic("SU")_n (K,f)$, the special unitary group of $f$. The centre $Z$ of
  $U_n (K,f)$ consists of the transformations $T x=lambda x$ where
  $lambda overline(lambda)=1$, provided $n>1$. The centre of
  $italic("SU")_n (K,f)$ is $Z inter italic("SU")_n (K,f)$. Factoring by the
  centre we obtain the corresponding projective groups
  $
     italic("PU")_n (K,f) & = U_n (K,f)\/Z, \
    italic("PSU")_n (K,f) & = italic("SU")_n (K,f)\/Z inter italic("SU")_n (K,f).
  $ <eq:1-5-projective>
  The groups $italic("PSU")_n (K,f)$ are usually simple. In fact
  $italic("PSU")_n (K,f)$ is always simple provided $n>=2$ and $nu>=1$, with the
  exception of three finite unitary groups mentioned below. Again there are
  examples which show that $italic("PSU")_n (K,f)$ need not be simple if $nu=0$.

  We now describe the finite unitary groups. A finite field $K$ admitting an
  automorphism of order 2 must be a field $italic("GF")(q^2)$ for some
  prime-power #source(21, "8")$q$, and the involutary automorphism is given by
  $ overline(lambda)=lambda^q. $ <eq:1-5-frobenius>
  By choosing a suitable basis for the vector space #V over $italic("GF")(q^2)$,
  any non-singular Hermitian scalar product can be represented by the matrix
  $I_n$. Thus there is essentially only one such scalar product, and this gives
  rise to a Hermitian form $f$ of maximal index. The corresponding unitary group
  is denoted by $U_n (q^2)$, and the order of the associated projective special
  unitary group is given by
  $
    abs(italic("PSU")_n (q^2))=frac(1, lr((n,q+1)))
    q^(n(n-1)/2)(q^2-1)(q^3+1)(q^4-1)
    dots.c (q^n-(-1)^n).
  $ <eq:1-5-order>
  The three exceptional groups which are not simple are
  $
    italic("PSU")_2(2^2), quad italic("PSU")_2(3^2), quad italic("PSU")_3(2^2).
  $ <eq:1-5-exceptions>

  #heading(level: 2)[
    The Orthogonal Groups in Characteristic 2
  ] <sec:orthogonal-groups-characteristic-two>
  The orthogonal groups over a field of characteristic 2 have to be defined in
  rather a different way from the orthogonal groups already considered. If $K$
  is a field of characteristic not 2 and $(x,y)$ is a symmetric scalar product
  on a vector space #V over $K$, the corresponding quadratic form $f$ is defined
  by $f(x)=(x,x)$, and therefore satisfies the condition
  $
    f(lambda x+mu y)=lambda^2 f(x)+mu^2 f(y)+2lambda mu(x, y)
  $ <eq:1-6-odd-polarization>
  for all $lambda,mu in K$.

  Now suppose $K$ is a field of characteristic 2. A quadratic form on #V is a
  function $f$ with values in $K$ satisfying the condition
  $
    f(lambda x+mu y)=lambda^2 f(x)+mu^2 f(y)+lambda mu(x, y)
  $ <eq:1-6-polarization>
  for all $lambda,mu in K$, where $(x,y)$ is some bilinear scalar product on #V.
  In particular, putting $mu=0$ we have
  $ f(lambda x)=lambda^2 f(x) $ <eq:1-6-homogeneity>
  and putting $lambda=mu=1$ we have
  $ (x,x)=0 $ <eq:1-6-alternating>
  and
  $ (y,x)=(x,y). $ <eq:1-6-symmetric>

  #source(22, "9")
  Thus $(x,y)$ may be regarded as a symplectic scalar product on #V. It is not
  assumed to be necessarily non-singular but by a suitable choice of basis for
  #V it can be represented by a matrix of form
  $
    mat(
      0, 1, , , , , , , , , ;
      1, 0, , , , , , , , , ;
      , , 0, 1, , , , , , 0, ;
      , , 1, 0, , , , , , , ;
      , , , , dots.down, , , , , , ;
      , , , , , 0, 1, , , , ;
      , , , , , 1, 0, , , , ;
      , , , 0, , , , 0, , , ;
      , , , , , , , , 0, , ;
      , , , , , , , , , dots.down, ;
      , , , , , , , , , , 0;
    ).
  $ <eq:1-6-scalar-matrix>
  Let $n$ be the dimension of #V and $2l$ be the rank of the #equation-ref(
    "1-6-scalar-matrix",
    body: [above matrix],
    highlight: false,
  ). Let $frak(V)_0$ be the set of $x in frak(V)$ such that $(x,y)=0$ for all
  $y in frak(V)$. Then $frak(V)_0$ is a subspace of #V of dimension $d=n-2l$. On
  this subspace $frak(V)_0$ the quadratic form $f$ satisfies the condition
  $ f(lambda x+mu y)=lambda^2 f(x)+mu^2 f(y) $ <eq:1-6-radical-form>
  and $f$ is said to be non-degenerate if no non-zero vector $x in frak(V)_0$
  satisfies $f(x)=0$. The dimension $d$ of $frak(V)_0$ is called the defect of
  $f$.

  #block(sticky: true)[
    The non-singular linear transformations $T$ of #V which satisfy the
    condition
  ]
  $ f(T x)=f(x) $ <eq:1-6-isometry>
  form the orthogonal group $O_n (K,f)$ associated with $f$. Since
  $ (x,y)=f(x+y)+f(x)+f(y), $ <eq:1-6-polar-form>
  #source(23, "10")
  it is clear that
  $ (T x,T y)=(x,y). $ <eq:1-6-bilinear-isometry>
  Thus each element of $O_n (K,f)$ is an isometry of the scalar product $(x,y)$.

  A vector $x in frak(V)$ is called singular if $f(x)=0$, and a subspace of #V
  is called totally singular if each vector in it is singular. Any two maximal
  totally singular subspaces of #V have the same dimension $nu$, and $nu$ is
  called the index of $f$. As before $nu$ is at most $1/2 n$.

  We shall again denote by $Omega_n (K,f)$ the commutator subgroup of
  $O_n (K,f)$.

  We shall consider only non-degenerate quadratic forms and distinguish between
  the cases when $d=0$ and $d>0$. Suppose first that $f$ is a non-degenerate
  quadratic form of defect 0. Then $(x,y)$ is a non-singular symplectic scalar
  product and so $O_n (K,f)$ is a subgroup of $italic("Sp")_n (K)$. (Note that
  $n=2l$ is even.) The commutator subgroups $Omega_n (K,f)$ are usually simple.
  In fact $Omega_n (K,f)$ is simple provided $n>=6$ and $nu>=1$. $Omega_n (K,f)$
  need not be simple if $n=4$ or if $n>=6$ and $nu=0$. We now describe the
  finite groups of this type. A basis
  $e_1,e_2,dots.c,e_l,e_(-1),e_(-2),dots.c,e_(-l)$ can be chosen for #V such
  that $f$ is one of the two following forms:
  $
    f(x) & = x_1 x_(-1)+x_2 x_(-2)+dots.c+x_l x_(-l), \
    f(x) & = x_1 x_(-1)+x_2 x_(-2)+dots.c+x_(l-1)x_(-(l-1))+alpha x_l^2+x_l
           x_(-l)+alpha x_(-l)^2,
  $ <eq:1-6-two-forms>
  where $x=sum_i x_i e_i$ <eq:1-6-coordinates>
  and $alpha t^2+t+alpha$ is an irreducible polynomial over $K=italic("GF")(q)$,
  where $q$ is a power of 2. The indices of these forms $f$ are $l$ and $l-1$
  respectively, and the respective orthogonal groups are denoted by
  $O_(2l)^+(q)$, $O_(2l)^-(q)$. The orders of these groups are given by the same
  formulae as the orders of the groups $O_(2l)^+(q)$, $O_(2l)^-(q)$ when $q$ is
  odd.

  Now suppose that $f$ is a non-degenerate quadratic form of defect greater
  than 0. The defect $d=n-2l$ is the dimension of the subspace $frak(V)_0$ of
  #V, and on $frak(V)_0$ the form $f$ satisfies the relation
  $ f(lambda x+mu y)=lambda^2 f(x)+mu^2 f(y). $ <eq:1-6-positive-defect>
  The set of values $f(x)$ for $x in frak(V)_0$ therefore forms a subset of $K$
  which is a subspace over the subfield $K^2$ of $K$. Since $frak(V)_0$ has
  dimension $d$ over $K$ and #source(
    24,
    "11",
  )$f$ is non-degenerate, $f(frak(V)_0)$ has dimension $d$ over $K^2$. In
  particular
  $ d<=abs(K\:K^2). $ <eq:1-6-defect-bound>
  It can be shown (cf. Dieudonné #bib-ref("dieudonne1948")) that $O_n (K,f)$ is
  isomorphic to the subgroup of $italic("Sp")_(2l)(K)$ of transformations $T$
  satisfying the condition
  $ f(T x)+f(x) in f(frak(V)_0), $ <eq:1-6-symplectic-subgroup>
  where $x$ lies in some suitably chosen non-singular symplectic subspace of #V
  of dimension $2l$.

  If $K$ is a perfect field, i.e. $K^2=K$, it is clear from the above that $d=1$
  and
  $ O_(2l+1)(K,f) ≅ italic("Sp")_(2l)(K). $ <eq:1-6-perfect-isomorphism>
  In particular there is one finite family of orthogonal groups $O_(2l+1)(q)$ of
  this kind, and $O_(2l+1)(q)$ is isomorphic to $italic("Sp")_(2l)(q)$.

  If $K$ is not perfect it can be shown that the commutator subgroup
  $Omega_n (K,f)$ of $O_n (K,f)$ is simple provided $l>=1$ and $nu>=1$ (with the
  possible exception of the case $l=2$, $nu=2$).

  The facts given above about the classical linear, symplectic, orthogonal and
  unitary groups will suffice for our present purposes. For further information
  about these classical groups the reader is referred to the books of Dieudonné
  #bib-ref("dieudonne1948", "dieudonne1955"). We shall show in later chapters
  that many of the simple classical groups, including all the finite families,
  can be interpreted as simple groups of Lie type.
]

// Preview this file in the context of the complete book.
#context { include "main.typ" }
