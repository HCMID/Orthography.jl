using Orthography
using Test


include("test_constructors.jl")
include("test_tokentypes.jl")
include("test_codepoints.jl")


#=
@testset "Test mechanism of alternative orthographic implementatoin" begin
    struct Latin23  <: OrthographicSystem
    end
    function codepoints(ortho::Latin23)
        "UVIJ"
    end
    latin = Orthography.Latin23()
    @test codepoints(latin) == "UVIJ"
end
=#