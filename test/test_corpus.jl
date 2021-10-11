
@testset "Test corpus functions" begin
    c = CitableTextCorpus([
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:1"),"Costello: Well then who's on first?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:2"), "Abbott: Yes."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:3"), "Costello: I mean the fellow's name."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:4"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:5"), "Costello: The guy on first."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:6"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:7"), "Costello: The first baseman."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:8"), "Abbott: Who."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:9"), "Costello: The guy playing..."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:10"), "Abbott: Who is on first!"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:11"), "Costello: I'm asking YOU who's on first."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:12"), "Abbott: That's the man's name."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:13"), "Costello: That's who's name?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:14"), "Abbott: Yes."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:15"), "Costello: Well go ahead and tell me."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:16"), "Abbott: That's it."),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:17"), "Costello: That's who?"),
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who:18"), "Abbott: Yes.)")
    ])
    histo = corpus_histo(c, simpleAscii())
    @test histo["Who"] == 4
    @test histo["Costello"] == 9

    lexvalues = tokenvalues(c, simpleAscii())
    @test length(lexvalues) == 26
    @test lexvalues[1] == "Costello"
    @test lexvalues[2] == "Abbott"

    tkncorpus = tokenizedcorpus(c, simpleAscii())
    @test typeof(tkncorpus) == CitableTextCorpus


    docs = documents(c)
    @test tokenize(docs[1], simpleAscii()) == tokenize(c, simpleAscii())
end
