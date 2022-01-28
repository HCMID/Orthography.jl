# Functions that can be built from the three functions of the OrthographyTrait interface.

"""True if all chars in `s` are valid.

$(SIGNATURES)
"""
function validstring(s, ortho::T)::Bool where  {T <: OrthographicSystem}
    chars = split(s, "")
    tf = map(c -> validcp(c, ortho), chars)
    !(false in tf)
end

"""True if `ch` appears in list of all valid characters (codepoints) for this orthography.

$(SIGNATURES)

`ch` is a string possibly including more than one Julia `Char` but representing 
a single character in the orthographic system `ortho`.
"""
function validcp(ch::AbstractString, ortho::T)::Bool where {T <: OrthographicSystem}
    cplist = split(codepoints(ortho),"")
    ch in cplist
end


"""
Tokenize citable node `cn` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitablePassage` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(
    psg::CitablePassage, 
    ortho::T; 
    edition = nothing, exemplar = nothing) where {T <: OrthographicSystem}
    @debug("Checking length of workparts for $(urn(psg)) == $(length(workparts(urn(psg))))")
    if length(workparts(urn(psg))) < 3
        throw(ArgumentError("Only nodes citable at a specific version level can be tokenized."))
    end

    versionedurn = nothing
    @warn("Tokenizing corpus with edition/exemplar $(edition)/$(exemplar)")
    if isnothing(exemplar)
        newversion = isnothing(edition) ? workparts(urn(psg))[3] * "_tokens" : edition  
        versionedurn = addversion(urn(psg), newversion)

    else
        newversion = isnothing(edition) ? workparts(urn(psg))[3] : edition
        version1 =  addversion(urn(psg), newversion) 
        versionedurn = addexemplar(version1, exemplar)
    end


    #versionedurn = addversion(urn(psg), newversion)

    tkns = tokenize(psg.text, ortho)

    citabletokens = []
    n1 = 0 # Int value before 1
    n2 = 96 # Char value before 'a'
    for tkn in tkns
        if tkn.tokencategory == Orthography.LexicalToken()
            n1 = n1 + 1
            n2 = 96
            refurn = CtsUrn(string(versionedurn.urn, ".", n1))
            u = isnothing(exemplar) ? refurn : addexemplar(refurn, exemplar)
            push!(citabletokens, (CitablePassage(u, tkn.text), tkn.tokencategory))
            
        else
            n2 = n2 + 1
            u = CtsUrn(string(versionedurn.urn, ".", n1, Char(n2)))
            push!(citabletokens, (CitablePassage(u, tkn.text), tkn.tokencategory))
           
        end
    end
    citabletokens
end

"""
Tokenize corpus `c` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitablePassage` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(c::CitableTextCorpus, ortho::T; edition = nothing, exemplar = nothing) where {T <: OrthographicSystem}
    tkns = []
    for cn in c.passages
        push!(tkns, tokenize(cn, ortho, edition = edition, exemplar = exemplar))
    end
    tkns  |> Iterators.flatten |> collect
end



"""
Tokenize document `doc` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitablePassage` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(doc::CitableDocument, ortho::T; edition = nothing, exemplar = nothing) where {T <: OrthographicSystem}
    tkns = []
    for psg in doc.passages
        push!(tkns, tokenize(psg, ortho, edition = edition, exemplar = exemplar))
    end
    tkns  |> Iterators.flatten |> collect
end
