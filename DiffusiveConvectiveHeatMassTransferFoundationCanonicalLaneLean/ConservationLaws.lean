import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Conservation Laws Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure ConservationLawsPackage where
  massConservation : Prop
  energyConservation : Prop
  speciesConservation : Prop
  momentumConservation : Prop

structure ConservationLawsEvidence (C : ConservationLawsPackage) where
  massConservationClosed : C.massConservation
  energyConservationClosed : C.energyConservation
  speciesConservationClosed : C.speciesConservation
  momentumConservationClosed : C.momentumConservation

def ConservationLawsClosed (C : ConservationLawsPackage) : Prop :=
  C.massConservation ∧ C.energyConservation ∧ C.speciesConservation ∧ C.momentumConservation

theorem conservation_laws_closed_from_evidence (C : ConservationLawsPackage) (E : ConservationLawsEvidence C) :
    ConservationLawsClosed C := by
  exact And.intro E.massConservationClosed (And.intro E.energyConservationClosed (And.intro E.speciesConservationClosed E.momentumConservationClosed))

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
