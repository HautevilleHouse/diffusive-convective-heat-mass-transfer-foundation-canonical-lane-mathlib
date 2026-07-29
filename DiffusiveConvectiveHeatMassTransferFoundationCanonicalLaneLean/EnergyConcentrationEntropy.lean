import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure EnergyConcentrationEntropyPackage {P : DiffusiveConvectivePDEPackage} where
  entropyFunctional : Type u
  energyDissipationRate : Prop
  entropyProductionRate : Prop
  monotonicityFormula : Prop
  entropyLowerBound : Prop

structure EnergyConcentrationEntropyEvidence {P : DiffusiveConvectivePDEPackage}
    (E : EnergyConcentrationEntropyPackage P) where
  energyDissipationRateClosed : E.energyDissipationRate
  entropyProductionRateClosed : E.entropyProductionRate
  monotonicityFormulaClosed : E.monotonicityFormula
  entropyLowerBoundClosed : E.entropyLowerBound

def EnergyConcentrationEntropyClosed {P : DiffusiveConvectivePDEPackage}
    (E : EnergyConcentrationEntropyPackage P) : Prop :=
  E.energyDissipationRate ∧ E.entropyProductionRate ∧
  E.monotonicityFormula ∧ E.entropyLowerBound

theorem energy_concentration_entropy_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} (E : EnergyConcentrationEntropyPackage P)
    (Ev : EnergyConcentrationEntropyEvidence E) : EnergyConcentrationEntropyClosed E :=
  And.intro Ev.energyDissipationRateClosed
    (And.intro Ev.entropyProductionRateClosed
      (And.intro Ev.monotonicityFormulaClosed Ev.entropyLowerBoundClosed))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse