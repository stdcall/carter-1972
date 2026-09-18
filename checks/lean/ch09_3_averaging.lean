import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Trace

namespace Carter1972

open scoped BigOperators

/-- Carter9.3.2: trace of the explicit averaging map equals the
dimension of the invariant subspace, over any characteristic-zero field.
The finite group need not be a Weyl group. -/
theorem averaging_trace
    {k G V : Type*} [Field k] [CharZero k] [Group G] [Fintype G]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) :
    LinearMap.trace k V
      ((Fintype.card G : k)⁻¹ • ∑ g : G, ρ g) =
      (Module.finrank k ρ.invariants : k) := by
  classical
  let : Invertible (Fintype.card G : k) :=
    invertibleOfNonzero (Nat.cast_ne_zero.mpr Fintype.card_ne_zero)
  have h := (Representation.isProj_averageMap ρ).trace
  simpa [Representation.averageMap, GroupAlgebra.average, map_sum] using h

end Carter1972

#print axioms Carter1972.averaging_trace
