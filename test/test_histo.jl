
@testset "Test histogram of tokens by type" begin
    c = CitableTextCorpus([
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"),"Costello: Well then who's on first?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:2"), "Abbott: Yes."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:3"), "Costello: I mean the fellow's name."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:4"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:5"), "Costello: The guy on first."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:6"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:7"), "Costello: The first baseman."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:8"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:9"), "Costello: The guy playing..."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:10"), "Abbott: Who is on first!"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:11"), "Costello: I'm asking YOU who's on first."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:12"), "Abbott: That's the man's name."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:13"), "Costello: That's who's name?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:14"), "Abbott: Yes."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:15"), "Costello: Well go ahead and tell me."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:16"), "Abbott: That's it."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:17"), "Costello: That's who?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:18"), "Abbott: Yes.)")
    ])
    histo = corpus_histo(simpleAscii(), c)
    @test histo["Who"] == 4
    @test histo["Costello"] == 9

end