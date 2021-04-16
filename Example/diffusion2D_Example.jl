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
DiffusionCoefficient=10.0
QuadPoints=3

#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Quad/Elements_1_36.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Quad/Nodes_1_36.txt"))
Nodes1=Nodes[:,2:3]

ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Quad/Elements_2_36.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Quad/Nodes_2_36.txt"))
Nodes2=Nodes[:,2:3]

ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)



println(maximum(u1))
println(maximum(u2))




#println(u)



end

end
