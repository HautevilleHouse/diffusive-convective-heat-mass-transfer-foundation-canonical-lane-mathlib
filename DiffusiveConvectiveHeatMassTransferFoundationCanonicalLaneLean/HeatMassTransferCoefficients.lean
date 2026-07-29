import canonicalLaneMathlib.AdmissibleClass

/-!
# Heat and Mass Transfer Coefficients Package

This module defines the heat and mass transfer coefficients and their closure relations.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure HeatTransferCoefficientPackage where
  geometry : Type u
  fluidProperties : Type v
  nusseltCorrelation : Prop
  heatTransferCoefficient : Type w
  closureValidated : Prop

structure MassTransferCoefficientPackage where
  geometry : Type u
  fluidProperties : Type v
  sherwoodCorrelation : Prop
  massTransferCoefficient : Type w
  closureValidated : Prop

def HeatTransferCoefficientClosed (H : HeatTransferCoefficientPackage) : Prop :=
  H.nusseltCorrelation ∧ H.closureValidated

def MassTransferCoefficientClosed (M : MassTransferCoefficientPackage) : Prop :=
  M.sherwoodCorrelation ∧ M.closureValidated

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
