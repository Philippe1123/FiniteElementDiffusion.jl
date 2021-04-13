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
PositionMatrix,K_el_vector_form,PositionVector=constructPositionMatrix(Nodes,Elements,solverparam,K_el_Dict)
##Second Assemble
K=assembly(PositionMatrix,K_el_vector_form)
#K=K./(solverparam.Nelem-1)
#println(K)
#Third solve
#println(K_el_Dict)


forcingterm=vec(ones(length(Nodes),1))
f=computerighthandside(forcingterm,solverparam,Nodes,Elements,PositionVector)

#f=vec(ones(size(K,2),1))
u=K\f

return u

end


function constructPositionMatrix(Nodes::Array,Elements::Matrix,solverparam::NamedTuple,K_el_Dict::Dict)
#ReferencesMatrix=zeros(length(Elements[1,:]).^2,2)
PositionMatrix=zeros(solverparam.Nelem.*(length(Elements[1,:]).^2),2)
PositionVector=zeros(solverparam.Nelem.*(length(Elements[1,:])),2)

K_el_vector_form=zeros(size(PositionMatrix,1),size(PositionMatrix,2))

#println(size(PositionMatrix))
counter=1
secondCounter=1
    for id=1:solverparam.Nelem
        ElemNodes=Elements[id,:]
        for i in ElemNodes
           PositionVector[secondCounter,1]=i
           PositionVector[secondCounter,2]=id
           secondCounter=secondCounter+1

            for j in ElemNodes

             PositionMatrix[counter,1]=j
             PositionMatrix[counter,2]=i
            counter=counter+1
            end
        end
    end


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
println(size(PositionVector))
PositionVector=Int64.(PositionVector)
println(size(PositionVector))
return PositionMatrix,K_el_vector_form,PositionVector
end


function assembly(PositionMatrix::Matrix,K_el_vector_form::Array)


#println(size(PositionMatrix))
#println(size(K_el_vector_form))

K=sparse(PositionMatrix[:,1],PositionMatrix[:,2],K_el_vector_form)
K=K[2:end-1,2:end-1]

#println(K)

return K

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array)

K_el=zeros(length(Nodes),length(Nodes))

modl=getfield(Main,Symbol(solverparam.elemtype))
x,H=gauss(solverparam.Qpt)
for i=1:length(Nodes)
    for j=1:length(Nodes)

for v=1:solverparam.Qpt
phi,dphi=modl.evaluate(x[v])
Jac=transpose(Nodes)*dphi
#println(transpose(Nodes))
#println(dphi)
Jac=Jac[1]
#println(Nodes)
#println(dphi[1])
#println(dphi[2])
#println(H[v])
#println(Jac)
#println(v)
#println(x[v])
#println(dphi[i])
#println(dphi[j])
#println(H[v])



a=Nodes[1,1]
b=Nodes[2,1]
#println("ok")
function fun(in) return (in*(b-a)/2+(a+b)/2)end
#println(Jac)
#println(solverparam.Nelem)

K_el[i,j]=K_el[i,j]+dphi[i]*1/Jac*dphi[j]*1/Jac*H[v]*Jac
end
#println("-----")
end
end

#println(K_el)
return K_el
end


function computerighthandside(forcingTerm::Array,solverparam::NamedTuple,Nodes::Array,Elements::Matrix,PositionVector::Matrix)
    modl=getfield(Main,Symbol(solverparam.elemtype))
    x,H=gauss(solverparam.Qpt)
righthandside=vec(zeros(length(Nodes),1))

j=1
println("len",size(PositionVector,1))
for id=1:size(PositionVector,1)
ElemNodes=Elements[PositionVector[id,2],:]
PositionNodes=Nodes[ElemNodes,:]

    for v=1:solverparam.Qpt
    phi,dphi=modl.evaluate(x[v])


    Jac=transpose(PositionNodes)*dphi
righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H[v]*Jac[1]*phi[mod(j-1,solverparam.Order)+1]
j=j+1

end



end
#println(righthandside)
righthandside=righthandside[2:end-1]
return righthandside

end



function getDOF()





end


end
