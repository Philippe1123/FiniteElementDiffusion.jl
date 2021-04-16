# FiniteElementDiffusion

This package solves a 1D and a 2D stationary diffusion equation by means of the Finite Element method.
Elements up to and including order 3 are available.

∇.⟦D ∇u⟧=f

add package by typing
```julia
pkg> add https://github.com/Philippe1123/FiniteElementDiffusion.jl.git
```

To run the example type
```julia
using FiniteElementDiffusion
diffusion1D_Example.Main()
diffusion2D_Example_Structured_Quad.Main()
diffusion2D_Example_UnStructured_Quad.Main()
```
