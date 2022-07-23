"An orthographic system accepting any Unicode
code point, and tokenizing on whitespace."
struct WSTokenizer <: OrthographicSystem
end

OrthographyTrait(::Type{WSTokenizer}) = IsOrthographicSystem()

"""Implement tokentypes function for WSTokenizer.

$(SIGNATURES)
"""
function tokentypes(ortho::WSTokenizer)
    [LexicalToken()]
end


"""Implement codepoints function for SimpleAscii.

$(SIGNATURES)
"""
function codepoints(ortho::WSTokenizer)
    []
end


"""Implement tokenize function for `WSTokenizer` orthography.

$(SIGNATURES)
"""
function tokenize(s::AbstractString, o::WSTokenizer) 
    tkns = []
    for t in split(s)
        push!(tkns, OrthographicToken(t, LexicalToken()) )
    end
    tkns
end


function validcp(ch::AbstractString, ortho::WSTokenizer)::Bool 
    true
end