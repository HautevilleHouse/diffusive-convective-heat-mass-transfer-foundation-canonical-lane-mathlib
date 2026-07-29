import canonicalLaneMathlib.AdmissibleClass

/-!
# Dimensionless Numbers Package

This module defines the dimensionless numbers governing convective heat and mass transfer.
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure DimensionlessNumbersPackage where
  reynoldsNumber : Prop
  prandtlNumber : Prop
  schmidtNumber : Prop
  nusseltNumber : Prop
  sherwoodNumber : Prop
  grashofNumber : Prop
  rayleighNumber : Prop
  lewisNumber : Prop
  pecletNumber : Prop
  correlationsDefined : Prop

def DimensionlessNumbersClosed (D : DimensionlessNumbersPackage) : Prop :=
  D.reynoldsNumber ∧ D.prandtlNumber ∧ D.schmidtNumber ∧ D.nusseltNumber ∧
  D.sherwoodNumber ∧ D.grashofNumber ∧ D.rayleighNumber ∧ D.lewisNumber ∧
  D.pecletNumber ∧ D.correlationsDefined

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
