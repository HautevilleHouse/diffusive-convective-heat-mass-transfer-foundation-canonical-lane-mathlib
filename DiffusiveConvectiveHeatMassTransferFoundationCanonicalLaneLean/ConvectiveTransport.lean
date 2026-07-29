import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure ConvectiveTransport where
  flowField : Type u
  velocity : flowField → ℝ × ℝ × ℝ
  speciesConcentration : flowField → ℝ
  massFlux : Prop
  convectiveDerivative : Prop
  divergenceFreeCondition : Prop
  massFluxClosed : massFlux
  convectiveDerivativeClosed : convectiveDerivative
  divergenceFreeConditionClosed : divergenceFreeCondition

structure ConvectiveTransportEvidence (C : ConvectiveTransport) where
  massFluxClosed : C.massFlux
  convectiveDerivativeClosed : C.convectiveDerivative
  divergenceFreeConditionClosed : C.divergenceFreeCondition

def ConvectiveTransportClosed (C : ConvectiveTransport) : Prop :=
  C.massFlux ∧ C.convectiveDerivative ∧ C.divergenceFreeCondition

theorem convective_transport_closed_from_evidence (C : ConvectiveTransport) (E : ConvectiveTransportEvidence C) : ConvectiveTransportClosed C :=
  And.intro E.massFluxClosed (And.intro E.convectiveDerivativeClosed E.divergenceFreeConditionClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse