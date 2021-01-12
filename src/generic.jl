
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
    ortho.tokentypes
end

# FUNCTIONS TO BE IMPLEMENTED
function validstring(ortho::OrthographicSystem, s::AbstractString)::Bool
    false    
end

function tokenize(ortho::OrthographicSystem, s::AbstractString)
    ""
end