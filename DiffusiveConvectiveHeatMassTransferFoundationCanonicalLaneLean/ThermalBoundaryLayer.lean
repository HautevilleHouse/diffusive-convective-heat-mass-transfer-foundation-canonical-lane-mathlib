import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure ThermalBoundaryLayer where
  wallSurface : Type u
  farField : Type u
  temperatureProfile : ℝ → ℝ
  thickness : ℝ
  heatTransferCoefficient : ℝ
  profileShape : Prop
  thicknessDefinition : Prop
  nusseltNumberRelation : Prop
  profileShapeClosed : profileShape
  thicknessDefinitionClosed : thicknessDefinition
  nusseltNumberRelationClosed : nusseltNumberRelation

structure ThermalBoundaryLayerEvidence (T : ThermalBoundaryLayer) where
  profileShapeClosed : T.profileShape
  thicknessDefinitionClosed : T.thicknessDefinition
  nusseltNumberRelationClosed : T.nusseltNumberRelation

def ThermalBoundaryLayerClosed (T : ThermalBoundaryLayer) : Prop :=
  T.profileShape ∧ T.thicknessDefinition ∧ T.nusseltNumberRelation

theorem thermal_boundary_layer_closed_from_evidence (T : ThermalBoundaryLayer) (E : ThermalBoundaryLayerEvidence T) : ThermalBoundaryLayerClosed T :=
  And.intro E.profileShapeClosed (And.intro E.thicknessDefinitionClosed E.nusseltNumberRelationClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse