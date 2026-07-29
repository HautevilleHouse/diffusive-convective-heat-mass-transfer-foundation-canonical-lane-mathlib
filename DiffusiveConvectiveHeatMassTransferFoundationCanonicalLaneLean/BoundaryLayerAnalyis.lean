import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure BoundaryLayerAnalysisPackage {P : DiffusiveConvectivePDEPackage} where
  thermalBoundaryLayerThickness : ℝ
  concentrationBoundaryLayerThickness : ℝ
  momentumBoundaryLayerThickness : ℝ
  similaritySolutionValid : Prop
  boundaryLayerEquationsClosed : Prop

structure BoundaryLayerAnalysisEvidence {P : DiffusiveConvectivePDEPackage}
    (B : BoundaryLayerAnalysisPackage P) where
  similaritySolutionValidClosed : B.similaritySolutionValid
  boundaryLayerEquationsClosedClosed : B.boundaryLayerEquationsClosed

def BoundaryLayerAnalysisClosed {P : DiffusiveConvectivePDEPackage}
    (B : BoundaryLayerAnalysisPackage P) : Prop :=
  B.similaritySolutionValid ∧ B.boundaryLayerEquationsClosed

theorem boundary_layer_analysis_closed_from_evidence
    {P : DiffusiveConvectivePDEPackage} (B : BoundaryLayerAnalysisPackage P)
    (Ev : BoundaryLayerAnalysisEvidence B) : BoundaryLayerAnalysisClosed B :=
  And.intro Ev.similaritySolutionValidClosed Ev.boundaryLayerEquationsClosedClosed

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse