@testset "Test enumeration of basic token types" begin
    alpha = Orthography.AlphabeticToken()
    @test isa(alpha,  Orthography.AlphabeticToken)
    @test typeof(alpha) <: TokenCategory
end