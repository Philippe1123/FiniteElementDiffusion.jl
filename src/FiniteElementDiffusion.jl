module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles
using QuadGK


export diffusion,solver1D,OneD_Order1,locationOfMesh,readin,DelimitedFiles,QuadGK,SparseArrays,OneD_Order2

include("../Example/diffusion.jl")
include("solver1D.jl")
include("OneD_Order1.jl")
include("OneD_Order2.jl")

include("../Mesh/readin.jl")


end # module
