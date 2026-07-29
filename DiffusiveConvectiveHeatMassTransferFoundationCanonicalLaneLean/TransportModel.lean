import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure TransportModelPackage where
  domain : Type u
  topology : TopologicalSpace domain
  timeInterval : Type v
  velocityField : Type w
  materialProperties : Type x
  diffusionCoefficient : Prop
  convectionCoefficient : Prop

structure TransportModelEvidence (M : TransportModelPackage) where
  diffusionCoefficientClosed : M.diffusionCoefficient
  convectionCoefficientClosed : M.convectionCoefficient

def TransportModelClosed (M : TransportModelPackage) : Prop :=
  M.diffusionCoefficient ∧ M.convectionCoefficient

theorem transport_model_closed_from_evidence
    (M : TransportModelPackage) (E : TransportModelEvidence M) : TransportModelClosed M := by
  exact And.intro E.diffusionCoefficientClosed E.convectionCoefficientClosed

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse