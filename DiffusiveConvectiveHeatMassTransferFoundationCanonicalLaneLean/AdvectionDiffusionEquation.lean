import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure AdvectionDiffusionEquation where
  domain : Type u
  scalarField : domain → ℝ
  velocityField : domain → ℝ × ℝ × ℝ
  diffusionCoefficient : domain → ℝ
  sourceTerm : domain → ℝ
  advectionTerm : Prop
  diffusionTerm : Prop
  pdeFormulation : Prop
  advectionTermClosed : advectionTerm
  diffusionTermClosed : diffusionTerm
  pdeFormulationClosed : pdeFormulation

structure AdvectionDiffusionEvidence (A : AdvectionDiffusionEquation) where
  advectionTermClosed : A.advectionTerm
  diffusionTermClosed : A.diffusionTerm
  pdeFormulationClosed : A.pdeFormulation

def AdvectionDiffusionClosed (A : AdvectionDiffusionEquation) : Prop :=
  A.advectionTerm ∧ A.diffusionTerm ∧ A.pdeFormulation

theorem advection_diffusion_closed_from_evidence (A : AdvectionDiffusionEquation) (E : AdvectionDiffusionEvidence A) : AdvectionDiffusionClosed A :=
  And.intro E.advectionTermClosed (And.intro E.diffusionTermClosed E.pdeFormulationClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse