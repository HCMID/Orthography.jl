module Orthography

using Documenter, DocStringExtensions

export OrthographicSystem
export TokenCategory, OrthographicToken
export GenericOrthography, SimpleAscii
export AlphabeticToken, NumericToken, PunctuationToken
export codepoints, tokentypes, validchar, validstring
export tokenize

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
# A specific implementation of an OrthographicSystem
include("simpleAscii.jl")
# Some common token categories
include("basicTypes.jl")





end # module
