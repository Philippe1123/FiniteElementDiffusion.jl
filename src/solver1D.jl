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
    DiffusionCoefficient=MaterialParam[id]
K_el_Dict[id]=computeElementStiffnessMatrices(solverparam,PositionNodes,ElemNodes,DiffusionCoefficient)
end
PositionMatrix,K_el_vector_form,PositionVector=constructPositionMatrix(Nodes,Elements,solverparam,K_el_Dict)
##Second Assemble
K=assembly(PositionMatrix,K_el_vector_form)
#println(K)
#println(PositionMatrix)
#println(K_el_Dict)
#K=K./(solverparam.Nelem-1)
#println(K)
#Third solve
#println(K_el_Dict)


#forcingterm=vec(ones(length(Nodes),1)).*Nodes
forcingterm = sin.(11*pi*Nodes)


f=computerighthandside(forcingterm,solverparam,Nodes,Elements,PositionVector)
#println(f)
#f=vec(ones(size(K,2),1))
f=-f
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




PositionVector=Int64.(PositionVector)
return PositionMatrix,K_el_vector_form,PositionVector
end


function assembly(PositionMatrix::Matrix,K_el_vector_form::Array)


#println(size(K_el_vector_form))

K=sparse(PositionMatrix[:,1],PositionMatrix[:,2],K_el_vector_form)
#K=Matrix(K)
K=K[2:end-1,2:end-1]
#first=K[2:end-2,2:end-2]
#second=K[2:end-2,end]
#third=K[end,2:end-2]
#third=transpose(third)
#fourth=K[end,end]
#println(size(first))
#println(size(second))
#println(size(third))
#println(size(fourth))

#K_1=[first second]
#K_2=[third fourth]
#K=[K_1;K_2]

return K

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array,ElemNodes::Array,D::Float64)

K_el=zeros(length(Nodes),length(Nodes))

modl=getfield(Main,Symbol(solverparam.elemtype))
x,H=gauss(solverparam.Qpt)
#println(ElemNodes)
for ii in ElemNodes
    for jj in ElemNodes
        #println(ii)
        #println(jj)

        i=mod(ii-1,solverparam.Order+1)+1
        j=mod(jj-1,solverparam.Order+1)+1
        #println(i)
        #println(j)

for v=1:solverparam.Qpt
phi,dphi=modl.evaluate(x[v])
Jac=transpose(Nodes)*dphi
#println(transpose(Nodes))
#println(dphi)
Jac=Jac[1]
#println(Jac)
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

K_el[i,j]=K_el[i,j]+dphi[i]*1/Jac*dphi[j]*1/Jac*H[v]*Jac*D
end
#println("-----")
end
end

#println(K_el)
return K_el
end

function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array,ElemNodes::Array,D::Array)

    K_el=zeros(length(Nodes),length(Nodes))
    
    modl=getfield(Main,Symbol(solverparam.elemtype))
    x,H=gauss(solverparam.Qpt)
    #println(ElemNodes)
    for ii in ElemNodes
        for jj in ElemNodes
            #println(ii)
            #println(jj)
    
            i=mod(ii-1,solverparam.Order+1)+1
            j=mod(jj-1,solverparam.Order+1)+1
            #println(i)
            #println(j)
    itr = 1
    for v=1:solverparam.Qpt
    phi,dphi=modl.evaluate(x[v])
    Jac=transpose(Nodes)*dphi
    #println(transpose(Nodes))
    #println(dphi)
    Jac=Jac[1]
    #println(Jac)
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
    
    K_el[i,j]=K_el[i,j]+dphi[i]*1/Jac*dphi[j]*1/Jac*H[v]*Jac*D[itr]
    end
    itr = itr +1
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
#println("posvector",PositionVector)

j=1
#println("------------")
for id=1:size(PositionVector,1)
ElemNodes=Elements[PositionVector[id,2],:]
PositionNodes=Nodes[ElemNodes,:]

    for v=1:solverparam.Qpt
    phi,dphi=modl.evaluate(x[v])


    Jac=transpose(PositionNodes)*dphi

righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H[v]*Jac[1]*phi[mod(j-1,solverparam.Order+1)+1]
#println("posid",PositionVector[id,1])
#println("phi_new",mod(j-1,solverparam.Order+1)+1)
#println("phi_old",mod(j-1,solverparam.Order)+1)
#println("***********")


end
#println("------------")

j=j+1

#println("jac",Jac)

#println("solverorder",solverparam.Order)


end
#println("posvector",PositionVector)

#println(righthandside)
righthandside=righthandside[2:end-1]
#first=righthandside[2:end-2]
#second=righthandside[end]
#righthandside=[first;second]
return righthandside

end



function getDOF()





end


end
