using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Test, Documenter, Orthography
doctest(Orthography)
