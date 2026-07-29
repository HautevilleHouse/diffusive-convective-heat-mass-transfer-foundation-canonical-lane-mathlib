import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.ConvectionDiffusionEquation

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure EnergyEquationPackage {M : TransportModelPackage} (C : ConvectionDiffusionEquationPackage M) where
  thermalDiffusivity : Prop
  internalEnergySource : Prop
  enthalpyTransport : Prop
  temperatureField : Prop
  energyConservation : Prop

structure EnergyEquationEvidence {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (E : EnergyEquationPackage C) where
  thermalDiffusivityClosed : E.thermalDiffusivity
  internalEnergySourceClosed : E.internalEnergySource
  enthalpyTransportClosed : E.enthalpyTransport
  temperatureFieldClosed : E.temperatureField
  energyConservationClosed : E.energyConservation

def EnergyEquationClosed {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (E : EnergyEquationPackage C) : Prop :=
  E.thermalDiffusivity ∧ E.internalEnergySource ∧ E.enthalpyTransport ∧ E.temperatureField ∧ E.energyConservation

theorem energy_equation_closed_from_evidence
    {M : TransportModelPackage} {C : ConvectionDiffusionEquationPackage M} (E : EnergyEquationPackage C)
    (Ev : EnergyEquationEvidence E) : EnergyEquationClosed E := by
  exact And.intro Ev.thermalDiffusivityClosed
    (And.intro Ev.internalEnergySourceClosed
      (And.intro Ev.enthalpyTransportClosed
        (And.intro Ev.temperatureFieldClosed Ev.energyConservationClosed)))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse