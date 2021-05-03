module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles
using QuadGK


export locationOfMesh,readin,DelimitedFiles,QuadGK,SparseArrays

export solver1D,solver2D

export diffusion1D_Example,diffusion2D_Example_Structured_Quad,diffusion2D_Example_UnStructured_Quad,diffusion2D_Example_UnStructured_Triag

export OneD_Order1,OneD_Order2,OneD_Order3,OneD_Order4

export TwoD_Quad_Order1,TwoD_Quad_Order2,TwoD_Quad_Order3

export TwoD_Quad_Numerical_Coeffs_Order2

export TwoD_Triag_Order1,TwoD_Triag_Order2,TwoD_Triag_Order3,TwoD_Triag_Order4

export gridPlot2D,gridPlot1D

export plotNodes,plotElements

export cubature_triangle
#export cubature_points, getCubaturePoints


include("../Example/diffusion1D_Example.jl")
include("../Example/diffusion2D_Example_Structured_Quad.jl")
include("../Example/diffusion2D_Example_UnStructured_Quad.jl")
include("../Example/diffusion2D_Example_UnStructured_Triag.jl")


include("solver1D.jl")
include("solver2D.jl")

include("OneD_Order1.jl")
include("OneD_Order2.jl")
include("OneD_Order3.jl")
include("OneD_Order4.jl")


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
