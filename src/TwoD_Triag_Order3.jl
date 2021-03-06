module TwoD_Triag_Order3


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(10,1)
    dphi_dξ=zeros(10,1)
    dphi_dη=zeros(10,1)

    phi[1]=-(η + ξ - 1/3)*(η + ξ - 2/3)*((9*η)/2 + (9*ξ)/2 - 9/2);
    phi[2]=(9*ξ*(ξ - 1/3)*(ξ - 2/3))/2;
    phi[3]=(9*η*(η - 1/3)*(η - 2/3))/2;
    phi[4]= ξ*(η + ξ - 2/3)*((27*η)/2 + (27*ξ)/2 - 27/2);
    phi[5]=-ξ*(ξ - 1/3)*((27*η)/2 + (27*ξ)/2 - 27/2);
    phi[6]=(27*η*ξ*(ξ - 1/3))/2;
    phi[7]=(27*η*ξ*(η - 1/3))/2;
    phi[8]=-(27*η*(η - 1/3)*(η + ξ - 1))/2;
    phi[9]= (27*η*(η + ξ - 1)*(η + ξ - 2/3))/2;
    phi[10]=-η*ξ*(27*η + 27*ξ - 27);

      dphi_dξ[1]=18*η + 18*ξ - 27*η*ξ - (27*η^2)/2 - (27*ξ^2)/2 - 11/2;
      dphi_dξ[2]=(27*ξ^2)/2 - 9*ξ + 1;
      dphi_dξ[3]=0;
      dphi_dξ[4]=(27*η^2)/2 + 54*η*ξ - (45*η)/2 + (81*ξ^2)/2 - 45*ξ + 9;
      dphi_dξ[5]=(9*η)/2 + 36*ξ - 27*η*ξ - (81*ξ^2)/2 - 9/2;
      dphi_dξ[6]=(9*η*(6*ξ - 1))/2;
      dphi_dξ[7]=(27*η*(η - 1/3))/2;
      dphi_dξ[8]=-(27*η*(η - 1/3))/2;
      dphi_dξ[9]=(9*η*(6*η + 6*ξ - 5))/2;
      dphi_dξ[10]=-27*η*(η + 2*ξ - 1);

      dphi_dη[1]=18*η + 18*ξ - 27*η*ξ - (27*η^2)/2 - (27*ξ^2)/2 - 11/2;
      dphi_dη[2]=0;
      dphi_dη[3]=(27*η^2)/2 - 9*η + 1;
      dphi_dη[4]=(9*ξ*(6*η + 6*ξ - 5))/2;
      dphi_dη[5]=-(27*ξ*(ξ - 1/3))/2;
      dphi_dη[6]= (27*ξ*(ξ - 1/3))/2;
      dphi_dη[7]=(9*ξ*(6*η - 1))/2;
      dphi_dη[8]=36*η + (9*ξ)/2 - 27*η*ξ - (81*η^2)/2 - 9/2;
      dphi_dη[9]=(81*η^2)/2 + 54*η*ξ - 45*η + (27*ξ^2)/2 - (45*ξ)/2 + 9;
      dphi_dη[10]=-27*ξ*(2*η + ξ - 1);

return phi,dphi_dξ,dphi_dη

end











end
