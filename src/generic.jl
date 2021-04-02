# Generic functions.

"""Generic function to retrieve `codepoints` member of an `OrthographicSystem`.

$(SIGNATURES)
"""
function codepoints(ortho::T) where {T <: OrthographicSystem}
    ortho.codepoints
end

"""Generic function to retrieve `tokentypes` member of an `OrthographicSystem`.

$(SIGNATURES)
"""
function tokentypes(ortho::T) where {T <: OrthographicSystem}
    ortho.tokencategories
end

"""True if all chars in `s` are valid.

$(SIGNATURES)
"""
function validstring(ortho::OrthographicSystem, s)::Bool
    chars = split(s, "")
    tf = map(c -> validchar(ortho,c), chars)
    !(false in tf)
end

"""True if `ch` appears in list of all valid characters for this orthography.

$(SIGNATURES)

`ch` is a string possibly including more than one `char` but representing 
a single character in the orthographic system `ortho`.
"""
function validchar(ortho::OrthographicSystem, ch::AbstractString)::Bool
    cplist = split(codepoints(ortho),"")
    ch in cplist
end


"""
Tokenize `s` using the tokenizer of the given orthographic system.

$(SIGNATURES)
"""
function tokenize(ortho::OrthographicSystem, s::AbstractString)
    ortho.tokenizer(s)
end

"A generic model of an orthographic system implementation."
struct GenericOrthography <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

