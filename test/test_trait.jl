@testset "Test values of OrthographyTrait" begin
    @test OrthographyTrait(typeof("s")) ==  NotOrthographicSystem()

    @test OrthographyTrait(typeof(simpleAscii())) ==  IsOrthographicSystem()
end