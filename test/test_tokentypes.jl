@testset "Test enumeration of basic token types" begin
    alpha = Orthography.LexicalToken()
    @test isa(alpha,  Orthography.LexicalToken)
    @test typeof(alpha) <: TokenCategory
end

@testset "Test SimpleAscii token array" begin
    tokencats = tokentypes(simpleAscii())
    @test isa(tokencats, Array{TokenCategory})
    @test LexicalToken() in tokencats
end

