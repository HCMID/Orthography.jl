module Orthography

using Unicode
using Documenter, DocStringExtensions

export OrthographicSystem
export codepoints, tokentypes, validchar, validstring
export nfkc

export TokenCategory, OrthographicToken
export LexicalToken, NumericToken, PunctuationToken

export GenericOrthography
export SimpleAscii
export simpleAscii 

include("ortho.jl")
include("basicTypes.jl")
include("utils.jl")
include("generic.jl")

include("simpleAscii.jl")


end # module
