using Pkg
Pkg.activate(".")
Pkg.instantiate()
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
        "API documentation" => [
            "man/index.md",
            "man/internals.md"
        ]
    ]
    )

deploydocs(
    repo = "github.com/HCMID/Orthography.jl.git",
)    
