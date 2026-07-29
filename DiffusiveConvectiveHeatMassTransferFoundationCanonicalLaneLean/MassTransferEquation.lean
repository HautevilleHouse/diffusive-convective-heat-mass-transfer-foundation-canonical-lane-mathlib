import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.ConvectionDiffusionEquation

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure MassTransferEquationPackage {M : TransportModelPackage} (C : ConvectionDiffusionEquationPackage M) where
  massDiffusivity : Prop
  speciesSource : Prop
  convectiveMassFlux : Prop
  concentrationField : Prop
  massConservation : Prop

structure MassTransferEquationEvidence {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (Mtr : MassTransferEquationPackage C) where
  massDiffusivityClosed : Mtr.massDiffusivity
  speciesSourceClosed : Mtr.speciesSource
  convectiveMassFluxClosed : Mtr.convectiveMassFlux
  concentrationFieldClosed : Mtr.concentrationField
  massConservationClosed : Mtr.massConservation

def MassTransferEquationClosed {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (Mtr : MassTransferEquationPackage C) : Prop :=
  Mtr.massDiffusivity ∧ Mtr.speciesSource ∧ Mtr.convectiveMassFlux ∧ Mtr.concentrationField ∧ Mtr.massConservation

theorem mass_transfer_equation_closed_from_evidence
    {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (Mtr : MassTransferEquationPackage C)
    (Ev : MassTransferEquationEvidence Mtr) : MassTransferEquationClosed Mtr := by
  exact And.intro Ev.massDiffusivityClosed
    (And.intro Ev.speciesSourceClosed
      (And.intro Ev.convectiveMassFluxClosed
        (And.intro Ev.concentrationFieldClosed Ev.massConservationClosed)))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse