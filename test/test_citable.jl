@testset "Test `Citable` trait of `CitableToken`s." begin

    ortho = WSTokenizer()
    psg = CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1:1"),"Costello: Well then who's on first?")
    tkns = tokenize(psg, ortho)

    expected = CitableToken(
        CitablePassage(CtsUrn("urn:cts:dummy:ac.who.v1_tokens:1.1"), "Costello:"),
        LexicalToken()
    )
    t = tkns[1]
    @test t == expected

    @test string(t) == "<urn:cts:dummy:ac.who.v1_tokens:1.1> Costello: (LexicalToken)"
    
    @test citable(t)
    @test urntype(t) == CtsUrn
    @test urn(t) == CtsUrn("urn:cts:dummy:ac.who.v1_tokens:1.1")
    @test label(t) == string(t)
    
end