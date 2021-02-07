using Orthography
using Test


@testset "Test supertype of orthography" begin
    greek = literaryGreek()
    @test typeof(greek) == LiteraryGreek
    @test supertype(LiteraryGreek) == OrthographicSystem
end