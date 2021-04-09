module diffusion

using DelimitedFiles
using FiniteElementDiffusion

function test()
    println("test")
end

function Main()
println(@__DIR__)
Elements=Int64.(readdlm(joinpath(locationOfMesh,"Elements_1D_1_1_elem.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"Nodes_1D_1_1_elem.txt"))
Nodes=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"


#Elements=Int64.(readdlm(joinpath(locationOfMesh,"Elements_1D_2.txt")))
#Elements=Elements[:,5:end]
#Nodes=readdlm(joinpath(locationOfMesh,"Nodes_1D_2.txt"))
#Nodes=Nodes[:,2]#only retain x component
#ElemType="OneD_Order2"


NumberOfElements=size(Elements,1)
MaterialParam=Dict()
DiffusionCoefficient=10

QuadPoints=2

for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end




solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements)
solver1D.main(Nodes,Elements,MaterialParam,solverparam)


end

end
