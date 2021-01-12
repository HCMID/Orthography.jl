

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

@testset "Test collecting and stripping punctuation" begin
    s = "abcd;"
    punct = ",:!.;"
    strippedaway = Orthography.collecttail(s,punct)
    @test strippedaway === ";"

    trimmed = Orthography.trimtail(s,punct)
    @test trimmed == "abcd"

    nopunct = Orthography.collecttail("abcd", punct)
    @test nopunct == ""
end

@testset "Test tokenization" begin
    sentence = "Now is the time for all long sentences to end."
    tokenstart::Array{OrthographicToken} = []
    ortho = GenericOrthography("abc", [Orthography.AlphabeticToken])
    tokens = tokenize(ortho, sentence,tokenstart)
    expectedcount = 10
    @test length(tokens) == expectedcount
    @test tokens[1].text == "Now"
    @test tokens[1].tokencategory == Orthography.UnanalyzedToken()
    @test tokens[10].text == "end."
    @test tokens[10].tokencategory == Orthography.UnanalyzedToken()
end