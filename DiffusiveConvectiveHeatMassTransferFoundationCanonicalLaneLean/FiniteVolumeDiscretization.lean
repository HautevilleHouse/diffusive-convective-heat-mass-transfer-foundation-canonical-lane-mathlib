import canonicalLaneMathlib.AdmissibleClass
import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.HeatMassTransferCoefficients

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure FiniteVolumeDiscretizationPackage {D : DiffusiveConvectiveSystem}
    {P : ConvectionDiffusionPDEPackage D}
    {B : BoundaryLayerPackage}
    {C : HeatMassTransferCoefficientsPackage} where
  meshType : Type u
  discretizationScheme : Prop
  stabilityCondition : Prop
  convergenceOrder : ℕ
  numericalDiffusivity : ℝ
  discretizationSchemeTerm : discretizationScheme
  stabilityConditionTerm : stabilityCondition

structure FiniteVolumeDiscretizationEvidence
    {D : DiffusiveConvectiveSystem} {P : ConvectionDiffusionPDEPackage D}
    {B : BoundaryLayerPackage} {C : HeatMassTransferCoefficientsPackage}
    (F : FiniteVolumeDiscretizationPackage) where
  discretizationSchemeClosed : F.discretizationScheme
  stabilityConditionClosed : F.stabilityCondition

def FiniteVolumeDiscretizationClosed
    {D : DiffusiveConvectiveSystem} {P : ConvectionDiffusionPDEPackage D}
    {B : BoundaryLayerPackage} {C : HeatMassTransferCoefficientsPackage}
    (F : FiniteVolumeDiscretizationPackage) : Prop :=
  F.discretizationScheme ∧ F.stabilityCondition

theorem finite_volume_discretization_closed_from_evidence
    {D : DiffusiveConvectiveSystem} {P : ConvectionDiffusionPDEPackage D}
    {B : BoundaryLayerPackage} {C : HeatMassTransferCoefficientsPackage}
    (F : FiniteVolumeDiscretizationPackage)
    (E : FiniteVolumeDiscretizationEvidence F) :
    FiniteVolumeDiscretizationClosed F := by
  exact And.intro E.discretizationSchemeClosed E.stabilityConditionClosed

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
