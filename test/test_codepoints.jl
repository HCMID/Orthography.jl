
@testset "Test parameterized functions" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    s = codepoints(SimpleAscii(charset, tokencats))
    @test s ==  ['a', 'b', 'c', '!']
end