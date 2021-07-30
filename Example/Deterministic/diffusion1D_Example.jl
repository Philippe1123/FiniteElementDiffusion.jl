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
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_5.txt"))
Nodes1=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver1D.main(Nodes1,Elements,MaterialParam,solverparam)


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_5.txt"))
Nodes2=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver1D.main(Nodes2,Elements,MaterialParam,solverparam)


#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_5.txt"))
Nodes3=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver1D.main(Nodes3,Elements,MaterialParam,solverparam)

#Order 4
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_5.txt"))
Nodes4=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4=solver1D.main(Nodes4,Elements,MaterialParam,solverparam)


####################### Hierarchical


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_5.txt"))
Nodes2H=Nodes[:,2]#only retain x component
ElemType="Hierarchical_OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2H=solver1D.main(Nodes2H,Elements,MaterialParam,solverparam)


#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_5.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_5.txt"))
Nodes3H=Nodes[:,2]#only retain x component
ElemType="Hierarchical_OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3H=solver1D.main(Nodes3H,Elements,MaterialParam,solverparam)

#println(u)
figure()
plot(Nodes1[2:end-1],u1,"-*")
plot(Nodes2[2:end-1],u2,"-*")
plot(Nodes3[2:end-1],u3,"-*")
plot(Nodes4[2:end-1],u4,"-*")
plot(Nodes2H[2:end-1],u2H,"-*")
plot(Nodes3H[2:end-1],u3H,"-*")

legend(("Order1","Order2","Order3","Order4"))
println(minimum(u1))
println(minimum(u2))
println(minimum(u3))
println(minimum(u4))
println(minimum(u2H))

println(u1)
println(u2)
println(u4)
println(u2H)
println(u3H)

end

end
