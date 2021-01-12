
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

"""
$(SIGNATURES)
Remove all trailing characters belong to list in `arr`,
and collect them.  This is useful to collect punctuation
from a token, for example.
"""
function collecttail(s::AbstractString, arr, stripped=[])
    lastch = string(last(s))
    if occursin(lastch,arr)
        push!(stripped, lastch)
        trimmed = chop(s, head=0, tail=1)
        collecttail(trimmed, arr, stripped)
    else
        join(stripped,"")
    end
end


"""
$(SIGNATURES)
Remove all trailing characters belong to list in `arr`,
and and return the trimmed string.  This is useful to remove punctuation
from a token, for example.
"""
function trimtail(s::AbstractString, arr)
    lastch = string(last(s))
    if occursin(lastch,arr)
        trimmed = chop(s, head=0, tail=1)
        trimtail(trimmed, arr)
    else
        s
    end
end