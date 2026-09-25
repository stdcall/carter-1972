# Selected Lean checks for Carter

Three files contain four declarations:

- `ch04_3_exponential.lean`: matches the exact finite factorial sum of Lemma
  4.3.1 to mathlib's nilpotent Lie-derivation exponential and its inverse.
- `ch09_3_averaging.lean`: matches the explicit group-average sum in Lemma
  9.3.2 to the projection/trace result in mathlib, checking its hypotheses.
- `ch13_7_twisted_nonsquare.lean`: proves that −1 is not a square if θ is a
  field automorphism, `(θ(θ(x)))³ = x` for all x, and `2 ≠ 0`. Finiteness is
  unnecessary: θ² fixes a hypothetical square root, giving a contradiction.

The first two files deliberately reuse mathlib. Their value is the exact,
checked correspondence to Carter's definitions, not a new proof of the mathlib
results. None of these files formalizes the entire surrounding chapter.

Run `just check-lean` with `LEAN_MATHLIB` set to a prebuilt mathlib checkout
of the pinned commit (in the environment or in a local `.env` file). The
runner, `check_proofs.py`, checks the pinned toolchain and mathlib commit, the
passage labels, warnings and axioms. It never installs, builds or updates an
environment.

Exact hypotheses, bound passages and scope are in `bindings.json`. Each file
lists in `passages` the labels of the passages it checks; `just check` and
`just check-lean` verify that these labels exist in the book. When the
mathematics of such a passage changes, review the proof against the new text.
An overview of the checks is in `../README.md`.
