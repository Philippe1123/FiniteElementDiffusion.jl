module diffusion2D_Stochastic_test_UnStructured_Triag

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using GaussianRandomFields
using ScatteredInterpolation
using Statistics

function test()
    println("test")
end

function Main()
println(@__DIR__)



MaterialParam=Dict()
DiffusionCoefficient=10.0
QuadPoints=3








####################################################################################3
#Order 2
Elements=Int64.(readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Elements_2_198.txt")))
Elements=Elements[:,5:end]
Nodes=readdlm(joinpath(locationOfMesh,"2D/Unstructured/Triag/Nodes_2_198.txt"))
Nodes2=Nodes[:,2:3]
Elements2=Elements[:,1:3]
println(Nodes2)
println(Elements)

Kernel = GaussianRandomFields.Matern(0.3,2.0,σ=1.0,p=2)
cov = CovarianceFunction(2,Kernel)
grf = GaussianRandomField(cov,KarhunenLoeve(100),Nodes2,Elements2[:,1:3],quad=GaussLegendre())
Zf=sample(grf)
Center=compute_centers(Nodes2,Elements2)
println(grf)


itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes2', Zf);
Zc=evaluate(itp, Center')
DiffusionCoefficient=exp.(Zc)


figure()
gridPlot2D.plotElements(Elements,Nodes2,"Triag")
gridPlot2D.plotNodes(Nodes2)

ElemType="TwoD_Triag_Order2"
NumberOfElements=size(Elements,1)
for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient[id] end
solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
u2=solver2D.main(Nodes2,Elements,MaterialParam,solverparam)


figure()
surf(Nodes2[:,1],Nodes2[:,2],u2)




end



function compute_centers(p,t)
    d = size(p, 2)
    vec_t = vec(t)
    size_t = size(t)

    pts = Array{Float64}(undef, size(t, 1), d)
    @inbounds for i in 1:d
        x = reshape(p[vec_t, i], size_t)
        mean!(view(pts, :, i), x)
    end
    pts
end


end
