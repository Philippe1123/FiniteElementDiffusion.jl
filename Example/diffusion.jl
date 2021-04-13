module diffusion

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot

function test()
    println("test")
end

function Main()
println(@__DIR__)
Elements=Int64.(readdlm(joinpath(locationOfMesh,"Elements_1D_200.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"Nodes_1D_200.txt"))
Nodes=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"


Elements=Int64.(readdlm(joinpath(locationOfMesh,"Elements_1D_2_2.txt")))
Elements=Elements[:,5:end]
int=Elements[:,2]
Elements[:,2]=Elements[:,3]
Elements[:,3]=int
println(Elements)
Nodes=readdlm(joinpath(locationOfMesh,"Nodes_1D_2_2.txt"))
Nodes=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"


NumberOfElements=size(Elements,1)
MaterialParam=Dict()
DiffusionCoefficient=10

QuadPoints=6

for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end




solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u=solver1D.main(Nodes,Elements,MaterialParam,solverparam)
println(u)
figure()
plot(u)

end

end
