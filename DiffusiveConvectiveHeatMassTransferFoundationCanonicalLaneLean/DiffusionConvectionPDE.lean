import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.ConservationLaws

/-!
# Diffusion-Convection PDE Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure DiffusionConvectionPDEPackage (C : ConservationLawsPackage) where
  diffusivityTensor : Prop
  convectiveVelocity : Prop
  sourceTerm : Prop
  pdeFormulation : Prop

structure DiffusionConvectionPDEEvidence {C : ConservationLawsPackage} (P : DiffusionConvectionPDEPackage C) where
  diffusivityTensorClosed : P.diffusivityTensor
  convectiveVelocityClosed : P.convectiveVelocity
  sourceTermClosed : P.sourceTerm
  pdeFormulationClosed : P.pdeFormulation

def DiffusionConvectionPDEClosed {C : ConservationLawsPackage} (P : DiffusionConvectionPDEPackage C) : Prop :=
  P.diffusivityTensor ∧ P.convectiveVelocity ∧ P.sourceTerm ∧ P.pdeFormulation

theorem diffusion_convection_pde_closed_from_evidence {C : ConservationLawsPackage} (P : DiffusionConvectionPDEPackage C) (E : DiffusionConvectionPDEEvidence P) :
    DiffusionConvectionPDEClosed P := by
  exact And.intro E.diffusivityTensorClosed (And.intro E.convectiveVelocityClosed (And.intro E.sourceTermClosed E.pdeFormulationClosed))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
