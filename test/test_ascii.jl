

@testset "Test constructing an ascii orthography" begin
    ortho = SimpleAscii()
    @test isa(ortho, SimpleAscii)
    @test codepoints(ortho) == "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-.,:;!?'\"()[]"
    @test tokentypes(ortho) == [AlphabeticToken(), NumericToken(), PunctuationToken()]
end

@testset "Test validing character usage" begin
    ortho = SimpleAscii()
    @test validchar(ortho, "a")
    #@test validchar(ortho, 'a')
    @test validstring(ortho, "baa")
    @test ! validstring(ortho, "μῆνιν")
end

@testset "Test tokenization" begin
    sentence = "Now is the time for all long sentences to end."
    tokenstart::Array{OrthographicToken} = []
    ortho = SimpleAscii()
    tokens = tokenize(ortho, sentence,tokenstart)
    expectedcount = 10
    @test length(tokens) == expectedcount
    @test tokens[1].text == "Now"
    @test tokens[1].tokencategory == Orthography.UnanalyzedToken()
    @test tokens[10].text == "end."
    @test tokens[10].tokencategory == Orthography.UnanalyzedToken()
end
