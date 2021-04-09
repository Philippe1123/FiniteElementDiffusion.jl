module solver1D

using QuadGK
using SparseArrays

function main(Nodes::Array,Elements::Matrix,MaterialParam::Dict,solverparam::NamedTuple)

### How to proceed
#First compute element stiffeness matrices
K_el_Dict=Dict()
for id=1:solverparam.Nelem
    ElemNodes=Elements[id,:]
    PositionNodes=Nodes[ElemNodes,:]
    #println(PositionNodes)
K_el_Dict[id]=computeElementStiffnessMatrices(solverparam,PositionNodes)
end
PositionMatrix,K_el_vector_form=constructPositionMatrix(Nodes,Elements,solverparam,K_el_Dict)
##Second Assemble
K=assembly(PositionMatrix,K_el_vector_form)
#Third solve
#println(K_el_Dict)

end


function constructPositionMatrix(Nodes::Array,Elements::Matrix,solverparam::NamedTuple,K_el_Dict::Dict)
#ReferencesMatrix=zeros(length(Elements[1,:]).^2,2)
PositionMatrix=zeros(solverparam.Nelem.*(length(Elements[1,:]).^2),2)
K_el_vector_form=zeros(size(PositionMatrix,1),size(PositionMatrix,2))

#println(size(PositionMatrix))
counter=1
    for id=1:solverparam.Nelem
        ElemNodes=Elements[id,:]

        for i in ElemNodes
            for j in ElemNodes

             PositionMatrix[counter,1]=j
             PositionMatrix[counter,2]=i
            counter=counter+1
            end
        end
    end

#    counter=1
#            ElemNodes=Elements[1,:]
#
#            for i in ElemNodes
#                for j in ElemNodes
#
#                 ReferencesMatrix[counter,1]=j
#                 ReferencesMatrix[counter,2]=i
#                counter=counter+1
#                end
#            end

for id=1:solverparam.Nelem

    K_el=0
    K_el=K_el_Dict[id]
    K_el=vec(reshape(K_el,size(K_el,1)*size(K_el,2),1))
#    println(typeof(K_el))
    if(id==1)
     K_el_vector_form=K_el
 else
     append!(K_el_vector_form,K_el)
    end

end



#    println(PositionMatrix)
#    println(K_el_vector_form)
return PositionMatrix,K_el_vector_form
end


function assembly(PositionMatrix::Matrix,K_el_vector_form::Array)


println(size(PositionMatrix))
println(size(K_el_vector_form))

K=sparse(PositionMatrix[:,1],PositionMatrix[:,2],K_el_vector_form)
println(K)

return 2

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array)

K_el=zeros(length(Nodes),length(Nodes))

mod=getfield(Main,Symbol(solverparam.elemtype))
x,H=gauss(solverparam.Qpt)
for i=1:length(Nodes)
    for j=1:length(Nodes)

for v=1:solverparam.Qpt
phi,dphi=mod.evaluate(x[v])
Jac=transpose(Nodes)*dphi
println(transpose(Nodes))
println(dphi)
Jac=Jac[1]
#println(Nodes)
#println(dphi[1])
#println(dphi[2])
#println(H[v])
println(Jac)
#println(v)
#println(x[v])
#println(dphi[i])
#println(dphi[j])
#println(H[v])



a=Nodes[1,1]
b=Nodes[2,1]
println("ok")
function fun(in) return (b-a)/2*(in*(b-a)/2+(a+b)/2)end

K_el[i,j]=K_el[i,j]+dphi[i]*fun(x[v])*dphi[j]*H[v]*1/Jac*1/Jac
end
println("-----")
end
end

#println(K_el)
return K_el
end






function getDOF()





end


end
