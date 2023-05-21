
@testset "Test corpus functions" begin
    c = CitableTextCorpus([
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:1"),"Costello: Well then who's on first?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:2"), "Abbott: Yes."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:3"), "Costello: I mean the fellow's name."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:4"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:5"), "Costello: The guy on first."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:6"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:7"), "Costello: The first baseman."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:8"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:9"), "Costello: The guy playing..."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:10"), "Abbott: Who is on first!"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:11"), "Costello: I'm asking YOU who's on first."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:12"), "Abbott: That's the man's name."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:13"), "Costello: That's who's name?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:14"), "Abbott: Yes."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:15"), "Costello: Well go ahead and tell me."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:16"), "Abbott: That's it."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:17"), "Costello: That's who?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:18"), "Abbott: Yes.)")
    ])
    expectedtokencount = 37
    expectedlexcount = 26
    expectednormedcount = 24
    histo = corpus_histo(c, simpleAscii())
    @test length(histo) == expectedtokencount
    @test histo["Who"] == 4
    @test histo["Costello"] == 9

    histofiltered = corpus_histo(c, simpleAscii(), filterby = LexicalToken())
    @test length(histofiltered) == expectedlexcount
    histonormed = corpus_histo(c, simpleAscii(), filterby = LexicalToken(), normalizer = lowercase)
    @test length(histonormed) == expectednormedcount

    # By default, filters for LexicalTokens only:
    lexvalues = tokenvalues(c, simpleAscii())
    @test length(lexvalues) == expectedlexcount
    @test lexvalues[1] == "Costello"
    @test lexvalues[2] == "Abbott"

    tkncorpus = tokenizedcorpus(c, simpleAscii())
    @test typeof(tkncorpus) == CitableTextCorpus


    @test corpusindex(c, simpleAscii()) |> length == expectedlexcount
    @test corpusindex(c, simpleAscii(), filterby = nothing) |> length == expectedtokencount
    @test corpusindex(c, simpleAscii(), normalizer = lowercase) |> length == expectednormedcount



    rawtokens = tokenize(c, simpleAscii())

    rawcorp = tokenizedcorpus(rawtokens)
    @test  length(rawcorp) == 107
    @test rawcorp.passages[1].text == "Costello"
    @test rawcorp.passages[2].text == ":"

    lexcorp =  tokenizedcorpus(rawtokens, filterby = LexicalToken())
    @test length(lexcorp) == 61
    @test lexcorp.passages[1].text == "Costello"
    @test lexcorp.passages[2].text == "Well"

    normedcorp = tokenizedcorpus(rawtokens, filterby = LexicalToken(), normalizer = lowercase)
    @test length(normedcorp) == 61
    @test normedcorp.passages[1].text == "costello"
    @test normedcorp.passages[2].text == "well"

end
