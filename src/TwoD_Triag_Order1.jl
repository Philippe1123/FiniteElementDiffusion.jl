module TwoD_Triag_Order1


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(3,1)
    dphi_dξ=zeros(3,1)
    dphi_dη=zeros(3,1)

phi[1]=(1-ξ-η)
phi[2]=ξ
phi[3]=η


dphi_dξ[1]=-1
dphi_dξ[2]=1
dphi_dξ[3]=0

dphi_dη[1]=-1
dphi_dη[2]=0
dphi_dη[3]=1

return phi,dphi_dξ,dphi_dη

end











end
