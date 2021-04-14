module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles
using QuadGK


export diffusion1D_Example,solver1D,OneD_Order1,locationOfMesh,readin,DelimitedFiles,QuadGK,SparseArrays,OneD_Order2,OneD_Order3

include("../Example/diffusion1D_Example.jl")
include("solver1D.jl")
include("OneD_Order1.jl")
include("OneD_Order2.jl")
include("OneD_Order3.jl")

include("../Mesh/readin.jl")


end # module
