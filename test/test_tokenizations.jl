@testset "Test tokenizing a string" begin
    ascii = simpleAscii()
    s = "Now is the time."
    tkns = tokenize(s, ascii)
    @test length(tkns) == 5
    
    @test tkns[1].text == "Now"
    @test tkns[5].text == "."  
    @test tkns[1].tokencategory == LexicalToken()
    @test tkns[5].tokencategory == PunctuationToken()   

end


@testset "Test tokenizing a CitablePassage" begin
    ascii = simpleAscii()

    urn = CtsUrn("urn:cts:dummy:unittests.v1:1")
    txt = "Now is the time." 
    cn = CitablePassage(urn,txt)

    tkns = tokenize(cn, ascii) 
    @test length(tkns) == 5
    @test tkns[1][1].text == "Now"
    @test tkns[1][1].urn == CtsUrn("urn:cts:dummy:unittests.v1:1.1")
    @test tkns[1][2] == LexicalToken()
end


@testset "Test tokenizing a CitableTextCorpus" begin
    ascii = simpleAscii()

    urn = CtsUrn("urn:cts:dummy:unittests.v1:1")
    txt = "Now is the time." 
    cn1 = CitablePassage(urn,txt)
    cn2 = CitablePassage(CtsUrn("urn:cts:dummy:unittests.v1:2"), "And then the time is past.")
    c = CitableTextCorpus([cn1, cn2])

    tkns = tokenize(c, ascii)
    @test length(tkns) == 12
end