module TwoD_Quad_Order1


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(4,1)
    dphi_dξ=zeros(4,1)
    dphi_dη=zeros(4,1)

phi[1]=1/4*(1-ξ)*(1-η)
phi[2]=1/4*(1+ξ)*(1-η)
phi[3]=1/4*(1+ξ)*(1+η)
phi[4]=1/4*(1-ξ)*(1+η)

dphi_dξ[1]=(η-1)/4
dphi_dξ[2]=(1-η)/4
dphi_dξ[3]=(η+1)/4
dphi_dξ[4]=(-η-1)/4

dphi_dη[1]=(ξ-1)/4
dphi_dη[2]=(-ξ-1)/4
dphi_dη[3]=(ξ+1)/4
dphi_dη[4]=(1-ξ)/4

return phi,dphi_dξ,dphi_dη

end











end
