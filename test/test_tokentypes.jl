@testset "Test enumeration of basic token types" begin
    alpha = Orthography.AlphabeticToken()
    @test isa(alpha,  Orthography.AlphabeticToken)
    @test typeof(alpha) <: TokenCategory
end

@testset "Test SimpleAscii token array" begin
    tokencats = tokentypes(SimpleAscii())
    @test isa(tokencats, Array{TokenCategory})
    @test AlphabeticToken() in tokencats
end

