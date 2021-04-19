module TwoD_Quad_Numerical_Coeffs_Order2


function evaluate(ξ::Float64,η::Float64)
    phi=zeros(9,1)
    dphi_dξ=zeros(9,1)
    dphi_dη=zeros(9,1)





    Coeffs =[       0         0         0         0         0         0         0         0    1.0000
                    0         0         0         0         0    0.5000         0   -0.5000         0
                    0         0         0         0   -0.5000         0    0.5000         0         0
               0.2500   -0.2500    0.2500   -0.2500         0         0         0         0         0
                    0         0         0         0         0    0.5000         0    0.5000   -1.0000
                    0         0         0         0    0.5000         0    0.5000         0   -1.0000
              -0.2500   -0.2500    0.2500    0.2500    0.5000         0   -0.5000         0         0
              -0.2500    0.2500    0.2500   -0.2500         0   -0.5000         0    0.5000         0
               0.2500    0.2500    0.2500    0.2500   -0.5000   -0.5000   -0.5000   -0.5000    1.0000]

    ξ=ξ.*ones(1,9);
    η=η.*ones(1,9);

    N_m=[ones(9,1) ξ' η' (ξ.*η)' (ξ.^2)' (η.^2)' ((ξ.^2).*η)' (ξ.*η.^2)' ((ξ.^2).*(η.^2))'].*Coeffs';
    N_i=zeros(9,1);


    for id=1:9

        N_i[id,1]=sum(N_m[id,:]);
    end
    phi=N_i;



    dphi_dξ=zeros(9,1);
    dphi_dη=zeros(9,1);


    dphi_dξ_mat=[zeros(9,1) ones(9,1) zeros(9,1) (η)' ((2*ξ))' zeros(9,1) ((2*ξ).*η)' (η.^2)' ((2*ξ).*(η.^2))'].*Coeffs';
    dphi_dη_mat=[zeros(9,1) zeros(9,1) ones(9,1) (ξ)' zeros(9,1) ((2*η))' (ξ.^2)' ((2*ξ).*η)' ((ξ.^2).*(2*η))'].*Coeffs';

    for id=1:9

        dphi_dξ[id,1]=sum(dphi_dξ_mat[id,:]);
        dphi_dη[id,1]=sum(dphi_dη_mat[id,:]);
    end

return phi,dphi_dξ,dphi_dη

end


end
