
"A generic model of an orthographic system implementation."
struct GenericOrthography <: OrthographicSystem
    codepoints
    tokencategories
end

"""
$(SIGNATURES)
Generic function to retrieve `codepoints` member of an `OrthographicSystem`.
"""
function codepoints(ortho::T) where {T <: OrthographicSystem}
    ortho.codepoints
end


"""
$(SIGNATURES)
Generic function to retrieve `tokentypes` member of an `OrthographicSystem`.
"""
function tokentypes(ortho::T) where {T <: OrthographicSystem}
    ortho.tokencategories
end

"""
$(SIGNATURES)
True if all chars in `s` are valid.
"""
function validstring(ortho::OrthographicSystem, s)::Bool
    chars = split(s, "")
    tf = map(c -> validchar(ortho,c), chars)
    !(false in tf)
end


"""
$(SIGNATURES)
True if `ch` appears in list of all valid characters for this orthography.
"""
function validchar(ortho::OrthographicSystem, ch::AbstractString)::Bool
    cplist = split(codepoints(ortho),"")
    ch in cplist
end

function tokenize(ortho::OrthographicSystem, s::AbstractString)
    ""
end