module TwoD_Triag_Order2


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(6,1)
    dphi_dξ=zeros(6,1)
    dphi_dη=zeros(6,1)

phi[1]=(1-ξ-η)*(1-2*ξ-2*η)
phi[2]=-ξ*(1-2*ξ)
phi[3]=-η*(1-2*η)
phi[4]=4*ξ*(1-ξ-η)
phi[5]=4*ξ*η
phi[6]=4*η*(1-ξ-η)


dphi_dξ[1]=-3+4*ξ +4*η
dphi_dξ[2]=-1+4*ξ
dphi_dξ[3]=0.0
dphi_dξ[4]=4-8*ξ-4*η
dphi_dξ[5]=4*η
dphi_dξ[6]=-4*η

dphi_dη[1]=-3+4*ξ+4*η
dphi_dη[2]=0.0
dphi_dη[3]=-1+4*η
dphi_dη[4]=-4*ξ
dphi_dη[5]=4*ξ
dphi_dη[6]=4-4*ξ-8*η

return phi,dphi_dξ,dphi_dη

end











end
