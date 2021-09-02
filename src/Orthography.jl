module Orthography

using Unicode
using Documenter, DocStringExtensions

using CitableText, CitableCorpus
using StatsBase

export OrthographicSystem
export validchar, validstring,  tokenize, codepoints, tokentypes
export corpus_histo
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
