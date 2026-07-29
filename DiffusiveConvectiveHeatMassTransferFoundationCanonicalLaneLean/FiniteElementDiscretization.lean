import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure FiniteElementDiscretizationPackage {P : DiffusiveConvectivePDEPackage} where
  mesh : Type u
  basisFunctions : Type v
  weakFormulation : Prop
  galerkinProjection : Prop
  discreteStability : Prop
  convergenceOrder : ℕ
  discretizationValid : Prop

structure FiniteElementDiscretizationEvidence {P : DiffusiveConvectivePDEPackage}
    (F : FiniteElementDiscretizationPackage P) where
  weakFormulationClosed : F.weakFormulation
  galerkinProjectionClosed : F.galerkinProjection
  discreteStabilityClosed : F.discreteStability
  discretizationValidClosed : F.discretizationValid

def FiniteElementDiscretizationClosed {P : DiffusiveConvectivePDEPackage}
    (F : FiniteElementDiscretizationPackage P) : Prop :=
  F.weakFormulation ∧ F.galerkinProjection ∧ F.discreteStability ∧ F.discretizationValid

theorem finite_element_discretization_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} (F : FiniteElementDiscretizationPackage P)
    (Ev : FiniteElementDiscretizationEvidence F) : FiniteElementDiscretizationClosed F :=
  And.intro Ev.weakFormulationClosed
    (And.intro Ev.galerkinProjectionClosed
      (And.intro Ev.discreteStabilityClosed Ev.discretizationValidClosed))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse