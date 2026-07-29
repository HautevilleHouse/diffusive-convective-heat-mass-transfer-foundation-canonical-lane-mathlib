import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure DiffusiveConvectivePDEPackage where
  spatialDomain : Type u
  timeInterval : Type v
  temperatureField : spatialDomain -> timeInterval -> ℝ
  concentrationField : spatialDomain -> timeInterval -> ℝ
  velocityField : spatialDomain -> timeInterval -> ℝ ^ 3
  thermalDiffusivity : ℝ
  massDiffusivity : ℝ
  convectiveCoefficient : ℝ
  pdeSystemValid : Prop
  boundaryConditionsValid : Prop

structure DiffusiveConvectivePDEEvidence (P : DiffusiveConvectivePDEPackage) where
  pdeSystemValidClosed : P.pdeSystemValid
  boundaryConditionsValidClosed : P.boundaryConditionsValid

def DiffusiveConvectivePDEClosed (P : DiffusiveConvectivePDEPackage) : Prop :=
  P.pdeSystemValid ∧ P.boundaryConditionsValid

theorem diffusive_convective_pde_closed_from_evidence (P : DiffusiveConvectivePDEPackage)
    (E : DiffusiveConvectivePDEEvidence P) : DiffusiveConvectivePDEClosed P :=
  And.intro E.pdeSystemValidClosed E.boundaryConditionsValidClosed

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse