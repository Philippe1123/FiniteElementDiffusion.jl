module solver2D

using QuadGK
using SparseArrays
using LinearAlgebra
using FiniteElementDiffusion

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
#println(Matrix(K))

K=applyBoundaryConditions(K,Nodes)

#println(K_el_Dict)


forcingterm=vec(ones(size(Nodes,1),1))
f=computerighthandside(forcingterm,solverparam,Nodes,Elements,PositionVector)
f=applyBoundaryConditions(f,Nodes)
#Third solve
f=-f
u=K\f

u=recombine(u,Nodes)
#println(u)
#println(maximum(u))
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



K=sparse(PositionMatrix[:,1],PositionMatrix[:,2],K_el_vector_form)
#K=K[2:end-1,2:end-1]

return K

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array,ElemNodes::Array,D::Float64)

K_el=zeros(size(Nodes,1),size(Nodes,1))

modl=getfield(Main,Symbol(solverparam.elemtype))

#x,H1=gauss(solverparam.Qpt)
#y,H2=gauss(solverparam.Qpt)

#out,H=cubature_triangle.evaluate(6)
#x=out[:,1]
#y=out[:,2]
#H1=sqrt.(H)
#H2=sqrt.(H)

x,y,H1,H2=getCubaturePoints(solverparam.elemtype,solverparam.Qpt)


#println(ElemNodes)
i=1
for ii in ElemNodes
    j=1

    for jj in ElemNodes


        if(occursin("Quad",solverparam.elemtype,))###########################################################QUAD

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

Jac=Jac[1]




#a=Nodes[1,1]
#b=Nodes[2,1]
function fun(in) return (in*(b-a)/2+(a+b)/2)end

K_el[i,j]=K_el[i,j]+dphi_dx[i]*dphi_dx[j]*H1[v]*Jac*D*H2[w]+dphi_dy[i]*dphi_dy[j]*H1[v]*Jac*D*H2[w]

end
end



else########################triag


    for w=1:solverparam.Qpt
    phi,dphi_dξ,dphi_dη=modl.evaluate(x[w],y[w])


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

    Jac=Jac[1]




    #a=Nodes[1,1]
    #b=Nodes[2,1]
    function fun(in) return (in*(b-a)/2+(a+b)/2)end

    K_el[i,j]=K_el[i,j]+dphi_dx[i]*dphi_dx[j]*H1[w]*Jac*D*H2[w]+dphi_dy[i]*dphi_dy[j]*H1[w]*Jac*D*H2[w]

    end


end ##################end



#println("-----")
j=j+1
end
i=i+1
end



#println(K_el)
return K_el
end


function computerighthandside(forcingTerm::Array,solverparam::NamedTuple,Nodes::Array,Elements::Matrix,PositionVector::Matrix)
    modl=getfield(Main,Symbol(solverparam.elemtype))

#    x,H1=gauss(solverparam.Qpt)
#    y,H2=gauss(solverparam.Qpt)

#out,H=cubature_triangle.evaluate(6)
#x=out[:,1]
#y=out[:,2]
#H1=sqrt.(H)
#H2=sqrt.(H)

x,y,H1,H2=getCubaturePoints(solverparam.elemtype,solverparam.Qpt)


if(occursin("Quad",solverparam.elemtype,))###########################################################QUAD


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
    #    println(length(ElemNodes))
#righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[v]*phi[mod(j-1,(solverparam.Order+1)^2)+1]*H2[w]*Jac[1]
righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[v]*phi[mod(j-1,length(ElemNodes))+1]*H2[w]*Jac[1]


end
end
j=j+1
end

else    ###############################################TRIAG


    righthandside=vec(zeros(size(Nodes,1),1))
    j=1
    for id=1:size(PositionVector,1)
    ElemNodes=Elements[PositionVector[id,2],:]
    PositionNodes=Nodes[ElemNodes,:]
    for w=1:solverparam.Qpt
            phi,dphi_dξ,dphi_dη=modl.evaluate(x[w],y[w])


            JacMat=[transpose(PositionNodes[:,1])*dphi_dξ transpose(PositionNodes[:,2])*dphi_dξ;transpose(PositionNodes[:,1])*dphi_dη transpose(PositionNodes[:,2])*dphi_dη]
            Jac=det(JacMat)

            #println("Jac",Jac)
        #    println(length(ElemNodes))
    #righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[v]*phi[mod(j-1,(solverparam.Order+1)^2)+1]*H2[w]*Jac[1]
    righthandside[PositionVector[id,1]]=righthandside[PositionVector[id,1]]+forcingTerm[PositionVector[id,1]]*H1[w]*phi[mod(j-1,length(ElemNodes))+1]*H2[w]*Jac[1]


    end
    j=j+1
    end

end########################################end


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
#println(Boundary)

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


function recombine(u::Array,Nodes::Matrix)
#Currently only dirichlet conditions at boundaries u(Γ)=0
u_full=zeros(size(Nodes,1),1)
u_full=vec(u_full)
#println(size(u_full))
#println(size(u))

minx=minimum(Nodes[:,1])
maxx=maximum(Nodes[:,1])

miny=minimum(Nodes[:,2])
maxy=maximum(Nodes[:,2])

Boundary=[minx;maxx;miny;maxy]
Boundary=unique(Boundary)
Boundary=sort(Boundary)
#println(Boundary)
j=1
for id=1:size(Nodes,1)

if((Nodes[id,1] in Boundary)||(Nodes[id,2] in Boundary))
#println(Nodes[id,1]," ",Nodes[id,2])
u_full[id]=0

else
u_full[id]=u[j]
#println(id," ",j)
j=j+1


end


end

return u_full
end




function getCubaturePoints(typeOfElement::String,numberOfCubs::Int64)

if(occursin("Triag",typeOfElement))

    out,H=cubature_triangle.evaluate(numberOfCubs)
    x=out[:,1]
    y=out[:,2]
    H1=sqrt.(H)
    H2=sqrt.(H)

elseif(occursin("Quad",typeOfElement))

    x,H1=gauss(numberOfCubs)
    y,H2=gauss(numberOfCubs)

end
return x,y,H1,H2

end



function computeElementStiffnessMatrices(solverparam::NamedTuple,Nodes::Array,ElemNodes::Array,D::Array)

K_el=zeros(size(Nodes,1),size(Nodes,1))

modl=getfield(Main,Symbol(solverparam.elemtype))

#x,H1=gauss(solverparam.Qpt)
#y,H2=gauss(solverparam.Qpt)

#out,H=cubature_triangle.evaluate(6)
#x=out[:,1]
#y=out[:,2]
#H1=sqrt.(H)
#H2=sqrt.(H)

x,y,H1,H2=getCubaturePoints(solverparam.elemtype,solverparam.Qpt)


#println(ElemNodes)
i=1
for ii in ElemNodes
    j=1

    for jj in ElemNodes


        if(occursin("Quad",solverparam.elemtype,))###########################################################QUAD
countD=1
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

Jac=Jac[1]




#a=Nodes[1,1]
#b=Nodes[2,1]
function fun(in) return (in*(b-a)/2+(a+b)/2)end

K_el[i,j]=K_el[i,j]+dphi_dx[i]*dphi_dx[j]*H1[v]*Jac*D[countD]*H2[w]+dphi_dy[i]*dphi_dy[j]*H1[v]*Jac*D[countD]*H2[w]
countD=countD+1
end
end



else########################triag

    countD=1
    for w=1:solverparam.Qpt
    phi,dphi_dξ,dphi_dη=modl.evaluate(x[w],y[w])


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

    Jac=Jac[1]




    #a=Nodes[1,1]
    #b=Nodes[2,1]
    function fun(in) return (in*(b-a)/2+(a+b)/2)end

    K_el[i,j]=K_el[i,j]+dphi_dx[i]*dphi_dx[j]*H1[w]*Jac*D[countD]*H2[w]+dphi_dy[i]*dphi_dy[j]*H1[w]*Jac*D[countD]*H2[w]
countD=countD+1
    end


end ##################end



#println("-----")
j=j+1
end
i=i+1
end



#println(K_el)
return K_el
end



end
