@testset "Test internal functions to find character types" begin

    ortho = WSTokenizer()
    @test isa(ortho, WSTokenizer)

    # Anything goes:
    @test isempty(codepoints(ortho))
    @test validstring("😀", ortho)
    @test validstring("😀", ortho)
    tkns = tokenize("string_1_😀 string_2_😀", ortho)
    @test length(tkns) == 2
    @test broadcast(typeof,tkns) == [OrthographicToken, OrthographicToken]
    @test [t.text for t in tkns] == ["string_1_😀", "string_2_😀"]
end
