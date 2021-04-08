module diffusion

using DelimitedFiles
using FiniteElementDiffusion

function test()
    println("test")
end

function Main()
println(@__DIR__)
Elements=Int64.(readdlm(joinpath(locationOfMesh,"Elements_1D.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"Nodes_1D.txt"))
Nodes=Nodes[:,2:3]
NumberOfElements=size(Elements,1)
MaterialParam=Dict()
DiffusionCoefficient=10
ElemType="OneD1"

for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end



solver1D.main(Nodes,Elements,MaterialParam)


end

end
