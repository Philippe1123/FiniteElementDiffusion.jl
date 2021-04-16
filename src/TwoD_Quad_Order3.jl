module TwoD_Quad_Order3


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(16,1)
    dphi_dξ=zeros(16,1)
    dphi_dη=zeros(16,1)





    phi[1]=-9*(ξ-1)*(ξ-1/3)*(ξ+1/3)/16*-9*(η-1)*(η-1/3)*(η+1/3)/16
    phi[2]=9*(ξ-1/3)*(ξ+1/3)*(ξ+1)/16*-9*(η-1)*(η-1/3)*(η+1/3)/16
    phi[3]=9*(ξ-1/3)*(ξ+1/3)*(ξ+1)/16*9*(η-1/3)*(η+1/3)*(η+1)/16
    phi[4]=-9*(ξ-1)*(ξ-1/3)*(ξ+1/3)/16*9*(η-1/3)*(η+1/3)*(η+1)/16
    phi[5]=27*(ξ-1)*(ξ-1/3)*(ξ+1)/16*-9*(η-1)*(η-1/3)*(η+1/3)/16
    phi[6]=-27*(ξ-1)*(ξ+1/3)*(ξ+1)/16*-9*(η-1)*(η-1/3)*(η+1/3)/16
    phi[7]=9*(ξ-1/3)*(ξ+1/3)*(ξ+1)/16*27*(η-1)*(η-1/3)*(η+1)/16
    phi[8]=9*(ξ-1/3)*(ξ+1/3)*(ξ+1)/16*-27*(η-1)*(η+1/3)*(η+1)/16
    phi[9]=9*(η-1/3)*(η+1/3)*(η+1)/16*-27*(ξ-1)*(ξ+1/3)*(ξ+1)/16
    phi[10]=9*(η-1/3)*(η+1/3)*(η+1)/16*27*(ξ-1)*(ξ-1/3)*(ξ+1)/16
    phi[11]=-9*(ξ-1)*(ξ-1/3)*(ξ+1/3)/16*-27*(η-1)*(η+1/3)*(η+1)/16
    phi[12]=-9*(ξ-1)*(ξ-1/3)*(ξ+1/3)/16*27*(η-1)*(η-1/3)*(η+1)/16
    phi[13]=27*(ξ-1)*(ξ-1/3)*(ξ+1)/16*27*(η-1)*(η-1/3)*(η+1)/16
    phi[14]=-27*(ξ-1)*(ξ+1/3)*(ξ+1)/16*27*(η-1)*(η-1/3)*(η+1)/16
    phi[15]=-27*(ξ-1)*(ξ+1/3)*(ξ+1)/16*-27*(η-1)*(η+1/3)*(η+1)/16
    phi[16]=27*(ξ-1)*(ξ-1/3)*(ξ+1)/16*-27*(η-1)*(η+1/3)*(η+1)/16


dphi_dξ[1]=-9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ - 1/3)/16 + 81*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/48)*(ξ - 1/3)
dphi_dξ[2]=-81*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(9*ξ - 3) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dξ[3]=81*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3) + 9*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(ξ/16 + 1/16)*(9*ξ - 3) + 9*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dξ[4]=9*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48) + 9*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(-9*ξ + 9)*(ξ - 1/3)/16 - 81*(η/16 + 1/16)*(η - 1/3)*(η + 1/3)*(ξ/16 + 1/48)*(ξ - 1/3)
dphi_dξ[5]=-243*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(27*ξ - 27) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ - 1/3)*(27*ξ - 27)/16
dphi_dξ[6]=-9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16) - 9*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ + 1/3)/16 + 243*(η/16 + 1/48)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)
dphi_dξ[7]=243*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(9*ξ - 3) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dξ[8]=-243*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(9*ξ - 3) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dξ[9]=-27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1) - 27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ + 1/3) - 27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ - 1)*(ξ + 1/3)/16
dphi_dξ[10]=27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1) + 27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1/3) + 27*(η/16 + 1/16)*(η + 1/3)*(9*η - 3)*(ξ - 1)*(ξ - 1/3)/16
dphi_dξ[11]=-27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(-9*ξ + 9)*(ξ - 1/3)/16 + 243*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/48)*(ξ - 1/3)
dphi_dξ[12]=27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ - 1/3)/16 - 243*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/48)*(ξ - 1/3)
dphi_dξ[13]=729*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(27*ξ - 27) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ - 1/3)*(27*ξ - 27)/16
dphi_dξ[14]=27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16) + 27*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ + 1/3)/16 - 729*(η/16 + 1/16)*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)
dphi_dξ[15]=-27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(-27*ξ + 27)*(ξ + 1/3)/16 + 729*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)
dphi_dξ[16]=-729*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(ξ - 1/3) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(27*ξ - 27) - 27*(η/16 + 1/16)*(η - 1)*(η + 1/3)*(ξ - 1/3)*(27*ξ - 27)/16




dphi_dη[1]=-9*(η/16 + 1/48)*(η - 1)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) - 9*(η/16 + 1/48)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) - 9*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3)/16
dphi_dη[2]=-9*(η/16 + 1/48)*(η - 1)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) - 9*(η/16 + 1/48)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) - 9*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dη[3]=9*(η/16 + 1/16)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) + 9*(η/16 + 1/16)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) + 9*(η - 1/3)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dη[4]=9*(η/16 + 1/16)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) + 9*(η/16 + 1/16)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) + 9*(η - 1/3)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3)/16
dphi_dη[5]=-9*(η/16 + 1/48)*(η - 1)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) - 9*(η/16 + 1/48)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) - 9*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27)/16
dphi_dη[6]=-9*(η/16 + 1/48)*(η - 1)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) - 9*(η/16 + 1/48)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) - 9*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3)/16
dphi_dη[7]=27*(η/16 + 1/16)*(η - 1)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) + 27*(η/16 + 1/16)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) + 27*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dη[8]=-27*(η/16 + 1/16)*(η - 1)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) - 27*(η/16 + 1/16)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3) - 27*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(ξ + 1/3)*(9*ξ - 3)/16
dphi_dη[9]=-243*(η/16 + 1/16)*(η + 1/3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ + 1/3) - 27*(η/16 + 1/16)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ + 1/3) - 27*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ + 1/3)/16
dphi_dη[10]=243*(η/16 + 1/16)*(η + 1/3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ - 1/3) + 27*(η/16 + 1/16)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ - 1/3) + 27*(η + 1/3)*(9*η - 3)*(ξ/16 + 1/16)*(ξ - 1)*(ξ - 1/3)/16
dphi_dη[11]=-27*(η/16 + 1/16)*(η - 1)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) - 27*(η/16 + 1/16)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) - 27*(η - 1)*(η + 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3)/16
dphi_dη[12]=27*(η/16 + 1/16)*(η - 1)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) + 27*(η/16 + 1/16)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3) + 27*(η - 1)*(η - 1/3)*(-9*ξ + 9)*(ξ/16 + 1/48)*(ξ - 1/3)/16
dphi_dη[13]=27*(η/16 + 1/16)*(η - 1)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) + 27*(η/16 + 1/16)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) + 27*(η - 1)*(η - 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27)/16
dphi_dη[14]=27*(η/16 + 1/16)*(η - 1)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) + 27*(η/16 + 1/16)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) + 27*(η - 1)*(η - 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3)/16
dphi_dη[15]=-27*(η/16 + 1/16)*(η - 1)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) - 27*(η/16 + 1/16)*(η + 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3) - 27*(η - 1)*(η + 1/3)*(-27*ξ + 27)*(ξ/16 + 1/16)*(ξ + 1/3)/16
dphi_dη[16]=-27*(η/16 + 1/16)*(η - 1)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) - 27*(η/16 + 1/16)*(η + 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27) - 27*(η - 1)*(η + 1/3)*(ξ/16 + 1/16)*(ξ - 1/3)*(27*ξ - 27)/16

return phi,dphi_dξ,dphi_dη

end











end
