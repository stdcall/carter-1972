#let chapter = [
  #[
    #import "main-defs.typ": bib-ref, book-ref, mathclap, qed, source

    #source(117, "104")
    = The Bruhat Decomposition <ch:bruhat-decomposition>

    == Bruhat’s Lemma <sec:bruhat-lemma>

    Let $B$ be the subgroup $U H$ of the Chevalley group $G$. In the case when
    the field $K$ is algebraically closed the subgroup $B$ and its conjugates in
    $G$ are usually called Borel subgroups of $G$. In this case $G$ may be
    interpreted as an algebraic group and the Borel subgroups are precisely the
    maximal soluble connected subgroups of $G$. It was proved by Borel that any
    two such subgroups are conjugate (cf. Borel #bib-ref("borel1956")). We shall
    investigate the decomposition of $G$ into double cosets $B g B$ with respect
    to $B$, following an investigation by Bruhat of the double coset
    decomposition of a semi-simple Lie group with respect to a maximal soluble
    connected subgroup (cf. Bruhat #bib-ref("bruhat1954")).

    #block(sticky: true)[
      We shall first require some additional information about the subgroup $U$
      of $G$. Let $r in Pi$ be a fundamental root and define
    ]
    $ U_r=product_(mathclap(s in Phi^+-{r})) X_s, $ <eq:8-1-ur>
    where the product is taken over all the positive roots other than $r$ in
    increasing order. Chevalley’s commutator formula shows that $U_r$ is a
    subgroup of $U$ and that the root subgroups in the product can in fact be
    taken in any order.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <l:8-1-1>
      #smallcaps[Lemma 8.1.1.] _Let $r in Pi$. Then $X_r$ and $X_(-r)$ normalize
      $U_r$._
    ]

    #smallcaps[Proof.] The commutator formula #book-ref("th", "5-2-2", [5.2.2])
    shows that $[X_r,U_r] subset.eq U_r$, hence $X_r$ normalizes $U_r$. Now
    consider the subgroup $[X_(-r),U_r]$. Suppose $s$ is a positive root
    distinct from $r$ and suppose $-i r+j s in Phi$, where $i>0$, $j>0$. Then
    $-i r+j s in Phi^+$. For when this root is expressed as an integral
    combination of fundamental roots, at least one coefficient is positive. Thus
    each coefficient must be non-negative and we have a positive root. The root
    $r$ itself cannot occur in this form. Applying the commutator formula once
    more we have $[X_(-r),U_r] subset.eq U_r$. Thus $X_(-r)$ normalizes $U_r$
    also. #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-1-2>
      #smallcaps[Corollary 8.1.2.] _(i) $U=U_r X_r=X_r U_r$, (ii)
      $U_r X_(-r)=X_(-r) U_r$._
    ]

    #source(118, "105")
    #smallcaps[Proof.] $U_r$ is permutable with $X_r$ and $X_(-r)$ since both
    normalize $U_r$. Since $U_r$ and $X_r$ are permutable subgroups of $U$,
    $U_r X_r$ is a subgroup of $U$. However, it contains all the root subgroups
    of $U$, so is the whole of $U$. #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-1-3>
      #smallcaps[Corollary 8.1.3.] _$n_r$ normalizes $U_r$._

      #smallcaps[Proof.] The normalizer of $U_r$ contains $X_r$ and $X_(-r)$ so
      contains $n_r$, since $n_r in lr(⟨X_r,X_(-r)⟩)$. #qed
    ]

    #block(sticky: true)[We define similarly, for each $r in Pi$,]
    $ V_(-r)=product_(mathclap(s in Phi^--{-r})) X_s, $ <eq:8-1-v-minus-r>
    #block(sticky: true)[
      where the product is taken over the negative roots other than $-r$ in
      decreasing order. Then $X_r$ and $X_(-r)$ normalize $V_(-r)$ and we have
    ]
    $
      V=V_(-r)X_(-r)=X_(-r)V_(-r)
      quad "and" quad V_(-r)X_r=X_r V_(-r).
    $ <eq:8-1-v-factorization>
    Furthermore $n_r$ normalizes $V_(-r)$.

    We observe that the above results depend essentially upon the fact that $r$
    is a fundamental root. They are not valid if $r$ is an arbitrary positive
    root. We shall use them to prove the following propositions.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-1-4>
      #smallcaps[Proposition 8.1.4.] _Let $r in Pi$. Then the subset
      $B union B n_r B$ is a subgroup of $G$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We must show that this subset is closed under
      multiplication and inversion. Inversion is clear, since
    ]
    $
              B^(-1) & =B, \
      (B n_r B)^(-1) & =B^(-1)n_r^(-1)B^(-1)=B n_r^(-1)B=B n_r B.
    $ <eq:8-1-4-inversion>
    #block(sticky: true)[
      In order to prove that the subset is closed under multiplication it is
      sufficient to show that
    ]
    $ n_r B n_r subset.eq B union B n_r B. $ <eq:8-1-4-reduction>
    #block(sticky: true)[
      Now $B=U H=X_r U_r H$, as in #book-ref("cor", "8-1-2", [8.1.2]). Then we
      have
    ]
    $
      n_r B n_r & =n_r B n_r^(-1) \
                & =n_r X_r U_r H n_r^(-1) \
                & =X_(-r)U_r H subset.eq X_(-r)B,
    $ <eq:8-1-4-conjugation>
    #source(119, "106")
    #block(sticky: true)[
      since $n_r$ normalizes $U_r$. Thus it is sufficient to show that
      $X_(-r) subset.eq B union B n_r B$, i.e. that
      $x_(-r)(t) in B union B n_r B$ for all $t in K$. If $t=0$,
      $x_(-r)(t) in B$. If $t != 0$ we have
    ]
    $
      x_(-r)(t) & =x_r (t^(-1))n_r (-t^(-1))x_r (t^(-1)), \
                & quad "by" #book-ref("eq", "6-4-4-ii", [6.4.4 (ii)]), \
                & =x_r (t^(-1))h_r (-t^(-1))n_r x_r (t^(-1)), \
                & quad "by" #book-ref("eq", "6-4-4-iii", [6.4.4 (iii)]).
    $ <eq:8-1-4-negative-root-element>
    Thus $x_(-r)(t) in B n_r B$ and the proof is complete. #qed

    The following proposition is of crucial importance in the later development.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-1-5>
      #smallcaps[Proposition 8.1.5.] _Let $r in Pi$, $n in N$ and $w$ be the
      image of $n$ under the natural homomorphism from $N$ to $W$. Then_
      $ B n B dot B n_r B subset.eq B n n_r B union B n B. $
      <eq:8-1-5-statement>
      _In particular, if $w(r) in Phi^+$ we have_
      $ B n B dot B n_r B=B n n_r B, $ <eq:8-1-5-positive>
      _whereas if $w(r) in Phi^-$ the set $B n B dot B n_r B$ contains elements
      from both double cosets $B n n_r B$, $B n B$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] Suppose first that $w(r) in Phi^+$. Then we have
    ]
    $
      B n B dot B n_r B & =B n X_r U_r H n_r B \
                        & =B n X_r n^(-1) dot n n_r
                          dot n_r^(-1)U_r H n_r B.
    $ <eq:8-1-5-positive-calculation>
    #block(sticky: true)[Now]
    $ n X_r n^(-1)=X_(w(r)) subset.eq B, $ <eq:8-1-5-root-conjugate>
    #block(sticky: true)[since $w(r) in Phi^+$. Also]
    $ n_r^(-1)U_r H n_r=U_r H subset.eq B, $ <eq:8-1-5-normalization>
    by #book-ref("cor", "8-1-3", [8.1.3]). Hence
    $B n B dot B n_r B subset.eq B n n_r B$. The reverse inclusion is clear.

    #block(sticky: true)[
      Now suppose that $w(r) in Phi^-$. Let $w'=w w_r$. Then $w'(r) in Phi^+$.
      Let $n'$ be an element of $N$ mapping to $w'$ under the natural
      homomorphism. Then we have
    ]
    $ B n' B dot B n_r B=B n' n_r B, $ <eq:8-1-5-shorter-coset>
    #source(120, "107")
    #block(sticky: true)[as above. Thus]
    $
      B n B dot B n_r B & =B n' n_r B dot B n_r B \
                        & =B n' B dot B n_r B dot B n_r B \
                        & subset.eq B n' B dot (B union B n_r B),
                          quad "by" #book-ref("p", "8-1-4", [8.1.4]), \
                        & =B n' B union B n' B dot B n_r B \
                        & =B n' B union B n' n_r B \
                        & =B n n_r B union B n B.
    $ <eq:8-1-5-negative-calculation>
    #block(sticky: true)[Thus]
    $ B n B dot B n_r B subset.eq B n n_r B union B n B. $
    <eq:8-1-5-inclusion>
    #block(sticky: true)[
      If $w(r) in Phi^-$, the set $B n B dot B n_r B$ contains elements from
      both $B n n_r B$ and $B n B$. For $n n_r$ is an element in this set from
      $B n n_r B$, and $n x_r (1)n_r$ is an element from $B n B$, since
    ]
    $
      n x_r (1)n_r & =n n_r dot n_r^(-1)x_r (1)n_r=n n_r dot x_(-r)(-1) \
                   & =n n_r dot x_r (-1)n_r x_r (-1) \
                   & in B n' B dot B n_r B=B n B.
    $ <eq:8-1-5-second-coset>
    #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-1-6>
      #smallcaps[Corollary 8.1.6.] _Let $r in Pi$, $n in N$ and $w$ be the image
      of $n$ in $W$. Then_
      $ B n_r B dot B n B subset.eq B n_r n B union B n B. $
      <eq:8-1-6-statement>
    ]

    #smallcaps[Proof.] Let $g in B n_r B dot B n B$. Then
    $g^(-1) in B n^(-1)B dot B n_r B$. Hence, by #book-ref(
      "p",
      "8-1-5",
      [8.1.5],
    ), $g^(-1) in B n^(-1)n_r B$ or $g^(-1) in B n^(-1)B$. It follows that
    $g in B n_r n B$ or $g in B n B$.
    #qed
  ]

  #[
    #import "main-defs.typ": bib-ref, book-ref, chapter-ref, qed, source

    == Groups with a $(B,N)$-Pair <sec:bn-pairs>

    It is now useful to introduce the general concept of a $(B,N)$-pair in a
    group. This concept, originally due to Tits #bib-ref("tits1962bruhat"), is
    useful not merely for deriving further properties of the Chevalley groups,
    but also in connection with the ‘twisted groups’ discussed in chapters
    #book-ref(
      "ch",
      "twisted-simple-groups",
    ) and #book-ref("ch", "properties-of-twisted-groups"), and with the
    associated geometrical structures described in #chapter-ref(
      "geometrical-structures",
    ).

    A pair of subgroups $B,N$ of a group $G$ is called a $(B,N)$-pair if the
    following axioms are satisfied:

    #metadata((kind: "anchor")) <def:bn-1>
    _BN_ 1. $G$ is generated by $B$ and $N$.

    #metadata((kind: "anchor")) <def:bn-2>
    _BN_ 2. $B ∩ N$ is a normal subgroup of $N$.

    #metadata((kind: "anchor")) <def:bn-3>
    _BN_ 3. The group $W=N\/(B ∩ N)$ is generated by a set of elements $w_i$,
    $i in I$, such that $w_i^2=1$.

    #source(121, "108")
    #block(breakable: false)[
      #metadata((kind: "anchor")) <def:bn-4>
      _BN_ 4. If $n_i in N$ maps to $w_i$ under the natural homomorphism of $N$
      into $W$, and if $n$ is any element of $N$, then
      $ B n_i B dot B n B subset.eq B n_i n B union B n B. $
      <eq:bn-4>
    ]

    #metadata((kind: "anchor")) <def:bn-5>
    _BN_ 5. If $n_i$ is as above, then $n_i B n_i != B$.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-2-1>
      #smallcaps[Proposition 8.2.1.] _The Chevalley group $G=frak(L)(K)$ has a
      $(B,N)$-pair._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We show that the subgroups of $G$ previously denoted by
      $B,N$ satisfy the above axioms. By #book-ref("cor", "7-2-4", [7.2.4]) we
      have $B ∩ N=H$, and by #book-ref("th", "7-2-2", [7.2.2]) we know that $H$
      is normal in $N$ and that $N\/H$ is isomorphic to the Weyl group $W$. The
      Weyl group is generated by the fundamental reflections $w_r$, $r in Pi$,
      and we take these as the generating involutions in #book-ref(
        "def",
        "bn-3",
        [_BN_
          3],
      ). By #book-ref("cor", "8-1-6", [8.1.6]) we have, for each $r in Pi$,
    ]
    $ B n_r B dot B n B subset.eq B n_r n B union B n B. $
    <eq:8-2-1-bn-4>
    // E032: conjugating X_r requires n_r^(-1) on the right.
    #block(sticky: true)[
      If $r in Pi$ we have $X_r subset.eq B$, but $n_r X_r n_r^(-1)=X_(-r)$ is
      not in $B$. Thus $n_r B n_r != B$. Finally, $G$ is generated by $B$ and
      $N$. For $G$ is generated by the root subgroups $X_r$, and each root $r$
      has the form $w(r_i)$ for some $w in W$ and $r_i in Pi$. Let $n$ be an
      element of $N$ mapping to $w$ under the natural homomorphism. Then
    ]
    $ X_r=X_(w(r_i))=n X_(r_i)n^(-1) $ <eq:8-2-1-generators>
    by #book-ref("l", "7-2-1", [7.2.1]). Thus $X_r$ is in the subgroup generated
    by $B$ and $N$, whence $lr(⟨B,N⟩)=G$. Therefore $G$ has a $(B,N)$-pair.
    #qed

    We now derive some consequences of the axioms for a $(B,N)$-pair.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-2-2>
      #smallcaps[Proposition 8.2.2.] _Let $G$ be a group with a $(B,N)$-pair.
      Then_
      #enum(
        numbering: "(i)",
        indent: 1.1em,
        body-indent: 0.5em,
        [_$G=B N B$._],
        [
          _For each subset $J$ of $I$, let $W_J$ be the subgroup of $W$
          generated by the elements $w_i$ for $i in J$, and $N_J$ be the
          subgroup of $N$ mapping to $W_J$ under the natural homomorphism. Then
          $P_J=B N_J B$ is a subgroup of $G$._
        ],
      )
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We prove (ii) first. $B N_J B$ is certainly closed
      under inversion, and so we must prove it closed under multiplication. Let
      $n in N_J$. Then $n$ may be written in the form $n=n_1 n_2 dots n_k$,
      where each $n_i$ maps under the natural homomorphism to a generator $w_i$
      of $W$ with $i in J$. Thus
    ]
    $
      n B N_J B & =n_1 n_2 dots n_k B N_J B \
                & subset.eq n_1 n_2 dots n_(k-1)B N_J B
                  subset.eq dots subset.eq B N_J B
    $ <eq:8-2-2-induction>
    #source(122, "109")
    #block(sticky: true)[
      by repeated application of #book-ref("def", "bn-4", [_BN_ 4]). Hence
    ]
    $ N_J B N_J B subset.eq B N_J B $ <eq:8-2-2-left-product>
    #block(sticky: true)[and it follows that]
    $ B N_J B dot B N_J B subset.eq B N_J B. $ <eq:8-2-2-closure>
    Thus $B N_J B$ is a subgroup of $G$.

    We now take $J=I$. Then $B N B$ is a subgroup of $G$. This subgroup
    certainly contains $B$ and $N$, and must be $G$ since $B$ and $N$ generate
    $G$. #qed

    It is evident from #book-ref("p", "8-2-2", [8.2.2]) that every double coset
    $B g B$ contains an element of $N$. We now consider the question of when two
    elements of $N$ lie in the same double coset.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-2-3>
      #smallcaps[Proposition 8.2.3.] _Let $G$ be a group with a $(B,N)$-pair.
      Let $n,n'$ be elements of $N$. Then $B n B=B n' B$ if and only if $n,n'$
      map to the same element of $W$ under the natural homomorphism from $N$
      into $W$. Thus there is a natural 1–1 correspondence between double cosets
      of $B$ in $G$ and elements of $W$._
    ]

    (We note that in the case where $G$ is a Chevalley group and $B$ a Borel
    subgroup this result implies that the number of double cosets of $B$ in $G$
    is finite, and equal to the order of the Weyl group. For a general group
    with a $(B,N)$-pair, the group $W$ need not be finite.)

    #smallcaps[Proof.] Each element of $W$ is a product of generators $w_i$,
    $i in I$. We denote by $l(w)$ the shortest length of any expression for $w$
    as a product of such generators. Suppose $B n B=B n' B$, where $n,n'$
    correspond to $w,w'$ respectively, and suppose that $l(w)<=l(w')$. We show
    that $w=w'$ by induction on $l(w)$. If $l(w)=0$ we have $w=1$ and $B n B=B$.
    Thus $B n' B=B$ and so $n' in B ∩ N$. Hence $w'=1$.

    #block(sticky: true)[
      Now suppose $l(w)>0$. Then $w=w_i w''$, where $i in I$ and
      $l(w'')=l(w)-1$. Let $n_i,n''$ be elements of $N$ corresponding to
      $w_i,w'' in W$. Then
    ]
    $ n_i n''B subset.eq B n' B. $ <eq:8-2-3-shorter-word>
    #block(sticky: true)[
      Thus by #book-ref("def", "bn-4", [_BN_ 4]) we have
    ]
    $ n''B subset.eq n_i B n' B subset.eq B n_i n' B union B n' B. $
    <eq:8-2-3-two-cosets>
    Hence $B n''B=B n_i n' B$ or $B n''B=B n' B$. By induction we have
    $w''=w_i w'$ or $w''=w'$. The latter is impossible since $l(w'')<l(w')$.
    Thus $w''=w_i w'$ and so $w'=w_i w''=w$.

    #source(123, "110")
    #block(sticky: true)[
      Since every double coset of $B$ in $G$ has the form $B n B$ for some
      $n in N$, there is a 1–1 correspondence
    ]
    $ B n B arrow.l.r (B ∩ N)n $ <eq:8-2-3-correspondence>
    between double cosets of $B$ in $G$ and elements of $W$. #qed

    The next two propositions establish analogues of the more detailed results
    concerning double coset multiplication proved for Chevalley groups in
    #book-ref(
      "p",
      "8-1-5",
      [8.1.5],
    ).

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-2-4>
      #smallcaps[Proposition 8.2.4.] _Let $G$ be a group with a $(B,N)$-pair.
      Let $w_i$, $i in I$, be one of the distinguished generators of $W$ and $w$
      be an element of $W$ such that $l(w_i w)>=l(w)$. Let $n_i,n$ be elements
      of $N$ mapped by the natural homomorphism into $w_i,w in W$. Then
      $B n_i B dot B n B subset.eq B n_i n B$._
    ]

    #smallcaps[Proof.] We again use induction on $l(w)$. If $l(w)=0$ then $w=1$
    and $n in B$, so the result is clear. Suppose $l(w)>0$. Then $w=w'w_j$ for
    some $j in I$, where $l(w')=l(w)-1$.

    #block(sticky: true)[
      Suppose by way of contradiction that the result is false. Then
      $B n_i B dot B n B$ intersects $B n B$, by #book-ref("def", "bn-4", [_BN_
        4]). Let $n',n_j$ be elements of $N$ mapped by the natural homomorphism
      to $w',w_j in W$. Then
    ]
    $ n_i B n ∩ B n B != emptyset $ <eq:8-2-4-intersection>
    #block(sticky: true)[and therefore]
    $ n_i B n' ∩ B n B n_j != emptyset. $ <eq:8-2-4-shorter-intersection>
    #block(sticky: true)[
      Now $l(w_i w')>=l(w')$ and so, by induction, we have
    ]
    $ n_i B n' subset.eq B n_i n' B. $ <eq:8-2-4-inductive-inclusion>
    #block(sticky: true)[Thus]
    $ B n_i n' B ∩ B n B n_j != emptyset. $ <eq:8-2-4-coset-intersection>
    #block(sticky: true)[
      Now it follows easily from #book-ref("def", "bn-4", [_BN_ 4]) that
    ]
    $ B n B dot B n_j B subset.eq B n n_j B union B n B. $
    <eq:8-2-4-right-product>
    Hence $B n_i n' B$ intersects either $B n n_j B$ or $B n B$. Thus, by
    #book-ref(
      "p",
      "8-2-3",
      [8.2.3],
    ), $w_i w'=w w_j$ or $w_i w'=w$. The former equation gives $w_i w'=w'$,
    whence $w_i=1$, which contradicts #book-ref("def", "bn-5", [_BN_ 5]). The
    latter gives $w_i w=w'$, which implies $l(w_i w)<l(w)$, a contradiction.
    #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-2-5>
      #smallcaps[Proposition 8.2.5.] _Suppose the notation is as in #book-ref(
        "p",
        "8-2-4",
        [8.2.4],
      ). Then, if $l(w_i w)<=l(w)$, $B n_i B dot B n B$ has non-empty
      intersection with $B n B$._
    ]

    #source(124, "111")
    #block(sticky: true)[
      #smallcaps[Proof.] By #book-ref("def", "bn-4", [_BN_ 4]) we have
    ]
    $ n_i B n_i subset.eq B union B n_i B. $ <eq:8-2-5-square>
    #block(sticky: true)[Since $n_i B n_i != B$ we have]
    $ n_i B n_i ∩ B n_i B != emptyset. $ <eq:8-2-5-nonempty>
    #block(sticky: true)[It follows that]
    $
      n_i B ∩ B n_i B n_i != emptyset \
      n_i B n ∩ B n_i B n_i n != emptyset.
    $ <eq:8-2-5-translated-intersection>
    #block(sticky: true)[
      Now $l(w_i dot w_i w)>=l(w_i w)$, thus by
      #book-ref("p", "8-2-4", [8.2.4])
    ]
    $ n_i B n_i n subset.eq B n B. $ <eq:8-2-5-inclusion>
    Hence $n_i B n$ intersects $B n B$ and the result follows. #qed

    _Note._ It follows from #book-ref("p", "8-2-4", [8.2.4]) and #book-ref(
      "p",
      "8-2-5",
      [8.2.5],
    ) that $l(w_i w)!=l(w)$.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-2-6>
      #smallcaps[Corollary 8.2.6.] _Suppose the notation is as in #book-ref(
        "p",
        "8-2-4",
        [8.2.4],
      ). If $l(w_i w)<l(w)$ then $n_i in B n B n^(-1)B$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] By #book-ref("p", "8-2-5", [8.2.5]) we have
    ]
    $ n_i B n ∩ B n B != emptyset. $ <eq:8-2-6-proof>
    Therefore $n_i in B n B n^(-1)B$, as required. #qed
  ]

  #[
    #import "main-defs.typ": book-ref, qed, source

    == Parabolic Subgroups <sec:parabolic-subgroups>

    Let $G$ be a group with a $(B,N)$-pair. A parabolic subgroup of $G$ is one
    which contains some conjugate $g B g^(-1)$ of $B$. For example, the subgroup
    $P_J$ of #book-ref("p", "8-2-2", [8.2.2]) is a parabolic subgroup. We shall
    show that the subgroups $P_J$ for the various subsets $J$ of $I$ are the
    only subgroups of $G$ containing $B$, and therefore that every parabolic
    subgroup is conjugate to some $P_J$. Furthermore, the subgroups $P_J$ are
    all distinct and non-conjugate in $G$, and each of them is equal to its
    normalizer.

    We first prove a proposition describing the subgroup generated by $B$ and a
    single element of $N$.

    #block()[
      #metadata((kind: "anchor")) <p:8-3-1>
      #smallcaps[Proposition 8.3.1.] _Let $G$ be a group with a $(B,N)$-pair and
      let $n$ be an element of $N$. Let $w in W$ be the image of $n$ under the
      natural_
      #source(125, "112")
      _homomorphism and let_
      $ w=w_(i_1)w_(i_2) dots w_(i_k), quad i_1,i_2,dots in I, $
      <eq:8-3-1-reduced-word>
      _where $l(w)=k$. Let $J$ be the subset $lr({i_1,i_2,dots,i_k})$ of $I$.
      Then the following three subgroups of $G$ are equal:_
      #enum(
        numbering: "(i)",
        indent: 1.1em,
        body-indent: 0.5em,
        [$lr(⟨B,n⟩)$,],
        [$lr(⟨B,n B n^(-1)⟩)$,],
        [$P_J=B N_J B$.],
      )
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We have $n=n_(i_1)n_(i_2) dots n_(i_k)$, where
      $n_(i_alpha) in N$ corresponds to $w_(i_alpha) in W$. Each $n_(i_alpha)$
      is in $N_J$, so $n in N_J$. Thus we have the inclusions
    ]
    $ lr(⟨B,n B n^(-1)⟩) subset.eq lr(⟨B,n⟩) subset.eq P_J. $
    <eq:8-3-1-inclusions>
    #block(sticky: true)[
      Now $P_J$ is the subgroup generated by $B$ and the elements
      $n_(i_1),n_(i_2),dots,n_(i_k)$. Since $l(w_(i_1)w)<l(w)$ we have, by
      #book-ref("cor", "8-2-6", [8.2.6]), $n_(i_1) in lr(⟨B,n B n^(-1)⟩)$. Since
    ]
    $ l(w_(i_2)w_(i_1)w)<l(w_(i_1)w) $ <eq:8-3-1-shortening>
    #block(sticky: true)[we have]
    $
      n_(i_2) in lr(⟨B,n_(i_1)n B n^(-1)n_(i_1)^(-1)⟩)
      subset.eq lr(⟨B,n B n^(-1)⟩)
    $ <eq:8-3-1-second-generator>
    and arguing similarly we see that each of $n_(i_1),n_(i_2),dots,n_(i_k)$
    lies in $lr(⟨B,n B n^(-1)⟩)$. Hence $P_J$ is contained in
    $lr(⟨B,n B n^(-1)⟩)$ and the result follows. #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <th:8-3-2>
      #smallcaps[Theorem 8.3.2.] _Let $G$ be a group with a $(B,N)$-pair. Then
      the subgroups $P_J$ are the only subgroups of $G$ containing $B$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] Let $M$ be a subgroup of $G$ containing $B$. $M$ is a
      union of double cosets of $B$ in $G$, and each such double coset contains
      an element of $N$. Thus $M$ is generated by $B$ and a certain set of
      elements of $N$. Let $n_alpha$ be any element of $N$. Then, by #book-ref(
        "p",
        "8-3-1",
        [8.3.1],
      ), the subgroup generated by $B$ and $n_alpha$ is $P_(J_alpha)$ for a
      suitable subset $J_alpha$ of $I$. Thus $M$ is generated by subgroups
      $P_(J_alpha)$ for a family of subsets $J_alpha$ of $I$, and so $M=P_J$,
      where
    ]
    $ J=union.big_alpha J_alpha. $ <eq:8-3-2-generating-subset>
    #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <th:8-3-3>
      #smallcaps[Theorem 8.3.3.] _Let $G$ be a group with a $(B,N)$-pair. Then
      each subgroup $P_J$ of $G$ is equal to its normalizer. Furthermore
      distinct subgroups $P_J,P_K$ cannot be conjugate in $G$._
    ]

    #smallcaps[Proof.] The normalizer $frak(N)(P_J)$ is generated by $B$ and
    elements of $N$.
    #source(126, "113")
    #block(sticky: true)[Let $n in N ∩ frak(N)(P_J)$. Then we have]
    $ P_J supset.eq lr(⟨B,n B n^(-1)⟩)=lr(⟨B,n⟩) $ <eq:8-3-3-normalizer>
    by #book-ref("p", "8-3-1", [8.3.1]). Therefore $n in P_J$. It follows that
    $P_J=frak(N)(P_J)$.

    #block(sticky: true)[
      Suppose now that $P_J,P_K$ are conjugate subgroups of $G$. Let
      $g P_J g^(-1)=P_K$ where $g=b n b'$ with $b,b' in B$ and $n in N$. Then
      $n P_J n^(-1)=P_K$. Thus
    ]
    $ P_K supset.eq lr(⟨B,n B n^(-1)⟩)=lr(⟨B,n⟩) $ <eq:8-3-3-conjugates>
    by #book-ref("p", "8-3-1", [8.3.1]). Therefore $n in P_K$ and so $P_K=P_J$.
    Thus distinct subgroups $P_J,P_K$ are non-conjugate. #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <th:8-3-4>
      #smallcaps[Theorem 8.3.4.] _Let $G$ be a group with a $(B,N)$-pair. Then
      the subgroups $P_J$ for distinct subsets $J$ of $I$ are all distinct.
      Furthermore we have $P_J ∩ P_K=P_(J ∩ K)$. Thus the subgroups $P_J$ form a
      lattice isomorphic to the lattice of subsets of $I$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] It is necessary to show first that the elements $w_i$
      of $W$ for $i in I$ form a minimal set of generators of $W$. Suppose we
      remove one element $j$ from $I$, and assume by way of contradiction that
      $W$ is generated by the elements $w_i$ for $i in I-{j}$. Then $G$ has a
      $(B,N)$-pair with $I$ replaced by $I-{j}$, since the axioms #book-ref(
        "def",
        "bn-1",
        [_BN_
          1],
      )–#book-ref("def", "bn-5", [5]) are still satisfied. Let
    ]
    $ w_j=w_(i_1)w_(i_2) dots w_(i_k), quad i_alpha in I-{j}, $
    <eq:8-3-4-redundant-generator>
    be an expression of minimal length of $w_j$ in terms of the remaining
    generators. Let $n_j$ be an element of $N$ corresponding to $w_j in W$, and
    let $J={i_1,i_2,dots,i_k}$. Then, by #book-ref("p", "8-3-1", [8.3.1]), we
    have $lr(⟨B,n_j⟩)=B N_J B$. However, $lr(⟨B,n_j⟩)=B union B n_j B$ by
    #book-ref(
      "p",
      "8-3-1",
      [8.3.1],
    ) applied to the full set of generators of $W$. Thus
    $B N_J B=B union B n_j B$. By #book-ref("p", "8-2-3", [8.2.3]) this implies
    that $W_J={1,w_j}$, which gives a contradiction. Thus the elements $w_i$,
    $i in I$, form a minimal set of generators.

    Now let $J,K$ be any two subsets of $I$. $P_J ∩ P_K$ is a subgroup of $G$
    containing $B$, thus $P_J ∩ P_K=P_L$ for some subset $L$ of $I$ by
    #book-ref(
      "th",
      "8-3-2",
      [8.3.2],
    ). Now $P_(J ∩ K) subset.eq P_L$. We suppose by way of contradiction that
    $P_(J ∩ K)!=P_L$. Then certainly $L$ is not contained in $J ∩ K$ and we may
    assume without loss of generality that $L$ is not contained in $J$. However,
    $P_L subset.eq P_J$ and so $N_L subset.eq N_J$ by #book-ref(
      "p",
      "8-2-3",
      [8.2.3],
    ). Hence $W_L subset.eq W_J$. Let $i in L-J$. Then $w_i in W_L$ and so
    $w_i in W_J$. But this means that $w_i$ is expressible in terms of the
    remaining generators of $W$, which is impossible. Thus
    $P_J ∩ P_K=P_(J ∩ K)$.

    #source(127, "114")
    #block(sticky: true)[
      We show finally that the subgroups $P_J$ are all distinct. Suppose
      $P_J=P_K$. If $J!=K$ we may assume that $J-K$ is non-empty. Since
    ]
    $ P_J=P_J ∩ P_K=P_(J ∩ K), $ <eq:8-3-4-distinct-subsets>
    we have $W_J=W_(J ∩ K)$, as before. This again means that some generator
    $w_i$ is expressible in terms of the remainder, which gives a contradiction.
    Thus $P_J=P_K$ implies that $J=K$. #qed

    We emphasize here that all the results of sections #book-ref(
      "sec",
      "bn-pairs",
    ) and #book-ref("sec", "parabolic-subgroups") have been obtained using only
    the axioms for a $(B,N)$-pair.
  ]

  #[
    #import "main-defs.typ": book-ref, chapter-ref, mathclap, qed, source

    == A Canonical Form <sec:canonical-form>

    We now return to the situation in which $G$ is a Chevalley group
    $frak(L)(K)$. The results just proved on the double coset decomposition are
    valid for $G$ since $G$ has a $(B,N)$-pair. Thus every element of $G$ can be
    written in the form $b_1 n b_2$, where $b_1,b_2 in B$ and $n in N$. However,
    it may be possible to express an element of $G$ in such a form in a number
    of different ways. We seek a canonical form for elements of $G$, i.e. a way
    of decomposing an element of $G$ so that each element has a unique
    expression in the given form.

    #metadata((kind: "anchor")) <def:8-4-closed-roots>
    #block(sticky: true)[
      A subset $Psi$ of $Phi$ is called a closed set of roots if, whenever
      $r,s in Psi$ and $i r+j s in Phi$, where $i,j$ are positive integers, the
      root $i r+j s$ is in $Psi$ also. We consider the situation in which
      $Phi^+$ is expressed as the disjoint union of two closed subsets. Suppose
      $Phi^+=Psi_1 union Psi_2$, where $Psi_1 ∩ Psi_2$ is empty and
      $Psi_1,Psi_2$ are closed. Let
    ]
    $
      U^1=product_(r in Psi_1) X_r quad "and" quad
      U^2=product_(r in Psi_2) X_r,
    $ <eq:8-4-closed-products>
    where the products are taken over the roots in increasing order. The
    commutator formula shows that $U^1,U^2$ are subgroups of $U$ and that the
    same subgroups are obtained if the factors are taken in a different order.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <l:8-4-1>
      #smallcaps[Lemma 8.4.1.] _$U=U^1 U^2$, $U^1 ∩ U^2=1$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] Let $u in U^1 ∩ U^2$. Then
    ]
    $ u=product_(r_i in Phi^+) x_(r_i) (t_i). $ <eq:8-4-1-intersection>
    Since $u in U^1$ we have $t_i=0$ whenever $r_i in Psi_2$. Since $u in U^2$
    we have $t_i=0$ whenever $r_i in Psi_1$. Thus $t_i=0$ for all $i$ and $u=1$.

    #source(128, "115")
    #block(sticky: true)[We define]
    $ U_m=product_(mathclap(h(r)>=m)) X_r $ <eq:8-4-1-filtration>
    #block()[
      for $m=1,2,dots$ and also define $U_m^1=U_m ∩ U^1$, $U_m^2=U_m ∩ U^2$. We
      show $U_m=U_m^1 U_m^2$ for all $m$. This is clear if $m$ is sufficiently
      large, and we prove it by descending induction.
    ]
    #block(sticky: true)[
      Assume inductively that $U_(m+1)=U_(m+1)^1 U_(m+1)^2$. Now we have
    ]
    $ U_m=product_(mathclap(h(r)=m)) X_r dot U_(m+1) $
    <eq:8-4-1-height-layer>
    #block(sticky: true)[and $U_m\/U_(m+1)$ is abelian. Thus]
    $ U_m=U_m^1 U_m^2 U_(m+1). $ <eq:8-4-1-layer-product>
    #block(sticky: true)[Since $U_(m+1)$ is normal in $U_m$ we have]
    $
      U_m & =U_m^1 U_m^2 U_(m+1)=U_m^1 U_(m+1)U_m^2 \
          & =U_m^1 U_(m+1)^1 U_(m+1)^2 U_m^2=U_m^1 U_m^2.
    $ <eq:8-4-1-induction>
    Finally, putting $m=1$, we have $U=U^1 U^2$ as required. #qed

    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-4-2>
      #smallcaps[Corollary 8.4.2.] _Each element $u in U$ is uniquely
      expressible in the form $u=u_1 u_2$ with $u_1 in U^1$, $u_2 in U^2$._
    ]

    #block(sticky: true)[
      A decomposition of $Phi^+$ of the type we have been considering is
      determined by each element of the Weyl group $W$. Let $w in W$ and define
    ]
    $
      Psi_1 & ={r in Phi^+; w(r) in Phi^+}, \
      Psi_2 & ={r in Phi^+; w(r) in Phi^-}.
    $ <eq:8-4-weyl-root-partition>
    #block(sticky: true)[
      Then $Psi_1,Psi_2$ are disjoint closed subsets whose union is $Phi^+$. We
      define
    ]
    $
      U_w^+ & =product_(r in Psi_1) X_r, \
      U_w^- & =product_(r in Psi_2) X_r.
    $ <eq:8-4-weyl-unipotent-parts>
    Then $U=U_w^+ U_w^-$ and $U_w^+ ∩ U_w^-=1$.

    #block(sticky: true)[
      We can now describe the required canonical form for elements of $G$.
    ]

    #block(breakable: false)[
      #metadata((kind: "anchor")) <th:8-4-3>
      #smallcaps[Theorem 8.4.3.] _For each $w in W$ choose a coset
      representative $n_w in N$ which maps to $w$ under the natural
      homomorphism. Then each element_
      #source(129, "116")
      _of $G$ is expressible in just one way in the form_
      $ g=b n_w u, $ <eq:8-4-3-canonical-form>
      _where $b in B$ and $u in U_w^-$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] We shall show that $n_w U_w^+ n_w^(-1) subset.eq U$. By
      #book-ref("l", "7-2-1", [7.2.1]) we have
    ]
    $ n_r X_s n_r^(-1)=X_(w_r (s)), $ <eq:8-4-3-root-conjugation>
    #block(sticky: true)[
      for all $r,s in Phi$. Let $w=w_(r_1)w_(r_2) dots w_(r_k)$ be an expression
      of $w$ as a product of reflections. Then $n_w$ and
      $n_(r_1)n_(r_2) dots n_(r_k)$ both have image $w$ under the natural
      homomorphism, hence
    ]
    $ n_w=h n_(r_1) dots n_(r_k) $ <eq:8-4-3-representative>
    #block(sticky: true)[for some $h in H$. Thus]
    // E033: invert the product in reverse order; restore the missing minus sign.
    $
      n_w X_s n_w^(-1)
      &=h n_(r_1) dots n_(r_k) X_s n_(r_k)^(-1) dots n_(r_1)^(-1)h^(-1) \
      &=h X_(w(s))h^(-1)=X_(w(s))
    $ <eq:8-4-3-conjugation-word>
    #block(sticky: true)[
      by #book-ref("l", "7-2-1", [7.2.1]). It follows that
    ]
    $
      n_w U_w^+ n_w^(-1)
      =n_w dot product_(s in Psi_1) X_s dot n_w^(-1) subset.eq U.
    $ <eq:8-4-3-positive-part>
    (One can prove similarly that $n_w U_w^- n_w^(-1) subset.eq V$.)

    #block(sticky: true)[
      Now consider the double coset $B n_w B$. We have
    ]
    $
      B n_w B & =B n_w H U=B n_w H U_w^+ U_w^- \
              & =B H n_w U_w^+ U_w^- subset.eq B U n_w U_w^-=B n_w U_w^-.
    $ <eq:8-4-3-double-coset>
    But clearly $B n_w U_w^- subset.eq B n_w B$, so we have equality. Since each
    element $g in G$ is in some double coset $B n_w B$, $g$ may be expressed in
    the form $g=b n_w u$, where $b in B$, $u in U_w^-$.

    #block(sticky: true)[To show uniqueness, suppose]
    $ b_1 n_w u_1=b_2 n_(w')u_2, $ <eq:8-4-3-two-expressions>
    #block(sticky: true)[
      where $b_1,b_2 in B$, $w,w' in W$, $u_1 in U_w^-$, $u_2 in U_(w')^-$. By
      #book-ref("p", "8-2-3", [8.2.3]) we have $w=w'$, thus $n_w=n_(w')$. It
      follows that
    ]
    $ b_2^(-1)b_1=n_w u_2 u_1^(-1)n_w^(-1). $ <eq:8-4-3-uniqueness>
    Since $n_w U_w^- n_w^(-1) subset.eq V$, this element is in $B ∩ V$, so is
    $1$ by #book-ref("l", "7-1-2", [7.1.2]). Thus $b_1=b_2$ and $u_1=u_2$. #qed

    #source(130, "117")
    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-4-4>
      #smallcaps[Corollary 8.4.4.] _Each element of $G$ has a unique expression
      in the form $g=u_1 h n_w u$, where $u_1 in U$, $h in H$, $w in W$,
      $u in U_w^-$._
    ]

    One consequence of the canonical form we have established is the following
    useful result.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-4-5>
      #smallcaps[Proposition 8.4.5.] _Two elements of $H$ which are conjugate in
      $G$ are conjugate in $N$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] Let $h_1,h_2 in H$ satisfy $h_2=g h_1 g^(-1)$. Let
      $g=u_1 h n_w u$ as in #book-ref("cor", "8-4-4", [8.4.4]). Then
    ]
    $ u_1 h n_w u h_1=h_2 u_1 h n_w u. $ <eq:8-4-5-conjugates>
    #block(sticky: true)[It follows that]
    $
      u_1 dot h n_w h_1 n_w^(-1) dot n_w h_1^(-1)u h_1
      =h_2 u_1 h_2^(-1) dot h_2 h dot n_w dot u.
    $ <eq:8-4-5-canonical-comparison>
    #block(sticky: true)[
      By the uniqueness of expression of elements of $G$ in canonical form we
      have
    ]
    $
      u_1=h_2 u_1 h_2^(-1), quad
      h n_w h_1 n_w^(-1)=h_2 h, quad h_1^(-1)u h_1=u.
    $ <eq:8-4-5-unique-factors>
    In particular, $h_2=n_w h_1 n_w^(-1)$, so $h_1,h_2$ are conjugate in $N$.
    #qed

    We conclude this section with a result concerning the group $hat(H)$ defined
    in #chapter-ref("diagonal-and-monomial-subgroups").

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-4-6>
      #smallcaps[Proposition 8.4.6.] _$G ∩ hat(H)=H$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] Let $g in G ∩ hat(H)$. Then $g=b_1 n b_2$, where
      $b_1,b_2 in B$ and $n in N$. Thus
    ]
    $ n=b_1^(-1)g b_2^(-1) in B hat(H) B. $ <eq:8-4-6-monomial-element>
    #block(sticky: true)[Now we have]
    $ B hat(H) B=U H hat(H) H U=U hat(H) U=U hat(H). $
    <eq:8-4-6-double-product>
    #block()[
      Thus $n in U hat(H) ∩ N$. But $U hat(H) ∩ N=H$ by #book-ref(
        "cor",
        "7-2-4",
        [7.2.4],
      ). Hence $n in H$ and $g in B$. But now $g in B ∩ hat(H)$ and
    ]
    #block(breakable: false)[
      $ B ∩ hat(H)=U H ∩ hat(H)=(U ∩ hat(H))H=H, $ <eq:8-4-6-intersection>
      since $U ∩ hat(H)=1$ by #book-ref("l", "7-1-2", [7.1.2]). #qed
    ]

    #source(131, "118")
    #block(breakable: false)[
      #metadata((kind: "anchor")) <cor:8-4-7>
      #smallcaps[Corollary 8.4.7.] _Let $hat(G)$ be the group of automorphisms
      of $frak(L)_K$ generated by $G$ and $hat(H)$. Then $G$ is a normal
      subgroup of $hat(G)$ and $hat(G)\/G$ is isomorphic to $hat(H)\/H$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] $hat(H)$ normalizes $G$ by the remark following
      #book-ref(
        "th",
        "7-1-1",
        [7.1.1],
      ). Thus $G$ is a normal subgroup of $hat(G)$ and $hat(G)=G hat(H)$. Also
    ]
    $ hat(G)\/G=G hat(H)\/G tilde.eq hat(H)\/(G ∩ hat(H))=hat(H)\/H $
    <eq:8-4-7-quotient>
    by #book-ref("p", "8-4-6", [8.4.6]). #qed
  ]

  #[
    #import "main-defs.typ": book-ref, mathclap, qed, source

    == The Levi Decomposition <sec:levi-decomposition>

    We shall now derive further information about the parabolic subgroups of the
    Chevalley group $G$. We have seen in sections #book-ref("sec", "bn-pairs")
    and #book-ref("sec", "parabolic-subgroups") that every parabolic subgroup of
    $G$ is conjugate to one of the subgroups $P_J=B N_J B$ for some subset $J$
    of the set $Pi$ of fundamental roots. Furthermore distinct subsets of $Pi$
    give rise to non-conjugate subgroups $P_J$. Thus $G$ has $2^l$ conjugacy
    classes of parabolic subgroups.

    We first give an alternative way of describing the subgroup $P_J$. Let
    $Phi_J$ be the set of roots which are integral combinations of roots in $J$
    and $overline(Phi)_J$ be the set of roots which do not belong to $Phi_J$.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <p:8-5-1>
      #smallcaps[Proposition 8.5.1.] _$P_J$ is the subgroup of $G$ generated by
      $H$ and the root subgroups $X_r$ for $r in Phi^+ union Phi_J$._
    ]

    #block(sticky: true)[
      #smallcaps[Proof.] $P_J=B N_J B$ is the subgroup of $G$ generated by $B$
      and the elements $n_r$ for $r in J$. Since $n_r in lr(⟨X_r,X_(-r)⟩)$, it
      is clear that
    ]
    $ P_J subset.eq lr(⟨H,X_r; r in Phi^+ union Phi_J⟩). $
    <eq:8-5-1-generators>
    #block(sticky: true)[
      Conversely, it is clear that $H subset.eq P_J$ and $X_r subset.eq P_J$ if
      $r in Phi^+$. Thus we consider the subgroups $X_r$ with
      $r in Phi^- ∩ Phi_J$. By #book-ref("p", "2-5-1", [2.5.1]) each root in
      $Phi_J$ is the image of a root in $J$ under an element of $W_J$. Thus
    ]
    $ r=w_(r_1)w_(r_2) dots w_(r_k)(s), $ <eq:8-5-1-root-orbit>
    #block(sticky: true)[where $r_1,dots,r_k,s in J$. Hence]
    // E034: the penultimate inverse factor is n_(r_2), not n_2.
    $
      n_(r_1)n_(r_2) dots n_(r_k) X_s
      n_(r_k)^(-1) dots n_(r_2)^(-1)n_(r_1)^(-1)=X_r
    $ <eq:8-5-1-conjugation>
    by #book-ref("l", "7-2-1", [7.2.1]). Therefore $X_r subset.eq P_J$ as
    required.
    #qed

    #source(132, "119")
    #block(sticky: true)[
      If $J$ is the empty set, then $P_J=B$. Now $B$ admits a decomposition into
      the semi-direct product of $U$ and $H$. This semi-direct decomposition
      generalizes in fact to any parabolic subgroup, as we shall now show. For
      any subset $J$ of $Pi$ we define $U_J$ to be the subgroup of $G$ generated
      by the root subgroups $X_r$ for which $r in Phi^+ ∩ overline(Phi)_J$.
      $Phi^+ ∩ overline(Phi)_J$ is evidently a closed set of roots, therefore
    ]
    $ U_J=product_(mathclap(r in Phi^+ ∩ overline(Phi)_J)) X_r, $
    <eq:8-5-unipotent-radical>
    by Chevalley's commutator formula. (The factors may be taken in any order.)
    We also define $L_J$ to be the subgroup of $G$ generated by $H$ and the root
    subgroups $X_r$ for all $r in Phi_J$.

    #block(breakable: false)[
      #metadata((kind: "anchor")) <th:8-5-2>
      #smallcaps[Theorem 8.5.2.]
      #enum(
        numbering: "(i)",
        indent: 1.1em,
        body-indent: 0.5em,
        [_$U_J$ is a normal subgroup of $P_J$._],
        [_$P_J=U_J L_J$ and $U_J ∩ L_J=1$._],
        [_$P_J$ is the normalizer of $U_J$ in $G$._],
      )
    ]
    The decomposition of $P_J$ into the semi-direct product of $U_J$ and $L_J$
    is called the Levi decomposition, and $L_J$ and its conjugates in $U_J$ are
    called the Levi subgroups of $P_J$.

    #smallcaps[Proof.] We show that the subgroups generating $P_J$ all normalize
    $U_J$. It is clear that $H$ normalizes $U_J$. Let $r$ be a positive root. If
    $s in Phi^+ ∩ overline(Phi)_J$ all roots of form $i r+j s$, where $i,j$ are
    positive integers, are also in $Phi^+ ∩ overline(Phi)_J$. Thus the
    commutator formula shows that $X_r$ normalizes $U_J$. Now suppose
    $r in Phi^- ∩ Phi_J$. Then $-r$ is not in $Phi^+ ∩ overline(Phi)_J$, and if
    $s$ is any root in $Phi^+ ∩ overline(Phi)_J$, all roots of form $i r+j s$,
    where $i,j$ are positive integers, are in $Phi^+ ∩ overline(Phi)_J$. For
    $i r+j s$ involves some fundamental root not in $J$ with a positive
    coefficient. Hence $X_r$ normalizes $U_J$ in this case also, and so $U_J$ is
    normal in $P_J$ by #book-ref(
      "p",
      "8-5-1",
      [8.5.1],
    ).

    Now #book-ref("p", "8-5-1", [8.5.1]) shows that $P_J$ is generated by $U_J$
    and $L_J$. Since $U_J$ is normal in $P_J$ we have $P_J=U_J L_J$.

    #block(sticky: true)[
      We now consider $U_J ∩ L_J$. Let $theta in U_J ∩ L_J$ and consider the
      effect of $theta$ on the Chevalley basis of $frak(L)_K$. We have
    ]
    $ theta dot h_s=h_s+x, $ <eq:8-5-2-cartan-action>
    #block(sticky: true)[where]
    $ x in sum_(mathclap(r in Phi^+ ∩ overline(Phi)_J)) frak(L)_r, $
    <eq:8-5-2-cartan-unipotent>
    #block(sticky: true)[since $theta in U_J$. But]
    $ theta dot h_s in frak(H) ⊕ sum_(r in Phi_J) frak(L)_r, $
    <eq:8-5-2-cartan-levi>
    #source(133, "120")
    #block(sticky: true)[since $theta in L_J$. However]
    $
      frak(L)=frak(H) ⊕ sum_(r in Phi_J) frak(L)_r
      ⊕ sum_(r in overline(Phi)_J) frak(L)_r,
    $ <eq:8-5-2-root-space-splitting>
    and so $theta dot h_s=h_s$.

    #block(sticky: true)[
      Now consider $theta dot e_s$. Suppose first that $s in Phi_J$. Then
    ]
    $ theta dot e_s=e_s+x, $ <eq:8-5-2-levi-root-action>
    #block(sticky: true)[where]
    $ x in sum_(r in overline(Phi)_J) frak(L)_r, $ <eq:8-5-2-levi-root-shift>
    #block(sticky: true)[since $theta in U_J$. Also]
    $ theta dot e_s in frak(H) ⊕ sum_(r in Phi_J) frak(L)_r, $
    <eq:8-5-2-levi-root-support>
    since $theta in L_J$. It follows that $theta dot e_s=e_s$.

    // E035: differences of roots need not be roots. Use the span from2.5.
    #block(sticky: true)[
      Now suppose $s in overline(Phi)_J$. Write $frak(V)_J$ for the subspace
      spanned by $J$, as in #book-ref(
        "sec",
        "weyl-parabolic-subgroups",
        supplement: [section ],
      ). Then
    ]
    $ theta dot e_s=e_s+x, $ <eq:8-5-2-complement-root-action>
    #block(sticky: true)[where]
    $ x in frak(H) ⊕ sum_(mathclap(r-s in.not frak(V)_J)) frak(L)_r, $
    <eq:8-5-2-complement-unipotent-support>
    #block(sticky: true)[since $theta in U_J$. But]
    $ theta dot e_s in sum_(mathclap(r-s in frak(V)_J)) frak(L)_r, $
    <eq:8-5-2-complement-levi-support>
    since $theta in L_J$. Thus $theta dot e_s=e_s$ in this case also. Hence
    $theta$ operates trivially on the Chevalley basis, so $theta=1$.

    Finally consider the subgroup $frak(N)_G (U_J)$. This subgroup contains
    $P_J$, so must be one of the subgroups $P_(J_1)$ for some subset
    $J_1 supset.eq J$. If $J_1 supset J$, choose a root $r in J_1$ with
    $r in.not J$. Then $r in Phi^+ ∩ overline(Phi)_J$ and so
    $X_r subset.eq U_J$. Also $n_r in frak(N)_G (U_J)$. However
    $n_r X_r n_r^(-1)=X_(-r)$ is not contained in $U_J$ and we have a
    contradiction. Therefore $J_1=J$ and $frak(N)_G (U_J)=P_J$.
    #qed
  ]

  #[
    #import "main-defs.typ": book-ref, mathclap, source

    == The Finite Chevalley Groups <sec:finite-chevalley-groups>

    #metadata((kind: "anchor")) <def:finite-chevalley-group>
    We now consider the special case in which the base field $K$ is the finite
    field $G F(q)$ with $q$ elements, where $q$ is an arbitrary prime power. $G$
    is then a group of non-singular linear transformations of a space over a
    #source(134, "121")
    finite field, so is a finite group. The Chevalley group of type $frak(L)$
    over $G F(q)$ will be denoted by $frak(L)(q)$. We shall obtain a formula for
    the orders of the groups $frak(L)(q)$.

    #block(sticky: true)[
      We begin with the canonical form for elements of $G$ established in
      #book-ref(
        "cor",
        "8-4-4",
        [8.4.4],
      ). Each element of $G$ has a unique expression in the form $u_1 h n_w u$,
      where $u_1 in U$, $h in H$, $w in W$, $u in U_w^-$. Thus we have
    ]
    $
      abs(G) & =sum_(w in W) abs(B n_w B)
               =sum_(w in W) abs(U H n_w U_w^-) \
             & =abs(U) dot abs(H) dot sum_(w in W) abs(U_w^-).
    $ <eq:8-6-order-from-cells>
    #block(sticky: true)[
      Now each element of $U$ is uniquely expressible in the form
    ]
    // E036: bind the product index r_i consistently with x_(r_i)(t_i).
    $ product_(r_i in Phi^+) x_(r_i) (t_i) $ <eq:8-6-unipotent-elements>
    #block(sticky: true)[
      with $t_i in G F(q)$. Thus $abs(U)=q^N$, where $N=abs(Phi^+)$. Also each
      element of $U_w^-$ is uniquely expressible in the form
    ]
    $
      product_(mathclap(r_i in Phi^+ "," w(r_i) in Phi^-)) x_(r_i) (t_i),
    $ <eq:8-6-cell-elements>
    #block(sticky: true)[and so]
    $ abs(U_w^-)=q^(l(w)). $ <eq:8-6-cell-order>

    We now consider the order of $H$. By #book-ref("th", "7-1-1", [7.1.1]) $H$
    is the set of automorphisms $h(chi)$ of $frak(L)_K$ where $chi$ is a
    #box[$K$-character] of $P$ which can be extended to a #box[$K$-character] of
    $Q$. $H$ is a subgroup of $hat(H)$, the group of automorphisms $h(chi)$ as
    $chi$ runs through all #box[$K$-characters] of $P$. Since $P$ is isomorphic
    to $Q$ (both are free abelian groups of rank $l$), $hat(H)$ is isomorphic to
    the group of automorphisms $h(chi)$ for all #box[$K$-characters] $chi$ of
    $Q$. Thus there is an epimorphism $hat(H) arrow H$ obtained by restricting
    $chi$ from $Q$ to $P$. The kernel consists of the automorphisms $h(chi)$,
    where $chi$ is a #box[$K$-character] of $Q$ which is the identity on $P$.
    The kernel is therefore isomorphic to the group of #box[$K$-characters] of
    the factor group $Q\/P$.

    #block(sticky: true)[
      Now $abs(hat(H))=(q-1)^l$, since the image of each generator under a
      #box[$K$-character] can be chosen in $q-1$ ways. Thus
    ]
    $ abs(H)=1/d (q-1)^l, $ <eq:8-6-torus-order>
    #block()[
      where $d$ is the order of the group of #box[$K$-characters] of $Q\/P$. Now
      it has been shown in #book-ref(
        "sec",
        "diagonal-subgroup",
        supplement: [section ],
      ) that the bases $p_1,dots,p_l$; $q_1,dots,q_l$ of fundamental roots and
      fundamental weights for $P,Q$ respectively are related by
    ]
    $ p_i=sum_(j=1)^l A_(j i)q_j. $ <eq:8-6-lattice-bases>

    #source(135, "122")
    #block(sticky: true)[
      Thus the factor group $Q\/P$ is generated by elements
      $overline(q)_1,dots,overline(q)_l$ subject to relations
    ]
    $ sum_(j=1)^l A_(j i)overline(q)_j=0. $ <eq:8-6-lattice-relations>

    #block(sticky: true)[
      A consideration of the Cartan integers $A_(i j)$ (listed in #book-ref(
        "sec",
        "description-of-simple-lie-algebras",
        supplement: [section ],
      ) for the different types of simple algebra) shows that $Q\/P$ has the
      following structure ($ZZ_i$ denotes a cyclic group of order $i$):
    ]
    #block(breakable: false)[
      #set par(first-line-indent: 0pt)
      #table(
        columns: (9mm, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        inset: (x: 2pt, y: 2pt),
        stroke: none,
        table.hline(stroke: 0.6pt),
        [$frak(L)$], [$A_l$], [$B_l$], [$C_l$], [$D_(2k+1)$], [$D_(2k)$],
        table.hline(stroke: 0.3pt),
        [$Q\/P$],
        [$ZZ_(l+1)$],
        [$ZZ_2$],
        [$ZZ_2$],
        [$ZZ_4$],
        [$ZZ_2 times ZZ_2$],
        table.hline(stroke: 0.3pt),
        [$frak(L)$], [$G_2$], [$F_4$], [$E_6$], [$E_7$], [$E_8$],
        table.hline(stroke: 0.3pt),
        [$Q\/P$], [$1$], [$1$], [$ZZ_3$], [$ZZ_2$], [$1$],
        table.hline(stroke: 0.6pt),
      )
    ] <fig:8-6-fundamental-groups>

    #block(sticky: true)[
      Now the number of #box[$K$-characters] of $ZZ_i$ is the number of $i$th
      roots of $1$ in $G F(q)$, which is $(i,q-1)$. Thus the number $d$ of
      #box[$K$-characters] of $Q\/P$ has the following values:
    ]
    #block(breakable: false)[
      #set par(first-line-indent: 0pt)
      #table(
        columns: (9mm, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        inset: (x: 2pt, y: 2pt),
        stroke: none,
        table.hline(stroke: 0.6pt),
        [$frak(L)$], [$A_l$], [$B_l$], [$C_l$], [$D_(2k+1)$], [$D_(2k)$],
        table.hline(stroke: 0.3pt),
        [$d$], [$(l+1,q-1)$], [$(2,q-1)$], [$(2,q-1)$],
        [$(4,q-1)$], [$(2,q-1)^2$],
        table.hline(stroke: 0.3pt),
        [$frak(L)$], [$G_2$], [$F_4$], [$E_6$], [$E_7$], [$E_8$],
        table.hline(stroke: 0.3pt),
        [$d$], [$1$], [$1$], [$(3,q-1)$], [$(2,q-1)$], [$1$],
        table.hline(stroke: 0.6pt),
      )
    ] <fig:8-6-character-counts>

    The two cases for type $D$ may be summarized by writing $d=(4,q^l-1)$.

    #block(sticky: true)[
      We now collect together the information obtained above and obtain the
      following formula.
    ]

    #block(width: 100%, breakable: false)[
      #metadata((kind: "anchor")) <p:8-6-1>
      #smallcaps[Proposition 8.6.1.] _Let $G=frak(L)(q)$. Then_
      $ abs(G)=1/d q^N (q-1)^l sum_(w in W) q^(l(w)). $ <eq:8-6-1-order>
    ]

    #block(sticky: true)[
      Although this is a simple theoretical formula for the order of $G$, it is
      not the best formula in practice as the expression
    ]
    $ sum_(w in W) q^(l(w)) $ <eq:8-6-length-polynomial>
    is very cumbersome. We shall show in the #book-ref(
      "ch",
      "polynomial-invariants",
      [following chapter],
      highlight: false,
    ) how this expression can be simplified.
  ]
]

// Preview this file in the context of the complete book.
#context { include "main.typ" }
