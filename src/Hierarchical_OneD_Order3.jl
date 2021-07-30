module Hierarchical_OneD_Order3


function evaluate(x::Float64)
    phi=zeros(4,1)
    dphi=zeros(4,1)
    phi[1]=(1-x)/2
    phi[2]=(x+1)/2

phi[3]=x^2/2 - 1/2
phi[4]=(5*x^4)/8 - (3*x^2)/4 + 1/8

dphi[1]=-1/2
dphi[2]=1/2
dphi[3]=x
dphi[4]=(5*x^3)/2 - (3*x)/2

return phi,dphi

end











end
