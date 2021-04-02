

@testset "Test constructor for a concrete orthographic system" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    tokenizer = Orthography.asciiTokenizer
    ortho = GenericOrthography(charset, tokencats, tokenizer)
    @test isa(ortho, GenericOrthography)
    @test typeof(ortho) <: OrthographicSystem
end

@testset "Test tokenizing with a GenericOrthography" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    tokenizer = Orthography.asciiTokenizer
    ortho = GenericOrthography(charset, tokencats, tokenizer)
    #tokenized = ortho.tokenizer("ba ba ba")
    #@test length(tokenized) == 3
    #@test tokenized[1].text == "ba"
   # @test tokenized[1].tokencategory == Orthography.UnanalyzedToken()

end