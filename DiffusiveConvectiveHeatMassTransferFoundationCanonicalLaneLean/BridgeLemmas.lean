import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiffusiveConvectiveWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse