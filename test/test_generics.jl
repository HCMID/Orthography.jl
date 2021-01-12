

@testset "Test constructing a generic orthography" begin
    ortho = GenericOrthography("abc", [Orthography.AlphabeticToken])
    @test isa(ortho, GenericOrthography)
    @test codepoints(ortho) == "abc"
    @test tokentypes(ortho) == [Orthography.AlphabeticToken]
end

@testset "Test validing character usage" begin
    ortho = GenericOrthography("abc", [Orthography.AlphabeticToken])
    @test validchar(ortho, "a")
    #@test validchar(ortho, 'a')
    @test validstring(ortho, "baa")
end