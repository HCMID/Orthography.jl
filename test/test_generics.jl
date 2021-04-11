


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
