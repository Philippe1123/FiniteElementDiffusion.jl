module solver2D

using QuadGK
using SparseArrays
using LinearAlgebra

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
println(K)
#println(Matrix(K))

K=applyBoundaryConditions(K,Nodes)
println(K)
#println(Matrix(K))
#println(PositionMatrix)
#println(K_el_Dict)
#K=K./(solverparam.Nelem-1)
#println(K)
#Third solve
#println(K_el_Dict)


forcingterm=vec(ones(size(Nodes,1),1))
#println(forcingterm)
f=computerighthandside(forcingterm,solverparam,Nodes,Elements,PositionVector)
println(f)
f=applyBoundaryConditions(f,Nodes)
println(f)
#f=vec(ones(size(K,2),1))
u=K\f
println(u)
println(maximum(u))
#return u

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



K=sparse(PositionMatrix[:,1],PositionMatrix[:,2],K_el_vector_form)
#K=K[2:end-1,2:end-1]

return K

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array,ElemNodes::Array,D::Float64)

K_el=zeros(size(Nodes,1),size(Nodes,1))

modl=getfield(Main,Symbol(solverparam.elemtype))
x,H1=gauss(solverparam.Qpt)
y,H2=gauss(solverparam.Qpt)

#println(ElemNodes)
i=1
for ii in ElemNodes
    j=1

    for jj in ElemNodes



for w=1:solverparam.Qpt

for v=1:solverparam.Qpt
phi,dphi_dξ,dphi_dη=modl.evaluate(x[v],y[w])


JacMat=[transpose(Nodes[:,1])*dphi_dξ transpose(Nodes[:,2])*dphi_dξ;transpose(Nodes[:,1])*dphi_dη transpose(Nodes[:,2])*dphi_dη]
Jac=det(JacMat)
J_inv=zeros(2,2)
J_inv[1,1]=1/Jac*JacMat[2,2]
J_inv[1,2]=1/Jac*-JacMat[1,2]
J_inv[2,1]=1/Jac*-JacMat[2,1]
J_inv[2,2]=1/Jac*JacMat[1,1]


dphi_dx=vec(zeros(length(dphi_dξ),1))
dphi_dy=vec(zeros(length(dphi_dη),1))

for k=1:length(dphi_dξ)
#    println(transpose(J_inv[1,:]))
#    println([dphi_dξ[k];dphi_dη[k]])
dphi_dx[k]=transpose(J_inv[1,:])*[dphi_dξ[k];dphi_dη[k]]
dphi_dy[k]=transpose(J_inv[2,:])*[dphi_dξ[k];dphi_dη[k]]
end



#println("dphi_dx ",dphi_dx,"dphi_dξ", dphi_dξ)
#println("dphi_dy ",dphi_dy,"dphi_dη", dphi_dη)

#println("Jac",JacMat)
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

#println(i," ",j)
#println(dphi_dξ[i]*dphi_dξ[j]*H1[v]*D*H2[w])
#println(dphi_dη[i]*dphi_dη[j]*H1[v]*D*H2[w])
#println(dphi_dξ[i]," ",dphi_dξ[j])
#println(dphi_dη[i]," ",dphi_dη[j])

K_el[i,j]=K_el[i,j]+dphi_dx[i]*dphi_dx[j]*H1[v]*Jac*D*H2[w]+dphi_dy[i]*dphi_dy[j]*H1[v]*Jac*D*H2[w]
#K_el[i,j]=K_el[i,j]+dphi_dξ[i]*dphi_dξ[j]*H1[v]*D*H2[w]+dphi_dη[i]*dphi_dη[j]*H1[v]*D*H2[w]

#println(1/Jac)
end
end
#println("-----")
j=j+1
end
i=i+1
end



println(K_el)
return K_el
end


function computerighthandside(forcingTerm::Array,solverparam::NamedTuple,Nodes::Array,Elements::Matrix,PositionVector::Matrix)
    modl=getfield(Main,Symbol(solverparam.elemtype))
    x,H1=gauss(solverparam.Qpt)
    y,H2=gauss(solverparam.Qpt)
righthandside=vec(zeros(size(Nodes,1),1))

j=1
for id=1:size(PositionVector,1)
ElemNodes=Elements[PositionVector[id,2],:]
PositionNodes=Nodes[ElemNodes,:]
for w=1:solverparam.Qpt
    for v=1:solverparam.Qpt
        phi,dphi_dξ,dphi_dη=modl.evaluate(x[v],y[w])


        JacMat=[transpose(PositionNodes[:,1])*dphi_dξ transpose(PositionNodes[:,2])*dphi_dξ;transpose(PositionNodes[:,1])*dphi_dη transpose(PositionNodes[:,2])*dphi_dη]
        Jac=det(JacMat)

        #println("Jac",Jac)

#righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[v]*Jac[1]*dphi_dξ[mod(j-1,solverparam.Order+1)+1]*H2[w]+forcingTerm[PositionVector[id,1]]*H1[v]*Jac[1]*dphi_dη[mod(j-1,solverparam.Order+1)+1]*H2[w]
#println(mod(j-1,solverparam.Order+1)+1)
#println(PositionVector[id,1])
righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[v]*phi[mod(j-1,(solverparam.Order+1)^2)+1]*H2[w]*Jac[1]
println(mod(j-1,solverparam.Order+1)+1)


end
end
j=j+1



end

#righthandside=righthandside[2:end-1]

return righthandside

end



function getDOF()


end

function applyBoundaryConditions(K::SparseMatrixCSC,Nodes::Matrix)
#Currently only dirichlet conditions at boundaries u(Γ)=0



minx=findall(isequal(minimum(Nodes[:,1])), Nodes[:,1])
maxx=findall(isequal(maximum(Nodes[:,1])), Nodes[:,1])

miny=findall(isequal(minimum(Nodes[:,2])), Nodes[:,2])
maxy=findall(isequal(maximum(Nodes[:,2])), Nodes[:,2])

Boundary=[minx;maxx;miny;maxy]
Boundary=unique(Boundary)
Boundary=sort(Boundary,rev=true)
println(Boundary)

for id=1:length(Boundary)
K = K[1:end .!= Boundary[id], 1:end .!= Boundary[id]]
end

return K
end


function applyBoundaryConditions(f::Array,Nodes::Matrix)
#Currently only dirichlet conditions at boundaries u(Γ)=0



minx=findall(isequal(minimum(Nodes[:,1])), Nodes[:,1])
maxx=findall(isequal(maximum(Nodes[:,1])), Nodes[:,1])

miny=findall(isequal(minimum(Nodes[:,2])), Nodes[:,2])
maxy=findall(isequal(maximum(Nodes[:,2])), Nodes[:,2])

Boundary=[minx;maxx;miny;maxy]
Boundary=unique(Boundary)
Boundary=sort(Boundary,rev=true)
#println(Boundary)

for id=1:length(Boundary)
f = f[1:end .!= Boundary[id], :]
end

return f
end

end
