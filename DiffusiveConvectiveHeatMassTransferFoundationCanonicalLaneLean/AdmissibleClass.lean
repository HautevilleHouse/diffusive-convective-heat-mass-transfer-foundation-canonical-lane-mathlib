import canonicalLaneMathlib.AdmissibleClass
import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : DiffusiveConvectiveAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiffusiveConvectiveWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse