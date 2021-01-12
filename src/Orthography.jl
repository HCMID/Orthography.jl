module Orthography

using Documenter, DocStringExtensions

export OrthographicSystem
export GenericOrthography, SimpleAscii
export TokenCategory
export AlphabeticToken, NumericToken, PunctuationToken
export codepoints, tokentypes

"An abstract type for orthographic systems."
abstract type OrthographicSystem end


"An abstract type for token categories."
abstract type TokenCategory end


include("generic.jl")
# A specific implementation of an OrthographicSystem
include("simpleAscii.jl")
# Some common token categories
include("basicTypes.jl")





end # module
