module gridPlot2D

using PyPlot







function plotNodes(Nodes::Matrix)
for id=1:size(Nodes,1)

plot(Nodes[id,1],Nodes[id,2],"*r")

end

end


function plotElements(Elements::Matrix,Nodes::Matrix,Type::String)

for id=1:size(Elements,1)

if(Type=="Quad")
ElemNodes=Elements[id,1:4]
elseif(Type=="Triag")
ElemNodes=Elements[id,1:3]
end


PositionNodes=Nodes[ElemNodes,:]


PositionNodes=[PositionNodes;transpose(PositionNodes[1,:])]

plot(PositionNodes[:,1],PositionNodes[:,2],"k")

end

end















end
