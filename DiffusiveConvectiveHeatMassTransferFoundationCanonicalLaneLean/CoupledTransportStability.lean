import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure CoupledTransportStabilityPackage {P : DiffusiveConvectivePDEPackage}
    {E : EnergyConcentrationEntropyPackage P} where
  linearStabilityCondition : Prop
  nonlinearStabilityCondition : Prop
  bifurcationThreshold : ℝ
  stabilityProofClosed : Prop

structure CoupledTransportStabilityEvidence {P : DiffusiveConvectivePDEPackage}
    {E : EnergyConcentrationEntropyPackage P}
    (S : CoupledTransportStabilityPackage P E) where
  linearStabilityConditionClosed : S.linearStabilityCondition
  nonlinearStabilityConditionClosed : S.nonlinearStabilityCondition
  stabilityProofClosedClosed : S.stabilityProofClosed

def CoupledTransportStabilityClosed {P : DiffusiveConvectivePDEPackage}
    {E : EnergyConcentrationEntropyPackage P}
    (S : CoupledTransportStabilityPackage P E) : Prop :=
  S.linearStabilityCondition ∧ S.nonlinearStabilityCondition ∧ S.stabilityProofClosed

theorem coupled_transport_stability_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} {E : EnergyConcentrationEntropyPackage P}
    (S : CoupledTransportStabilityPackage P E)
    (Ev : CoupledTransportStabilityEvidence S) : CoupledTransportStabilityClosed S :=
  And.intro Ev.linearStabilityConditionClosed
    (And.intro Ev.nonlinearStabilityConditionClosed Ev.stabilityProofClosedClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse