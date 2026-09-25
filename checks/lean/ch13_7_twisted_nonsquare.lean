import Mathlib.Tactic.LinearCombination
import Mathlib.Algebra.Ring.Equiv

namespace Carter1972

/-- Carter13.7.4, printed249: Frobenius cubing composed with theta^2
is the identity, and the field does not have characteristic2. Then -1
is not a square. Carter uses characteristic3. No finiteness is needed
for this bounded step. -/
theorem twisted_minus_one_not_square {K : Type*} [Field K]
    (theta : K ≃+* K) (two_ne : (2 : K) ≠ 0)
    (cube_theta_sq : ∀ x : K, (theta (theta x)) ^ 3 = x)
    (t : K) : t ^ 2 ≠ -1 := by
  intro square
  have same_square : (theta t) ^ 2 = t ^ 2 := by
    calc
      (theta t) ^ 2 = theta (t ^ 2) := (map_pow theta t 2).symm
      _ = -1 := by rw [square]; simp
      _ = t ^ 2 := square.symm
  have factors : (theta t - t) * (theta t + t) = 0 := by
    linear_combination same_square
  have theta_twice : theta (theta t) = t := by
    rcases mul_eq_zero.mp factors with minus | plus
    · have fixed : theta t = t := by linear_combination minus
      rw [fixed, fixed]
    · have negated : theta t = -t := by linear_combination plus
      rw [negated, map_neg, negated, neg_neg]
  have cubed : t ^ 3 = t := by simpa [theta_twice] using cube_theta_sq t
  have two_t : (2 : K) * t = 0 := by
    linear_combination t * square - cubed
  have zero : t = 0 := (mul_eq_zero.mp two_t).resolve_left two_ne
  simp [zero] at square

end Carter1972

#print axioms Carter1972.twisted_minus_one_not_square
