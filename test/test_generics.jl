

@testset "Test constructing a generic orthography" begin
    ortho = GenericOrthography("abc", [Orthography.LexicalToken], Orthography.asciiTokenizer)
    @test isa(ortho, GenericOrthography)
    @test codepoints(ortho) == "abc"
    @test tokentypes(ortho) == [Orthography.LexicalToken]
end

@testset "Test validing character usage" begin
    ortho = GenericOrthography("abc", [Orthography.LexicalToken], Orthography.asciiTokenizer)
    @test validchar(ortho, "a")
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
