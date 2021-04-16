using DelimitedFiles

using LinearAlgebra

using GaussianRandomFields

using DigitalNets, LatticeRules

#using Plots

using PyPlot

using Printf

using Statistics

using LaTeXStrings

using SpecialFunctions

using SimpleMultigrid

using MultilevelEstimators


function main()


	# Number of grid points
	npt = 30
	h = 1/(npt-1)

	# Number of dimensions
	dim = 90

	# Gaussian random field
	mat = Matern(1, 3)
	covariance_function = CovarianceFunction(2, mat)
	pts = [i/(npt-1) - h/2 for i in 1:npt-1]
	grf = GaussianRandomField(covariance_function, KarhunenLoeve(dim), pts,pts)

	# Plot some realizations of the Gaussian random field
	sps = [exp.(sample(grf, xi=rand(dim) .- 1/2)) for _ in 1:10]
	#sps = [exp.(sample(grf)) for _ in 1:10] # for an actual Gaussian random field
	figure()
	surf(sps[1])
#	plot(pts, sps[1], legend=false, framestyle=:box, xlabel=L"x", ylabel=L"a(x, \omega)")
	for i in 2:length(sps)
		surf(sps[i])
	end
	savefig("random-fields.pdf")

	# Plot some PDE solutions
	sol = pde_solve.(sps)
#    figure()
#	surf(sol[1])

#	for i in 2:length(sol)
#		surf(sol[i])
#	end

#	savefig("pde-solutions.pdf")

	# Define function that returns the QoI
	f(x) = begin
  #		x = sqrt(2)*erfinv.(2*x .- 1) # transform to normal for actual Gaussian random field
	#	println(x)
	#	a = exp.(sample(grf, xi=x .- 1/2))

	 #   ω=ones(length(x),1)-abs.(2*x.-1)
	 ω=ones(length(x),1)
	    for id=1:length(x)
	    ω[id]=transform(TruncatedNormal(0,1,-2,2),x[id])
	    end
		a = exp.(sample(grf, xi=ω))
		u = pde_solve(a)
		u = u[length(u) ÷ 2]
	end

	f_ten(x) = begin
		ω=ones(length(x),1)
		out=ones(length(x),1)
		for id=1:length(x)
	    out[id]=1-abs.(2*x[id].-1)
		ω[id]=transform(TruncatedNormal(0,1,-2,2),out[id])
		end
		a = exp.(sample(grf, xi=ω))
		u = pde_solve(a)
		u = u[length(u) ÷ 2]
	end

	# Log2 of number of integration points
	nip = 16

	# Log2 of number of shifts
	nsh = 3

	# MC
	qpt = [rand(dim) for _ in 1:2^nip]
	dev = integrate2(f, "Random sampling", nip, 0, qpt)
	figure()

		 loglog(2 .^(1:nip), dev,"-o")
	# QMC, lattice rule
	gen = parse.(UInt32, readlines(joinpath(@__DIR__(),"exod2_base2_m20_CKN.txt")))
	lat = LatticeRule(gen, dim)
	slt = [ShiftedLatticeRule(lat) for s in 1:2^nsh]
	qpt = [slt[s][n] for n in 0:2^(nip - nsh + 1)-1, s in 1:2^nsh]
	dev = integrate2(f, "Lattice rule", nip - nsh + 1, nsh, qpt)
	loglog(2 .^(nsh:nip), dev,"-o")


	# QMC, lattice rule with tent
	gen = parse.(UInt32, readlines(joinpath(@__DIR__(),"exod2_base2_m20_CKN.txt")))
	lat = LatticeRule(gen, dim)
	slt = [ShiftedLatticeRule(lat) for s in 1:2^nsh]
	qpt = [slt[s][n] for n in 0:2^(nip - nsh + 1)-1, s in 1:2^nsh]
	dev = integrate2(f_ten, "Lattice rule wiht tent", nip - nsh + 1, nsh, qpt)
	loglog(2 .^(nsh:nip), dev,"-o")

	# QMC, digital net
	dgn = DigitalNet32(dim)
	sdn = [DigitalShiftedDigitalNets32(dgn) for s in 1:2^nsh]
	qpt = [sdn[s][n] for n in 0:2^(nip - nsh + 1)-1, s in 1:2^nsh]
	dev = integrate2(f, "Digital net", nip - nsh + 1, nsh, qpt)
	loglog(2 .^(nsh:nip), dev,"-o")

	# QMC, digital net, order 2
	dgn = DigitalNet64(dim)
	sdn = [DigitalShiftedDigitalNets64(dgn) for s in 1:2^nsh]
	qpt = [sdn[s][n] for n in 0:2^(nip - nsh + 1)-1, s in 1:2^nsh]
	dev = integrate2(f, "Digital net (order 2)", nip - nsh + 1, nsh, qpt)
	loglog(2 .^(nsh:nip), dev,"-o")
#	gui()

	# QMC, digital net, order 3
	dgn = DigitalNet64_2(dim)
	sdn = [DigitalShiftedDigitalNets64(dgn) for s in 1:2^nsh]
	qpt = [sdn[s][n] for n in 0:2^(nip - nsh + 1)-1, s in 1:2^nsh]
	dev = integrate2(f, "Digital net (order 3)", nip - nsh + 1, nsh, qpt)
	loglog(2 .^(nsh:nip), dev,"-o")
#	gui()
vec=[10; 10^3]

loglog(vec,(vec.^(-1/2))./10,label=1/2)
loglog(vec,(vec.^(-1))./10,label=1/2)
loglog(vec,(vec.^(-1.5))./10,label=1/2)
loglog(vec,vec.^(-2),label=1/2)
legend(("MC","Lattice (exo2_base2_m20)","Lattice with tent","sobol_Cs","sobol_alpha2_BS","sobol_alpha3_BS","O(n^-1/2)","O(n^-1)","O(n^-1.5)","O(n^-2)"))
xlabel("Number of samples n")
ylabel("root mean square error")
title("2D Lognormal Diffusion Problem with truncated Normal distributed [-2,2]")

	# Plot the result
	savefig("higher-order.pdf")
end

function pde_solve(af)
	Af = elliptic2d(af)
    bf = fill(one(eltype(Af)), size(Af, 1))
    uf = Af\bf
	return uf
end

function integrate2(fun, name, nip, nsh, qpt)
	dev = zeros(nip)
	qoi = zeros(2^nip, 2^nsh)
	npr = 1
	for ell in 1:nip
		nxt = cld(2^ell, 2) # 1, 1, 2, 4, 8, ...
		for s in 1:2^nsh
			for n in npr:nxt
				qoi[n, s] = fun(qpt[n, s])
			end
		end
		mnr = mean(view(qoi, 1:nxt, :), dims=1)
		mel = mean(mnr)
		sel = nsh == 0 ? std(view(qoi, 1:nxt, :)) / sqrt(nxt) : std(mnr) / sqrt(2^nsh)
		@printf("%s with %d points, mean = %7.5f, std estimator = %13.7e\n", name, nxt, mel, sel)
		dev[ell] = sel
		npr = nxt + 1
	end
	dev
end

main()
