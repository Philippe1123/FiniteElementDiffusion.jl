module FiniteElementDiffusion

using SparseArrays
using DelimitedFiles


export diffusion,solver1D,OneD_Order1

include("../Example/diffusion.jl")
include("solver1D.jl")
include("OneD_Order1.jl")


end # module
