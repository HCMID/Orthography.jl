# Generic functions.

"""Generic function to retrieve `codepoints` member of an `OrthographicSystem`.

$(SIGNATURES)
"""
function codepoints(ortho::T) where {T <: OrthographicSystem}
    @warn "Function codepoints not defined for orthography $(typeof(ortho))"
    nothing
end

"""Generic function to retrieve `tokentypes` member of an `OrthographicSystem`.

$(SIGNATURES)
"""
function tokentypes(ortho::T) where {T <: OrthographicSystem}
    @warn "Function tokentypes not defined for orthography $(typeof(ortho))"
    nothing
end

"""True if all chars in `s` are valid.

$(SIGNATURES)
"""
function validstring(ortho::T, s)::Bool where  {T <: OrthographicSystem}
    chars = split(s, "")
    tf = map(c -> validchar(ortho,c), chars)
    !(false in tf)
end

"""True if `ch` appears in list of all valid characters for this orthography.

$(SIGNATURES)

`ch` is a string possibly including more than one `char` but representing 
a single character in the orthographic system `ortho`.
"""
function validchar(ortho::T, ch::AbstractString)::Bool where {T <: OrthographicSystem}
    cplist = split(codepoints(ortho),"")
    ch in cplist
end


"""
Tokenize `s` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of `OrthographicTokens`.
"""
function tokenize(ortho::T, s::AbstractString) where {T <: OrthographicSystem}
    ortho.tokenizer(s)
end



"""
Tokenize `cn` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitableNode` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(ortho::T, cn::CitableNode) where {T <: OrthographicSystem}

    tkns = ortho.tokenizer(cn.text)

    citabletokens = []
    n1 = 0 # Int value before 1
    n2 = 96 # Char value before 'a'
    for tkn in tkns
        if tkn.tokencategory == Orthography.LexicalToken()
            n1 = n1 + 1
            n2 = 96
            u = CtsUrn(string(cn.urn.urn, ".", n1))
            push!(citabletokens, (CitableNode(u, tkn.text), tkn.tokencategory))
            
        else
            n2 = n2 + 1
            u = CtsUrn(string(cn.urn.urn, ".", n1, Char(n2)))
            push!(citabletokens, (CitableNode(u, tkn.text), tkn.tokencategory))
           
        end
    end
    citabletokens
end





"""
Tokenize `c` using the tokenizer of the given orthographic system.

$(SIGNATURES)

The return value is a list of pairings of a `CitableNode` and a token category.  The citable node is citable at the level of the token.
"""
function tokenize(ortho::T, c::CitableTextCorpus) where {T <: OrthographicSystem}
    tkns = []
    for cn in c.corpus
        push!(tkns, tokenize(ortho, cn))
    end
    tkns  |> Iterators.flatten |> collect
end