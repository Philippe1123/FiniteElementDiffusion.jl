
module p_MLQMC_LNA_Routine

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
	OrderOfElementsPerLevel=Dict()
	OrderOfElementsPerLevel[Level(0)]="TwoD_Triag_Order1"
	OrderOfElementsPerLevel[Level(1)]="TwoD_Triag_Order2"
	OrderOfElementsPerLevel[Level(2)]="TwoD_Triag_Order3"
	OrderOfElementsPerLevel[Level(3)]="TwoD_Triag_Order4"
	OrderOfElementsPerLevel[Level(4)]="TwoD_Triag_Order5"

	GaussPointOrdering=Dict()
	OrderingPerLevel=Dict()
	OrderingPerLevel[Level(0)]=[7,16,10,15,2,11,3,1,9,6,13,4,12,8,14,5]
	OrderingPerLevel[Level(1)]=[7,16,15,10,2,11,3,1,9,6,13,4,8,12,14,5]
	GaussPointOrdering[Level(0)]=OrderingPerLevel

	OrderingPerLevel=Dict()
	OrderingPerLevel[Level(1)]=[13,17,19,10,5,16,6,1,9,12,18,7,8,14,15,11,2,3,4]
	OrderingPerLevel[Level(2)]=[13,17,2,19,10,5,16,3,6,1,9,12,18,7,8,14,4,15,11]
	GaussPointOrdering[Level(1)]=OrderingPerLevel

	OrderingPerLevel=Dict()
	OrderingPerLevel[Level(2)]=[4,20,8,22,13,14,19,9,15,1,12,3,21,16,11,17,10,18,2,26,28,7,25,6,27,5,23,24]
	OrderingPerLevel[Level(3)]=[4,26,28,20,7,8,22,13,19,14,25,9,15,1,12,6,3,27,16,21,11,17,10,5,18,23,24,2]
	GaussPointOrdering[Level(2)]=OrderingPerLevel

	OrderingPerLevel=Dict()
	OrderingPerLevel[Level(3)]=[4,21,24,27,13,14,30,10,26,5,20,15,6,1,9,12,3,25,7,31,8,28,16,11,29,22,23,2,33,17,36,32,18,37,34,19,35]
	OrderingPerLevel[Level(4)]=[4,21,24,27,13,33,14,17,26,30,36,32,10,5,20,15,18,6,1,9,3,25,12,7,8,37,34,28,31,19,16,35,11,29,22,23,2]
	GaussPointOrdering[Level(3)]=OrderingPerLevel


	OrderingPerLevel=Dict()
	OrderingPerLevel[Level(4)]=[9,7,18,2,25,12,1,10,3,37,34,11,29,28,6,46,43,38,35,30,8,17,24,39,44,33,50,52,36,42,45,49,55,51,59,60,61,4,16,13,27,22,20,19,31,5,21,14,23,15,40,32,26,47,41,48,53,57,54,58,56]
	GaussPointOrdering[Level(4)]=OrderingPerLevel


	nshifts=8
	nb_of_warm_up_samples=2
	max_index_set_param=11 #8
	numberoftol=60
	NQoI=1
	is_qmc=true
	MaxLevel=4
	nterms=300
	corr_len=0.01
	smoothness=2.0
	is_analyse=false
	index_set=ML()
	isHigerOrderRefinement=true
	isElementRefinement=false
	correlateOnlyDiffs=true
	is_multiple_qoi=false
	###############


	folder_with_elements=string(@__DIR__())
	indices = get_max_index_set(index_set, MaxLevel)





	Elements_Full=Dict()
	Elements=Dict()
	Nodes=Dict()
	RandomFieldEvaluationPoints=Dict()
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
		Element_All=readdlm(Handle_Elements,Int);
		Element=Element_All[:,5:7]
		Elements[id]=Element
		Elements_Full[id]=Element_All[:,5:end]


		if((isa(index_set,SL)||isa(index_set,ML))&&isHigerOrderRefinement==false)
			PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/Nodes_L",Access)),".txt")
			PathElementCenters=string(string(folder_with_elements,string("/",type,"_refinement/ElementsCenter_L",Access)),".txt")
			Handle_PathElementCenters=open(PathElementCenters,"w")
			Handle_Nodes=open(PathNodes)
			Node=readdlm(Handle_Nodes);
			Node=Node[:,2:3]
			Nodes[id]=Node
			Center=compute_centers(Node,Element)
			RandomFieldEvaluationPoints[id]=Center
			#Nodes[id]=[Centers[id];Nodes[id]] ###############################################################################################use centers to generate
			writedlm(Handle_PathElementCenters,RandomFieldEvaluationPoints)
			close(Handle_PathElementCenters)
			close(Handle_Nodes)
			println("h-ref")
		else
			PathNodes_elements=string(string(folder_with_elements,string("/",type,"_refinement/Nodes_L",Access)),".txt")
			Nodes_elements=readdlm(PathNodes_elements);
			Nodes_elements=Nodes_elements[:,2:3]

			if(correlateOnlyDiffs==false)
				PathRandomFieldEvaluationPoints=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",Access)),".txt")
				Handle_RandomFieldEvaluationPoints=open(PathRandomFieldEvaluationPoints)
				RandomFieldEvaluationPoint=readdlm(Handle_RandomFieldEvaluationPoints);
				close(Handle_RandomFieldEvaluationPoints)
				RandomFieldEvaluationPoint=RandomFieldEvaluationPoint[:,2:3]
				RandomFieldEvaluationPoints[id]=RandomFieldEvaluationPoint
end
				PathNodes=string(string(folder_with_elements,string("/",type,"_refinement/Nodes_L",Access)),".txt")
				Handle_Nodes=open(PathNodes)
				Node=readdlm(Handle_Nodes);
				Node=Node[:,2:3]
				Nodes[id]=Node


			println("p-ref and hp-ref")
		end
		close(Handle_Elements)
	end

	if(correlateOnlyDiffs==true)
		RandomFieldEvaluationPoints=Dict()
		for id in indices
			RandomFieldEvaluationPoints_Dict=Dict()
			RandomFieldEvaluationPoints[id]=RandomFieldEvaluationPoints_Dict=Dict()
		end
		for id in indices
			PathRandomFieldEvaluationPoints=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",LevelDict[id][id])),".txt")
			Handle_RandomFieldEvaluationPoints=open(PathRandomFieldEvaluationPoints)
			RandomFieldEvaluationPoint=readdlm(Handle_RandomFieldEvaluationPoints);
			close(Handle_RandomFieldEvaluationPoints)
			RandomFieldEvaluationPoint=RandomFieldEvaluationPoint[:,2:3]
			RandomFieldEvaluationPoints[id][id]=RandomFieldEvaluationPoint
			for (key,value) in diff(id)
				PathRandomFieldEvaluationPoints=string(string(folder_with_elements,string("/",type,"_refinement/GaussPoints_L",LevelDict[key][id])),".txt")
				Handle_RandomFieldEvaluationPoints=open(PathRandomFieldEvaluationPoints)
				RandomFieldEvaluationPoint=readdlm(Handle_RandomFieldEvaluationPoints);
				close(Handle_RandomFieldEvaluationPoints)
				RandomFieldEvaluationPoint=RandomFieldEvaluationPoint[:,2:3]
				RandomFieldEvaluationPoints[key][id]=RandomFieldEvaluationPoint
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
			grfs[index] = GaussianRandomField(cov,KarhunenLoeve(nterms),RandomFieldEvaluationPoints[index],Elements[index],quad=GaussLegendre())
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
			grfs[index][index]=GaussianRandomField(cov,KarhunenLoeve(nterms),RandomFieldEvaluationPoints[index][index],Elements[index],quad=GaussLegendre(),eigensolver=EigenSolver())
			Random.seed!(1234)
			println(grfs[index][index])
			for (key,value) in diff(index)
				println(string("Slave Fields for Level: ",index))
				#    println(Nodes)
				Random.seed!(1234)
				grfs[key][index] = GaussianRandomField(cov,KarhunenLoeve(nterms),RandomFieldEvaluationPoints[key][index],Elements[index],quad=GaussLegendre(),eigensolver=EigenSolver())
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
	sample_function = correlateOnlyDiffs ? (index, ξ) -> Diffusion_cslo(index, ξ, grfs,Nodes,Elements_Full,isHigerOrderRefinement,isElementRefinement,increment,correlateOnlyDiffs,RandomFieldEvaluationPoints,OrderOfElementsPerLevel,GaussPointOrdering) : (index, ξ) -> Diffusion(index, ξ, grfs,Nodes,Elements_Full,isHigerOrderRefinement,isElementRefinement,increment,correlateOnlyDiffs,RandomFieldEvaluationPoints,OrderOfElementsPerLevel,GaussPointOrdering)
	isa(index_set,SL) ? println("All samples taken on level ", max_level) : println()



	folder=string(@__DIR__(),"/",name)


	if(isdir(folder)==false)
		mkdir(folder)
	else
		rm(folder,recursive=true)
		mkdir(folder)
	end


	#ptgen=DigitalNet64_2(dim) # changed to sobol3
	ptgen=DigitalNet32(nterms) #


	estimator=MultilevelEstimators.Estimator(
	index_set, # index_set: ML, SL, TD...
	sample_method,
	sample_function,
	distributions,
	name = name, # estimator name
	folder = folder, # for report
	do_mse_splitting=false,
	#  min_splitting=0.01,
	#   max_splitting=0.1,
	nb_of_shifts=nshifts,
	nb_of_warm_up_samples=nb_of_warm_up_samples,
	max_index_set_param=max_index_set_param,
	continuate=true,
	nb_of_tols=numberoftol,
	nb_of_qoi = NQoI, # number of qoi
	point_generator=ptgen,
	sample_mul_factor=2.0,
	)


	# history = run(estimator,2.0e-5)
	history = run(estimator,2.0e-6)


end





function Diffusion(index::Index, ξ::Vector{T} where {T<:Real}, grf::Dict, Nodes::Dict, Elements::Dict,isHigerOrderRefinement::Bool,isElementRefinement::Bool,increment::Int64,correlateOnlyDiffs::Bool,RandomFieldEvaluationPoints::Dict,OrderOfElementsPerLevel::Dict,GaussPointOrdering::Dict)

	StepChange=0
	if(length(increment)==length(index))
		index=index+Level(increment)
	end

	Nodes_Fine=Nodes[index]
	Elements_Fine=Elements[index]
	RandomFieldEvaluationPoints_Fine=RandomFieldEvaluationPoints[index]
	Zf = GaussianRandomFields.sample(grf[index],xi=ξ) # compute GRF
	Zf=exp.(Zf)

	NumberOfGaussPointsPerElement_Fine=Int64(size(RandomFieldEvaluationPoints_Fine,1)/size(Elements_Fine,1))
	NumberOfElements=size(Elements_Fine,1)


	#itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Fine', Zf);
	#Zf=evaluate(itp, RandomFieldEvaluationPoints_Fine')

	ElemType=OrderOfElementsPerLevel[index]
	QuadPoints=NumberOfGaussPointsPerElement_Fine
	MaterialParam=Dict()

	MatrixForm=reshape(Zf,NumberOfGaussPointsPerElement_Fine,NumberOfElements)'
	for id=1:NumberOfElements
		MaterialParam[id]=MatrixForm[id,1:end]
	end



	solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]),GaussPointOrdering=GaussPointOrdering[index])
	Qf=solver2D.main(Nodes_Fine,Elements_Fine,MaterialParam,solverparam)


	itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Fine', Qf);
	Qf = evaluate(itp,[0.5 0.5]')

	dQ = Qf
	if(increment==0)
		for (key,value) in diff(index)
			index_1=key
			Nodes_Coarse=Nodes[index_1]
			Elements_Coarse=Elements[index_1]
			RandomFieldEvaluationPoints_Coarse=RandomFieldEvaluationPoints[index_1]

			if(grf[index_1].data.eigenfunc[1,1]==grf[index].data.eigenfunc[1,1])
				Zc=GaussianRandomFields.sample(grf[index_1],xi=ξ)
				#				itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Coarse', Zc);
				#				Zc=evaluate(itp, RandomFieldEvaluationPoints_Coarse')
				Zc=exp.(Zc)
			else
				itp = ScatteredInterpolation.interpolate(NearestNeighbor(), RandomFieldEvaluationPoints_Fine', Zf);
				Zc=evaluate(itp, RandomFieldEvaluationPoints_Coarse')
				Zc=vec(Zc)
			end


			NumberOfGaussPointsPerElement_Coarse=Int64(size(RandomFieldEvaluationPoints_Coarse,1)/size(Elements_Coarse,1))
			NumberOfElements=size(Elements_Coarse,1)


			ElemType=OrderOfElementsPerLevel[index_1]
			QuadPoints=NumberOfGaussPointsPerElement_Coarse
			MaterialParam=Dict()

			#			for id=1:NumberOfElements MaterialParam[id]=Zc[id] end

			MatrixForm=reshape(Zc,NumberOfGaussPointsPerElement_Coarse,NumberOfElements)'
			for id=1:NumberOfElements
				MaterialParam[id]=MatrixForm[id,1:end]
			end

			solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]),GaussPointOrdering=GaussPointOrdering[index_1])
			Qc=solver2D.main(Nodes_Coarse,Elements_Coarse,MaterialParam,solverparam)

			itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Coarse', Qc);
			Qc = evaluate(itp,[0.5 0.5]')

			dQ += value*Qc
		end
	end
	return (dQ,Qf)
end




#cslo= correlate only successive levels
function Diffusion_cslo(index::Index, ξ::Vector{T} where {T<:Real}, grfs::Dict, Nodes::Dict, Elements::Dict,isHigerOrderRefinement::Bool,isElementRefinement::Bool,increment::Int64,correlateOnlyDiffs::Bool,RandomFieldEvaluationPoints::Dict,OrderOfElementsPerLevel::Dict,GaussPointOrdering::Dict)

	#println("Slope_cslo")
	StepChange=0
	if(length(increment)==length(index))
		index=index+Level(increment)
	end


	RandomFieldEvaluationPoints_Fine=RandomFieldEvaluationPoints[index][index]
	Elements_Fine=Elements[index]
	Nodes_Fine=Nodes[index]
	grf=grfs[index][index]
	Zf = GaussianRandomFields.sample(grf,xi=ξ[1:randdim(grf)]) # compute GRF
	Zf=exp.(Zf)
	#    StringExtension=Extension[index][index][4:end]
	NumberOfGaussPointsPerElement_Fine=Int64(size(RandomFieldEvaluationPoints_Fine,1)/size(Elements_Fine,1))
	NumberOfElements=size(Elements_Fine,1)
	ElemType=OrderOfElementsPerLevel[index]
	QuadPoints=NumberOfGaussPointsPerElement_Fine
	MaterialParam=Dict()
	MatrixForm=reshape(Zf,NumberOfGaussPointsPerElement_Fine,NumberOfElements)'
	for id=1:NumberOfElements
		MaterialParam[id]=MatrixForm[id,1:end]
	end
	solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]),GaussPointOrdering=GaussPointOrdering[index][index])
	Qf=solver2D.main(Nodes_Fine,Elements_Fine,MaterialParam,solverparam)
	itp = ScatteredInterpolation.interpolate(Polyharmonic(), Nodes_Fine', Qf);
	Qf = evaluate(itp,[0.5 0.5]')



	dQ = Qf

	if(increment==0)
		for (key,value) in diff(index)

			#    index_1=index[1]-1
			index_1=key
			RandomFieldEvaluationPoints_Coarse=RandomFieldEvaluationPoints[index_1][index]
			Elements_Coarse=Elements[index_1]
			Nodes_Coarse=Nodes[index_1]
	#		StringExtension=Extension[index_1][index][4:end]

			if(grfs[index_1][index].data.eigenfunc[1,1]==grfs[index][index].data.eigenfunc[1,1])
				Zc=GaussianRandomFields.sample(grfs[index_1][index],xi=ξ[1:randdim(grfs[index_1][index])])
				Zc=exp.(Zc)
				#      println("success")
			else
				#      println("fail")
				itp = ScatteredInterpolation.interpolate(NearestNeighbor(), RandomFieldEvaluationPoints_Fine', Zf);
				Zc=evaluate(itp, RandomFieldEvaluationPoints_Coarse')
				Zc=vec(Zc)
			end
			NumberOfGaussPointsPerElement_Coarse=Int64(size(RandomFieldEvaluationPoints_Coarse,1)/size(Elements_Coarse,1))
			NumberOfElements=size(Elements_Coarse,1)


			ElemType=OrderOfElementsPerLevel[index_1]
			QuadPoints=NumberOfGaussPointsPerElement_Coarse
			MaterialParam=Dict()

			#			for id=1:NumberOfElements MaterialParam[id]=Zc[id] end

			MatrixForm=reshape(Zc,NumberOfGaussPointsPerElement_Coarse,NumberOfElements)'
			for id=1:NumberOfElements
				MaterialParam[id]=MatrixForm[id,1:end]
			end

			solverparam=(elemtype =ElemType, Qpt=QuadPoints, Nelem=NumberOfElements, Order=parse(Int,ElemType[end]),GaussPointOrdering=GaussPointOrdering[index_1][index])
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
