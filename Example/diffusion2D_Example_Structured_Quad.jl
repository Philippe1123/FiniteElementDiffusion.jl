module diffusion2D_Example_Structured_Quad

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
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_16.txt"))
Nodes1=Nodes[:,2:3]

figure()
gridPlot2D.plotElements(Elements,Nodes1,"Quad")
gridPlot2D.plotNodes(Nodes1)

ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)

####################################################################################3
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_16.txt"))
Nodes2=Nodes[:,2:3]


figure()
gridPlot2D.plotElements(Elements,Nodes2,"Quad")
gridPlot2D.plotNodes(Nodes2)

ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)


ElemType="TwoD_Quad_Numerical_Coeffs_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_bis=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)



####################################################################################3
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_16.txt"))
Nodes3=Nodes[:,2:3]

figure()
gridPlot2D.plotElements(Elements,Nodes3,"Quad")
gridPlot2D.plotNodes(Nodes3)

ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver2D.main(Nodes3,Elements,MaterialParam,solverparam)

println(maximum(u1))
println(maximum(u2))
println(maximum(u2_bis))

println(maximum(u3))




#println(u)



end

end
