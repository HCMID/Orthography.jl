
@testset "Test parameterized functions" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    genericcps = codepoints(GenericOrthography(charset, tokencats))
    @test genericcps ==  ['a', 'b', 'c', '!']

    asciicps = codepoints(SimpleAscii())
    expected = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-.,:;!?'\"()[]"
    @test asciicps == expected

end