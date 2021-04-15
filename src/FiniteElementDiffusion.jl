module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles
using QuadGK


export locationOfMesh,readin,DelimitedFiles,QuadGK,SparseArrays

export solver1D,solver2D

export diffusion1D_Example,diffusion2D_Example

export OneD_Order1,OneD_Order2,OneD_Order3

export TwoD_Quad_Order1,TwoD_Quad_Order2

include("../Example/diffusion1D_Example.jl")
include("../Example/diffusion2D_Example.jl")

include("solver1D.jl")
include("solver2D.jl")

include("OneD_Order1.jl")
include("OneD_Order2.jl")
include("OneD_Order3.jl")

include("TwoD_Quad_Order1.jl")
include("TwoD_Quad_Order2.jl")

include("../Mesh/readin.jl")


end # module
