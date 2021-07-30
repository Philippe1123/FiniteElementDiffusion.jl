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
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_1_198.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_1_198.txt"))
Nodes1=Nodes[:,2:3]

figure()
gridPlot2D.plotElements(Elements,Nodes1,"Triag")
gridPlot2D.plotNodes(Nodes1)

ElemType="TwoD_Triag_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver2D.main(Nodes1,Elements,MaterialParam,solverparam)

####################################################################################3
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_2_198.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_2_198.txt"))
Nodes2=Nodes[:,2:3]


figure()
gridPlot2D.plotElements(Elements,Nodes2,"Triag")
gridPlot2D.plotNodes(Nodes2)

ElemType="TwoD_Triag_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)

####################################################################################3
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_3_198.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_3_198.txt"))
Nodes3=Nodes[:,2:3]

figure()
gridPlot2D.plotElements(Elements,Nodes3,"Triag")
gridPlot2D.plotNodes(Nodes3)

ElemType="TwoD_Triag_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver2D.main(Nodes3,Elements,MaterialParam,solverparam)


#Order 4
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_4_198.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_4_198.txt"))
Nodes4=Nodes[:,2:3]

figure()
gridPlot2D.plotElements(Elements,Nodes4,"Triag")
gridPlot2D.plotNodes(Nodes4)

ElemType="TwoD_Triag_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4=solver2D.main(Nodes4,Elements,MaterialParam,solverparam)


println(minimum(u1))
println(minimum(u2))
println(minimum(u3))
println(minimum(u4))

println(@__DIR__())

out1=open(string(@__DIR__(),"/out/2D/Unstructured/Triag/1.txt"),"w")
 writedlm(out1,[Nodes1 u1])
 close(out1)

 out2=open(string(@__DIR__(),"/out/2D/Unstructured/Triag/2.txt"),"w")
  writedlm(out2,[Nodes2 u2])
  close(out2)

  out3=open(string(@__DIR__(),"/out/2D/Unstructured/Triag/3.txt"),"w")
   writedlm(out3,[Nodes3 u3])
   close(out3)

   out4=open(string(@__DIR__(),"/out/2D/Unstructured/Triag/4.txt"),"w")
    writedlm(out4,[Nodes4 u4])
    close(out4)
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

figure()
surf(Nodes1[:,1],Nodes1[:,2],u1)
figure()
surf(Nodes2[:,1],Nodes2[:,2],u2)
figure()
surf(Nodes3[:,1],Nodes3[:,2],u3)
figure()
surf(Nodes4[:,1],Nodes4[:,2],u4)



#println("Not operational yet")

#println(u)



end

end
