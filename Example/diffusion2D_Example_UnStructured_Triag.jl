module diffusion2D_Example_UnStructured_Triag

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
QuadPoints=19

#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_1_42.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_1_42.txt"))
Nodes1=Nodes[:,2:3]

#figure()
#gridPlot2D.plotElements(Elements,Nodes1,"Triag")
#gridPlot2D.plotNodes(Nodes1)

ElemType="TwoD_Triag_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)

####################################################################################3
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_2_42.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_2_42.txt"))
Nodes2=Nodes[:,2:3]


#figure()
#gridPlot2D.plotElements(Elements,Nodes2,"Triag")
#gridPlot2D.plotNodes(Nodes2)

ElemType="TwoD_Triag_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)

####################################################################################3
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_3_42.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_3_42.txt"))
Nodes3=Nodes[:,2:3]

#figure()
#gridPlot2D.plotElements(Elements,Nodes3,"Triag")
#gridPlot2D.plotNodes(Nodes3)

ElemType="TwoD_Triag_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver2D.main(Nodes3,Elements,MaterialParam,solverparam)


#Order 4
#Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_4_42.txt")))
#Elements=Elements[:,5:end]
#Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_4_42.txt"))
#Nodes4=Nodes[:,2:3]

#figure()
#gridPlot2D.plotElements(Elements,Nodes4,"Triag")
#gridPlot2D.plotNodes(Nodes4)

#ElemType="TwoD_Triag_Order4"
#NumberOfElements=size(Elements,1)
#for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
#solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
#u4=solver2D.main(Nodes4,Elements,MaterialParam,solverparam)


println(maximum(u1))
println(maximum(u2))
println(maximum(u3))
#println(maximum(u4))

#println(size(Nodes1))
#println(size(u1))

#pt1=[Nodes1 u1]
#pt2=[Nodes2 u2]
#pt3=[Nodes3 u3]
#println(pt1)
#println(pt2)
#println(pt3)

#figure()



#println("Not operational yet")

#println(u)



end

end
