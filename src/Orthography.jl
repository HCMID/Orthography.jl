module Orthography

using Unicode
using Documenter, DocStringExtensions

using CitableBase
using CitableText, CitableCorpus
using StatsBase
using TypedTables
using OrderedCollections

export OrthographicSystem, OrthographyTrait
export IsOrthographicSystem, NotOrthographicSystem
export validcp, validstring, codepoints, tokentypes

export CitableToken 
export tokenize

export corpus_histo, tokenvalues, tokenizedcorpus, corpusindex
export nfkc

export TokenCategory, OrthographicToken
export tokentext, tokencategory
export LexicalToken, NumericToken, PunctuationToken

export SimpleAscii
export simpleAscii 
export WSTokenizer

include("ortho.jl")
include("basicTypes.jl")
include("utils.jl")
include("generic.jl")
include("corpus.jl")

include("simpleAscii.jl")
include("wstokenizer.jl")

end # module
