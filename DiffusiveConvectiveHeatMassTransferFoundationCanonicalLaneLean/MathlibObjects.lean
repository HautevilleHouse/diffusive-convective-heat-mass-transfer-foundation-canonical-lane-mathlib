import DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure HeatMassSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure HeatMassAdmittedObject where
  space : HeatMassSpace
  boundedDomain : Prop
  initialBoundaryConditionsSet : Prop
  solutionSpace : Type
  solutionTopology : TopologicalSpace solutionSpace
  uniqueSolutionExists : Prop
  conclusion : uniqueSolutionExists

structure HeatMassEndgameState where
  object : HeatMassAdmittedObject

def HeatMassWitnessClosed (O : HeatMassAdmittedObject) : Prop :=
  O.uniqueSolutionExists

end DiffusiveConvectiveHeatMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
