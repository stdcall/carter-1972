#import "main-defs.typ":

// Added in the 1989 reprint (Wiley Classics Library): the second of the two
// pages it inserts after chapter 16 (printed page 313), below the
// new list of sporadic groups and before the bibliography. There is no 1972
// source page, hence no source() marker. The original “(See page 263)” points
// to the self-conjugate character values in the proof of 14.4.1.
= Supplement <sec:supplement>

== Hartley’s Lemma <sec:hartleys-lemma>

#let context-page = context {
  let found = query(label("pg:hartley-lemma-context"))
  if found.len() == 1 {
    str(counter(page).at(found.first().location()).first())
  } else [?]
}

(See @pg:hartley-lemma-context[page #context-page]).

(a) Let $G^1$ be a finite twisted group of type $attach(A, tl: 2)_l$,
$attach(D, tl: 2)_l$, $attach(E, tl: 2)_6$ or $attach(D, tl: 3)_4$ and let
$r in Phi$.

Suppose $r=overline(r)$. Then given any $t in K^*$ with $t=overline(t)$ there
exists $h(chi) in H^1$ with $chi(r)=t$.

Suppose $r != overline(r)$. Then given any $t in K^*$ there exists
$h(chi) in H^1$ with $chi(r)=t$ except when $G^1=attach(A, tl: 2)_3$ or
$attach(D, tl: 2)_l$ or when $G^1=attach(A, tl: 2)_2$ and $q equiv -1 mod 3$. If
$G^1=attach(A, tl: 2)_3$ or $attach(D, tl: 2)_l$ there exists $h(chi) in H^1$
with $chi(r)=t^2$. If $G^1=attach(A, tl: 2)_2$ and $q equiv -1 mod 3$ there
exists $h(chi) in H^1$ with $chi(r)=t^3$.

(b) Let $G^1$ be a finite twisted group of type $attach(B, tl: 2)_2$,
$attach(F, tl: 2)_4$ or $attach(G, tl: 2)_2$ and let $r in Phi$. Then given any
$t in K^*$ there exists $h(chi) in H^1$ with $chi(r)=t$ except when
$G^1=attach(G, tl: 2)_2$ and $r=a+b$ or $3a+b$. In these cases there exists
$h(chi) in H^1$ with $chi(r)=t^2$.
