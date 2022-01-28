module diffusion1D_Convergence_v4

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using Interpolations
using Revise
using LinearAlgebra
using Dierckx

function test()
    println("test")
end

function Main()
println(@__DIR__)


nm(x,y,z)=sqrt(abs((sum(x.^2. .+ y.^2. - 2. .* x .* y))))

MaterialParam=Dict()
DiffusionCoefficient=1.0
QuadPoints=3

#####################################################################33"""
QuadPoints=3

#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_2.txt"))
Nodes1_2=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_2=solver1D.main(Nodes1_2,Elements,MaterialParam,solverparam)
#u1_2=Spline1D(Nodes1_2, vcat(vcat(0,u1_2),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_4.txt"))
Nodes1_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_4=solver1D.main(Nodes1_4,Elements,MaterialParam,solverparam)
u1_4=Spline1D(Nodes1_4,  vcat(vcat(0,u1_4),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_8.txt"))
Nodes1_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_8=solver1D.main(Nodes1_8,Elements,MaterialParam,solverparam)
u1_8=Spline1D(Nodes1_8, vcat(vcat(0,u1_8),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_16.txt"))
Nodes1_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_16=solver1D.main(Nodes1_16,Elements,MaterialParam,solverparam)
u1_16=Spline1D(Nodes1_16, vcat(vcat(0,u1_16),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_32.txt"))
Nodes1_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_32=solver1D.main(Nodes1_32,Elements,MaterialParam,solverparam)
u1_32=Spline1D(Nodes1_32, vcat(vcat(0,u1_32),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_64.txt"))
Nodes1_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_64=solver1D.main(Nodes1_64,Elements,MaterialParam,solverparam)
u1_64=Spline1D(Nodes1_64, vcat(vcat(0,u1_64),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_2048.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_2048.txt"))
Nodes1_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_2048=solver1D.main(Nodes1_2048,Elements,MaterialParam,solverparam)

QuadPoints=2
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_2.txt"))
Nodes2_2=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_2=solver1D.main(Nodes2_2,Elements,MaterialParam,solverparam)
u2_2=Spline1D(Nodes2_2, vcat(vcat(0,u2_2),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_4.txt"))
Nodes2_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_4=solver1D.main(Nodes2_4,Elements,MaterialParam,solverparam)
u2_4=Spline1D(Nodes2_4,vcat(vcat(0,u2_4),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_8.txt"))
Nodes2_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_8=solver1D.main(Nodes2_8,Elements,MaterialParam,solverparam)
u2_8=Spline1D(Nodes2_8, vcat(vcat(0,u2_8),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_16.txt"))
Nodes2_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_16=solver1D.main(Nodes2_16,Elements,MaterialParam,solverparam)
u2_16=Spline1D(Nodes2_16, vcat(vcat(0,u2_16),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_32.txt"))
Nodes2_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_32=solver1D.main(Nodes2_32,Elements,MaterialParam,solverparam)
u2_32=Spline1D(Nodes2_32, vcat(vcat(0,u2_32),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_64.txt"))
Nodes2_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_64=solver1D.main(Nodes2_64,Elements,MaterialParam,solverparam)
u2_64=Spline1D(Nodes2_64, vcat(vcat(0,u2_64),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_2048.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_2048.txt"))
Nodes2_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_2048=solver1D.main(Nodes2_2048,Elements,MaterialParam,solverparam)
u2_2048=Spline1D(Nodes2_2048, vcat(vcat(0,u2_2048),0); k=3)



QuadPoints=4
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_2.txt"))
Nodes3_2=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_2=solver1D.main(Nodes3_2,Elements,MaterialParam,solverparam)
u3_2=Spline1D(Nodes3_2, vcat(vcat(0,u3_2),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_4.txt"))
Nodes3_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_4=solver1D.main(Nodes3_4,Elements,MaterialParam,solverparam)
u3_4=Spline1D(Nodes3_4,vcat(vcat(0,u3_4),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_8.txt"))
Nodes3_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_8=solver1D.main(Nodes3_8,Elements,MaterialParam,solverparam)
u3_8=Spline1D(Nodes3_8,vcat(vcat(0,u3_8),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_16.txt"))
Nodes3_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_16=solver1D.main(Nodes3_16,Elements,MaterialParam,solverparam)
u3_16=Spline1D(Nodes3_16, vcat(vcat(0,u3_16),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_32.txt"))
Nodes3_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_32=solver1D.main(Nodes3_32,Elements,MaterialParam,solverparam)
u3_32=Spline1D(Nodes3_32, vcat(vcat(0,u3_32),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_64.txt"))
Nodes3_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_64=solver1D.main(Nodes3_64,Elements,MaterialParam,solverparam)
u3_64=Spline1D(Nodes3_64, vcat(vcat(0,u3_64),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_2048.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_2048.txt"))
Nodes3_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_2048=solver1D.main(Nodes3_2048,Elements,MaterialParam,solverparam)


QuadPoints=5
#Order 4
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_2.txt"))
Nodes4_2=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_2=solver1D.main(Nodes4_2,Elements,MaterialParam,solverparam)
u4_2=Spline1D(Nodes4_2, vcat(vcat(0,u4_2),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_4.txt"))
Nodes4_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_4=solver1D.main(Nodes4_4,Elements,MaterialParam,solverparam)
u4_4=Spline1D(Nodes4_4, vcat(vcat(0,u4_4),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_8.txt"))
Nodes4_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_8=solver1D.main(Nodes4_8,Elements,MaterialParam,solverparam)
u4_8=Spline1D(Nodes4_8, vcat(vcat(0,u4_8),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_16.txt"))
Nodes4_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_16=solver1D.main(Nodes4_16,Elements,MaterialParam,solverparam)
u4_16=Spline1D(Nodes4_16, vcat(vcat(0,u4_16),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_32.txt"))
Nodes4_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_32=solver1D.main(Nodes4_32,Elements,MaterialParam,solverparam)
u4_32=Spline1D(Nodes4_32, vcat(vcat(0,u4_32),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_64.txt"))
Nodes4_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_64=solver1D.main(Nodes4_64,Elements,MaterialParam,solverparam)
u4_64=Spline1D(Nodes4_64, vcat(vcat(0,u4_64),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_2048.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_2048.txt"))
Nodes4_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_2048=solver1D.main(Nodes4_2048,Elements,MaterialParam,solverparam)


QuadPoints=6
#order 5
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_2.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_2.txt"))
Nodes5_2=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_2=solver1D.main(Nodes5_2,Elements,MaterialParam,solverparam)
u5_2=Spline1D(Nodes5_2,vcat(vcat(0,u5_2),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_4.txt"))
Nodes5_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_4=solver1D.main(Nodes5_4,Elements,MaterialParam,solverparam)
u5_4=Spline1D(Nodes5_4, vcat(vcat(0,u5_4),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_8.txt"))
Nodes5_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_8=solver1D.main(Nodes5_8,Elements,MaterialParam,solverparam)
u5_8=Spline1D(Nodes5_8, vcat(vcat(0,u5_8),0); k=3)



Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_16.txt"))
Nodes5_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_16=solver1D.main(Nodes5_16,Elements,MaterialParam,solverparam)
u5_16=Spline1D(Nodes5_16, vcat(vcat(0,u5_16),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_32.txt"))
Nodes5_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_32=solver1D.main(Nodes5_32,Elements,MaterialParam,solverparam)
u5_32=Spline1D(Nodes5_32, vcat(vcat(0,u5_32),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_64.txt"))
Nodes5_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_64=solver1D.main(Nodes5_64,Elements,MaterialParam,solverparam)
u5_64=Spline1D(Nodes5_64, vcat(vcat(0,u5_64),0); k=3)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_6250.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_6250.txt"))
Nodes5_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_2048=solver1D.main(Nodes5_2048,Elements,MaterialParam,solverparam)

#f(x) = x.^2 ./2 .- x./2
x=0:0.004:1
sol5=evaluate(Spline1D(x, x.^2 ./2 .- x./2; k=3),Nodes5_64)
sol4=evaluate(Spline1D(x, x.^2 ./2 .- x./2; k=3),Nodes5_64)
sol3=evaluate(Spline1D(x, x.^2 ./2 .- x./2; k=3),Nodes5_64)
sol2=evaluate(Spline1D(x, x.^2 ./2 .- x./2; k=3),Nodes5_64)
sol1=evaluate(Spline1D(x, x.^2 ./2 .- x./2; k=3),Nodes5_64)


u5_64=evaluate(u5_64,Nodes5_64)
u5_32=evaluate(u5_32,Nodes5_64)
u5_16=evaluate(u5_16,Nodes5_64)
u5_8=evaluate(u5_8,Nodes5_64)
u5_4=evaluate(u5_4,Nodes5_64)
u5_2=evaluate(u5_2,Nodes5_64)

u4_64=evaluate(u4_64,Nodes5_64)
u4_32=evaluate(u4_32,Nodes5_64)
u4_16=evaluate(u4_16,Nodes5_64)
u4_8=evaluate(u4_8,Nodes5_64)
u4_4=evaluate(u4_4,Nodes5_64)
u4_2=evaluate(u4_2,Nodes5_64)

u3_64=evaluate(u3_64,Nodes5_64)
u3_32=evaluate(u3_32,Nodes5_64)
u3_16=evaluate(u3_16,Nodes5_64)
u3_8=evaluate(u3_8,Nodes5_64)
u3_4=evaluate(u3_4,Nodes5_64)
u3_2=evaluate(u3_2,Nodes5_64)

#u2_2048=evaluate(u2_2048,Nodes5_64)
u2_64=evaluate(u2_64,Nodes5_64)
u2_32=evaluate(u2_32,Nodes5_64)
u2_16=evaluate(u2_16,Nodes5_64)
u2_8=evaluate(u2_8,Nodes5_64)
u2_4=evaluate(u2_4,Nodes5_64)
u2_2=evaluate(u2_2,Nodes5_64)

u1_64=evaluate(u1_64,Nodes5_64)
u1_32=evaluate(u1_32,Nodes5_64)
u1_16=evaluate(u1_16,Nodes5_64)
u1_8=evaluate(u1_8,Nodes5_64)
u1_4=evaluate(u1_4,Nodes5_64)
#u1_2=evaluate(u1_2,collect(x))

println(length(u1_64))
println(length(u3_64))
println(length(u2_16))


figure()
plot(Nodes5_64,u5_64)
plot(Nodes5_64,u4_64)
"""
plot(collect(x),u3_64)
plot(collect(x),u2_64)
plot(collect(x),u1_64)
"""
plot(Nodes5_64,sol5)
plot(Nodes5_64,sol4)

legend(("5","4","e"))

figure()

x=[2,4,8,16,32,64]

sol_4=[norm(u4_2 .- sol4,2),norm(u4_4 .- sol4,2),norm(u4_8 .- sol4,2),norm(u4_16 .- sol4,2),norm(u4_32 .-sol4,2),norm(u4_64 .- sol4,2)]#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog(x,sol_4,"-*")

sol_1=[norm(u1_4 .- sol1,2),norm(u1_8 .-sol1,2),norm(u1_16 .- sol1,2),norm(u1_32 .- sol1,2),norm(u1_64 .- sol1,2)]
loglog([4,8,16,32,64],sol_1,"-*")

sol_2=[norm(u2_2 .- sol2,2),norm(u2_4 .- sol2,2),norm(u2_8 .- sol2,2),norm(u2_16 .- sol2,2),norm(u2_32 .- sol2,2),norm(u2_64 .- sol2,2)]#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog([2,4,8,16,32,64],sol_2,"-*")

sol_3=[norm(u3_2 .- sol3,2),norm(u3_4 .- sol3,2),norm(u3_8 .- sol3,2),norm(u3_16 .- sol3,2),norm(u3_32 .- sol3,2),norm(u3_64 .- sol3,2)]#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog(x,sol_3,"-*")

sol_5=[norm(u5_2 .- sol5,2),norm(u5_4 .- sol5,2),norm(u5_8 .- sol5,2),norm(u5_16 .- sol5,2),norm(u5_32 .- sol5,2),norm(u5_64 .- sol5,2)]#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog(x,sol_5,"-*")

legend(("Order4","Order1","Order2","Order3","Order5"))

loglog([10^2,10^3],[10^-5 ,10^-7])
loglog([10^2,10^3],[10^-5 ,10^-6])
loglog([10^2,10^3],[10^-5 ,10^-8])
loglog([10^2,10^3],[10^-5 ,10^-9])
loglog([10^2,10^3],[10^-5 ,10^-10])
loglog([10^2,10^3],[10^-5 ,10^-11])







end

end
