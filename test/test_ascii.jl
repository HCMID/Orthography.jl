
@testset "Test internal functions to find character types" begin
    ascii = simpleAscii()
    expectedalphacount = 52
    @test length(Orthography.asciialphabetic()) == 52
    @test length(Orthography.asciinumeric()) == 13

    expectedpunct = "-.,:;!?'\"()[]"
    @test Orthography.asciipunctuation() == expectedpunct
end

@testset "Test constructing an ascii orthography" begin
    ortho = simpleAscii()
    @test isa(ortho, SimpleAscii)
    @test tokentypes(ortho) == [LexicalToken(), NumericToken(), PunctuationToken()]
    expectedcps = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-:;!?'\"()[] \t\n"
    @test codepoints(ortho) == expectedcps
end

@testset "Test validing character usage" begin
    ortho = simpleAscii()
    @test validcp("a", ortho)
    @test validstring("baa", ortho)
    @test ! validstring("μῆνιν", ortho)
end

@testset "Test splitting off trailing punctuation" begin
    splitup = Orthography.splitAsciiPunctuation("dogs.")
    @test splitup[1] == "dogs"
    @test splitup[end] == "."
    intact = Orthography.splitAsciiPunctuation("11,000,000.0")
    @test length(intact) == 1
end

@testset "Test token categorization for SimpleAscii" begin
    negdecimal = Orthography.asciitokenforstring("-123.5")
    @test negdecimal.tokencategory == Orthography.NumericToken()
    commas = Orthography.asciitokenforstring("100,000")
    @test commas.tokencategory == Orthography.NumericToken()
    simpleint = Orthography.asciitokenforstring("10")
    @test simpleint.tokencategory == Orthography.NumericToken()


    singleton = Orthography.asciitokenforstring(".")
    @test singleton.tokencategory == Orthography.PunctuationToken()
    exclam = Orthography.asciitokenforstring("?!!????!!")
    @test exclam.tokencategory == Orthography.PunctuationToken()

    txt = Orthography.asciitokenforstring("yabadabadoo")
    @test txt.tokencategory == Orthography.LexicalToken()
end


@testset "Test tokenization" begin
    sentence = "Now is the time for all long sentences to end."
    ortho = simpleAscii()
    tokens = tokenize(sentence, ortho)
    expectedcount = 11
    @test length(tokens) == expectedcount
    @test tokens[1].text == "Now"
    @test tokens[1].tokencategory == Orthography.LexicalToken()
    @test tokens[end].text == "."
    @test tokens[end].tokencategory == Orthography.PunctuationToken()
end
