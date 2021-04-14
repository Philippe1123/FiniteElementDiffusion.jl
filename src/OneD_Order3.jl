module OneD_Order3


function evaluate(x::Float64)
    phi=zeros(4,1)
    dphi=zeros(4,1)
phi[1]=-9*(x-1)*(x-1/3)*(x+1/3)/16
phi[2]=9*(x-1/3)*(x+1/3)*(x+1)/16
phi[3]=27*(x-1)*(x-1/3)*(x+1)/16
phi[4]=-27*(x-1)*(x+1/3)*(x+1)/16

dphi[1]=1/16*(-27*x^2+18*x+1)
dphi[2]=1/16*(27*x^2+18*x-1)
dphi[3]=9/16*(9*x^2-2*x-3)
dphi[4]=-9/16*(9*x^2+2*x-3)

return phi,dphi

end











end
