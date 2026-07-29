import canonicalLaneMathlib.AdmissibleClass
import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.ConvectionDiffusionPDE

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure BoundaryLayerPackage {D : DiffusiveConvectiveSystem}
    {P : ConvectionDiffusionPDEPackage D} where
  boundaryLayerThickness : ℝ
  nusseltNumber : ℝ
  sherwoodNumber : ℝ
  similaritySolution : Prop
  boundaryLayerEquations : Prop
  similaritySolutionTerm : similaritySolution
  boundaryLayerEquationsTerm : boundaryLayerEquations

structure BoundaryLayerEvidence {D : DiffusiveConvectiveSystem}
    {P : ConvectionDiffusionPDEPackage D}
    (B : BoundaryLayerPackage) where
  similaritySolutionClosed : B.similaritySolution
  boundaryLayerEquationsClosed : B.boundaryLayerEquations

def BoundaryLayerClosed {D : DiffusiveConvectiveSystem}
    {P : ConvectionDiffusionPDEPackage D}
    (B : BoundaryLayerPackage) : Prop :=
  B.similaritySolution ∧ B.boundaryLayerEquations

theorem boundary_layer_closed_from_evidence
    {D : DiffusiveConvectiveSystem} {P : ConvectionDiffusionPDEPackage D}
    (B : BoundaryLayerPackage) (E : BoundaryLayerEvidence B) :
    BoundaryLayerClosed B := by
  exact And.intro E.similaritySolutionClosed E.boundaryLayerEquationsClosed

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
