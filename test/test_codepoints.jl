
@testset "Test parameterized functions" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    genericcps = codepoints(GenericOrthography(charset, tokencats, Orthography.asciiTokenizer))
    @test genericcps ==  ['a', 'b', 'c', '!']

    asciicps = codepoints(simpleAscii())
    expected = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-.,:;!?'\"()[]"
    @test asciicps == expected

end