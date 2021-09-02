# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
# Run this from repository root to serve:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'julia -e 'using LiveServer; serve(dir="docs/build")' 
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions
using Orthography

makedocs(
    sitename = "Orthography",
    pages = [
        "Overview" => "index.md",
        "Guide" => [
            "guide/guide.md",
            "guide/applications.md"
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
