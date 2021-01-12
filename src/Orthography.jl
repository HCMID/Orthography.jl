module Orthography

using Documenter, DocStringExtensions

export OrthographicSystem, TokenCategory
export GenericOrthography, SimpleAscii
export codepoints, tokentypes

"An abstract type for orthographic systems."
abstract type OrthographicSystem end

"A generic model of an orthographic system implementation."
struct GenericOrthography <: OrthographicSystem
    codepoints
    tokencategories
end

"An abstract type for token categories."
abstract type TokenCategory end

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

# A specific implementation of an OrthographicSystem
include("simpleAscii.jl")
# Some common token categories
include("basicTypes.jl")





end # module
