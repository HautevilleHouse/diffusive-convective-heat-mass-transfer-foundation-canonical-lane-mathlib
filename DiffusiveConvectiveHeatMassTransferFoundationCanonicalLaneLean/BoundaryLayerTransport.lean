import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Layer Transport Package

This module encodes the boundary layer equations for momentum, heat, and mass transfer.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure BoundaryLayerTransportPackage where
  flowGeometry : Type u
  velocityProfile : Type v
  temperatureProfile : Type w
  concentrationProfile : Type x
  momentumEquation : Prop
  energyEquation : Prop
  speciesEquation : Prop
  closureRelations : Prop

def BoundaryLayerTransportClosed (B : BoundaryLayerTransportPackage) : Prop :=
  B.momentumEquation ∧ B.energyEquation ∧ B.speciesEquation ∧ B.closureRelations

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
