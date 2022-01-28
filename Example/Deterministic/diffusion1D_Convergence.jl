module diffusion1D_Convergence

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using Interpolations
using LinearAlgebra
using Revise

function test()
    println("test")
end

function Main()
println(@__DIR__)



MaterialParam=Dict()
DiffusionCoefficient=1.0
QuadPoints=3
"""
#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_767.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_767.txt"))
Nodes1=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1=solver1D.main(Nodes1,Elements,MaterialParam,solverparam)


#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_767.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_767.txt"))
Nodes2=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver1D.main(Nodes2,Elements,MaterialParam,solverparam)


#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_767.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_767.txt"))
Nodes3=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3=solver1D.main(Nodes3,Elements,MaterialParam,solverparam)
"""
#####################################################################33"""
QuadPoints=3

#Order 1
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_11.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_11.txt"))
Nodes1_11=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_11=solver1D.main(Nodes1_11,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_23.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_23.txt"))
Nodes1_23=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_23=solver1D.main(Nodes1_23,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_47.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_47.txt"))
Nodes1_47=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_47=solver1D.main(Nodes1_47,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_95.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_95.txt"))
Nodes1_95=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_95=solver1D.main(Nodes1_95,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_192.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_192.txt"))
Nodes1_192=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_192=solver1D.main(Nodes1_192,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_1_383.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_1_383.txt"))
Nodes1_383=Nodes[:,2]#only retain x component
ElemType="OneD_Order1"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u1_383=solver1D.main(Nodes1_383,Elements,MaterialParam,solverparam)

QuadPoints=2
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_11.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_11.txt"))
Nodes2_11=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_11=solver1D.main(Nodes2_11,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_23.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_23.txt"))
Nodes2_23=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_23=solver1D.main(Nodes2_23,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_47.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_47.txt"))
Nodes2_47=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_47=solver1D.main(Nodes2_47,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_95.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_95.txt"))
Nodes2_95=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_95=solver1D.main(Nodes2_95,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_192.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_192.txt"))
Nodes2_192=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_192=solver1D.main(Nodes2_192,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_383.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_383.txt"))
Nodes2_383=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_383=solver1D.main(Nodes2_383,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_767.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_767.txt"))
Nodes2_767=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_767=solver1D.main(Nodes2_767,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_2_1534.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_2_1534.txt"))
Nodes2_1534=Nodes[:,2]#only retain x component
ElemType="OneD_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2_1534=solver1D.main(Nodes2_1534,Elements,MaterialParam,solverparam)

QuadPoints=10
#Order 3
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_11.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_11.txt"))
Nodes3_11=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_11=solver1D.main(Nodes3_11,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_23.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_23.txt"))
Nodes3_23=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_23=solver1D.main(Nodes3_23,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_47.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_47.txt"))
Nodes3_47=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_47=solver1D.main(Nodes3_47,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_95.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_95.txt"))
Nodes3_95=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_95=solver1D.main(Nodes3_95,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_192.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_192.txt"))
Nodes3_192=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_192=solver1D.main(Nodes3_192,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_3_383.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_3_383.txt"))
Nodes3_383=Nodes[:,2]#only retain x component
ElemType="OneD_Order3"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u3_383=solver1D.main(Nodes3_383,Elements,MaterialParam,solverparam)

QuadPoints=10
#Order 4
Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_11.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_11.txt"))
Nodes4_11=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_11=solver1D.main(Nodes4_11,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_23.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_23.txt"))
Nodes4_23=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_23=solver1D.main(Nodes4_23,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_47.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_47.txt"))
Nodes4_47=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_47=solver1D.main(Nodes4_47,Elements,MaterialParam,solverparam)

Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_95.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_95.txt"))
Nodes4_95=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_95=solver1D.main(Nodes4_95,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_192.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_192.txt"))
Nodes4_192=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_192=solver1D.main(Nodes4_192,Elements,MaterialParam,solverparam)


Elements=Int64.(readdlm(joinpath(locationOfMesh,"1D/Elements_4_383.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"1D/Nodes_4_383.txt"))
Nodes4_383=Nodes[:,2]#only retain x component
ElemType="OneD_Order4"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u4_383=solver1D.main(Nodes4_383,Elements,MaterialParam,solverparam)



figure()
f(x) = -1/(100*pi)^2 * sin.(100*pi*x)
#f(x) = -x.^2 ./2 .+ x./2

println(f(Nodes4_11)[2:end-1])
println(u4_11)

x=[11,23,47,95,192,383,767,1534]

sol_4=[norm(u4_11 .- f(Nodes4_11)[2:end-1],2),norm(u4_23 .- f(Nodes4_23)[2:end-1],2),norm(u4_47 .- f(Nodes4_47)[2:end-1],2),norm(u4_95 .- f(Nodes4_95)[2:end-1],2),norm(u4_192 .- f(Nodes4_192)[2:end-1],2),norm(u4_383 .- f(Nodes4_383)[2:end-1],2)]
#x = [length(Nodes4_11),length(Nodes4_23),length(Nodes4_47),length(Nodes4_95),length(Nodes4_192),length(Nodes4_383)]
loglog(x[1:end-2],sol_4,"-*")

sol_1=[norm(u1_11 .- f(Nodes1_11)[2:end-1],2),norm(u1_23 .- f(Nodes1_23)[2:end-1],2),norm(u1_47 .- f(Nodes1_47)[2:end-1],2),norm(u1_95 .- f(Nodes1_95)[2:end-1],2),norm(u1_192 .- f(Nodes1_192)[2:end-1],2),norm(u1_383 .- f(Nodes1_383)[2:end-1],2)]
#x = [length(Nodes1_11),length(Nodes1_23),length(Nodes1_47),length(Nodes1_95),length(Nodes1_192),length(Nodes1_383)]
loglog(x[1:end-2],sol_1,"-*")

sol_2=[norm(u2_11 .- f(Nodes2_11)[2:end-1],2),norm(u2_23 .- f(Nodes2_23)[2:end-1],2),norm(u2_47 .- f(Nodes2_47)[2:end-1],2),norm(u2_95 .- f(Nodes2_95)[2:end-1],2),norm(u2_192 .- f(Nodes2_192)[2:end-1],2),norm(u2_383 .- f(Nodes2_383)[2:end-1],2),norm(u2_767 .- f(Nodes2_767)[2:end-1],2),norm(u2_1534 .- f(Nodes2_1534)[2:end-1],2)]
#x = [length(Nodes2_11),length(Nodes2_23),length(Nodes2_47),length(Nodes2_95),length(Nodes2_192),length(Nodes2_383),length(Nodes2_767),length(Nodes2_1534)]
loglog(x,sol_2,"-*")

sol_3=[norm(u3_11 .- f(Nodes3_11)[2:end-1],2),norm(u3_23 .- f(Nodes3_23)[2:end-1],2),norm(u3_47 .- f(Nodes3_47)[2:end-1],2),norm(u3_95 .- f(Nodes3_95)[2:end-1],2),norm(u3_192 .- f(Nodes3_192)[2:end-1],2),norm(u3_383 .- f(Nodes3_383)[2:end-1],2)]
#x = [length(Nodes3_11),length(Nodes3_23),length(Nodes3_47),length(Nodes3_95),length(Nodes3_192),length(Nodes3_383)]
loglog(x[1:end-2],sol_3,"-*")

loglog([10^2,10^3],[10^-5 ,10^-7])
loglog([10^2,10^3],[10^-5 ,10^-6])
loglog([10^2,10^3],[10^-5 ,10^-8])
loglog([10^2,10^3],[10^-5 ,10^-9])

legend(("order4","order1","order2","order3"))



grid(which = "both", ls = "-")


"""
x=[11,23,47,95,192,383,767,1534]

sol_4=[norm(u4_11[4:5:end-3] .- f(Nodes4_11)[5:5:end-4],2),norm(u4_23[4:5:end-3] .- f(Nodes4_23)[5:5:end-4],2),norm(u4_47[4:5:end-3] .- f(Nodes4_47)[5:5:end-4],2),norm(u4_95[4:5:end-3] .- f(Nodes4_95)[5:5:end-4],2),norm(u4_192[4:5:end-3] .- f(Nodes4_192)[5:5:end-4],2),norm(u4_383[4:5:end-3] .- f(Nodes4_383)[5:5:end-4],2)]
loglog(x[1:end-2],sol_4,"-*")

sol_1=[norm(u1_11 .- f(Nodes1_11)[2:end-1],2),norm(u1_23 .- f(Nodes1_23)[2:end-1],2),norm(u1_47 .- f(Nodes1_47)[2:end-1],2),norm(u1_95 .- f(Nodes1_95)[2:end-1],2),norm(u1_192 .- f(Nodes1_192)[2:end-1],2),norm(u1_383 .- f(Nodes1_383)[2:end-1],2)]
loglog(x[1:end-2],sol_1,"-*")

sol_2=[norm(u2_11[2:3:end-1] .- f(Nodes2_11)[3:3:end-2],2),norm(u2_23[2:3:end-1] .- f(Nodes2_23)[3:3:end-2],2),norm(u2_47[2:3:end-1] .- f(Nodes2_47)[3:3:end-2],2),norm(u2_95[2:3:end-1] .- f(Nodes2_95)[3:3:end-2],2),norm(u2_192[2:3:end-1] .- f(Nodes2_192)[3:3:end-2],2),norm(u2_383[2:3:end-1] .- f(Nodes2_383)[3:3:end-2],2),norm(u2_767[2:3:end-1] .- f(Nodes2_767)[3:3:end-2],2),norm(u2_1534[2:3:end-1] .- f(Nodes2_1534)[3:3:end-2],2)]
loglog(x,sol_2,"-*")

sol_3=[norm(u3_11 .- f(Nodes3_11)[2:end-1],2),norm(u3_23 .- f(Nodes3_23)[2:end-1],2),norm(u3_47 .- f(Nodes3_47)[2:end-1],2),norm(u3_95 .- f(Nodes3_95)[2:end-1],2),norm(u3_192 .- f(Nodes3_192)[2:end-1],2),norm(u3_383 .- f(Nodes3_383)[2:end-1],2)]
loglog(x[1:end-2],sol_3,"-*")

loglog([10^2,10^3],[10^-5 ,10^-7])
loglog([10^2,10^3],[10^-5 ,10^-6])
loglog([10^2,10^3],[10^-5 ,10^-8])
loglog([10^2,10^3],[10^-5 ,10^-9])

legend(("order4","order1","order2","order3"))

"""

#println(u)
figure()
plot(Nodes1_383[2:end-1],u1_383,"*k")
plot(Nodes2_383[2:end-1],u2_383,"*r")
plot(Nodes3_383[2:end-1],u3_383,"*b")
plot(Nodes4_383[2:end-1],u4_383,"*g")
plot(Nodes2_383,f(Nodes2_383),".")
plot(Nodes4_383,f(Nodes4_383),".")
plot(Nodes3_383,f(Nodes3_383),".")

plot(0:0.00001:1,f(0:0.00001:1),".")
#println(Nodes4_383)



legend(("Order1","Order2","Order3","Order4","exact_2","exact_4","exact_3","exact"))
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


end

end
