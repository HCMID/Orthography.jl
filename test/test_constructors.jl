
@testset "Test tokenizing with a simple Ascii tokenizer" begin
    tokenized = tokenize("ba ba ba", simpleAscii())
    @test length(tokenized) == 3
    @test tokenized[1].text == "ba"
    @test tokenized[1].tokencategory == Orthography.LexicalToken()
end