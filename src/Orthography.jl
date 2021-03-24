module Orthography

using Documenter, DocStringExtensions

export OrthographicSystem
export codepoints, tokentypes, validchar, validstring

export TokenCategory, OrthographicToken
export LexicalToken, NumericToken, PunctuationToken

export GenericOrthography
export SimpleAscii #, LiteraryGreek
export simpleAscii #, literaryGreek
# export GreekString

"An abstract type for orthographic systems."
abstract type OrthographicSystem end


"An abstract type for token categories."
abstract type TokenCategory end

"A classified string of text."
struct OrthographicToken
    text::AbstractString
    tokencategory::TokenCategory
end


include("basicTypes.jl")
include("utils.jl")
include("generic.jl")

include("simpleAscii.jl")
#include("literaryGreek.jl")


end # module
