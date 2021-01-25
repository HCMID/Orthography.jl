module Orthography

using Documenter, DocStringExtensions

export OrthographicSystem
export TokenCategory, OrthographicToken
export GenericOrthography
export SimpleAscii
export AlphabeticToken, NumericToken, PunctuationToken
export codepoints, tokentypes, validchar, validstring
#export tokenize
export simpleAscii

"An abstract type for orthographic systems."
abstract type OrthographicSystem end


"An abstract type for token categories."
abstract type TokenCategory end

"A classified string of text."
struct OrthographicToken
    text::AbstractString
    tokencategory::TokenCategory
end


include("generic.jl")
include("simpleAscii.jl")
include("basicTypes.jl")
include("utils.jl")





end # module
