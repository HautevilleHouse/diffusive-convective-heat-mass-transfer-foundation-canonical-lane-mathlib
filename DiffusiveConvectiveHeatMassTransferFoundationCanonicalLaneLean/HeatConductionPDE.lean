import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure HeatConductionPDE where
  materialDomain : Type u
  temperatureField : materialDomain → ℝ
  thermalConductivity : materialDomain → ℝ
  heatSource : materialDomain → ℝ
  pdeEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  pdeEquationClosed : pdeEquation
  initialConditionClosed : initialCondition
  boundaryConditionClosed : boundaryCondition

structure HeatConductionEvidence (H : HeatConductionPDE) where
  pdeEquationClosed : H.pdeEquation
  initialConditionClosed : H.initialCondition
  boundaryConditionClosed : H.boundaryCondition

def HeatConductionClosed (H : HeatConductionPDE) : Prop :=
  H.pdeEquation ∧ H.initialCondition ∧ H.boundaryCondition

theorem heat_conduction_closed_from_evidence (H : HeatConductionPDE) (E : HeatConductionEvidence H) : HeatConductionClosed H :=
  And.intro E.pdeEquationClosed (And.intro E.initialConditionClosed E.boundaryConditionClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse