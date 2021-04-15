module diffusion2D_Example

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot

function test()
    println("test")
end

function Main()
println(@__DIR__)



MaterialParam=Dict()
DiffusionCoefficient=1.0
QuadPoints=3

#Order 1
#Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Quad/Elements_1_201.txt")))
#Elements=Elements[:,5:end]
#Nodes=readdlm(joinpath(locationOfMesh,"2D/Quad/Nodes_1_201.txt"))
#Nodes1=Nodes[:,2:3]

#ElemType="TwoD_Quad_Order1"
#NumberOfElements=size(Elements,1)
#for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
#solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
#u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Quad/Elements_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Quad/Nodes_2.txt"))
Nodes1=Nodes[:,2:3]

ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)








#println(u)



end

end
