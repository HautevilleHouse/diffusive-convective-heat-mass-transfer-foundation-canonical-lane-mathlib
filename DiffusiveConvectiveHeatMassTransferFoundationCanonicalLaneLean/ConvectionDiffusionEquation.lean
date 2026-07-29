import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.TransportModel

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure ConvectionDiffusionEquationPackage (M : TransportModelPackage) where
  diffusiveFlux : Prop
  convectiveFlux : Prop
  sourceTerm : Prop
  conservationLaw : Prop
  boundaryConditions : Prop

structure ConvectionDiffusionEquationEvidence {M : TransportModelPackage} (C : ConvectionDiffusionEquationPackage M) where
  diffusiveFluxClosed : C.diffusiveFlux
  convectiveFluxClosed : C.convectiveFlux
  sourceTermClosed : C.sourceTerm
  conservationLawClosed : C.conservationLaw
  boundaryConditionsClosed : C.boundaryConditions

def ConvectionDiffusionEquationClosed {M : TransportModelPackage} (C : ConvectionDiffusionEquationPackage M) : Prop :=
  C.diffusiveFlux ∧ C.convectiveFlux ∧ C.sourceTerm ∧ C.conservationLaw ∧ C.boundaryConditions

theorem convection_diffusion_equation_closed_from_evidence
    {M : TransportModelPackage} (C : ConvectionDiffusionEquationPackage M)
    (E : ConvectionDiffusionEquationEvidence C) : ConvectionDiffusionEquationClosed C := by
  exact And.intro E.diffusiveFluxClosed
    (And.intro E.convectiveFluxClosed
      (And.intro E.sourceTermClosed
        (And.intro E.conservationLawClosed E.boundaryConditionsClosed)))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse