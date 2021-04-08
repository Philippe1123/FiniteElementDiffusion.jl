module diffusion

using DelimitedFiles


function test()
    println("test")
end

function Main()

Elements=readdlm("../Mesh/Elements.txt")
Nodes=readdlm("../Mesh/Nodes.txt")
NumberOfElements=size(Elements,1)
MaterialParam=Dict()
DiffusionCoefficient=10
ElemType="OneD1"

for id=1:NumberOfElements MaterialParam[id]=DiffusionCoefficient end







end

end
