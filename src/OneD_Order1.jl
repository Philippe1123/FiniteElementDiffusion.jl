module OneD_Order1


function evaluate(x::Float64)
    phi=zeros(2,1)
    dphi=zeros(2,1)
phi[1]=(1-x)/2
phi[2]=(x+1)/2

dphi[1]=-1/2
dphi[2]=1/2

return phi,dphi

end











end
