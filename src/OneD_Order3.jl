module OneD_Order3


function evaluate(x::Float64)
    phi=zeros(4,1)
    dphi=zeros(4,1)
phi[1]=-9*(x-1)*(x-1/3)*(x+1/3)/16
phi[2]=9*(x-1/3)*(x+1/3)*(x+1)/16
phi[3]=27*(x-1)*(x-1/3)*(x+1)/16
phi[4]=-27*(x-1)*(x+1/3)*(x+1)/16

dphi[1]=9/16*(-3*x^2+2*x+1/9)
dphi[2]=9/16*(3*x^2+2*x-1/9)
dphi[3]=27/16*(3*x^2-2/3*x-1)
dphi[4]=-27/16*(3*x^2+2/3*x-1)

return phi,dphi

end











end
