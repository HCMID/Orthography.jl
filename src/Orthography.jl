module Orthography


using Documenter, DocStringExtensions


export OrthographicSystem, SimpleAscii #, BasicTokenTypes
export codepoints, tokentypes

"An abstract type for orthographic systems."
abstract type OrthographicSystem end

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

# A specific implementation of an OrthoographicSystem
include("simpleAscii.jl")

 

#=
"A useful set of widely usable categories of token."
@enum BasicTokenTypes begin
    alphabetictoken=1
    numerictoken=2
    punctuationtoken=3
end
=#

end # module
