module diffusion2D_convergence_Quad

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using Revise
using ScatteredInterpolation

function test()
    println("test")
end

function Main()
println(@__DIR__)



MaterialParam=Dict()
DiffusionCoefficient=1.0
QuadPoints=5
println("-----------order1-----")
#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_4.txt"))
Nodes1_2=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_2=solver2D.main(Nodes1_2,Elements,MaterialParam,solverparam)
itp1_2 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_2, u1_2);
println(minimum(u1_2))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_16.txt"))
Nodes1_4=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_4=solver2D.main(Nodes1_4,Elements,MaterialParam,solverparam)
itp1_4 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_4, u1_4);
println(minimum(u1_4))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_64.txt"))
Nodes1_8=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_8=solver2D.main(Nodes1_8,Elements,MaterialParam,solverparam)
itp1_8 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_8, u1_8);
println(minimum(u1_8))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_256.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_256.txt"))
Nodes1_16=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_16=solver2D.main(Nodes1_16,Elements,MaterialParam,solverparam)
itp1_16 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_16, u1_16);
println(minimum(u1_16))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_1024.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_1024.txt"))
Nodes1_32=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_32=solver2D.main(Nodes1_32,Elements,MaterialParam,solverparam)
itp1_32 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_32, u1_32);
println(minimum(u1_32))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_1_4096.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_1_4096.txt"))
Nodes1_64=Nodes[:,2:3]
ElemType="TwoD_Quad_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_64=solver2D.main(Nodes1_64,Elements,MaterialParam,solverparam)
itp1_64 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes1_64, u1_64);
println(minimum(u1_64))
println("---- order 2---")
####################################################################################3##################3
#Order 2


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_4.txt"))
Nodes2_2=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_2=solver2D.main(Nodes2_2,Elements,MaterialParam,solverparam)
itp2_2 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_2, u2_2);
println(minimum(u2_2))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_16.txt"))
Nodes2_4=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_4=solver2D.main(Nodes2_4,Elements,MaterialParam,solverparam)
itp2_4 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_4, u2_4);
println(minimum(u2_4))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_64.txt"))
Nodes2_8=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_8=solver2D.main(Nodes2_8,Elements,MaterialParam,solverparam)
itp2_8 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_8, u2_8);
println(minimum(u2_8))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_256.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_256.txt"))
Nodes2_16=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_16=solver2D.main(Nodes2_16,Elements,MaterialParam,solverparam)
itp2_16 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_16, u2_16);
println(minimum(u2_16))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_1024.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_1024.txt"))
Nodes2_32=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_32=solver2D.main(Nodes2_32,Elements,MaterialParam,solverparam)
itp2_32 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_32, u2_32);
println(minimum(u2_32))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_2_4096.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_2_4096.txt"))
Nodes2_64=Nodes[:,2:3]
ElemType="TwoD_Quad_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_64=solver2D.main(Nodes2_64,Elements,MaterialParam,solverparam)
itp2_64 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes2_64, u2_64);
println(minimum(u2_64))

println("---------order3-------")
####################################################################################3
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_4.txt"))
Nodes3_2=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_2=solver2D.main(Nodes3_2,Elements,MaterialParam,solverparam)
itp3_2 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_2, u3_2);
println(minimum(u3_2))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_16.txt"))
Nodes3_4=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_4=solver2D.main(Nodes3_4,Elements,MaterialParam,solverparam)
itp3_4 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_4, u3_4);
println(minimum(u3_4))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_64.txt"))
Nodes3_8=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_8=solver2D.main(Nodes3_8,Elements,MaterialParam,solverparam)
itp3_8 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_8, u3_8);
println(minimum(u3_8))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_256.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_256.txt"))
Nodes3_16=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_16=solver2D.main(Nodes3_16,Elements,MaterialParam,solverparam)
itp3_16 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_16, u3_16);
println(minimum(u3_16))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_1024.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_1024.txt"))
Nodes3_32=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_32=solver2D.main(Nodes3_32,Elements,MaterialParam,solverparam)
itp3_32 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_32, u3_32);
println(minimum(u3_32))


Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Elements_3_4096.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Structured/Quad/Nodes_3_4096.txt"))
Nodes3_64=Nodes[:,2:3]
ElemType="TwoD_Quad_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_64=solver2D.main(Nodes3_64,Elements,MaterialParam,solverparam)
itp3_64 = ScatteredInterpolation.interpolate(NearestNeighbor(), Nodes3_64, u3_64);
println(minimum(u3_64))

println("-----------------------------")

println(minimum(u1_64))
println(minimum(u2_64))
println(minimum(u3_64))


figure()
surf(Nodes3[:,1],Nodes3[:,2],u3)


#println(u)



end

end
