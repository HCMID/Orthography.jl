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
"""
function tokenize(ortho::T, s::AbstractString) where {T <: OrthographicSystem}
    ortho.tokenizer(s)
end


