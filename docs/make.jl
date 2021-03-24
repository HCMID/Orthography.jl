using Pkg
Pkg.activate(".")
push!(LOAD_PATH,"../")


using Documenter, DocStringExtensions
using Orthography

makedocs(
    sitename = "Orthography.jl",
    pages = [
        "Home" => "index.md",
        "Guide" => [
            "guide/guide.md"
        ],
        "API documenatation" => "man/index.md"

    ]
    )
