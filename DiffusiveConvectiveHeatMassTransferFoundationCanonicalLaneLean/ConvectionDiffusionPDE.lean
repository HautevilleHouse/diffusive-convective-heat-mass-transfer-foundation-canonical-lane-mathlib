import canonicalLaneMathlib.AdmissibleClass

/-!
# Convection-Diffusion PDE Package

This module records the convection-diffusion equation over a transport domain.
The analytic content is expressed as explicit proof obligations carried by the package.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure ConvectionDiffusionPDEPackage where
  spatialDomain : Type u
  timeParameter : Type v
  scalarField : Type w
  temperatureField : scalarField
  concentrationField : scalarField
  diffusionCoefficient : scalarField
  convectionVelocity : scalarField
  sourceTerm : scalarField
  pdeFormulation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

def ConvectionDiffusionPDEClosed (P : ConvectionDiffusionPDEPackage) : Prop :=
  P.pdeFormulation ∧ P.initialCondition ∧ P.boundaryCondition

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
