module diffusion1D_Convergence_p

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using Interpolations
using Revise
using LinearAlgebra

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_4.txt"))
Nodes1_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_4=solver1D.main(Nodes1_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_8.txt"))
Nodes1_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_8=solver1D.main(Nodes1_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_16.txt"))
Nodes1_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_16=solver1D.main(Nodes1_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_32.txt"))
Nodes1_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_32=solver1D.main(Nodes1_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_64.txt"))
Nodes1_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_64=solver1D.main(Nodes1_64,Elements,MaterialParam,solverparam)

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_4.txt"))
Nodes2_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_4=solver1D.main(Nodes2_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_8.txt"))
Nodes2_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_8=solver1D.main(Nodes2_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_16.txt"))
Nodes2_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_16=solver1D.main(Nodes2_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_32.txt"))
Nodes2_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_32=solver1D.main(Nodes2_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_64.txt"))
Nodes2_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_64=solver1D.main(Nodes2_64,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_128.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_128.txt"))
Nodes2_128=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_128=solver1D.main(Nodes2_128,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_256.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_256.txt"))
Nodes2_256=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_256=solver1D.main(Nodes2_256,Elements,MaterialParam,solverparam)

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_4.txt"))
Nodes3_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_4=solver1D.main(Nodes3_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_8.txt"))
Nodes3_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_8=solver1D.main(Nodes3_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_16.txt"))
Nodes3_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_16=solver1D.main(Nodes3_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_32.txt"))
Nodes3_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_32=solver1D.main(Nodes3_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_64.txt"))
Nodes3_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_64=solver1D.main(Nodes3_64,Elements,MaterialParam,solverparam)

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_4.txt"))
Nodes4_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_4=solver1D.main(Nodes4_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_8.txt"))
Nodes4_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_8=solver1D.main(Nodes4_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_16.txt"))
Nodes4_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_16=solver1D.main(Nodes4_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_32.txt"))
Nodes4_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_32=solver1D.main(Nodes4_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_64.txt"))
Nodes4_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_64=solver1D.main(Nodes4_64,Elements,MaterialParam,solverparam)

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_4.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_4.txt"))
Nodes5_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_4=solver1D.main(Nodes5_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_8.txt"))
Nodes5_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_8=solver1D.main(Nodes5_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_16.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_16.txt"))
Nodes5_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_16=solver1D.main(Nodes5_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_32.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_32.txt"))
Nodes5_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_32=solver1D.main(Nodes5_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_64.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_64.txt"))
Nodes5_64=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_64=solver1D.main(Nodes5_64,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_6250.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_6250.txt"))
Nodes5_2048=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_2048=solver1D.main(Nodes5_2048,Elements,MaterialParam,solverparam)

f(x) = -1/(11*pi)^2 * sin.(11*pi*x)
#f(x) = x.^2 ./2 .- x./2



"""
sol_1=[norm(u1_2 .- f(Nodes1_2)[2:end-1],2),norm(u2_2[2:2:end-1] .- f(Nodes2_2)[3:2:end-2],2),norm(u3_2[3:3:end-2] .- f(Nodes3_2)[4:3:end-3],2),norm(u4_2[4:4:end-3] .- f(Nodes4_2)[5:4:end-4],2),norm(u5_2[5:5:end-4] .- f(Nodes5_2)[6:5:end-5],2)]
loglog([length(Nodes1_2),length(Nodes2_2),length(Nodes3_2),length(Nodes4_2),length(Nodes5_2)],sol_1,"-*")


sol_2=[norm(u1_4 .- f(Nodes1_4)[2:end-1],2),norm(u2_4[2:2:end-1] .- f(Nodes2_4)[3:2:end-2],2),norm(u3_4[3:3:end-2] .- f(Nodes3_4)[4:3:end-3],2),norm(u4_4[4:4:end-3] .- f(Nodes4_4)[5:4:end-4],2),norm(u5_4[5:5:end-4] .- f(Nodes5_4)[6:5:end-5],2)]
loglog([length(Nodes1_4),length(Nodes2_4),length(Nodes3_4),length(Nodes4_4),length(Nodes5_4)],sol_2,"-*")

sol_3=[norm(u1_8 .- f(Nodes1_8)[2:end-1],2),norm(u2_8[2:2:end-1] .- f(Nodes2_8)[3:2:end-2],2),norm(u3_8[3:3:end-2] .- f(Nodes3_8)[4:3:end-3],2),norm(u4_8[4:4:end-3] .- f(Nodes4_8)[5:4:end-4],2),norm(u5_8[5:5:end-4] .- f(Nodes5_8)[6:5:end-5],2)]
loglog([length(Nodes1_8),length(Nodes2_8),length(Nodes3_8),length(Nodes4_8),length(Nodes5_8)],sol_3,"-*")
"""
sol_4=[norm(u1_16 .- f(Nodes1_16)[2:end-1],2),norm(u2_16[2:2:end-1] .- f(Nodes2_16)[3:2:end-2],2),norm(u3_16[3:3:end-2] .- f(Nodes3_16)[4:3:end-3],2),norm(u4_16[4:4:end-3] .- f(Nodes4_16)[5:4:end-4],2),norm(u5_16[5:5:end-4] .- f(Nodes5_16)[6:5:end-5],2)]
loglog([length(Nodes1_16),length(Nodes2_16),length(Nodes3_16),length(Nodes4_16),length(Nodes5_16)],sol_4,"-*")

sol_5=[norm(u1_32 .- f(Nodes1_32)[2:end-1],2),norm(u2_32[2:2:end-1] .- f(Nodes2_32)[3:2:end-2],2),norm(u3_32[3:3:end-2] .- f(Nodes3_32)[4:3:end-3],2),norm(u4_32[4:4:end-3] .- f(Nodes4_32)[5:4:end-4],2),norm(u5_32[5:5:end-4] .- f(Nodes5_32)[6:5:end-5],2)]
loglog([length(Nodes1_32),length(Nodes2_32),length(Nodes3_32),length(Nodes4_32),length(Nodes5_32)],sol_5,"-*")

sol_6=[norm(u1_64 .- f(Nodes1_64)[2:end-1],2),norm(u2_64[2:2:end-1] .- f(Nodes2_64)[3:2:end-2],2),norm(u3_64[3:3:end-2] .- f(Nodes3_64)[4:3:end-3],2),norm(u4_64[4:4:end-3] .- f(Nodes4_64)[5:4:end-4],2),norm(u5_64[5:5:end-4] .- f(Nodes5_64)[6:5:end-5],2)]
loglog([length(Nodes1_64),length(Nodes2_64),length(Nodes3_64),length(Nodes4_64),length(Nodes5_64)],sol_6,"-*")

legend(("16 elements","32 elements","64 elements"))
grid(which = "both", ls = "-")
xlabel("Number of DOF's")
ylabel("L2 norm of the error")

end

end
