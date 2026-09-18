import Mathlib.Algebra.Lie.Derivation.Basic

/-!
Carter (1972), Lemma 4.3.1, printed p.60 / DjVu73.
The existing mathlib theorem is specialized to the exact finite sum in Carter.
A Lie algebra over a characteristic-zero field carries the required rational
scalar action by restriction of scalars. No finite-dimensionality is needed.
-/

namespace Carter1972

variable {R L : Type*} [CommRing R] [LieRing L] [LieAlgebra R L]
  [Module ℚ L]

/-- The finite sum in Lemma 4.3.1 is a bijective Lie-algebra homomorphism. -/
theorem nilpotent_derivation_exponential (D : LieDerivation R L L)
    (n : ℕ) (hn : D.toLinearMap ^ n = 0) :
    ∃ F : L ≃ₗ⁅R⁆ L,
      F.toLinearMap = ∑ i ∈ Finset.range n,
        (i.factorial : ℚ)⁻¹ • (D.toLinearMap ^ i) := by
  refine ⟨D.exp ⟨n, hn⟩, ?_⟩
  exact IsNilpotent.exp_eq_sum hn

/-- The exponential has inverse exp(-D), as used in Carter's proof. -/
theorem nilpotent_exponential_inverse (D : LieDerivation R L L)
    (h : IsNilpotent D.toLinearMap) (x : L) :
    IsNilpotent.exp (-D.toLinearMap) (IsNilpotent.exp D.toLinearMap x) = x := by
  exact (D.exp h).left_inv x

#print axioms nilpotent_derivation_exponential
#print axioms nilpotent_exponential_inverse

end Carter1972
