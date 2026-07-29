import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.DiffusionConvectionPDE

/-!
# Weak Formulation Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure WeakFormulationPackage {C : ConservationLawsPackage} (P : DiffusionConvectionPDEPackage C) where
  testFunctionSpace : Prop
  weakFormIntegral : Prop
  existenceWeakSolution : Prop
  uniquenessWeakSolution : Prop

structure WeakFormulationEvidence {C : ConservationLawsPackage} {P : DiffusionConvectionPDEPackage C} (W : WeakFormulationPackage P) where
  testFunctionSpaceClosed : W.testFunctionSpace
  weakFormIntegralClosed : W.weakFormIntegral
  existenceWeakSolutionClosed : W.existenceWeakSolution
  uniquenessWeakSolutionClosed : W.uniquenessWeakSolution

def WeakFormulationClosed {C : ConservationLawsPackage} {P : DiffusionConvectionPDEPackage C} (W : WeakFormulationPackage P) : Prop :=
  W.testFunctionSpace ∧ W.weakFormIntegral ∧ W.existenceWeakSolution ∧ W.uniquenessWeakSolution

theorem weak_formulation_closed_from_evidence {C : ConservationLawsPackage} {P : DiffusionConvectionPDEPackage C} (W : WeakFormulationPackage P) (E : WeakFormulationEvidence W) :
    WeakFormulationClosed W := by
  exact And.intro E.testFunctionSpaceClosed (And.intro E.weakFormIntegralClosed (And.intro E.existenceWeakSolutionClosed E.uniquenessWeakSolutionClosed))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
