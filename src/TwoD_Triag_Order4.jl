module TwoD_Triag_Order4


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(15,1)
    dphi_dξ=zeros(15,1)
    dphi_dη=zeros(15,1)



    phi[1]=((η+ξ-1)*(4*η+4*ξ-1)*(4*η+4*ξ-2)*(4*η+4*ξ-3))/6;
    phi[2]=(ξ*(4*ξ-1)*(4*ξ-2)*(4*ξ-3))/6;
    phi[3]=(η*(4*η-1)*(4*η-2)*(4*η-3))/6;
    phi[4]=-(8*ξ*(η+ξ-1)*(4*η+4*ξ-2)*(4*η+4*ξ-3))/3;
    phi[5]=ξ*(4*ξ-1)*(4*η+4*ξ-3)*(4*η+4*ξ-4);
    phi[6]=-(8*ξ*(4*ξ-1)*(4*ξ-2)*(η+ξ-1))/3;
    phi[7]=(8*η*ξ*(4*ξ-1)*(4*ξ-2))/3;
    phi[8]=4*η*ξ*(4*η-1)*(4*ξ-1);
    phi[9]=(8*η*ξ*(4*η-1)*(4*η - 2))/3;
    phi[10]=-(8*η*(4*η-1)*(4*η-2)*(η+ξ-1))/3;
    phi[11]=4*η*(4*η-1)*(η+ξ-1)*(4*η+4*ξ-3);
    phi[12]=-(8*η*(η+ξ-1)*(4*η+4*ξ-2)*(4*η+4*ξ-3))/3;
    phi[13]=32*η*ξ*(η+ξ-1)*(4*η+4*ξ-3);
    phi[14]=-32*η*ξ*(4*ξ-1)*(η+ξ-1);
    phi[15]=-32*η*ξ*(4*η-1)*(η+ξ-1);

      dphi_dξ[ 1]=(128*η^3)/3+128*η^2*ξ-80*η^2+128*η*ξ^2-160*η*ξ+(140*η)/3+(128*ξ^3)/3-80*ξ^2+(140*ξ)/3-25/3;
      dphi_dξ[ 2]=(128*ξ^3)/3-48*ξ^2+(44*ξ)/3-1;
      dphi_dξ[ 3]=0;
      dphi_dξ[ 4]=-(128*η^3)/3-256*η^2*ξ+96*η^2-384*η*ξ^2+384*η*ξ-(208*η)/3-(512*ξ^3)/3+288*ξ^2-(416*ξ)/3+16;
      dphi_dξ[ 5]=128*η^2*ξ-16*η^2+384*η*ξ^2-288*η*ξ+28*η+256*ξ^3-384*ξ^2+152*ξ-12;
      dphi_dξ[ 6]=64*η*ξ-(224*ξ)/3-(16*η)/3-128*η*ξ^2+224*ξ^2-(512*ξ^3)/3+16/3;
      dphi_dξ[ 7]=(16*η*(24*ξ^2-12*ξ+1))/3;
      dphi_dξ[ 8]=4*η*(4*η-1)*(8*ξ-1);
      dphi_dξ[ 9]=(8*η*(4*η-1)*(4*η-2))/3;
      dphi_dξ[10]=-(8*η*(4*η-1)*(4*η-2))/3;
      dphi_dξ[11]=4*η*(4*η-1)*(8*η+8*ξ-7);
      dphi_dξ[12]=-(16*η*(24*η^2+48*η*ξ-36*η+24*ξ^2-36*ξ+13))/3;
      dphi_dξ[13]=32*η*(4*η^2+16*η*ξ-7*η+12*ξ^2-14*ξ+3);
      dphi_dξ[14]=-32*η*(8*η*ξ-10*ξ-η+12*ξ^2+1);
      dphi_dξ[15]=-32*η*(4*η-1)*(η+2*ξ-1);

    phi_dη[ 1]=(128*η^3)/3+128*η^2*ξ-80*η^2+128*η*ξ^2-160*η*ξ+(140*η)/3+(128*ξ^3)/3-80*ξ^2+(140*ξ)/3-25/3;
    phi_dη[ 2]=0;
    phi_dη[ 3]=(128*η^3)/3-48*η^2+(44*η)/3-1;
    phi_dη[ 4]=-(16*ξ*(24*η^2+48*η*ξ-36*η+24*ξ^2-36*ξ+13))/3;
    phi_dη[ 5]=4*ξ*(4*ξ-1)*(8*η+8*ξ-7);
    phi_dη[ 6]=-(8*ξ*(4*ξ-1)*(4*ξ-2))/3;
    phi_dη[ 7]=(8*ξ*(4*ξ-1)*(4*ξ-2))/3;
    phi_dη[ 8]=4*ξ*(8*η-1)*(4*ξ-1);
    phi_dη[ 9]=(16*ξ*(24*η^2-12*η+1))/3;
    phi_dη[10]=64*η*ξ-(16*ξ)/3-(224*η)/3-128*η^2*ξ+224*η^2-(512*η^3)/3+16/3;
    phi_dη[11]=256*η^3+384*η^2*ξ-384*η^2+128*η*ξ^2-288*η*ξ+152*η-16*ξ^2+28*ξ-12;
    phi_dη[12]=-(512*η^3)/3-384*η^2*ξ+288*η^2-256*η*ξ^2+384*η*ξ-(416*η)/3-(128*ξ^3)/3+96*ξ^2-(208*ξ)/3+16;
    phi_dη[13]=32*ξ*(12*η^2+16*η*ξ-14*η+4*ξ^2-7*ξ+3);
    phi_dη[14]=-32*ξ*(4*ξ-1)*(2*η+ξ-1);
    phi_dη[15]=-32*ξ*(8*η*ξ-ξ-10*η+12*η^2+1);


return phi,dphi_dξ,dphi_dη

end











end
