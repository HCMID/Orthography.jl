@testset "Test tokenizing a string" begin
    ascii = simpleAscii()
    s = "Now is the time."
    tkns = tokenize(s, ascii)
    @test length(tkns) == 5
    
    @test tokentext(tkns[1]) == "Now"
    @test tokentext(tkns[5]) == "."  
    @test tokencategory(tkns[1]) == LexicalToken()
    @test tokencategory(tkns[5]) == PunctuationToken()   

end


@testset "Test tokenizing a CitablePassage" begin
    ascii = simpleAscii()

    psgurn = CtsUrn("urn:cts:dummy:unittests.test1.v1:1")
    txt = "Now is the time." 
    cn = CitablePassage(psgurn,txt)

    tkns = tokenize(cn, ascii) 
    @test length(tkns) == 5
    @test text(tkns[1][1]) == "Now"
    @test urn(tkns[1][1]) == CtsUrn("urn:cts:dummy:unittests.test1.v1_tokens:1.1")
    @test tkns[1][2] == LexicalToken()

    edlabelled = tokenize(cn, ascii, edition="tokenized") 
    @test urn(edlabelled[1][1]) == CtsUrn("urn:cts:dummy:unittests.test1.tokenized:1.1")

    exlabelled = tokenize(cn, ascii, exemplar="tokens") 
    @test urn(exlabelled[1][1]) == CtsUrn("urn:cts:dummy:unittests.test1.v1.tokens:1.1")
end


@testset "Test tokenizing a CitableTextCorpus" begin
    ascii = simpleAscii()

    urn = CtsUrn("urn:cts:dummy:unittests.test2.v1:1")
    txt = "Now is the time." 
    cn1 = CitablePassage(urn,txt)
    cn2 = CitablePassage(CtsUrn("urn:cts:dummy:unittests.test2.v1_tokens:2"), "And then the time is past.")
    c = CitableTextCorpus([cn1, cn2])

    tkns = tokenize(c, ascii)
    @test length(tkns) == 12
end
