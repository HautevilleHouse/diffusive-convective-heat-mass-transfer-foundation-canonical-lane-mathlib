import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

structure FourierFickLaw where
  medium : Type u
  temperatureGradient : medium → ℝ × ℝ × ℝ
  concentrationGradient : medium → ℝ × ℝ × ℝ
  heatFlux : medium → ℝ × ℝ × ℝ
  massFlux : medium → ℝ × ℝ × ℝ
  thermalConductivityTensor : medium → ℝ × ℝ × ℝ
  diffusivityTensor : medium → ℝ × ℝ × ℝ
  fourierLaw : Prop
  fickLaw : Prop
  constitutionValid : Prop
  fourierLawClosed : fourierLaw
  fickLawClosed : fickLaw
  constitutionValidClosed : constitutionValid

structure FourierFickEvidence (F : FourierFickLaw) where
  fourierLawClosed : F.fourierLaw
  fickLawClosed : F.fickLaw
  constitutionValidClosed : F.constitutionValid

def FourierFickClosed (F : FourierFickLaw) : Prop :=
  F.fourierLaw ∧ F.fickLaw ∧ F.constitutionValid

theorem fourier_fick_closed_from_evidence (F : FourierFickLaw) (E : FourierFickEvidence F) : FourierFickClosed F :=
  And.intro E.fourierLawClosed (And.intro E.fickLawClosed E.constitutionValidClosed)

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse