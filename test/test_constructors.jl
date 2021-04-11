



@testset "Test tokenizing with a simple Ascii tokenizer" begin
    ascii = simpleAscii()

    tokenized = ascii.tokenizer("ba ba ba")
    @test length(tokenized) == 3
    @test tokenized[1].text == "ba"
    @test tokenized[1].tokencategory == Orthography.LexicalToken()
end