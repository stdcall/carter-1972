#let chapter = [
  #[
    #import "main-defs.typ": bib-ref, book-ref, mathclap, qed, source
    #let gf = math.op("GF")
    #let tw(i, body) = math.attach(body, tl: i)
    #let rbar = $overline(r)$
    #let tbar = $overline(t)$
    #let Hhat = $hat(H)$

    #source(263, "250")
    = Further Properties of the Twisted Groups <ch:properties-of-twisted-groups>

    In the last chapter we defined the twisted groups and gave a detailed
    description of the subgroups $U^1,H^1,N^1,W^1$. In the present chapter we
    shall derive the orders of the finite groups in the families, prove the
    simplicity of the twisted groups, and show that certain of these groups can
    be identified with classical groups.

    == The Finite Twisted Groups <sec:finite-twisted-groups>

    Suppose $G^1$ is a twisted group constructed as a subgroup of the Chevalley
    group $G=frak(L)(K)$, and suppose that the field $K$ is finite. If $frak(L)$
    has type $A_l$, where $l>=2$, then $K$ admits an automorphism of order $2$,
    so must be the field $gf(q^2)$ for some prime-power $q$. The same applies if
    $frak(L)$ has type $D_l$ or $E_6$. If $frak(L)$ has type $D_4$ and the graph
    automorphism of $G$ used in the construction has order $3$, then $K$ must be
    a field admitting an automorphism of order $3$. Thus $K=gf(q^3)$ for some
    prime-power $q$. If $frak(L)$ has type $B_2$ or $F_4$, then $K$ is a field
    of characteristic $2$ admitting an automorphism $theta$ such that
    $2theta^2=1$. If $frak(L)$ has type $G_2$, $K$ is a field of characteristic
    $3$ admitting an automorphism $theta$ such that $3theta^2=1$. We determine
    which finite fields have these properties.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:14-1-1>
      #smallcaps[Lemma 14.1.1.] _Let $K=gf(p^n)$ be a finite field of
      characteristic $p$ admitting an automorphism $theta$ satisfying
      $p theta^2=1$. Then $n$ is odd and $theta$ has the form_
      $ lambda^theta=lambda^(p^m), $ <eq:14-1-1-field-automorphism>
      _where $n=2m+1$._
    ]

    #smallcaps[Proof.] We have $lambda^theta=lambda^(p^r)$ for some $r$. Thus
    $lambda^(p theta^2)=lambda^(p^(2r+1))$, and so $lambda^(p^(2r+1))=lambda$
    for all $lambda in K$. Thus $K$ is contained in $gf(p^(2r+1))$, hence $n$
    divides $2r+1$. It follows that $n$ is odd, and we write $n=2m+1$. Let
    $ 2r+1=(2m+1) dot (2s+1). $ <eq:14-1-1-odd-divisibility>
    #source(264, "251")
    Then $r=s(2m+1)+m$ and we have
    $
      lambda^(p^r) & =lambda^(p^((2m+1)s+m)) \
                   & =lambda^(p^((2m+1)s) p^m)
                     =(lambda^(p^((2m+1)s)))^(p^m).
    $ <eq:14-1-1-exponent-reduction>
    But $lambda^(p^(2m+1))=lambda$, thus $lambda^(p^((2m+1)s))=lambda$ and
    $lambda^(p^r)=lambda^(p^m)$. Hence $lambda^theta=lambda^(p^m)$ as required.
    #qed

    Lemma #book-ref("l", "14-1-1", [14.1.1]) shows that if $frak(L)$ has type
    $B_2$ or $F_4$ then $K=gf(2^(2m+1))$ for some $m$, and if $frak(L)$ has type
    $G_2$ then $K=gf(3^(2m+1))$ for some $m$.

    #metadata((kind: "anchor")) <def:twisted-group-notation>
    The notation $G^1=tw(i, frak(L))(K)$ will be used for the twisted groups,
    where the superscript $i$ denotes the order of the symmetry of the Dynkin
    diagram used in the construction. The finite twisted groups will be denoted
    by
    $
           tw(2, A_l)(q^2), & quad l>=2, \
           tw(2, D_l)(q^2), & quad l>=4, \
           tw(2, E_6)(q^2), & \
           tw(3, D_4)(q^3), & \
      tw(2, B_2)(2^(2m+1)), & \
      tw(2, G_2)(3^(2m+1)), & \
      tw(2, F_4)(2^(2m+1)). &
    $ <eq:14-1-twisted-families>
    It is convenient to write the three latter groups also as $tw(2, B_2)(q^2)$,
    $tw(2, G_2)(q^2)$, $tw(2, F_4)(q^2)$ and so we define $q$ in these cases to
    be $p^(m+1/2)$, where $p=2$ or $3$. Note however that $q$ is an irrational
    number in these cases rather than a rational prime-power.

    The groups $tw(2, B_2)(K)$ were discovered by Suzuki #bib-ref(
      "suzuki1960simple",
      "suzuki1962simple",
    ) and are called Suzuki groups, and the groups $tw(2, G_2)(K)$,
    $tw(2, F_4)(K)$ were discovered by Ree #bib-ref(
      "ree1961f4",
      "ree1961twisted",
    ) and are called Ree groups.

    In order to determine the orders of the finite twisted groups we first
    calculate the orders of their subgroups $U^1$, $(U_w^-)^1$ and $H^1$.

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <l:14-1-2>
      #smallcaps[Lemma 14.1.2.]
      #enum(
        numbering: "(i)",
        indent: 0pt,
        body-indent: 0.6em,
        [$abs(U^1)=q^N$.],
        [$abs((U_w^-)^1)=q^(l(w))$, $w in W^1$.],
        [$abs(H^1)=1/d (q-eta_1)(q-eta_2) dots (q-eta_l)$,],
      )
      _where $eta_1,dots,eta_l$ are the eigenvalues of the isometry $tau$ of
      $frak(V)$, and $d$ is the order of the group of self-conjugate
      $K$-characters of $Q slash P$ in the case when all roots have the same
      length, and $d=1$ otherwise._
    ]

    #source(265, "252")
    #smallcaps[Proof.] Let $S$ be one of the equivalence classes in $Phi$
    defined in #book-ref("l", "13-2-1", [13.2.1]). Then #book-ref(
      "p",
      "13-6-3",
      [13.6.3],
    ) shows that $abs(X_S^1)=q^abs(S)$. By #book-ref("p", "13-6-1", [13.6.1]) it
    follows that $abs(U^1)=q^N$ and $abs((U_w^-)^1)=q^(l(w))$.

    We now consider $abs(H^1)$. Suppose all the roots have the same length. Then
    $sigma dot h_r (t)=h_rbar (tbar)$ by #book-ref("l", "13-7-1", [13.7.1]). Let
    $h(chi)$ be an element of $H$, where $chi$ is a $K$-character of $Q$. Then
    $ sigma dot h(chi)=sigma dot h(chi_(p_1,lambda_1) dots chi_(p_l,lambda_l)) $
    <eq:14-1-2-weight-character-expansion>
    as in #book-ref("th", "7-1-1", [7.1.1]) where $lambda_i=chi(q_i)$. It
    follows that
    $
      sigma dot h(chi)
      =h(chi_(overline(p)_1,overline(lambda)_1) dots
        chi_(overline(p)_l,overline(lambda)_l))=h(overline(chi)),
    $ <eq:14-1-2-character-conjugation>
    where $overline(chi)(overline(q)_i)=overline(chi(q_i))$. Thus $h(chi)$ is
    invariant under $sigma$ if $chi$ is a self-conjugate $K$-character of $Q$.

    Let $Hhat^1$ be the group of self-conjugate $K$-characters of $Q$.
    $abs(Hhat^1)$ is the number of self-conjugate $K$-characters of $Q$. In
    order to determine the number of self-conjugate $K$-characters of $Q$ we
    consider the $rho$-orbits of $Pi$ and the corresponding $rho$-orbits of the
    set $q_1,dots,q_l$ of fundamental weights. Let $J$ be such a $rho$-orbit. If
    $abs(J)=1$ the value of a self-conjugate $K$-character $chi$ at the
    corresponding $q_i$ can be any non-zero element of $gf(q)$, so can be chosen
    in $q-1$ ways. If $abs(J)=2$ the value of $chi$ at $q_i$ can be any non-zero
    element of $gf(q^2)$ and the value at $overline(q)_i$ is then determined.
    Thus the values of $chi$ on this orbit can be chosen in $q^2-1$ ways.
    Similarly if $abs(J)=3$ the values of $chi$ on the corresponding orbit can
    be chosen in $q^3-1$ ways. Thus the number of self-conjugate $K$-characters
    of $Q$ is
    $ product_J (q^abs(J)-1) $ <eq:14-1-2-orbit-character-count>
    over all $rho$-orbits $J$ of $Pi$. However, the roots of $x^abs(J)-1$ are
    the eigenvalues of the isometry $tau$ of $frak(V)$ on the subspace spanned
    by the fundamental roots in $J$. Thus
    $ product_J (q^abs(J)-1)=(q-eta_1)(q-eta_2) dots (q-eta_l), $
    <eq:14-1-2-orbit-eigenvalue-product>
    where $eta_1,dots,eta_l$ are the eigenvalues of $tau$ on $frak(V)$.

    Now $H^1$ is the set of elements $h(chi)$ where $chi$ is a self-conjugate
    $K$-character of $P$ which can be extended to a self-conjugate $K$-character
    of $Q$ (#book-ref("th", "13-7-2", [13.7.2])). Thus there is a homomorphism
    of $Hhat^1$ onto $H^1$ obtained by restricting $chi$ from $Q$ to $P$. The
    kernel of this homomorphism is the set of self-conjugate $K$-characters
    $chi$ of $Q$ which are the identity on $P$.
    #block(sticky: true)[
      Thus $abs(Hhat^1) slash abs(H^1)=d$, where $d$ is the order of the group
      of
      #source(266, "253")
      self-conjugate $K$-characters of $Q slash P$. Therefore
    ]
    $ abs(H^1)=1/d product_(i=1)^l (q-eta_i), $ <eq:14-1-2-torus-order>
    as required.

    Now suppose that there are roots of different lengths, i.e. that $G^1$ is a
    Suzuki or Ree group. Then $H^1$ consists of all $sigma$-invariant elements
    of $H$ by #book-ref("th", "13-7-4", [13.7.4]), since we have a finite field.
    Also $h(chi) in H^1$ if and only if
    $ chi(rbar)=chi(r)^(lambda(rbar)theta), quad r in Pi. $
    <eq:14-1-2-exceptional-fixed-character>
    As before the values of $chi$ on a $rho$-orbit $J$ of $Pi$ can be chosen in
    $q^abs(J)-1$ ways. (Note that all $rho$-orbits now have two elements.) Thus
    $ abs(H^1)=product_J (q^abs(J)-1)=product_(i=1)^l (q-eta_i) $
    <eq:14-1-2-exceptional-torus-order>
    for the Suzuki and Ree groups. #qed

    _Note._ The number $d$ in #book-ref("l", "14-1-2", [14.1.2]) takes the value
    $(l+1,q+1)$ for $tw(2, A_l)(q^2)$; $(4,q^l+1)$ for $tw(2, D_l)(q^2)$;
    $(3,q+1)$ for $tw(2, E_6)(q^2)$; and $1$ for $tw(3, D_4)(q^3)$.

    For if $frak(L)=A_l,D_(2k+1)$ or $E_6$, the group $Q slash P$ is cyclic with
    a generator $a$ satisfying $overline(a)=-a$. Thus $chi$ is a self-conjugate
    $K$-character of $Q slash P$ if and only if $chi(-a)=chi(a)^q$, i.e.
    $chi(a)^(q+1)=1$. Thus $d=(Delta,q+1)$, where $Delta=abs(Q slash P)$. For
    the groups $tw(2, D_(2k))(q^2)$, $Q slash P$ is elementary abelian of order
    $4$ and the map $a->overline(a)$ interchanges two non-zero elements and
    fixes the third. Thus $d=(2,q+1)$ in this case, and the case
    $tw(2, D_l)(q^2)$ can be summarized by writing $d=(4,q^l+1)$. Finally for
    $tw(3, D_4)(q^3)$, $Q slash P$ is elementary abelian of order $4$ and the
    map $a->overline(a)$ permutes cyclically the three non-zero elements. Thus
    $d=1$ in this case. These facts may easily be verified using the information
    about the group $Q slash P$ given in section #book-ref(
      "sec",
      "finite-chevalley-groups",
    ).

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:14-1-3>
      #smallcaps[Proposition 14.1.3.]
      $
        abs(G^1)=1/d q^N product_(i=1)^l (q-eta_i)
        sum_(mathclap(w in W^1)) q^(l(w)).
      $
      <eq:14-1-3-twisted-order>
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] This follows from the double coset decomposition of
      $G^1$ with respect to $B^1$. The number of elements in the double coset
      $B^1 n_w B^1$, $w in W^1$, is $abs(B^1) dot abs((U_w^-)^1)$ by #book-ref(
        "p",
        "13-5-3",
        [13.5.3],
      ), and this is equal to
    ]
    $ 1/d q^N product_(i=1)^l (q-eta_i) dot q^(l(w)) $
    <eq:14-1-3-double-coset-size>
    by #book-ref("l", "14-1-2", [14.1.2]). The result follows. #qed
  ]

  #[
    #import "main-defs.typ": book-ref, mathclap, qed, source
    #let tr = math.op("tr")
    #let Ihat = $hat(frak(I))$
    #let Pbar = $overline(P)$
    #let Wtau = $chevron.l W,tau chevron.r$
    #let WJtau = $chevron.l W_J,tau chevron.r$

    #source(267, "254")
    #heading(level: 2)[
      Factorization of the Polynomial $P_(W^1)(t)$
    ] <sec:twisted-poincare-polynomial>

    As with the Chevalley groups, it is possible to simplify the expression
    obtained for the order of the twisted groups by finding a factorization of
    the polynomial
    $ P_(W^1)(t)=sum_(w in W^1) t^(l(w)). $ <eq:14-2-polynomial>
    To do this we use a modification of the argument for the Chevalley groups
    used in section #book-ref("sec", "solomon-theorem").

    Let $frak(I)=RR[I_1,dots,I_l]$ be the ring of polynomial invariants of $W$.
    The isometry $tau$ of $frak(V)$ operates naturally on $frak(I)$ by
    $ tau(P)(x)=P(tau^(-1)(x)) $ <eq:14-2-polynomial-action>
    for $P in frak(I)$, $x in frak(V)$. Since $P$ is an invariant polynomial and
    $tau$ normalizes $W$, $tau(P)$ must also be invariant. Now $tau$ transforms
    the subspace $frak(I)_n$ of homogeneous polynomials of degree $n$ into
    itself for each $n$. Thus by extending the base field from $RR$ to $CC$ we
    can choose a basis of $frak(I)_n$ consisting of eigenvectors of $tau$. Hence
    the generators $I_1,dots,I_l$ of $frak(I)$ as a polynomial ring can be
    chosen to be eigenvectors of $tau$. We suppose the basic invariants
    $I_1,dots,I_l$ are chosen in this way, where $deg I_i=d_i$ and
    $ tau(I_i)=epsilon_i I_i, quad epsilon_i in CC. $
    <eq:14-2-basic-eigenvectors>

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:14-2-1>
      #smallcaps[Proposition 14.2.1.]
      $
        sum_(w in W^1) t^(l(w))
        =product_(i=1)^l lr(((1-epsilon_i t^(d_i))/(1-eta_i t))).
      $ <eq:14-2-1-factorization>
    ]

    #block(sticky: true)[#smallcaps[Proof.] (a) Let]
    $
      P_(W^1)(t)=sum_(w in W^1) t^(l(w)) quad "and" quad
      Pbar_(W^1)(t)=product_(i=1)^l lr(((1-epsilon_i t^(d_i))/(1-eta_i t))).
    $ <eq:14-2-1-two-polynomials>
    Let $P_(W_J^1)(t)$ and $Pbar_(W_J^1)(t)$ denote the corresponding
    polynomials for the groups $W_J^1$, where $J$ is any $rho$-invariant subset
    of $Pi$. For each $rho$-invariant subset $J$ let $O_J$ be the number of
    $rho$-orbits in $J$. We shall show that $P_(W^1)(t)$ and $Pbar_(W^1)(t)$
    satisfy the following identities:
    $ sum_J (-1)^(O_J) (P_(W^1)(t))/(P_(W_J^1)(t))=t^N, $
    <eq:14-2-1-length-identity>
    $ sum_J (-1)^(O_J) (Pbar_(W^1)(t))/(Pbar_(W_J^1)(t))=t^N, $
    <eq:14-2-1-degree-identity>
    #source(268, "255")
    where the sums are taken over all $rho$-invariant subsets of $Pi$. (Compare
    these identities with the ones in section #book-ref(
      "sec",
      "solomon-theorem",
    ).)

    #block(sticky: true)[
      (b) The identity involving $P_(W^1)(t)$ is proved as before. We have
    ]
    $
      sum_J (-1)^(O_J) (P_(W^1)(t))/(P_(W_J^1)(t))
      =sum_J (-1)^(O_J) P_(D_J^1)(t)
    $ <eq:14-2-1-coset-sum>
    // E066: the inner Weyl-group sum is over W^1, as are the adjacent sums.
    $
      quad =sum_J (-1)^(O_J)
      lr((sum_(w in W^1 \ w(J) subset.eq Phi^+) t^(l(w))))
    $ <eq:14-2-1-positive-sum>
    $
      quad =sum_(w in W^1)
      lr((sum_(J \ w(J) subset.eq Phi^+) (-1)^(O_J))) t^(l(w)).
    $ <eq:14-2-1-reordered-sum>
    Let $J_w$ be the set of roots $r in Pi$ such that $w(r) in Phi^+$. Then the
    coefficient of $t^(l(w))$ in the above sum is
    $
      sum_(J subset.eq J_w) (-1)^(O_J)=(1-1)^n, quad "where" n=O_(J_w).
    $ <eq:14-2-1-coefficient>
    This is $0$ unless $J_w$ is the empty set. If $J_w=emptyset$ then $w=w_0$.
    Thus the above sum is $t^(l(w_0))=t^N$.

    (c) We now consider the polynomial $Pbar_(W^1)(t)$. In order to show that
    this polynomial satisfies the above identity we must consider the operation
    of the Weyl group on the Coxeter complex. Note that the isometry $tau$ of
    $frak(V)$ also operates on the Coxeter complex.

    #block(sticky: true)[
      Now each orbit of the Coxeter complex under the operation of $W$ contains
      just one element $C_J$ by #book-ref(
        "p",
        "2-6-3",
        [2.6.3],
      ), where
    ]
    $
      C_J={v;(v,r)=0 "for" r in J, quad (v,r)>0 "for" r in Pi-J}.
    $ <eq:14-2-1-fundamental-face>
    For each $rho$-invariant subset $J$ of $Pi$, let $n_J (w tau)$ be the number
    of elements in the orbit containing $C_J$ which are fixed by $w tau$. We
    show that
    // E067: the proof and subsequent averaging require every w in W.
    $ sum_J (-1)^(O_J) n_J (w tau)=det w, quad w in W. $
    <eq:14-2-1-face-character>

    Let $frak(U)$ be the subspace of $frak(V)$ of elements fixed by $w tau$.
    Then the elements of the Coxeter complex which intersect $frak(U)$ are
    precisely those which are fixed by $w tau$. For if an element $frak(K)$ of
    the complex intersects $frak(U)$ it contains a point in common with
    $w tau(frak(K))$, and so $w tau(frak(K))=frak(K)$. Conversely, if
    $w tau(frak(K))=frak(K)$, $w tau$ must fix some point of $frak(K)$ since
    $w tau$ is an isometry. Thus $frak(K)$ intersects $frak(U)$.

    We now consider the complex in $frak(U)$ whose elements have form
    $frak(K) inter frak(U)$, where $frak(K)$ is an element of the Coxeter
    complex with $w tau(frak(K))=frak(K)$. We
    #source(269, "256")
    wish to find the dimension of $frak(K) inter frak(U)$, and consider first
    the case in which $frak(K)=C_J$ for some $J$. Since $w tau(C_J)=C_J$ we have
    $w(C_(rho(J)))=C_J$ and so $rho(J)=J$ by #book-ref("p", "2-6-3", [2.6.3]).
    Thus $tau(C_J)=C_J$ and $w(C_J)=C_J$. Therefore $w$ fixes every element of
    $C_J$ by #book-ref("cor", "2-6-2", [2.6.2]) and so $w tau$ acts on $C_J$ in
    the same way as $tau$. It follows that the elements of $C_J$ fixed by
    $w tau$ are the elements of $C_J$ fixed by $tau$. However,
    $dim C_J=abs(Pi-J)$ and each $rho$-orbit of $Pi-J$ contributes $1$ to the
    dimension of the $tau$-invariant elements of $C_J$. Thus we have
    $ dim(C_J inter frak(U))=O_(Pi-J). $ <eq:14-2-1-fundamental-dimension>

    We now consider an arbitrary element $frak(K)$ of the Coxeter complex with
    $w tau(frak(K))=frak(K)$. We have $frak(K)=w'(C_J)$ for some $w' in W$ and
    some $J$, by #book-ref("p", "2-6-3", [2.6.3]). Then
    $ w tau w'(C_J)=w'(C_J) $ <eq:14-2-1-conjugated-face>
    #block(sticky: true)[and so]
    $ w'^(-1) w dot tau w' tau^(-1) dot tau(C_J)=C_J. $
    <eq:14-2-1-conjugated-stabilizer>
    #block(sticky: true)[However, $tau w' tau^(-1) in W$, and so we have]
    $ dim(C_J inter frak(U)')=O_(Pi-J), $ <eq:14-2-1-conjugated-dimension>
    #block(sticky: true)[
      where $frak(U)'$ is the subspace of $frak(V)$ of elements fixed by
      $w'^(-1) w tau w'$. Now $frak(U)=w'(frak(U)')$ and so
    ]
    $
      O_(Pi-J)=dim(C_J inter w'^(-1)(frak(U)))
      =dim(w'(C_J) inter frak(U)).
    $ <eq:14-2-1-arbitrary-dimension>
    Thus $dim(frak(K) inter frak(U))=O_(Pi-J)$.

    We now apply #book-ref("l", "9-4-4", [9.4.4]) to the complex induced in
    $frak(U)$. We have seen that the number of elements of this complex of
    dimension $i$ is given by
    $ n_i=sum_(mathclap(O_(Pi-J)=i)) n_J (w tau). $
    <eq:14-2-1-face-dimensions>
    #block(sticky: true)[Thus we have]
    $ sum_J (-1)^(O_(Pi-J)) n_J (w tau)=(-1)^(dim frak(U)). $
    <eq:14-2-1-euler-sum>
    #block(sticky: true)[Hence]
    $ sum_J (-1)^(O_J) n_J (w tau)=(-1)^(O_Pi) dot (-1)^(dim frak(U)). $
    <eq:14-2-1-orbit-parity>

    Now $w$, $tau$ and $w tau$, being orthogonal transformations, have
    eigenvalues $1$, $-1$ or pairs of complex conjugates. Thus
    $
      det(w tau) & =(-1)^(l-dim frak(U)), \
         det tau & =(-1)^(l-dim frak(V)^1)=(-1)^(l-O_Pi).
    $ <eq:14-2-1-determinants>
    #source(270, "257")
    #block(sticky: true)[Hence]
    $ det w=(-1)^(O_Pi) dot (-1)^(dim frak(U)) $ <eq:14-2-1-determinant-ratio>
    #block(sticky: true)[and we have]
    $ sum_J (-1)^(O_J) n_J (w tau)=det w. $ <eq:14-2-1-face-identity>

    #block(sticky: true)[
      (d) We prove next an analogue of #book-ref("p", "9-4-7", [9.4.7]) by
      showing that
    ]
    $ sum_J (-1)^(O_J) tr_((frak(I)_J)_n) tau=tr_(Ihat_n) tau, $
    <eq:14-2-1-trace-identity>
    where $(frak(I)_J)_n$ is the space of homogeneous polynomials on $frak(V)$
    of degree $n$ invariant under $W_J$, $Ihat_n$ is the space of homogeneous
    alternating polynomials of degree $n$, and the sum extends over all
    $rho$-invariant subsets $J$ of $Pi$. Note that the terms $dim (frak(I)_J)_n$
    and $dim Ihat_n$ in #book-ref("p", "9-4-7", [9.4.7]) have been replaced here
    by the trace of $tau$ acting on these two subspaces.

    #block(sticky: true)[
      Consider the group $Wtau$ generated by $W$ and $tau$. The remarks in (c)
      show that the stabilizer of $C_J$ in $Wtau$ is $WJtau$. Therefore the unit
      character of $WJtau$ induced up to $Wtau$ satisfies
    ]
    $
      1_(WJtau)^(Wtau)(w tau)=n_J (w tau),
    $
    <eq:14-2-1-induced-unit>
    just as in #book-ref("l", "9-4-2", [9.4.2]). Now let $chi$ be the trace
    function of $Wtau$ acting on $frak(S)_n$, the space of homogeneous
    polynomials of degree $n$. Then we have
    $
      chi_(WJtau)^(Wtau)(w tau) & =1_(WJtau)^(Wtau)(w tau) dot chi(w tau) \
                                & =n_J (w tau) chi(w tau),
    $ <eq:14-2-1-induced-character>
    as in the proof of #book-ref("p", "9-4-7", [9.4.7]). By (c) it follows that
    $
      sum_J (-1)^(O_J)
      chi_(WJtau)^(Wtau)(w tau)
      =det w dot chi(w tau).
    $ <eq:14-2-1-character-sum>
    #block(sticky: true)[We now average over $W$ and obtain]
    $
      sum_J (-1)^(O_J) 1/abs(W) sum_(w in W)
      chi_(WJtau)^(Wtau)(w tau)
      =1/abs(W) sum_(w in W) det w dot chi(w tau).
    $ <eq:14-2-1-average>
    #block(sticky: true)[But]
    $
      1/abs(W) sum_(w in W)
      chi_(WJtau)^(Wtau)(w tau)
      =1/abs(W_J) sum_(w in W_J) chi(w tau),
    $ <eq:14-2-1-restricted-average>
    as in the proof of #book-ref("p", "9-4-7", [9.4.7]). Thus
    $
      sum_J (-1)^(O_J) chi(1/abs(W_J) sum_(w in W_J) w tau)
      =1/abs(W) sum_(w in W) det w dot chi(w tau).
    $ <eq:14-2-1-projector-average>

    #source(271, "258")
    #block(sticky: true)[Let $M$ be any $Wtau$-module and let]
    $ T=1/abs(W) sum_(w in W) w. $ <eq:14-2-1-projector>
    Then $M$ has a direct decomposition $M=M_0 ⊕ M_1$, as in #book-ref(
      "l",
      "9-3-2",
      [9.3.2],
    ), where $M_0$ is the set of elements annihilated by $T$ and $M_1$ is the
    set of elements fixed by $T$. Since $T$ commutes with $tau$, $T tau$ leaves
    $M_0$ and $M_1$ invariant. In fact $T tau=0$ on $M_0$ and $T tau=tau$ on
    $M_1$. Thus the trace of $T tau$ on $M$ is equal to the trace of $tau$ on
    $M_1$.

    #block(sticky: true)[Applying this with $M=frak(S)_n$ we have]
    $ chi(1/abs(W_J) sum_(w in W_J) w tau)=tr_((frak(I)_J)_n) tau $
    <eq:14-2-1-invariant-trace>
    #block(sticky: true)[and also]
    $ chi(1/abs(W) sum_(w in W) det w dot w tau)=tr_(Ihat_n) tau. $
    <eq:14-2-1-alternating-trace>
    #block(sticky: true)[It follows that]
    $ sum_J (-1)^(O_J) tr_((frak(I)_J)_n) tau=tr_(Ihat_n) tau $
    <eq:14-2-1-trace-result>
    as required. We observe that $tr_(Ihat_n) tau=tr_(frak(I)_(n-N)) tau$ since
    by #book-ref("l", "9-4-6", [9.4.6]) we have
    $ Ihat_n=0 quad "for" n<N, $ <eq:14-2-1-alternants-below-degree>
    $
      Ihat_n=lr((product_(r in Phi^+) H_r)) dot frak(I)_(n-N)
      quad "for" n>=N
    $
    <eq:14-2-1-alternants-above-degree>
    #block(sticky: true)[and]
    $ tau(product_(r in Phi^+) H_r)=product_(r in Phi^+) H_r. $
    <eq:14-2-1-fixed-alternant>

    #block(sticky: true)[(e) The coefficient of $t^n$ in]
    $
      1/((product_(i=1)^l (1-eta_i t)) dot Pbar_(W^1)(t))
      =product_(i=1)^l 1/(1-epsilon_i t^(d_i))
    $ <eq:14-2-1-invariant-series>
    is the trace of $tau$ on $frak(I)_n$, as in #book-ref(
      "p",
      "9-3-3",
      [9.3.3],
    ). Thus the coefficient of $t^n$ in
    // E068: shift the whole series once, not each factor of the product.
    $ t^N/((product_(i=1)^l (1-eta_i t)) dot Pbar_(W^1)(t)) $
    <eq:14-2-1-shifted-series>
    is $tr_(frak(I)_(n-N)) tau=tr_(Ihat_n) tau$.

    #block(sticky: true)[Now consider the coefficient of $t^n$ in]
    // E069: restore t in all degree-one factors here and below.
    $
      1/((product_(i=1)^l (1-eta_i t)) dot Pbar_(W_J^1)(t))
    $ <eq:14-2-1-parabolic-series-left>
    $
      =1/((1-epsilon_(J 1) t^(d_(J 1))) dots
      (1-epsilon_(J k) t^(d_(J k)))(1-eta_(k+1) t) dots (1-eta_l t)),
    $ <eq:14-2-1-parabolic-series-right>
    #source(272, "259")
    #block(sticky: true)[where]
    $
      Pbar_(W_J^1)(t)=product_(i=1)^k
      lr(((1-epsilon_(J i) t^(d_(J i)))/(1-eta_i t))).
    $
    <eq:14-2-1-parabolic-product>
    Since $frak(V)=frak(V)_J ⊕ frak(V)_J^perp$, where $W_J$ operates trivially
    on $frak(V)_J^perp$, the basic invariants of $W_J$ on $frak(V)$ may be taken
    as the basic invariants of $W_J$ on $frak(V)_J$ together with $l-k$
    additional elements satisfying $tau(x_i)=eta_i x_i$, where
    $eta_(k+1),dots,eta_l$ are the eigenvalues of $tau$ on $frak(V)_J^perp$.
    Thus the coefficient of $t^n$ in
    $
      1/((1-epsilon_(J 1) t^(d_(J 1))) dots
      (1-epsilon_(J k) t^(d_(J k)))(1-eta_(k+1) t) dots (1-eta_l t))
    $ <eq:14-2-1-complement-series>
    is the trace of $tau$ on $(frak(I)_J)_n$, again as in #book-ref(
      "p",
      "9-3-3",
      [9.3.3],
    ). By (d) it follows that
    $ sum_J (-1)^(O_J) 1/(Pbar_(W_J^1)(t))=t^N/(Pbar_(W^1)(t)). $
    <eq:14-2-1-series-identity>

    #block(sticky: true)[(f) We have now proved the identities]
    $ sum_J (-1)^(O_J) (P_(W^1)(t))/(P_(W_J^1)(t))=t^N, $
    <eq:14-2-1-final-length-identity>
    $ sum_J (-1)^(O_J) (Pbar_(W^1)(t))/(Pbar_(W_J^1)(t))=t^N, $
    <eq:14-2-1-final-degree-identity>
    and so may deduce that $P_(W^1)(t)=Pbar_(W^1)(t)$ by induction on $abs(J)$.
    This completes the proof. #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #let tw(i, body) = math.attach(body, tl: i)

    == The Orders of the Finite Twisted Groups <sec:finite-twisted-group-orders>

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <th:14-3-1>
      #smallcaps[Theorem 14.3.1.] _The orders of the finite twisted groups are
      given by_
      $
        abs(G^1)=1/d q^N (q^(d_1)-epsilon_1)(q^(d_2)-epsilon_2)
        dots(q^(d_l)-epsilon_l),
      $
      <eq:14-3-1-order>
      _where $d$ is as in section #book-ref("sec", "finite-twisted-groups") and
      $d_i,epsilon_i$ as in section #book-ref(
        "sec",
        "twisted-poincare-polynomial",
      )._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We have shown in #book-ref("p", "14-2-1", [14.2.1])
      that
    ]
    $
      sum_(w in W^1) t^(l(w))
      &=product_(i=1)^l lr(((1-epsilon_i t^(d_i))/(1-eta_i t))) \
      &=t^N product_(i=1)^l lr(((t^(-d_i)-epsilon_i)/(t^(-1)-eta_i))),
    $ <eq:14-3-1-reciprocal-product>
    #source(273, "260")
    since $d_1+dots+d_l=N+l$ by #book-ref("th", "9-3-4", [9.3.4]). Replacing $t$
    by $t^(-1)$ we have
    // E071: source has l=1 below the product, but the factors are indexed by i.
    $
      sum_(w in W^1) t^(N-l(w))
      =product_(i=1)^l lr(((t^(d_i)-epsilon_i)/(t-eta_i))).
    $ <eq:14-3-1-reciprocal-sum>
    #block(sticky: true)[However, $w_0 in W^1$, and for each $w$ we have]
    $ l(w_0 w)=N-l(w). $ <eq:14-3-1-longest-length>
    #block(sticky: true)[It follows that]
    $ sum_(w in W^1) t^(N-l(w))=sum_(w in W^1) t^(l(w)). $
    <eq:14-3-1-length-symmetry>
    #block(sticky: true)[Thus]
    $
      product_(i=1)^l (t-eta_i) dot sum_(w in W^1) t^(l(w))
      =product_(i=1)^l (t^(d_i)-epsilon_i).
    $
    <eq:14-3-1-polynomial-order>
    The result now follows from #book-ref("p", "14-1-3", [14.1.3]) on replacing
    $t$ by $q$. #qed

    We shall now determine the numbers $epsilon_1,dots,epsilon_l$ for the
    individual twisted groups. If we put $t=1$ in the identity
    $
      sum_(w in W^1) t^(l(w))
      =product_(i=1)^l lr(((1-epsilon_i t^(d_i))/(1-eta_i t))),
    $ <eq:14-3-eigenvalue-multiplicities>
    we see that the number of $epsilon_i$ equal to $1$ is the same as the number
    of $eta_i$ equal to $1$. If the isometry $tau$ of $frak(V)$ has order $2$,
    then $epsilon_i=plus.minus 1$ and $eta_i=plus.minus 1$ for all $i$. Thus
    $epsilon_1,dots,epsilon_l$ is a permutation of $eta_1,dots,eta_l$. If $tau$
    has order $3$ then $frak(L)=D_4$ and $eta_1,dots,eta_4$ are
    $1,1,omega,omega^2$ where $omega=e^(2 pi i slash 3)$. Thus two of
    $epsilon_1,dots,epsilon_4$ are $1$ and the other two must be $omega,omega^2$
    since $tau$ is a real transformation of order $3$. Thus in all cases
    $epsilon_1,dots,epsilon_l$ is a permutation of $eta_1,dots,eta_l$.

    The numbers $d_1,dots,d_l$ and $epsilon_1,dots,epsilon_l$ are now known;
    however we still have to determine which $epsilon_i$ is associated with
    which $d_i$. If $frak(L)$ has type $A_l$, $D_l$ ($l$ odd), or $E_6$, then
    $tau=-w_0$. (This follows easily from the fact that $w_0 != -1$ in these
    cases.) Thus $tau$ operates on each invariant in the same way as $-1$. Hence
    $tau(I_i)=(-1)^(d_i) I_i$ and $epsilon_i=(-1)^(d_i)$.

    #block(sticky: true)[
      If $frak(L)$ has type $D_l$ we may take for the fundamental roots
    ]
    $
      p_1=e_1-e_2, quad p_2=e_2-e_3, quad dots, \
      p_(l-1)=e_(l-1)-e_l, quad p_l=e_(l-1)+e_l,
    $ <eq:14-3-dl-simple-roots>
    as in section #book-ref("sec", "description-of-simple-lie-algebras"). Then
    $tau$ operates on the orthonormal basis $(e_i)$ of $frak(V)$ by
    $ tau(e_i)=e_i, quad i=1,dots,l-1, quad tau(e_l)=-e_l. $
    <eq:14-3-dl-isometry>

    #source(274, "261")
    #block(sticky: true)[Each $x in frak(V)$ may be expressed in the form]
    $ x=x_1 e_1+dots+x_l e_l $ <eq:14-3-dl-coordinates>
    and the basic invariants may be taken as the first $l-1$ elementary
    symmetric functions in $x_1^2,x_2^2,dots,x_l^2$, together with
    $x_1 x_2 dots x_l$. Thus the $d_i$ and $epsilon_i$ have values
    $
      d_1=2, quad d_2=4, quad dots, quad d_(l-1)=2(l-1), quad d_l=l, \
      epsilon_1=1, quad epsilon_2=1, quad dots, quad
      epsilon_(l-1)=1, quad epsilon_l=-1.
    $ <eq:14-3-dl-invariants>

    If $frak(L)=B_2$ we have $d_1=2$, $d_2=4$ and the $epsilon$'s are $1,-1$.
    Now the invariant
    $ sum_i x_i^2 $ <eq:14-3-quadratic-invariant>
    of degree $2$ has $epsilon=1$, since $tau$ is an isometry of $frak(V)$. Thus
    $epsilon_1=1$, $epsilon_2=-1$ for $B_2$. If $frak(L)=G_2$ we have $d_1=2$,
    $d_2=6$ and the $epsilon$'s are $1,-1$. Thus we have $epsilon_1=1$,
    $epsilon_2=-1$ as before.

    #block(sticky: true)[Finally suppose $frak(L)=F_4$. Then]
    $ d_1=2, quad d_2=6, quad d_3=8, quad d_4=12 $
    <eq:14-3-f4-degrees>
    and the $epsilon$'s are $1,1,-1,-1$, where $epsilon_1=1$. We show that the
    other basic invariant with $epsilon=1$ is the one of degree $8$.

    #block(sticky: true)[
      The roots of $F_4$ may be written with respect to an orthonormal basis
      $e_1,e_2,e_3,e_4$ in the form
    ]
    $
      plus.minus e_i plus.minus e_j, & quad i != j, \
      plus.minus e_i, & \
      1/2 (plus.minus e_1 plus.minus e_2 plus.minus e_3 plus.minus e_4). &
    $ <eq:14-3-f4-roots>
    #block(sticky: true)[Let $x in frak(V)$ be written as]
    $ x=x_1 e_1+x_2 e_2+x_3 e_3+x_4 e_4 $ <eq:14-3-f4-coordinates>
    #block(sticky: true)[and define the polynomial $I$ by the formula]
    // E070: unordered pairs give one summand per long root, as the prose
    // requires.
    $
      I & =sum_(i<j) (plus.minus x_i plus.minus x_j)^8
          +sum_i (sqrt(2)(plus.minus x_i))^8 \
        & quad +sum lr(
            (sqrt(2)/2
              (plus.minus x_1 plus.minus x_2 plus.minus x_3 plus.minus x_4))
          )^8.
    $ <eq:14-3-f4-invariant>
    There is one term in $I$ for each root, and the terms corresponding to the
    short roots have an additional factor $sqrt(2)$. Since the elements of $W$
    permute the long roots and the short roots, $I$ is a polynomial invariant of
    $W$. Since $tau$ maps long roots into multiples of short roots by a factor
    of $sqrt(2)$ we have $tau(I)=I$. Also, $I$ is not a multiple of the
    quadratic invariant $x_1^2+x_2^2+x_3^2+x_4^2$. For substituting
    $(x_1,x_2,x_3,x_4)=(1,i,0,0)$ in the formula
    #source(275, "262")
    for $I$ gives a non-zero value. Thus $I$ may be taken as the basic invariant
    of degree $8$. Hence $epsilon_1=1$, $epsilon_2=-1$, $epsilon_3=1$,
    $epsilon_4=-1$.

    We have now obtained specific formulae for the orders of the finite twisted
    groups. They are as follows.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:14-3-2>
      #smallcaps[Theorem 14.3.2.]
    ]
    #block(breakable: false)[
      $
        abs(tw(2, A_l)(q^2)) & =1/lr((l+1,q+1)) q^(l(l+1)/2)(q^2-1)(q^3+1) \
                             & quad times(q^4-1)dots(q^(l+1)+(-1)^l),
      $ <eq:14-3-2-unitary-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(2, D_l)(q^2)) & =1/lr((4,q^l+1)) q^(l(l-1))(q^2-1)(q^4-1) \
                             & quad times(q^6-1)dots(q^(2l-2)-1)(q^l+1),
      $ <eq:14-3-2-orthogonal-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(2, E_6)(q^2)) & =1/lr((3,q+1)) q^36(q^2-1)(q^5+1)(q^6-1) \
                             & quad times(q^8-1)(q^9+1)(q^12-1),
      $ <eq:14-3-2-e6-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(3, D_4)(q^3))=q^12(q^2-1)(q^6-1)(q^8+q^4+1),
      $ <eq:14-3-2-triality-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(2, B_2)(q^2))=q^4(q^2-1)(q^4+1), quad q^2=2^(2m+1),
      $ <eq:14-3-2-suzuki-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(2, G_2)(q^2))=q^6(q^2-1)(q^6+1), quad q^2=3^(2m+1),
      $ <eq:14-3-2-ree-g2-order>
    ]
    #block(breakable: false)[
      $
        abs(tw(2, F_4)(q^2)) & =q^24(q^2-1)(q^6+1)(q^8-1)(q^12+1), \
                             & quad q^2=2^(2m+1).
      $ <eq:14-3-2-ree-f4-order>
    ]
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, mathclap, qed, source
    #import "diagrams/twisted-simplicity.typ": unitary-chain
    #let rbar = $overline(r)$
    #let rbarbar = $overline(overline(r))$
    #let sbar = $overline(s)$
    #let tbar = $overline(t)$
    #let tbarbar = $overline(overline(t))$
    #let ubar = $overline(u)$
    #let vbar = $overline(v)$
    #let lbar = $overline(lambda)$
    #let t1bar = $overline(t)_1$
    #let u1bar = $overline(u)_1$

    == The Simplicity of the Twisted Groups <sec:twisted-group-simplicity>

    We shall now show that the twisted groups are all simple, with a few
    exceptions over very small fields.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:14-4-1>
      #smallcaps[Theorem 14.4.1.] _The twisted groups are all simple, except for
      $attach(A, tl: 2)_2 (2^2)$, $attach(B, tl: 2)_2 (2)$,
      $attach(G, tl: 2)_2 (3)$, $attach(F, tl: 2)_4 (2)$._
    ]

    #smallcaps[Proof.] (a) By #book-ref("th", "13-5-4", [13.5.4]) each twisted
    group $G^1$ contains $B^1,N^1$ as a $(B,N)$-pair. We shall therefore use the
    criterion for simplicity given in #book-ref("th", "11-1-1", [11.1.1]). Three
    out of the four conditions given in #book-ref("th", "11-1-1", [11.1.1]) are
    easily checked. $B^1$ is soluble since it is a subgroup of the soluble group
    $B=U H$. Let $G_1^1$ be a normal subgroup of $G^1$ contained in $B^1$. Then
    $G_1^1$ is contained in $U^1 H^1$ and its conjugate $V^1 H^1$, so $G_1^1$ is
    contained in $H^1$. As in the proof of #book-ref("th", "11-1-2", [11.1.2])
    we see that every element of $G_1^1$ commutes with every element of $U^1$
    and every element of $V^1$. Let $h(chi) in G_1^1$. Since
    $ h(chi)x_r (t)h(chi)^(-1)=x_r (chi(r)t), $ <eq:14-4-torus-action>
    #source(276, "263")
    it follows from #book-ref("p", "13-6-3", [13.6.3]) that $chi(r)=1$ for each
    root $r in Phi$. This is because each root $r$ occurs in some equivalence
    class $S$, and so there is an element in $X_S^1$ involving $r$. Hence
    $G_1^1=1$ and
    $ inter.big_(#mathclap($g in G^1$)) g B^1 g^(-1)=1. $
    <eq:14-4-trivial-core>

    The Weyl group of the $(B,N)$-pair $B^1,N^1$ is $W^1$, and the set $I$ of
    distinguished generators of $W^1$ is the set of elements $w_0^J$ as $J$ runs
    over the $rho$-orbits of $Pi$. We have seen in section #book-ref(
      "sec",
      "twisted-weyl-group-structure",
    ) that these elements either form the set of fundamental reflections in some
    indecomposable Weyl group, or $abs(I)=2$ and the two elements of $I$
    generate a dihedral group of order $16$. In either case it is impossible to
    decompose $I$ into non-empty complementary subsets which commute with one
    another. It is therefore sufficient by #book-ref("th", "11-1-1", [11.1.1])
    to prove that $G^1=(G^1)'$. We shall show in fact that $(G^1)'$ contains
    $X_S^1$ for each equivalence class $S$ of $Phi$.

    (b) Suppose all the roots have the same length. Then the equivalence classes
    $S$ of $Phi$ are of type $A_1$, $A_1 times A_1$, $A_1 times A_1 times A_1$,
    or $A_2$. Let $h(chi)$ be an element of $H^1$. We use the following
    relations:
    $ h(chi)x_r (t)h(chi)^(-1)=x_r (chi(r)t) $ <eq:14-4-a1-action>
    if $S={r}$ has type $A_1$.
    $
      h(chi)x_r (t)x_rbar (tbar)h(chi)^(-1)
      =x_r (chi(r)t)x_rbar (chi(rbar)tbar)
    $ <eq:14-4-pair-action>
    if $S={r,rbar}$ has type $A_1 times A_1$.
    $
      & h(chi)x_r (t)x_rbar (tbar)x_rbarbar (tbarbar)h(chi)^(-1) \
      & =x_r (chi(r)t)x_rbar (chi(rbar)tbar)
        x_rbarbar (chi(rbarbar)tbarbar)
    $ <eq:14-4-triple-action>
    if $S={r,rbar,rbarbar}$ has type $A_1 times A_1 times A_1$.
    $
      & h(chi)x_r (t)x_rbar (tbar)x_(r+rbar)(u)h(chi)^(-1) \
      & =x_r (chi(r)t)x_rbar (chi(rbar)tbar)x_(r+rbar)(chi(r+rbar)u)
    $ <eq:14-4-a2-action>
    if $S={r,rbar,r+rbar}$ has type $A_2$ and $u+ubar=-N_(r,rbar)t tbar$.

    We use the self-conjugate characters of #book-ref("th", "13-7-2", [13.7.2]).
    By conjugating under $W^1$ we may suppose that $S=Phi_J^+$ for a $rho$-orbit
    $J$ of $Pi$. If $S={r}$ and $K_0 != upright("GF")(2)$, we can choose such a
    character with $chi(r) != 1$. Indeed, $h_r (c)$ gives $chi(r)=c^2$ for
    $c in K_0^*$. This suffices unless $K_0=upright("GF")(3)$. In that case,
    assigning the fundamental-weight character values on an orbit adjacent to
    $r$ gives $chi(r)$ as the inverse of a field norm, which takes both non-zero
    values of $K_0$.

    If $S$ has type $A_1 times A_1$ or $A_1 times A_1 times A_1$, the product of
    the elements $h_r (c)$ over the orbit, with $c in K^*$ and conjugate
    parameters, gives $chi(r)=c^2$. Since $K$ has more than three elements, we
    can again choose $chi(r) != 1$.

    If $S={r}$ has type $A_1$ and $K_0 != upright("GF")(2)$ we can choose a
    self-conjugate character $chi$ of $Q$ with $chi(r) != 1$. Then
    $x_r ((chi(r)-1)t) in (G^1)'$ for all $t in K_0$.
    #source(277, "264")
    Let $u$ be any non-zero element of $K_0$ and define
    $ t=u/(chi(r)-1). $ <eq:14-4-a1-solve>
    Then $x_r (u) in (G^1)'$, and so $X_S^1 subset.eq (G^1)'$.

    If $S$ has type $A_1 times A_1$ or $A_1 times A_1 times A_1$, we see
    similarly that $X_S^1 subset.eq (G^1)'$, even if $K_0=upright("GF")(2)$.

    If $S$ has type $A_2$ the above relations show that
    $
      & x_r ((chi(r)-1)t)x_rbar ((chi(rbar)-1)tbar) \
      & quad dot x_(r+rbar)((chi(r+rbar)-1)u+N_(r,rbar)(chi(rbar)-1)t tbar)
    $ <eq:14-4-a2-commutator>
    lies in $(G^1)'$. If $K_0 != upright("GF")(2)$ we can choose a
    self-conjugate $K$-character of $Q$ such that $chi(r+rbar) != 1$. For
    $lambda in K^*$ take $chi=chi_(r,lambda)chi_(rbar,lbar)$. Then
    $chi(r)=lambda^2/lbar$, $chi(rbar)=lbar^2/lambda$ and
    $chi(r+rbar)=lambda lbar$. Suppose $chi(r+rbar)=1$ for all $lambda$. Then
    $lambda lbar=1$ for all $lambda != 0$ in $K$ and so $lambda^2=1$ for all
    $lambda != 0$ in $K_0$. Thus $K_0$ is a finite field. Let
    $K_0=upright("GF")(q)$. Then $lbar=lambda^q$ and $lambda^(q+1)=1$ for all
    $lambda != 0$ in $K$. Thus $mu=1$ for all $mu != 0$ in $K_0$, so that
    $K_0=upright("GF")(2)$, the excluded case.

    Let $t_1,u_1$ be elements of $K$ satisfying
    $u_1+u1bar=-N_(r,rbar)t_1 t1bar$. Choose a self-conjugate character $chi$ of
    $Q$ such that $chi(r+rbar) != 1$ and define $t,u in K$ by
    $
      t & =t_1/(chi(r)-1), \
      u & =u_1/(chi(r+rbar)-1)
          -frac(N_(r,rbar)(chi(rbar)-1)t tbar, chi(r+rbar)-1).
    $ <eq:14-4-a2-solve>
    Then $u+ubar=-N_(r,rbar)t tbar$ and $x_r (t_1)x_rbar (t1bar)x_(r+rbar)(u_1)$
    is in $(G^1)'$. Thus $X_S^1 subset.eq (G^1)'$, as required.

    (c) Suppose all the roots have the same length and $K_0=upright("GF")(2)$.
    For each equivalence class $S$ of $Phi$ we define elements $x_S (t)$ or
    $x_S (t,u)$ of $X_S^1$ as in #book-ref("p", "13-6-4", [13.6.4]). We recall
    that it has been shown in (b) that $x_S (t) in (G^1)'$ if $S$ has type
    $A_1 times A_1$ or $A_1 times A_1 times A_1$.

    Now the equivalence classes in $Phi$ are in 1–1 correspondence with the
    elements of a root system with Weyl group $W^1$. We have shown in section
    #book-ref("sec", "twisted-weyl-group-structure") that this root system has
    type:
    $
          C_k & quad "if" quad G^1=attach(A, tl: 2)_(2k-1), \
          B_k & quad "if" quad G^1=attach(A, tl: 2)_(2k), \
      B_(l-1) & quad "if" quad G^1=attach(D, tl: 2)_l, \
          F_4 & quad "if" quad G^1=attach(E, tl: 2)_6, \
          G_2 & quad "if" quad G^1=attach(D, tl: 3)_4.
    $ <eq:14-4-folded-types>
    In each case, except $G^1=attach(A, tl: 2)_2$, the root system with Weyl
    group $W^1$ has roots of two different lengths, and two equivalence classes
    correspond to roots
    #source(278, "265")
    of the same length if and only if they have the same type. Now $W^1$
    operates transitively on roots of a given length, and since
    $
      n_w X_S^1 n_w^(-1)=X_(w(S))^1, quad w in W^1,
    $ <eq:14-4-class-conjugation>
    we see that $G^1$ operates transitively by conjugation on the subgroups
    $X_S^1$ of a given type. It is therefore sufficient to show that one such
    subgroup of each type lies in $(G^1)'$.

    Suppose the Dynkin diagram of $W^1$ has a double bond. Let $S_1,S_2$ be two
    equivalence classes corresponding to fundamental roots joined by this double
    bond. If $G^1$ is not of type $attach(A, tl: 2)_(2k)$ these classes are of
    type $A_1 times A_1$ and $A_1$. Let $S_1={r,rbar}$ and $S_2={s}$. Then the
    commutator relations show that
    $
      [x_(S_2)(u),x_(S_1)(t)]=x_(S_3)(t u)x_(S_4)(t tbar u),
    $ <eq:14-4-double-bond-commutator>
    where $S_3={r+s,rbar+s}$ and $S_4={r+rbar+s}$. (We have used the fact that
    $K$ has characteristic $2$.) Thus $x_(S_3)(t u)x_(S_4)(t tbar u) in (G^1)'$
    for all $t in K$, $u in K_0$. However, $x_(S_3)(t u) in (G^1)'$ since $S_3$
    has type $A_1 times A_1$. Thus $x_(S_4)(1) in (G^1)'$ and so
    $X_(S_4)^1 subset.eq (G^1)'$. Hence $(G^1)'$ contains a subgroup $X_S^1$ of
    type $A_1$ as well as one of type $A_1 times A_1$, thus $(G^1)'$ contains
    $X_S^1$ for all $S$.

    If $G^1$ is of type $attach(A, tl: 2)_(2k)$, the equivalence classes
    $S_1,S_2$ are of type $A_1 times A_1$ and $A_2$. Let $S_1={r,rbar}$ and
    $S_2={s,sbar,s+sbar}$. These fundamental roots $r,rbar,s,sbar$ of $frak(L)$
    may be chosen so they are related in the manner shown in the Dynkin diagram
    of $frak(L)$.
    #figure(unitary-chain(), caption: none, outlined: false)
    <fig:14-4-unitary-chain>
    The commutator relations show that
    $
      [x_(S_2)(u,v),x_(S_1)(t)]=x_(S_3)(t vbar)x_(S_4)(t u,t tbar v),
    $ <eq:14-4-unitary-commutator>
    where $S_3={r+s+sbar,rbar+s+sbar}$ and $S_4={r+s,rbar+sbar,r+rbar+s+sbar}$.
    Thus $x_(S_3)(t vbar)x_(S_4)(t u,t tbar v) in (G^1)'$. However,
    $x_(S_3)(t vbar) in (G^1)'$ since $S_3$ has type $A_1 times A_1$, thus
    $x_(S_4)(t u,t tbar v) in (G^1)'$ also. Putting $t=1$ we have
    $x_(S_4)(u,v) in (G^1)'$ and so $X_(S_4)^1 subset.eq (G^1)'$. It now follows
    as before that $X_S^1 subset.eq (G^1)'$ for all $S$.

    If $G^1$ has type $attach(D, tl: 3)_4$ the equivalence classes correspond to
    a root system of type $G_2$. Let $S_1,S_2$ be classes corresponding to short
    roots of $G_2$ whose sum is short. $S_1,S_2$ both have type $A_1$. Let
    $S_1={r}$, $S_2={s}$. Then the commutator relations show that
    $ [x_(S_2)(u),x_(S_1)(t)]=x_(S_3)(t u), $ <eq:14-4-triality-commutator>
    where $S_3={r+s}$. Thus $x_(S_3)(1) in (G^1)'$ and so
    $X_(S_3)^1 subset.eq (G^1)'$. Hence $X_S^1 subset.eq (G^1)'$ for all $S$ as
    before.

    #source(279, "266")
    (d) Now suppose that $Phi$ contains roots of different lengths. Then the
    equivalence classes $S$ of $Phi$ are of type $A_1 times A_1$, $B_2$ or
    $G_2$. Suppose that $G^1=attach(B, tl: 2)_2 (K)$ or
    $attach(F, tl: 2)_4 (K)$. Then the equivalence classes have type
    $A_1 times A_1$ or $B_2$. Let $h(chi)$ be an element of $H^1$. Then
    $chi(rbar)=chi(r)^(lambda(rbar)theta)$ by #book-ref(
      "th",
      "13-7-4",
      [13.7.4],
    ). Let $S={r,rbar}$ be an equivalence class of type $A_1 times A_1$, where
    $r$ is short and $rbar$ long. Then
    $ h(chi)x_S (t)h(chi)^(-1)=x_S (chi(rbar)t) $ <eq:14-4-unequal-pair-action>
    and so
    $
      h(chi)x_S (t)h(chi)^(-1)x_S (t)^(-1)=x_S ((chi(rbar)-1)t)
    $ <eq:14-4-unequal-pair-commutator>
    by #book-ref("p", "13-6-4", [13.6.4 (v)]). Now by #book-ref(
      "th",
      "13-7-4",
      [13.7.4],
    ) we can find an element $h(chi) in H^1$ for which $chi(rbar)$ takes any
    prescribed non-zero value in $K$. Thus if $K != upright("GF")(2)$ we may
    choose $chi$ so that $chi(rbar) != 1$. It follows that
    $X_S^1 subset.eq (G^1)'$.

    Now let $S={a,b,a+b,2a+b}$ be an equivalence class of type $B_2$. Suppose
    that $alpha(t),beta(u)$ are defined as in #book-ref("p", "13-6-4", [13.6.4
      (vi)]). Then
    $ h(chi)beta(u)h(chi)^(-1)=beta(chi(a+b)u). $ <eq:14-4-b2-beta-action>
    Thus we have
    $
      h(chi)beta(u)h(chi)^(-1)beta(u)^(-1)=beta((chi(a+b)-1)u).
    $ <eq:14-4-b2-beta-commutator>
    By #book-ref("th", "13-7-4", [13.7.4]) we can choose $h(chi) in H^1$ so that
    $chi(a+b)$ takes any non-zero value in $K$. Thus $beta(u) in (G^1)'$ for all
    $u$, provided $K != upright("GF")(2)$. We also have
    $ h(chi)alpha(t)h(chi)^(-1)=alpha(chi(b)t) $ <eq:14-4-b2-alpha-action>
    and
    $
      & h(chi)alpha(t)h(chi)^(-1)alpha(t)^(-1) \
      & =alpha(chi(b)t)alpha(-t)beta(t^(theta+1)) \
      & =alpha((chi(b)-1)t)beta((chi(b)^theta-1)t^(theta+1))
    $ <eq:14-4-b2-alpha-commutator>
    by #book-ref("p", "13-6-4", [13.6.4 (vi)]). Since $beta(u) in (G^1)'$ for
    all $u$ we have $alpha((chi(b)-1)t) in (G^1)'$ for all $t$. As before we may
    choose $chi$ with $chi(b) != 1$ provided $K != upright("GF")(2)$. Thus
    $alpha(t) in (G^1)'$ for all $t$. Hence
    $ x_S (t,u)=alpha(t)beta(u) in (G^1)' $ <eq:14-4-b2-derived-subgroup>
    and $X_S^1 subset.eq (G^1)'$, as required.

    (e) We suppose finally that $G^1=attach(G, tl: 2)_2 (K)$. In the proof of
    #book-ref("th", "13-7-4", [13.7.4]) we showed that $H^1$ contains the
    element
    $ h(chi)=h_a ((-lambda^(-2))^theta)h_b (-lambda^(-2)) $
    <eq:14-4-ree-torus-element>
    #source(280, "267")
    for all $lambda != 0$ in $K$. Since
    $ chi=chi_(a,(-lambda^(-2))^theta)chi_(b,-lambda^(-2)), $
    <eq:14-4-ree-character>
    we have
    $
      chi(a) & =(-lambda^(-2))^(theta dot A_(a a)) dot
               (-lambda^(-2))^(A_(b a))=-lambda^(-4theta+2), \
      chi(b) & =(-lambda^(-2))^(theta dot A_(a b)) dot
               (-lambda^(-2))^(A_(b b))=-lambda^(6theta-4).
    $ <eq:14-4-ree-weights>
    Let $alpha(t),beta(u),gamma(v)$ be defined as in #book-ref(
      "p",
      "13-6-4",
      [13.6.4 (vii)],
    ). Then
    $ h(chi)gamma(v)h(chi)^(-1)=gamma(chi(3a+2b)v) $ <eq:14-4-ree-gamma-action>
    and
    $
      h(chi)gamma(v)h(chi)^(-1)gamma(v)^(-1)=gamma((chi(3a+2b)-1)v)
    $ <eq:14-4-ree-gamma-commutator>
    by #book-ref("p", "13-6-4", [13.6.4 (vii)]). Now $chi(3a+2b)=-lambda^(-2)$.
    Suppose $chi(3a+2b)=1$ for all $lambda$. Then $-lambda^(-2)=1$ for all
    $lambda != 0$ in $K$, hence $lambda^4=1$ for all $lambda != 0$ in $K$. Now
    $K$ is a field of characteristic $3$, so if $K != upright("GF")(3)$ we can
    choose $chi$ so that $chi(3a+2b) != 1$. It follows that $gamma(v) in (G^1)'$
    for all $v in K$.

    Now consider the elements $beta(u)$. We have
    $ h(chi)beta(u)h(chi)^(-1)=beta(chi(3a+b)u) $ <eq:14-4-ree-beta-action>
    and so
    $
      h(chi)beta(u)h(chi)^(-1)beta(u)^(-1)=beta((chi(3a+b)-1)u)
    $ <eq:14-4-ree-beta-commutator>
    by #book-ref("p", "13-6-4", [13.6.4 (vii)]). Now
    $chi(3a+b)=lambda^(-6theta+2)$. Suppose $chi(3a+b)=1$ for all $lambda$. Then
    $lambda^(-6theta+2)=1$ and so $lambda^(-2+2theta)=1$ since $6theta^2=2$. It
    follows that $lambda^(-6+6theta)=1$ and so $lambda^(-4)=1$. Thus
    $lambda^4=1$ for all $lambda != 0$ in $K$. If $K != upright("GF")(3)$ we can
    therefore choose $chi$ so that $chi(3a+b) != 1$. Then $beta(u) in (G^1)'$
    for all $u in K$.

    Now consider the elements $alpha(t)$. We have
    $ h(chi)alpha(t)h(chi)^(-1)=alpha(chi(b)t) $ <eq:14-4-ree-alpha-action>
    and so, by #book-ref("p", "13-6-4", [13.6.4 (vii)]), we have
    $
      h(chi)alpha(t)h(chi)^(-1)alpha(t)^(-1)
      =alpha((chi(b)-1)t)beta(u)gamma(v)
    $ <eq:14-4-ree-alpha-commutator>
    for certain elements $u,v in K$. However, $beta(u)$ and $gamma(v)$ belong to
    $(G^1)'$ and therefore $alpha((chi(b)-1)t)$ is in $(G^1)'$ also. Now
    $chi(b)=-lambda^(6theta-4)$. Suppose $chi(b)=1$ for all $lambda$. Then
    $-lambda^(6theta-4)=1$ and so $-lambda^(2-4theta)=1$ since $6theta^2=2$. It
    follows that $lambda^(12theta-8)=1$ and $-lambda^(6-12theta)=1$, whence
    $-lambda^(-2)=1$. Therefore $lambda^4=1$ for all $lambda != 0$ in $K$. If
    $K != upright("GF")(3)$ we can choose $chi$ so that $chi(b) != 1$. Thus
    $alpha(t) in (G^1)'$ for all $t in K$.

    #source(281, "268")
    #block(sticky: true)[We have now shown that]
    $ x_S (t,u,v)=alpha(t)beta(u)gamma(v) in (G^1)' $
    <eq:14-4-ree-derived-subgroup>
    for all $t,u,v in K$, hence $X_S^1 subset.eq (G^1)'$ as required.

    (f) We have now shown that $X_S^1 subset.eq (G^1)'$ for all equivalence
    classes $S$ of $Phi$, except when $G^1=attach(A, tl: 2)_2 (2^2)$,
    $attach(B, tl: 2)_2 (2)$, $attach(G, tl: 2)_2 (3)$,
    $attach(F, tl: 2)_4 (2)$. Since the subgroups $X_S^1$ generate $G^1$ we have
    $G^1=(G^1)'$ except in these cases. Thus $G^1$ is simple by #book-ref(
      "th",
      "11-1-1",
      [11.1.1],
    ). #qed

    _Note._ The four twisted groups which have not been proved to be simple are
    all in fact not simple. $attach(A, tl: 2)_2 (2^2)$ is a soluble group of
    order $72$, $attach(B, tl: 2)_2 (2)$ is a soluble group of order $20$,
    $attach(G, tl: 2)_2 (3)$ is a group of order $1512$ which has as its
    commutator subgroup the simple group $A_1 (8)$ of order $504$, and
    $attach(F, tl: 2)_4 (2)$ has as its commutator subgroup a subgroup of index
    $2$ which is simple of order $2^11 dot 3^3 dot 5^2 dot 13$.
    $(attach(F, tl: 2)_4 (2))'$ can be proved to be simple by an argument along
    the lines of the preceding discussion (cf. Tits #bib-ref("bib334-228")).
    This group is not isomorphic to any of the other simple groups of Lie type
    which we have discussed.
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source
    #import "diagrams/twisted-classical.typ": orthogonal-fork
    #let rbar = $overline(r)$
    #let tbar = $overline(t)$
    #let abar = $overline(alpha)$
    #let Mbar = $overline(M)$
    #let Tbar = $overline(T)$

    #heading(level: 2)[
      Identification with some Classical Groups
    ] <sec:twisted-classical-group-identifications>

    We show now that the twisted groups $attach(A, tl: 2)_l (K)$ and
    $attach(D, tl: 2)_l (K)$ are isomorphic to certain classical groups.

    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:14-5-1>
      #smallcaps[Theorem 14.5.1.] _$attach(A, tl: 2)_l$ is isomorphic to the
      unitary group $upright("PSU")_(l+1)(K,f)$ leaving invariant the Hermitian
      form_
    ]
    $
      f=epsilon(
        overline(x)_0 x_l-overline(x)_1 x_(l-1)
        +overline(x)_2 x_(l-2)-dots
      )
    $ <eq:14-5-1-hermitian-form>
    _ with matrix_
    $
      A=epsilon mat(

        , , , , , 1;
        , , , , -1, ;
        , , , 1, , ;
        , , -1, , , ;
        , dots.up, , , , ;
        dots.up, , , , ,
      ).
    $ <eq:14-5-1-hermitian-matrix>
    _Here $epsilon$ is defined to be $1$ if $l$ is even and a non-zero element
    of $K$ satisfying $epsilon+overline(epsilon)=0$ if $l$ is odd._

    #source(282, "269")
    #smallcaps[Proof.] By #book-ref("th", "3-5-2", [3.5.2]) there is an
    automorphism of the Lie algebra $frak(L)$ such that
    $ e_r -> e_rbar, quad h_r -> h_rbar $ <eq:14-5-1-diagram-automorphism>
    for $r in Pi$ or $-r in Pi$. If we transfer to the field $K$ we obtain a
    corresponding automorphism of the Lie algebra $frak(L)_K$. If we then
    combine this automorphism with the field automorphism $t -> tbar$ of $K$ we
    obtain a ‘semi-automorphism’ $psi$ of $frak(L)_K$ which satisfies the
    conditions
    $
                psi(h_r) & =h_rbar, quad psi(e_r)=e_rbar, quad r in
                           plus.minus Pi, \
      psi(lambda x+mu y) & =overline(lambda)psi(x)+overline(mu)psi(y), \
                         & quad lambda,mu in K; thin x,y in frak(L)_K.
    $ <eq:14-5-1-semilinearity>
    We now consider the map
    $ theta -> psi theta psi^(-1), $ <eq:14-5-1-conjugation-map>
    where $theta$ is an element of the Chevalley group $G=frak(L)(K)$. The
    transformation $psi theta psi^(-1)$ is easily seen to be an automorphism of
    $frak(L)_K$ and we have
    $
      psi x_r (t)psi^(-1) & =psi exp(upright("ad") t e_r)psi^(-1) \
                          & =exp upright("ad")(psi dot t e_r)
                            =exp(upright("ad") tbar e_rbar)=x_rbar (tbar)
    $ <eq:14-5-1-root-conjugation>
    for $r in plus.minus Pi$. Thus $psi x_r (t)psi^(-1) in G$, and since the
    elements $x_r (t)$ for $r in plus.minus Pi$, $t in K$, generate $G$ it
    follows that the map $theta -> psi theta psi^(-1)$ transforms $G$ into
    itself. It is in fact an automorphism of $G$, for it is invertible and
    satisfies
    $
      psi theta_1 theta_2 psi^(-1)
      =psi theta_1 psi^(-1) dot psi theta_2 psi^(-1).
    $ <eq:14-5-1-conjugation-product>
    However, this map coincides with the automorphism $sigma$ of $G$ on the
    generators $x_r (t)$ for $r in plus.minus Pi$, so is equal to $sigma$. Thus
    the elements of $G$ invariant under $sigma$ are those which commute with the
    semi-automorphism $psi$.

    In the present case $frak(L)_K$ may be taken as the Lie algebra of
    $(l+1) times (l+1)$ matrices of trace $0$. The fundamental root vectors may
    be taken as $e_(i,i+1)$ for $i=0,1,...,l-1$ and the fundamental co-roots are
    then
    $ e_(i i)-e_(i+1,i+1), quad i=0,1,...,l-1. $ <eq:14-5-1-simple-coroots>
    The automorphism of $frak(L)_K$ given by the symmetry of the Dynkin diagram
    acts as follows:
    $
                e_(i,i+1) & -> e_(l-i-1,l-i), \
      e_(i i)-e_(i+1,i+1) & -> e_(l-i-1,l-i-1)-e_(l-i,l-i).
    $ <eq:14-5-1-simple-images>

    #source(283, "270")
    Now it is easily verified that the maps $M -> -M'$ (where $M'$ is the
    transpose of $M$) and $M -> A^(-1) M A$ are both automorphisms of
    $frak(L)_K$. Combining them we obtain an automorphism $M -> -A^(-1) M' A$.
    Under this automorphism we have
    $ e_(i j) -> (-1)^(i+j+1)e_(l-j,l-i). $ <eq:14-5-1-matrix-unit-image>
    Thus this automorphism behaves in the same way as the automorphism induced
    by the symmetry of the Dynkin diagram when operating on $e_(i,i+1)$ and
    $e_(i i)-e_(i+1,i+1)$. Thus these two automorphisms coincide. The
    semi-automorphism $psi$ defined above is therefore given by
    $
      M attach(arrow.r, t: psi) -A^(-1) Mbar' A.
    $ <eq:14-5-1-semilinear-matrix-map>
    #block(sticky: true)[
      Now we have seen that $G$ consists of the automorphisms of $frak(L)_K$
      given by
    ]
    $ M -> T M T^(-1), quad T in upright("SL")_(l+1)(K). $
    <eq:14-5-1-inner-matrix-map>
    We consider which of these automorphisms commute with $psi$. In order for
    this to be so, $T$ must satisfy the condition
    $
      -A^(-1)(Tbar^(-1))' Mbar' Tbar' A=-T A^(-1) Mbar' A T^(-1),
    $ <eq:14-5-1-commuting-condition>
    which implies
    $ Mbar' Tbar' A T A^(-1)=Tbar' A T A^(-1) Mbar'. $
    <eq:14-5-1-centralizing-matrix>
    As this holds for all $M in frak(L)_K$ we must have
    $ Tbar' A T A^(-1)=lambda I $ <eq:14-5-1-scalar-matrix>
    for some $lambda in K$. Thus $Tbar' A T=lambda A$.

    Suppose $T$ is an upper unitriangular matrix. Then by comparing the
    $(0,l)$-coefficients on each side we have $lambda=1$. Similarly, if $T$ is
    lower unitriangular a comparison of the $(l,0)$-coefficients shows that
    $lambda=1$. Thus the matrices $T$ giving rise to the elements of $U^1$ and
    $V^1$ are precisely the upper and lower unitriangular matrices of the group
    $upright("SU")_(l+1)(K,f)$. However, $upright("SU")_(l+1)(K,f)$ is generated
    by its upper and lower unitriangular matrices. Thus $G^1$, the group
    generated by $U^1$ and $V^1$, consists of all transformations
    $M -> T M T^(-1)$, where $T in upright("SU")_(l+1)(K,f)$. Therefore $G^1$ is
    isomorphic to $upright("PSU")_(l+1)(K,f)$. #qed

    We note that the index $nu(f)$ of the Hermitian form $f$ is $(l+1)/2$ if $l$
    is odd and $l/2$ if $l$ is even. Thus $nu(f)$ is as large as it can be in
    the light of Witt's theorem.

    #source(284, "271")
    #block(sticky: true)[
      #metadata((kind: "anchor")) <th:14-5-2>
      #smallcaps[Theorem 14.5.2.] _$attach(D, tl: 2)_l (K)$ is isomorphic to the
      orthogonal group $P Omega_(2l)(K_0,f)$, where $K_0$ is the fixed field of
      $K$ under the field automorphism used to define $attach(D, tl: 2)_l (K)$
      and $f$ is the quadratic form_
    ]
    $
      x_1 x_(-1)+x_2 x_(-2)+dots+x_(l-1)x_(-(l-1))
      +(x_l-alpha x_(-l))(x_l-abar x_(-l)),
    $ <eq:14-5-2-quadratic-form>
    _where $alpha$ is a generator of $K$ over $K_0$._

    (Note that the quadratic form $f$ is defined over $K_0$. It has index $l-1$
    regarded as a form over $K_0$ and $l$ regarded as a form over $K$.)

    #smallcaps[Proof.] It was shown in #book-ref("th", "11-3-2", [11.3.2]) that
    the Chevalley group $G=D_l (K)$ is isomorphic to the orthogonal group
    $P Omega_(2l)(K,f_D)$, where $f_D$ is the quadratic form
    $ y_1 y_(-1)+y_2 y_(-2)+dots+y_l y_(-l). $ <eq:14-5-2-split-form>
    #block(sticky: true)[Let]
    $ A=mat(0, I_l; I_l, 0) $ <eq:14-5-2-polar-matrix>
    be the matrix of the polar form associated with $f_D$. The group
    $Omega_(2l)(K,f_D)$ is the commutator subgroup of $O_(2l)(K,f_D)$. It is
    generated by matrices $exp(t e_r)$, where $r in Pi$ or $-Pi$ and $t in K$,
    and all its matrices $T$ satisfy $T' A T=A$. If we use the matrix
    representation given in #book-ref("sec", "matrix-algebra-d"), the matrices
    $exp(t e_r)$ for $r in Pi$ are
    $
      & I+t(e_12-e_(-2,-1)), quad I+t(e_23-e_(-3,-2)), quad dots, \
      & I+t(e_(l-1,l)-e_(-l,-(l-1))), \
      & I+t(e_(l-1,-l)-e_(l,-(l-1))).
    $ <eq:14-5-2-fundamental-matrices>
    These matrices correspond to the nodes $1,2,...,l$ respectively in the
    Dynkin diagram
    #figure(orthogonal-fork(), caption: none, outlined: false)
    <fig:14-5-orthogonal-fork>
    Now consider the map
    $ exp(t e_r) -> exp(t e_rbar), quad r in plus.minus Pi. $
    <eq:14-5-2-diagram-map>

    #source(285, "272")
    The operation of transformation by the matrix $B$ below induces this map.
    $
      B=mat(
        I_(l-1), 0, 0, 0;
        0, 0, 0, 1;
        0, 0, I_(l-1), 0;
        0, 1, 0, 0
      ),
      quad (1,...,l-1;thin l;thin -1,...,-(l-1);thin -l).
    $ <eq:14-5-2-swap-matrix>
    Transformation by $B$ leaves the first $l-2$ matrices $exp(t e_r)$ invariant
    and interchanges the last two. It is convenient to write the rows and
    columns in the order $1,2,...,l-1,-1,-2,...,-(l-1),l,-l$. Then
    $ B=mat(I_(2l-2), 0; 0, B_0), $ <eq:14-5-2-reordered-swap>
    where
    $ B_0=mat(0, 1; 1, 0). $ <eq:14-5-2-swap-block>
    #block(sticky: true)[
      Since the map $exp(t e_r) -> exp(tbar e_rbar)$ is induced by the
      transformation
    ]
    $ T -> B^(-1) Tbar B, $ <eq:14-5-2-twisting-map>
    we shall need to consider the matrices fixed under this transformation.
    These are the matrices $T in Omega_(2l)(K,f_D)$ which satisfy $B T=Tbar B$.

    We now change the basis of the underlying $2l$-dimensional space over $K$ so
    that the point which originally had coordinates
    $ y_1,...,y_l,y_(-1),...,y_(-l) $ <eq:14-5-2-old-coordinates>
    now has coordinates $x_1,...,x_l,x_(-1),...,x_(-l)$, where
    $
         y_i & =x_i, quad i=1,...,l-1,-1,...,-(l-1), \
         y_l & =x_l-alpha x_(-l), \
      y_(-l) & =x_l-abar x_(-l)
    $ <eq:14-5-2-coordinate-change>
    #source(286, "273")
    ($alpha$ is a generator of $K$ over $K_0$). Then, in the reordered
    coordinates, the matrix of the polar form of $f$ is $S' A S$, where
    $
        S & =mat(I_(2l-2), 0; 0, S_0), \
        A & =mat(0, I_(l-1), 0, 0; I_(l-1), 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0), \
      S_0 & =mat(1, -alpha; 1, -abar).
    $ <eq:14-5-2-change-matrices>
    We note that a matrix $M$ satisfies
    $ M'(S' A S)M=S' A S $ <eq:14-5-2-transformed-isometry>
    if and only if $T=S M S^(-1)$ satisfies
    $ T' A T=A. $ <eq:14-5-2-original-isometry>
    We consider the conjugate subgroup $S^(-1) Omega_(2l)(K,f_D)S$ and
    investigate which matrices $M$ in this subgroup correspond to matrices
    $T in Omega_(2l)(K,f_D)$ such that $B T=Tbar B$. Let
    $ M=mat(M_11, M_12; M_21, M_22), $ <eq:14-5-2-block-matrix>
    with block row and column sizes $2l-2,2$. Then, using the fact that
    $B_0 S_0=overline(S)_0$, we see by matrix multiplication that $B T=Tbar B$
    if and only if
    $
      M_11=overline(M)_11, quad M_12=overline(M)_12, \
      M_21=overline(M)_21, quad M_22=overline(M)_22.
    $ <eq:14-5-2-fixed-blocks>
    Under this change of basis, the fixed root subgroups generating $U^1$ and
    $V^1$ become the elementary orthogonal subgroups for the form $f$ over
    $K_0$. These generate $Omega_(2l)(K_0,f)$. The matrix group generated by
    these fixed root subgroups is therefore $S Omega_(2l)(K_0,f)S^(-1)$. Since
    $G^1$ is generated by $U^1$ and $V^1$, passing to the quotient by scalar
    matrices gives
    $ G^1 tilde.eq P Omega_(2l)(K_0,f). $ <eq:14-5-2-identification>
    #qed
  ]
]

#import "chapter-preview.typ": chapter-preview
#chapter-preview(14, chapter)
