module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles
using QuadGK
using LinearAlgebra



export locationOfMesh,readin,DelimitedFiles,QuadGK,SparseArrays

export solver1D,solver2D

export diffusion1D_Example,diffusion2D_Example_Structured_Quad,diffusion2D_Example_UnStructured_Quad,diffusion2D_Example_UnStructured_Triag

export diffusion2D_Stochastic_test_Structured_Quad,diffusion2D_Stochastic_test_UnStructured_Triag

export OneD_Order1,OneD_Order2,OneD_Order3,OneD_Order4,OneD_Order5

export Hierarchical_OneD_Order2,Hierarchical_OneD_Order3

export TwoD_Quad_Order1,TwoD_Quad_Order2,TwoD_Quad_Order3

export TwoD_Quad_Numerical_Coeffs_Order2

export TwoD_Triag_Order1,TwoD_Triag_Order2,TwoD_Triag_Order3,TwoD_Triag_Order4

export gridPlot2D,gridPlot1D

export plotNodes,plotElements

export cubature_triangle

export diffusion1D_Convergence
export diffusion1D_Convergence_v2
export diffusion1D_Convergence_v3
export diffusion1D_Convergence_v4
export diffusion1D_Convergence_p

export diffusion2D_convergence_Quad
#export cubature_points, getCubaturePoints


include("../Example/Deterministic/diffusion1D_Example.jl")
include("../Example/Deterministic/diffusion2D_Example_Structured_Quad.jl")
include("../Example/Deterministic/diffusion2D_Example_UnStructured_Quad.jl")
include("../Example/Deterministic/diffusion2D_Example_UnStructured_Triag.jl")
include("../Example/Deterministic/diffusion1D_Convergence.jl")
include("../Example/Deterministic/diffusion1D_Convergence_v2.jl")
include("../Example/Deterministic/diffusion1D_Convergence_v3.jl")
include("../Example/Deterministic/diffusion1D_Convergence_v4.jl")
include("../Example/Deterministic/diffusion1D_Convergence_p.jl")

include("../Example/Deterministic/diffusion2D_convergence_Quad.jl")


include("../Example/Stochastic/h-MLMC/diffusion2D_Stochastic_test_Structured_Quad.jl")
include("../Example/Stochastic/h-MLMC/diffusion2D_Stochastic_test_UnStructured_Triag.jl")


include("solver1D.jl")
include("solver2D.jl")

include("OneD_Order1.jl")
include("OneD_Order2.jl")
include("Hierarchical_OneD_Order2.jl")
include("Hierarchical_OneD_Order3.jl")

include("OneD_Order3.jl")
include("OneD_Order4.jl")
include("OneD_Order5.jl")



include("TwoD_Quad_Order1.jl")
include("TwoD_Quad_Order2.jl")
include("TwoD_Quad_Numerical_Coeffs_Order2.jl")
include("TwoD_Quad_Order3.jl")

include("TwoD_Triag_Order1.jl")
include("TwoD_Triag_Order2.jl")
include("TwoD_Triag_Order3.jl")
include("TwoD_Triag_Order4.jl")



include("gridPlot1D.jl")
include("gridPlot2D.jl")

include("cubature_triangle.jl")
#include("cubature_points.jl")


include("../Mesh/readin.jl")


end # module
