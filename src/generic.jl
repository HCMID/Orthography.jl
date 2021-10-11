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
function tokenize(cn::CitablePassage, ortho::T) where {T <: OrthographicSystem}

    tkns = tokenize(cn.text, ortho)

    citabletokens = []
    n1 = 0 # Int value before 1
    n2 = 96 # Char value before 'a'
    for tkn in tkns
        if tkn.tokencategory == Orthography.LexicalToken()
            n1 = n1 + 1
            n2 = 96
            u = CtsUrn(string(cn.urn.urn, ".", n1))
            push!(citabletokens, (CitablePassage(u, tkn.text), tkn.tokencategory))
            
        else
            n2 = n2 + 1
            u = CtsUrn(string(cn.urn.urn, ".", n1, Char(n2)))
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
function tokenize(c::CitableTextCorpus, ortho::T) where {T <: OrthographicSystem}
    tkns = []
    for cn in c.passages
        push!(tkns, tokenize(cn, ortho))
    end
    tkns  |> Iterators.flatten |> collect
end





"""
Tokenize document `doc` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitablePassage` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(doc::CitableDocument, ortho::T) where {T <: OrthographicSystem}
    tkns = []
    for psg in doc.passages
        push!(tkns, tokenize(psg, ortho))
    end
    tkns  |> Iterators.flatten |> collect
end