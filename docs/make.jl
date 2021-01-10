using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions, Orthography

makedocs(sitename = "Orthography Documentation")
