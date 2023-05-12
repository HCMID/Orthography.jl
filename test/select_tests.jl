using Pkg
Pkg.activate("..")


using Orthography
using CitableText, CitableCorpus, CitableBase
using Unicode
using TestSetExtensions
using Test

@testset "All the tests" begin
    println(map(s -> replace(s, r".jl$" => ""), ARGS))
    @includetests map(s -> replace(s, r".jl$" => ""), ARGS)
end
