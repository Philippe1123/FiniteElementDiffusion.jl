module diffusion1D_Example

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
QuadPoints=6

#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1.txt"))
Nodes1=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver1D.main(Nodes1,Elements,MaterialParam,solverparam)


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2.txt"))
Nodes2=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver1D.main(Nodes2,Elements,MaterialParam,solverparam)


#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3.txt"))
Nodes3=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver1D.main(Nodes3,Elements,MaterialParam,solverparam)





#println(u)
figure()
plot(Nodes1[2:end-1],u1,"-*")
plot(Nodes2[2:end-1],u2,"-*")
plot(Nodes3[2:end-1],u3,"-*")
legend(("Order1","Order2","Order3"))


end

end
