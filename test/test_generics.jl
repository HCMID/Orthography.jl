


@testset "Test collecting and stripping punctuation" begin
    s = "abcd;"
    punct = ",:!.;'"
    strippedaway = Orthography.collecttail(s,punct)
    @test strippedaway === ";"

    trimmed = Orthography.trimtail(s,punct)
    @test trimmed == "abcd"

    nopunct = Orthography.collecttail("abcd", punct)
    @test nopunct == ""

    s2 = "'single quoted'"
    @test Orthography.trimhead(s2,punct) == "single quoted'"
    @test  Orthography.collecthead(s2,punct) == "'"
end
