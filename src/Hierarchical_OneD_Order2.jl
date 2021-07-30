module Hierarchical_OneD_Order2


function evaluate(x::Float64)
    phi=zeros(3,1)
    dphi=zeros(3,1)
    phi[1]=(1-x)/2
    phi[2]=(x+1)/2

phi[3]=sqrt(3/2)*(x^2/2 - 1/2)

dphi[1]=-1/2
dphi[2]=1/2
dphi[3]=sqrt(3/2)*x

return phi,dphi

end











end
