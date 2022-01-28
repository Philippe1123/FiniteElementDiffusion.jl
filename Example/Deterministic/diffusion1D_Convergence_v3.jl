module diffusion1D_Convergence_v3

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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_6.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_6.txt"))
Nodes3_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_4=solver1D.main(Nodes3_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_18.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_18.txt"))
Nodes3_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_8=solver1D.main(Nodes3_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_54.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_54.txt"))
Nodes3_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_16=solver1D.main(Nodes3_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_162.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_162.txt"))
Nodes3_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_32=solver1D.main(Nodes3_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_486.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_486.txt"))
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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_8.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_8.txt"))
Nodes4_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_4=solver1D.main(Nodes4_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_24.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_24.txt"))
Nodes4_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_8=solver1D.main(Nodes4_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_96.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_96.txt"))
Nodes4_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_16=solver1D.main(Nodes4_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_384.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_384.txt"))
Nodes4_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_32=solver1D.main(Nodes4_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_1536.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_1536.txt"))
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

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_10.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_10.txt"))
Nodes5_4=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_4=solver1D.main(Nodes5_4,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_50.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_50.txt"))
Nodes5_8=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_8=solver1D.main(Nodes5_8,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_250.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_250.txt"))
Nodes5_16=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_16=solver1D.main(Nodes5_16,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_1250.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_1250.txt"))
Nodes5_32=Nodes[:,2]#only retain x component
ElemType="OneD_Order5"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u5_32=solver1D.main(Nodes5_32,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_5_6250.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_5_6250.txt"))
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
#f(x) = (x.^3 ./6 .- x./6)

println((f(Nodes1_2)[2:end-1] .-u1_2)) 
println((f(Nodes1_4)[2:end-1] .-u1_4))
println((f(Nodes1_8)[2:end-1] .-u1_8))

figure()
plot(u5_8)
plot(f(Nodes5_8)[2:end-1])
figure()
plot(u5_32)
plot(f(Nodes5_32)[2:end-1])


println(u1_8)
println(f(Nodes1_8)[2:end-1])

figure()


figure()

x=[2,4,8,16,32,64]

println((Nodes3_8)[4:3:end-3])

sol_1=[norm( f(Nodes1_2)[2:end-1].-u1_2 ,2),norm( f(Nodes1_4)[2:end-1].-u1_4,2),norm( f(Nodes1_8)[2:end-1].-u1_8 ,2),norm( f(Nodes1_16)[2:end-1].-u1_16 ,2),norm( f(Nodes1_32)[2:end-1].-u1_32 ,2),norm( f(Nodes1_64)[2:end-1].-u1_64 ,2)]
#x = [length(Nodes1_2),length(Nodes1_4),length(Nodes1_8),length(Nodes1_16),length(Nodes1_32),length(Nodes1_64)]
loglog(x,sol_1,"-*")

sol_2=[norm(u2_2[2:2:end-1] .- f(Nodes2_2)[3:2:end-2],2),norm(u2_4[2:2:end-1] .- f(Nodes2_4)[3:2:end-2],2),norm(u2_8[2:2:end-1] .- f(Nodes2_8)[3:2:end-2],2),norm(u2_16[2:2:end-1] .- f(Nodes2_16)[3:2:end-2],2),norm(u2_32[2:2:end-1] .- f(Nodes2_32)[3:2:end-2],2),norm(u2_64[2:2:end-1] .- f(Nodes2_64)[3:2:end-2],2),norm(u2_128[2:2:end-1] .- f(Nodes2_128)[3:2:end-2],2),norm(u2_256[2:2:end-1] .- f(Nodes2_256)[3:2:end-2],2)]
#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog([2,4,8,16,32,64,128,256],sol_2,"-*")

sol_3=[norm(u3_2[3:3:end-2] .- f(Nodes3_2)[4:3:end-3],2),norm(u3_4[3:3:end-2] .- f(Nodes3_4)[4:3:end-3],2),norm(u3_8[3:3:end-2] .- f(Nodes3_8)[4:3:end-3],2),norm(u3_16[3:3:end-2] .- f(Nodes3_16)[4:3:end-3],2),norm(u3_32[3:3:end-2] .- f(Nodes3_32)[4:3:end-3],2),norm(u3_64[3:3:end-2] .- f(Nodes3_64)[4:3:end-3],2)]
#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog([2,6,18,54,162,486],sol_3,"-*")
sol_4=[norm(u4_2[4:4:end-3] .- f(Nodes4_2)[5:4:end-4],2),norm(u4_4[4:4:end-3] .- f(Nodes4_4)[5:4:end-4],2),norm(u4_8[4:4:end-3] .- f(Nodes4_8)[5:4:end-4],2),norm(u4_16[4:4:end-3] .- f(Nodes4_16)[5:4:end-4],2),norm(u4_32[4:4:end-3] .- f(Nodes4_32)[5:4:end-4],2)]
#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog([2,8,24,96,384],sol_4,"-*")

sol_5=[norm(u5_2[5:5:end-4] .- f(Nodes5_2)[6:5:end-5],2),norm(u5_4[5:5:end-4] .- f(Nodes5_4)[6:5:end-5],2),norm(u5_8[5:5:end-4] .- f(Nodes5_8)[6:5:end-5],2),norm(u5_16[5:5:end-4] .- f(Nodes5_16)[6:5:end-5],2)]
#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog([2,10,50,250],sol_5,"-*")

legend(("1st Order","2nd Order","3d Order","4th Order","5th Order"))
grid(which = "both", ls = "-")
xlabel("Number of Elements")
ylabel("L2 norm of the error")

println(sol_1)
figure()

#nL2(x,y)=(1/(length(x)+1)*sum(x.^2))+(1/(length(y)+1)*sum(y.^2))-2/(length(x)+1)*sum(x.*y)<0 ? 0 : sqrt((1/(length(x)+1)*sum(x.^2))+(1/(length(y)+1)*sum(y.^2))-2/(length(x)+1)*sum(x.*y))
nL2(x,y)=sqrt((1/(length(x)+1)*sum((x.-y).^2)))


sol_1=[nL2( f(Nodes1_2)[2:end-1],u1_2 ),nL2( f(Nodes1_4)[2:end-1],u1_4),nL2( f(Nodes1_8)[2:end-1],u1_8),nL2( f(Nodes1_16)[2:end-1],u1_16 ),nL2( f(Nodes1_32)[2:end-1],u1_32),nL2( f(Nodes1_64)[2:end-1],u1_64 )]
#x = [length(Nodes1_2),length(Nodes1_4),length(Nodes1_8),length(Nodes1_16),length(Nodes1_32),length(Nodes1_64)]
loglog(x,sol_1,"-*")

sol_2=[nL2(u2_2[2:2:end-1] , f(Nodes2_2)[3:2:end-2]),nL2(u2_4[2:2:end-1] , f(Nodes2_4)[3:2:end-2]),nL2(u2_8[2:2:end-1] , f(Nodes2_8)[3:2:end-2]),nL2(u2_16[2:2:end-1] , f(Nodes2_16)[3:2:end-2]),nL2(u2_32[2:2:end-1] , f(Nodes2_32)[3:2:end-2]),nL2(u2_64[2:2:end-1] , f(Nodes2_64)[3:2:end-2]),nL2(u2_128[2:2:end-1] , f(Nodes2_128)[3:2:end-2]),nL2(u2_256[2:2:end-1] , f(Nodes2_256)[3:2:end-2])]
#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog([2,4,8,16,32,64,128,256],sol_2,"-*")

sol_3=[nL2(u3_2[3:3:end-2] , f(Nodes3_2)[4:3:end-3]),nL2(u3_4[3:3:end-2] , f(Nodes3_4)[4:3:end-3]),nL2(u3_8[3:3:end-2] , f(Nodes3_8)[4:3:end-3]),nL2(u3_16[3:3:end-2] , f(Nodes3_16)[4:3:end-3]),nL2(u3_32[3:3:end-2] , f(Nodes3_32)[4:3:end-3]),nL2(u3_64[3:3:end-2] , f(Nodes3_64)[4:3:end-3])]
#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog([2,6,18,54,162,486],sol_3,"-*")

sol_4=[nL2(u4_2[4:4:end-3] ,f(Nodes4_2)[5:4:end-4]),nL2(u4_4[4:4:end-3] , f(Nodes4_4)[5:4:end-4]),nL2(u4_8[4:4:end-3] , f(Nodes4_8)[5:4:end-4]),nL2(u4_16[4:4:end-3] , f(Nodes4_16)[5:4:end-4]),nL2(u4_32[4:4:end-3] , f(Nodes4_32)[5:4:end-4])]
#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog([2,8,24,96,384],sol_4,"-*")

sol_5=[nL2(u5_2[5:5:end-4] , f(Nodes5_2)[6:5:end-5]),nL2(u5_4[5:5:end-4] , f(Nodes5_4)[6:5:end-5]),nL2(u5_8[5:5:end-4] , f(Nodes5_8)[6:5:end-5]),nL2(u5_16[5:5:end-4] , f(Nodes5_16)[6:5:end-5])]
#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog([2,10,50,250],sol_5,"-*")

println(sol_4)

legend(("1st Order","2nd Order","3d Order","4th Order","5th Order"))
grid(which = "both", ls = "-")
xlabel("Number of Elements")
ylabel("L2 norm of the error")



"""
loglog([2,2*10],[10^-4 ,10^-6])
loglog([2,2*10],[10^-4 ,10^-7])
loglog([2,2*10],[10^-4 ,10^-8])
loglog([2,2*10],[10^-4 ,10^-9])
loglog([2,2*10],[10^-4 ,10^-10])
"""



figure()

x=[2,4,8,16,32,64]

sol_4=[norm(u4_2 .- f(Nodes4_2)[2:1:end-1],2),norm(u4_4 .- f(Nodes4_4)[2:1:end-1],2),norm(u4_8 .- f(Nodes4_8)[2:1:end-1],2),norm(u4_16 .- f(Nodes4_16)[2:1:end-1],2),norm(u4_32 .- f(Nodes4_32)[2:1:end-1],2),norm(u4_64 .- f(Nodes4_64)[2:1:end-1],2)]
#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog([2,8,24,96,384,1536],sol_4,"-*")

sol_1=[norm(u1_2 .- f(Nodes1_2)[2:1:end-1],2),norm(u1_4 .- f(Nodes1_4)[2:1:end-1],2),norm(u1_8 .- f(Nodes1_8)[2:1:end-1],2),norm(u1_16 .- f(Nodes1_16)[2:end-1],2),norm(u1_32 .- f(Nodes1_32)[2:end-1],2),norm(u1_64 .- f(Nodes1_64)[2:end-1],2)]
#x = [length(Nodes1_2),length(Nodes1_4),length(Nodes1_8),length(Nodes1_16),length(Nodes1_32),length(Nodes1_64)]
loglog(x,sol_1,"-*")

sol_2=[norm(u2_2 .- f(Nodes2_2)[2:1:end-1],2),norm(u2_4 .- f(Nodes2_4)[2:1:end-1],2),norm(u2_8 .- f(Nodes2_8)[2:1:end-1],2),norm(u2_16 .- f(Nodes2_16)[2:1:end-1],2),norm(u2_32 .- f(Nodes2_32)[2:1:end-1],2),norm(u2_64 .- f(Nodes2_64)[2:1:end-1],2),norm(u2_128 .- f(Nodes2_128)[2:1:end-1],2),norm(u2_256 .- f(Nodes2_256)[2:1:end-1],2)]
#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog([2,4,8,16,32,64,128,256],sol_2,"-*")

sol_3=[norm(u3_2 .- f(Nodes3_2)[2:1:end-1],2),norm(u3_4 .- f(Nodes3_4)[2:1:end-1],2),norm(u3_8 .- f(Nodes3_8)[2:1:end-1],2),norm(u3_16 .- f(Nodes3_16)[2:1:end-1],2),norm(u3_32 .- f(Nodes3_32)[2:1:end-1],2),norm(u3_64 .- f(Nodes3_64)[2:1:end-1],2)]
#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog([2,6,18,36,92,186],sol_3,"-*")


sol_5=[norm(u5_2 .- f(Nodes5_2)[2:1:end-1],2),norm(u5_4 .- f(Nodes5_4)[2:1:end-1],2),norm(u5_8 .- f(Nodes5_8)[2:1:end-1],2),norm(u5_16 .- f(Nodes5_16)[2:1:end-1],2),norm(u5_32 .- f(Nodes5_32)[2:1:end-1],2),norm(u5_64 .- f(Nodes5_64)[2:1:end-1],2)]
#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog(x,sol_5,"-*")

legend(("Order4","Order1","Order2","Order3","Order5"))
loglog([10^2,10^3],[10^-5 ,10^-7])
loglog([10^2,10^3],[10^-5 ,10^-6])
loglog([10^2,10^3],[10^-5 ,10^-8])
loglog([10^2,10^3],[10^-5 ,10^-9])
loglog([10^2,10^3],[10^-5 ,10^-10])
loglog([10^2,10^3],[10^-5 ,10^-11])




figure()

sol_4=[nm(u4_2[4:4:end-3] , f(Nodes4_2)[5:4:end-4],2),nm(u4_4[4:4:end-3] , f(Nodes4_4)[5:4:end-4],2),nm(u4_8[4:4:end-3] , f(Nodes4_8)[5:4:end-4],2),nm(u4_16[4:4:end-3] , f(Nodes4_16)[5:4:end-4],2),nm(u4_32[4:4:end-3] , f(Nodes4_32)[5:4:end-4],2),nm(u4_64[4:4:end-3] , f(Nodes4_64)[5:4:end-4],2)]
#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog(x,sol_4,"-*")

sol_1=[nm(u1_2 , f(Nodes1_2)[2:end-1],2),nm(u1_4 , f(Nodes1_4)[2:end-1],2),nm(u1_8 , f(Nodes1_8)[2:end-1],2),nm(u1_16 , f(Nodes1_16)[2:end-1],2),nm(u1_32 , f(Nodes1_32)[2:end-1],2),nm(u1_64 , f(Nodes1_64)[2:end-1],2)]
#x = [length(Nodes1_2),length(Nodes1_4),length(Nodes1_8),length(Nodes1_16),length(Nodes1_32),length(Nodes1_64)]
loglog(x,sol_1,"-*")

sol_2=[nm(u2_2[2:2:end-1] ,f(Nodes2_2)[3:2:end-2],2),nm(u2_4[2:2:end-1] , f(Nodes2_4)[3:2:end-2],2),nm(u2_8[2:2:end-1] , f(Nodes2_8)[3:2:end-2],2),nm(u2_16[2:2:end-1] , f(Nodes2_16)[3:2:end-2],2),nm(u2_32[2:2:end-1] , f(Nodes2_32)[3:2:end-2],2),nm(u2_64[2:2:end-1] ,f(Nodes2_64)[3:2:end-2],2)]
#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog(x,sol_2,"-*")

sol_3=[nm(u3_2[3:3:end-2] , f(Nodes3_2)[4:3:end-3],2),nm(u3_4[3:3:end-2] , f(Nodes3_4)[4:3:end-3],2),nm(u3_8[3:3:end-2] , f(Nodes3_8)[4:3:end-3],2),nm(u3_16[3:3:end-2] , f(Nodes3_16)[4:3:end-3],2),nm(u3_32[3:3:end-2] , f(Nodes3_32)[4:3:end-3],2),nm(u3_64[3:3:end-2] , f(Nodes3_64)[4:3:end-3],2)]
#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog(x,sol_3,"-*")

sol_5=[nm(u5_2[5:5:end-4] , f(Nodes5_2)[6:5:end-5],2),nm(u5_4[5:5:end-4] , f(Nodes5_4)[6:5:end-5],2),nm(u5_8[5:5:end-4] , f(Nodes5_8)[6:5:end-5],2),nm(u5_16[5:5:end-4] ,f(Nodes5_16)[6:5:end-5],2),nm(u5_32[5:5:end-4] , f(Nodes5_32)[6:5:end-5],2),nm(u5_64[5:5:end-4] , f(Nodes5_64)[6:5:end-5],2)]
#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog(x,sol_5,"-*")

legend(("Order4","Order1","Order2","Order3","Order5"))


figure()

sol_4=[nm(u4_2[4:4:end-3] , f(Nodes4_2)[5:4:end-4],2),nm(u4_4[4:4:end-3] , f(Nodes4_4)[5:4:end-4],2),nm(u4_8[4:4:end-3] , f(Nodes4_8)[5:4:end-4],2),nm(u4_16[4:4:end-3] , f(Nodes4_16)[5:4:end-4],2),nm(u4_32[4:4:end-3] , f(Nodes4_32)[5:4:end-4],2),nm(u4_64[4:4:end-3] , f(Nodes4_64)[5:4:end-4],2)]
#x = [length(Nodes4_2),length(Nodes4_4),length(Nodes4_8),length(Nodes4_16),length(Nodes4_32),length(Nodes4_64)]
loglog([2,8,24,96,384,1536],sol_4,"-*")

sol_1=[nm(u1_2 , f(Nodes1_2)[2:end-1],2),nm(u1_4 , f(Nodes1_4)[2:end-1],2),nm(u1_8 , f(Nodes1_8)[2:end-1],2),nm(u1_16 , f(Nodes1_16)[2:end-1],2),nm(u1_32 , f(Nodes1_32)[2:end-1],2),nm(u1_64 , f(Nodes1_64)[2:end-1],2)]
#x = [length(Nodes1_2),length(Nodes1_4),length(Nodes1_8),length(Nodes1_16),length(Nodes1_32),length(Nodes1_64)]
loglog(x,sol_1,"-*")

sol_2=[nm(u2_2[2:2:end-1] ,f(Nodes2_2)[3:2:end-2],2),nm(u2_4[2:2:end-1] , f(Nodes2_4)[3:2:end-2],2),nm(u2_8[2:2:end-1] , f(Nodes2_8)[3:2:end-2],2),nm(u2_16[2:2:end-1] , f(Nodes2_16)[3:2:end-2],2),nm(u2_32[2:2:end-1] , f(Nodes2_32)[3:2:end-2],2),nm(u2_64[2:2:end-1] ,f(Nodes2_64)[3:2:end-2],2)]
#x = [length(Nodes2_2),length(Nodes2_4),length(Nodes2_8),length(Nodes2_16),length(Nodes2_32),length(Nodes2_64),length(Nodes2_767),length(Nodes2_2048)]
loglog([2,4,8,16,32,64],sol_2,"-*")

sol_3=[nm(u3_2[3:3:end-2] , f(Nodes3_2)[4:3:end-3],2),nm(u3_4[3:3:end-2] , f(Nodes3_4)[4:3:end-3],2),nm(u3_8[3:3:end-2] , f(Nodes3_8)[4:3:end-3],2),nm(u3_16[3:3:end-2] , f(Nodes3_16)[4:3:end-3],2),nm(u3_32[3:3:end-2] , f(Nodes3_32)[4:3:end-3],2),nm(u3_64[3:3:end-2] , f(Nodes3_64)[4:3:end-3],2)]
#x = [length(Nodes3_2),length(Nodes3_4),length(Nodes3_8),length(Nodes3_16),length(Nodes3_32),length(Nodes3_64)]
loglog([2,6,18,36,92,186],sol_3,"-*")

sol_5=[nm(u5_2[5:5:end-4] , f(Nodes5_2)[6:5:end-5],2),nm(u5_4[5:5:end-4] , f(Nodes5_4)[6:5:end-5],2),nm(u5_8[5:5:end-4] , f(Nodes5_8)[6:5:end-5],2),nm(u5_16[5:5:end-4] ,f(Nodes5_16)[6:5:end-5],2),nm(u5_32[5:5:end-4] , f(Nodes5_32)[6:5:end-5],2),nm(u5_64[5:5:end-4] , f(Nodes5_64)[6:5:end-5],2)]
#x = [length(Nodes5_2),length(Nodes5_4),length(Nodes5_8),length(Nodes5_16),length(Nodes5_32),length(Nodes5_64)]
loglog([2,10,50,250,1250,6250],sol_5,"-*")

legend(("Order4","Order1","Order2","Order3","Order5"))
grid(which = "both", ls = "-")

"""
println("-----")

println(norm(u1_2.-f(Nodes1_2),2))
println(norm(u2_2[2:2:end-1].-f(Nodes2_4[3:2:end-2]),2))
println(norm(u3_2[3:3:end-2].-f(Nodes3_2[4:3:end-3]),2))
println(norm(u4_2[4:4:end-3].-f(Nodes4_2[5:4:end-4]),2))
println(norm(u5_2[5:5:end-4].-f(Nodes5_2[6:5:end-5]),2))


println(Nodes3_8[4:3:end-3])
println(Nodes2_8[3:2:end-2])
println(Nodes4_8[5:4:end-4])
println(Nodes5_8[6:5:end-5])

println(u2_64[2:2:end-1])
println(u3_64[3:3:end-2])
println(u4_64[4:4:end-3])
println(u5_64[5:5:end-4])

loglog([10^-0,10^1],[10^-2 ,10^-4])
loglog([10^-0,10^1],[10^-2 ,10^-3])
loglog([10^-0,10^1],[10^-2 ,10^-5])
loglog([10^-0,10^1],[10^-2 ,10^-6])
loglog([10^-0,10^1],[10^-2 ,10^-7])
loglog([10^-0,10^1],[10^-2 ,10^-8])




figure()
plot(Nodes3_64[2:end-1],abs.(u3_64 .- f(Nodes3_64)[2:end-1]),"-*")
plot(Nodes2_64[2:end-1],abs.(u2_64 .- f(Nodes2_64)[2:end-1]),"-*")
plot(Nodes1_64[2:end-1],abs.(u1_64 .- f(Nodes1_64)[2:end-1]),"-*")
plot(Nodes4_64[2:end-1],abs.(u4_64 .- f(Nodes4_64)[2:end-1]),"-*")
plot(Nodes5_64[2:end-1],abs.(u5_64 .- f(Nodes5_64)[2:end-1]),"-*")
plot(Nodes1_64[2:end-1],zeros(length(Nodes1_64[2:end-1])),"--*")


legend(("order3","order2","order1","order4","order5"))



figure()
plot(Nodes3_2[2:end-1],abs.(u3_2 .- f(Nodes3_2)[2:end-1]),"-*")
plot(Nodes2_2[2:end-1],abs.(u2_2 .- f(Nodes2_2)[2:end-1]),"-*")
plot(Nodes1_2[2:end-1],abs.(u1_2 .- f(Nodes1_2)[2:end-1]),"-*")
plot(Nodes4_2[2:end-1],abs.(u4_2 .- f(Nodes4_2)[2:end-1]),"-*")
plot(Nodes5_2[2:end-1],abs.(u5_2 .- f(Nodes5_2)[2:end-1]),"-*")
plot(Nodes1_2[2:end-1],zeros(length(Nodes1_2[2:end-1])),"--*")


legend(("order3","order2","order1","order4","order5"))

figure()
plot(Nodes3_16[2:end-1],abs.(u3_16 .- f(Nodes3_16)[2:end-1]),"-*")
plot(Nodes2_16[2:end-1],abs.(u2_16 .- f(Nodes2_16)[2:end-1]),"-*")
plot(Nodes1_16[2:end-1],abs.(u1_16 .- f(Nodes1_16)[2:end-1]),"-*")
plot(Nodes4_16[2:end-1],abs.(u4_16 .- f(Nodes4_16)[2:end-1]),"-*")
plot(Nodes5_16[2:end-1],abs.(u5_16 .- f(Nodes5_16)[2:end-1]),"-*")
plot(Nodes1_16[2:end-1],zeros(length(Nodes1_16[2:end-1])),"--*")


legend(("order3","order2","order1","order4","order5"))


println(minimum(u1))
println(minimum(u2))
println(minimum(u3))


println(u1)
println(u2)
println(u4)


sol=abs.([minimum(u1),minimum(u2),minimum(u3),minimum(u4)] .- -0.1250)./0.125
nod=[length(u1),length(u2),length(u3),length(u4)]

figure()

loglog(nod,sol)
"""

end

end
