
module h_MLMC_Routine

using DelimitedFiles
using FiniteElementDiffusion
using PyPlot
using GaussianRandomFields
using ScatteredInterpolation
using Statistics
using MultilevelEstimators
using  Random
using Dates
using LatticeRules
using DigitalNets


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
nb_of_warm_up_samples=10
max_index_set_param=11 #8
numberoftol=60
NQoI=1
is_qmc=false
MaxLevel=3
nterms=400
corr_len=0.3
smoothness=4.0
is_analyse=false
index_set=ML()
isHigerOrderRefinement=false
isElementRefinement=true
correlateOnlyDiffs=false
is_multiple_qoi=false
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


	if is_qmc
	  sample_method=QMC()
	else
		sample_method=MC()
	end



	name = "Diffusion2D "
	name = is_analyse ? string(name,"analyse ") : name
	name = isa(index_set,AD) ? string(name,"A") : name
	name = isa(index_set,ML) ? string(name,"ML") : MultilevelEstimators.ndims(index_set) > 1 ? string(name,"MI") : name
	name = is_qmc ? string(name,"Q") : name
	name = string(name,"MC")
	name = isHigerOrderRefinement ? string(name,"_High") : string(name,"_Ref")
	name = is_multiple_qoi ? string(name," (multiple)") : name
	name = string(name,"_")
	timenow = Dates.now()
	timenow = Dates.format(timenow, "dd-mm-yyyy-T:HH:MM:SS")
	name = string(name,timenow)
	#nb_of_qoi = is_multiple_qoi ? Int(Lx/he*2^(max_level-1)+1) : 1
	sample_function = correlateOnlyDiffs ? (index, ξ) -> Diffusion_cslo(index, ξ, grfs,Nodes,Elements,isHigerOrderRefinement,isElementRefinement,increment,correlateOnlyDiffs) : (index, ξ) -> Diffusion(index, ξ, grfs,Nodes,Elements,isHigerOrderRefinement,isElementRefinement,increment,correlateOnlyDiffs,Centers)
	isa(index_set,SL) ? println("All samples taken on level ", max_level) : println()



	folder=string(@__DIR__(),"/",name)


	    if(isdir(folder)==false)
	    mkdir(folder)
	    else
	        rm(folder,recursive=true)
	        mkdir(folder)
	    end


   #ptgen=DigitalNet64_2(dim) # changed to sobol3
   #ptgen=DigitalNet32(nterms) # changed to sobol3


   estimator=MultilevelEstimators.Estimator(
   index_set, # index_set: ML, SL, TD...
   sample_method,
   sample_function,
   distributions,
   name = name, # estimator name
   folder = folder, # for report
   do_mse_splitting=true,
 #  min_splitting=0.01,
#   max_splitting=0.1,
   #nb_of_shifts=nshifts,
   nb_of_warm_up_samples=nb_of_warm_up_samples,
   max_index_set_param=max_index_set_param,
   continuate=true,
   nb_of_tols=numberoftol,
   nb_of_qoi = NQoI, # number of qoi
   #point_generator=ptgen,
   #sample_mul_factor=2.0,
   )


   history = run(estimator,2.0e-5)
   #history = run(estimator,2.0e-6)


end





function Diffusion(index::Index, ξ::Vector{T} where {T<:Real}, grf::Dict, Nodes::Dict, Elements::Dict,isHigerOrderRefinement::Bool,isElementRefinement::Bool,increment::Int64,correlateOnlyDiffs::Bool,Centers::Dict)

	StepChange=0
	if(length(increment)==length(index))
		index=index+Level(increment)
	end

	Nodes_Fine=Nodes[index]
	Elements_Fine=Elements[index]
	Centers_Fine=Centers[index]
	Zf = GaussianRandomFields.sample(grf[index],xi=ξ) # compute GRF


	itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Fine', Zf);
	Zf=evaluate(itp, Centers_Fine')

	Zf=exp.(Zf)



	ElemType="TwoD_Triag_Order1"
	QuadPoints=16
	MaterialParam=Dict()
	NumberOfElements=size(Elements_Fine,1)
	for id=1:NumberOfElements MaterialParam[id]=Zf[id] end
	solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
	Qf=solver2D.main(Nodes_Fine,Elements_Fine,MaterialParam,solverparam)
	itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Fine', Qf);
	Qf = evaluate(itp,[0.5 0.5]')

    dQ = Qf
	if(increment==0)
		for (key,value) in diff(index)

			index_1=key
			Nodes_Coarse=Nodes[index_1]
			Elements_Coarse=Elements[index_1]
			Centers_Coarse=Centers[index_1]

			if(grf[index_1].data.eigenfunc[1,1]==grf[index].data.eigenfunc[1,1])
				Zc=GaussianRandomFields.sample(grf[index_1],xi=ξ)
				itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Coarse', Zc);
				Zc=evaluate(itp, Centers_Coarse')
				Zc=exp.(Zc)
			else
				itp = ScatteredInterpolation.interpolate(NearestNeighbor(), Centers_Fine', Zf);
				Zc=evaluate(itp, Centers_Coarse')
				Zc=vec(Zc)
			end

			#Qc = Slope_Sample(Zc,MatlabSampler,folder,index_1,true,isHigerOrderRefinement,isElementRefinement,StepChange)
			MaterialParam=Dict()
			NumberOfElements=size(Elements_Coarse,1)
			for id=1:NumberOfElements MaterialParam[id]=Zc[id] end
			solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]))
			Qc=solver2D.main(Nodes_Coarse,Elements_Coarse,MaterialParam,solverparam)

			itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Coarse', Qc);
			Qc = evaluate(itp,[0.5 0.5]')

			dQ += value*Qc
		end
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
