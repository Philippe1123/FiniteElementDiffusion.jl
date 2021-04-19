module cubature_points

using QuadGK
using FiniteElementDiffusion


#Wrapper which returns 2D cubature points for triangle or quadrilateral

function getCubaturePoints(typeOfElement::String,numberOfCubs::Int64)

if(occursin("Triag",typeOfElement))

    out,H=cubature_triangle.evaluate(numberOfCubs)
    x=out[:,1]
    y=out[:,2]
    H1=H
    H2=1.

elseif(occursin("Quad",typeOfElement))

    x,H1=gauss(numberOfCubs)
    y,H2=gauss(numberOfCubs)

end
return x,y,H1,H2

end









return











end
