
module h-MLMC_Routine

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using GaussianRandomFields
using ScatteredInterpolation
using Statistics


macro get_arg(key_name, default_value)
    @eval get_arg(args::Dict{Symbol, Any}, ::Val{$key_name}) = haskey(args, $key_name) ? args[$key_name] : $default_value
end

#@get_arg :max_index_set_param 6

@get_arg :minpadding index->0

get_arg(args::Dict{Symbol,Any}, arg::Symbol) = get_arg(args, Val(arg))

get_arg(args::Dict{Symbol,Any}, arg::Val{T}) where T = throw(ArgumentError(string("in init_lognormal, invalid key ", T, " found")))

get_max_index_set(index_set, Int64) = get_index_set(index_set, Int64)

get_max_index_set(::SL, args) = [Index(args)]

get_max_index_set(::Union{AD, U}, args) = get_index_set(get_arg(args, :max_search_space), get_arg(args, :max_index_set_param))




function Main()
###########Input



nshifts=8
nb_of_warm_up_samples=2
max_index_set_param=11 #8
numberoftol=60
NQoI=1
sample_method=QMC()
MaxLevel=6

index_set=ML()
isHigerOrderRefinement=false
isElementRefinement=true
correlateOnlyDiffs=false
###############


folder_with_elements=string(@__DIR__())
indices = get_max_index_set(index_set, MaxLevel)






Elements=Dict()
Nodes=Dict()
	if(isa(index_set,SL)||isa(index_set,ML))

  		if(isHigerOrderRefinement==false)
			Centers=Dict()
			isElementRefinement=true
  			type="h"
  		elseif(isHigerOrderRefinement==true)
  			type="p"
  			isElementRefinement=false
  		end
	else
		type="hp"
		isElementRefinement=true
		isHigerOrderRefinement=true
   	end
	println("ElementRefinement ",isElementRefinement)
	println("isHigerOrderRefinement ",isHigerOrderRefinement)
	NumberOfDicEntries=Dict()
	StringForAcces=Dict()
	ij=1
	LevelDict=Dict()
	Positions=Dict()

	for id in indices
		IntermPositions=Dict()
		IntermLevelDict=Dict()
		LevelDict[id]=IntermLevelDict
		Positions[id]=IntermPositions
	end

	for id in indices
		SizeId=length(id)
		Access="_";
			for i=1:SizeId
				Access=string(Access,id[i])
			end
		NumberOfDicEntries[id]=0
	#%%%% written only for MLMC
		if(correlateOnlyDiffs==true)
			NumberOfDicEntries[id]=NumberOfDicEntries[id]+1
			Access_test=string("_",id,"_M",id,'_',"S",id)
			 LevelDict[id][id]=Access_test
			 for (key,value) in diff(id)
	      #IntermLevelDict=LevelDict[key]
	            #   println(IntermLevelDict)
				NumberOfDicEntries[key]=NumberOfDicEntries[key]+1
				Access_test=string("_",key,"_M",id,'_',"S",key)
				LevelDict[key][id]=Access_test
			end
		end


		PathElement=string(string(folder_with_elements,string("/",type,"_refinement/Elements_L",Access)),".txt")
		Handle_Elements=open(PathElement)
		Element=readdlm(Handle_Elements,Int);
 		Element=Element[:,5:7]
 		Elements[id]=Element



		if((isa(index_set,SL)||isa(index_set,ML))&&isHigerOrderRefinement==false)
			PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/Nodes_L",Access)),".txt")
			PathElementCenters=string(string(folder_with_elements,string("/",type,"_refinement/ElementsCenter_L",Access)),".txt")
			Handle_PathElementCenters=open(PathElementCenters,"w")
 			Handle_Nodes=open(PathNodes)
 			Node=readdlm(Handle_Nodes);
			Node=Node[:,2:3]
			Nodes[id]=Node
			Center=compute_centers(Node,Element)
			Centers[id]=Center
   #Nodes[id]=[Centers[id];Nodes[id]] ###############################################################################################use centers to generate
			writedlm(Handle_PathElementCenters,Center)
			close(Handle_PathElementCenters)
			close(Handle_Nodes)
			println("h-ref")
		else
			PathNodes_elements=string(string(folder_with_elements,string("/",type,"_refinement/Nodes_L",Access)),".txt")
			Nodes_elements=readdlm(PathNodes_elements);
			Nodes_elements=Nodes_elements[:,2:3]

			if(correlateOnlyDiffs==false)
				PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",Access)),".txt")
				Handle_Nodes=open(PathNodes)
				Node=readdlm(Handle_Nodes);
				close(Handle_Nodes)
				Node=Node[:,2:3]
				Nodes[id]=Node
			end
			println("p-ref and hp-ref")
		end
		close(Handle_Elements)
	end

	if(correlateOnlyDiffs==true)
		Nodes=Dict()
		for id in indices
			Node_Dict=Dict()
			Nodes[id]=Node_Dict=Dict()
		end
		for id in indices
			PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",LevelDict[id][id])),".txt")
			Handle_Nodes=open(PathNodes)
			Node=readdlm(Handle_Nodes);
			close(Handle_Nodes)
			Node=Node[:,2:3]
			Nodes[id][id]=Node
			for (key,value) in diff(id)
				PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",LevelDict[key][id])),".txt")
				Handle_Nodes=open(PathNodes)
				Node=readdlm(Handle_Nodes);
				close(Handle_Nodes)
				Node=Node[:,2:3]
				Nodes[key][id]=Node
 			end
		end
	end



	distributions = [MultilevelEstimators.TruncatedNormal(0,1,-2,2) for i in 1:nterms]
	println(distributions[1])
	p=2
	exp_field = GaussianRandomFields.Matern(corr_len,smoothness,σ=1.0,p=p)

	println("P of covar equals")
	println(p)
	cov = CovarianceFunction(2,exp_field)


         # all other levels
	grfs=Dict()
	if(correlateOnlyDiffs==false)
		for index in indices
			println(index)
			Random.seed!(1234)
			grfs[index] = GaussianRandomField(cov,KarhunenLoeve(nterms),Nodes[index],Elements[index],quad=GaussLegendre())
			println(grfs[index])
		end


		for index in indices
			if(index>Level(0))
				index_1=index[1]-1
				index_1=Level(index_1)
				println(index)

				if(grfs[index].data.eigenfunc[1,1]==grfs[index_1].data.eigenfunc[1,1])
					println("Level ", index," and Level ",index_1, "same eigenfunc")
  #                Random.seed!(7328)
    #              println(GaussianRandomFields.sample(grfs[index])[13])
 				else
					println("Warning: Level ", index," and Level ",index_1, "DIFFERENT eigenfunc")
				end
			end
		end
	else
		for id in indices
			grfs_Dict=Dict()
			grfs[id]=grfs_Dict
		end
		for index in indices
			println(string("Master Field for Level: ",index))
			Random.seed!(1234)
			grfs[index][index]=GaussianRandomField(cov,KarhunenLoeve(nterms),Nodes[index][index],Elements[index],quad=GaussLegendre(),eigensolver=EigenSolver())
			Random.seed!(1234)
			println(grfs[index][index])
			for (key,value) in diff(index)
				println(string("Slave Fields for Level: ",index))
          #    println(Nodes)
		  		Random.seed!(1234)
				grfs[key][index] = GaussianRandomField(cov,KarhunenLoeve(nterms),Nodes[key][index],Elements[index],quad=GaussLegendre(),eigensolver=EigenSolver())
				Random.seed!(1234)
#              println("here")
				println(grfs[key][index])
				if(grfs[key][index].data.eigenfunc[1,1]==grfs[index][index].data.eigenfunc[1,1])
					println("Eigenfunctions Matching")
				else
					println("WARNING: Eigenfunctions Not Matching, Program will switch to interpolate")

				end

			end
			println("---------------------------------------------")

		end

	end
	println(grfs)


	if(isa(index_set,SL))
		increment = max_level
	else
		increment=0
	end










	sample_function = (index,ξ)->Sample_mapping(index, ξ, grf,mapping,pts)
    name="test"
    folder=string(string(@__DIR__(),"/Test")
   #ptgen=DigitalNet64_2(dim) # changed to sobol3
   ptgen=DigitalNet32(dim) # changed to sobol3


   estimator=MultilevelEstimators.Estimator(
   index_set, # index_set: ML, SL, TD...
   sample_method,
   sample_function,
   distributions,
   name = name, # estimator name
   folder = folder, # for report
   do_mse_splitting=true,
   min_splitting=0.9,
   max_splitting=0.91,
   nb_of_shifts=nshifts,
   nb_of_warm_up_samples=nb_of_warm_up_samples,
   max_index_set_param=max_index_set_param,
   continuate=true,
   nb_of_tols=numberoftol,
   nb_of_qoi = NQoI, # number of qoi
   point_generator=ptgen,
   sample_mul_factor=2.0,
   cost_model = level -> 10^(0.8 * level[1]),
   )


   #history = run(estimator,2.0e-5)
   history = run(estimator,2.0e-6)


end





function Sample_mapping(index::Index, ξ::Vector{T} where {T<:Real},grf::GaussianRandomField,mapping::Dict,pts::Array)




     ω=map(mapping[index],ξ)
     Zf = exp.(GaussianRandomFields.sample(grf,xi=ω[1:randdim(grf)])) # compute GRF
     Zf=vec(Zf)
     b=abs.(pts.^2/2-pts/2)
	 u1=b.*Zf.^(-1)
	 Qf = maximum(u1)

    dQ = Qf
    for (key,value) in diff(index)
		ω=map(mapping[key],ξ)
        Zc = exp.(GaussianRandomFields.sample(grf,xi=ω[1:randdim(grf)])) # compute GRF
        Zc=vec(Zc)
        b=abs.(pts.^2/2-pts/2)
   	    u1=b.*Zc.^(-1)
		Qc = maximum(u1)
        dQ += value*Qc
    end


return (dQ,Qf)



end

function Sample_field(index::Index, ξ::Vector{T} where {T<:Real},grfs::Dict,mapping::Function,pts::Array)




     ω=map(mapping,ξ)
     Zf = exp.(GaussianRandomFields.sample(grfs[index],xi=ω[1:randdim(grfs[index])])) # compute GRF
     Zf=vec(Zf)
     b=abs.(pts.^2/2-pts/2)
	 u1=b.*Zf.^(-1)
	 Qf = maximum(u1)

    dQ = Qf
    for (key,value) in diff(index)
		ω=map(mapping,ξ)
        Zc = exp.(GaussianRandomFields.sample(grfs[key],xi=ω[1:randdim(grfs[key])])) # compute GRF
        Zc=vec(Zc)
        b=abs.(pts.^2/2-pts/2)
   	    u1=b.*Zc.^(-1)
		Qc = maximum(u1)
        dQ += value*Qc
    end


return (dQ,Qf)



end



function compute_centers(p,t)
    d = size(p, 2)
    vec_t = vec(t)
    size_t = size(t)

    pts = Array{Float64}(undef, size(t, 1), d)
    @inbounds for i in 1:d
        x = reshape(p[vec_t, i], size_t)
        mean!(view(pts, :, i), x)
    end
    pts
end









end
