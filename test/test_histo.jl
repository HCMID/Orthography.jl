
@testset "Test histogram of tokens by type" begin
    c = CitableTextCorpus([
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"),"Costello: Well then who's on first?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Yes."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: I mean the fellow's name."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: The guy on first."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: The first baseman."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Who."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: The guy playing..."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Who is on first!"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: I'm asking YOU who's on first."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: That's the man's name."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: That's who's name?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Yes."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: Well go ahead and tell me."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: That's it."),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Costello: That's who?"),
        CitableNode(CtsUrn("urn:cts:dummy:ac.who:1"), "Abbott: Yes.)")
    ])

end