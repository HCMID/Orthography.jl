"An orthographic system for a basic alphabetic subset of the ASCII characater set."
struct SimpleAscii <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

"""Construct a `SimpleAscii` with correct member values.

$(SIGNATURES)
"""
function simpleAscii()
    SimpleAscii(
        asciiCPs(),
        basicTypes(),
        asciiTokenizer
    )
end


"""Define a string including all valid code points
in the `SimpleAscii` orthography.

$(SIGNATURES)
"""
function asciiCPs()
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphaupper = uppercase(alphabet)
    punct = "-.,:;!?"
    quotes = "'\""
    brackets = "()[]"
    alphabet * alphaupper * punct * quotes * brackets
end

"""Define an Array with all valid `TokenCategory`systems
in the `SimpleAscii` orthography.

$(SIGNATURES)
"""
function basicTypes()
    [LexicalToken(), NumericToken(), PunctuationToken()]
end

"""Parse a string on whitespace into an array of unanalyzed tokens.

$(SIGNATURES)
"""
function asciiTokenizer(s::AbstractString)
    unanalyzed = UnanalyzedToken()
    wsdelimited = split(s)
    map(t -> OrthographicToken(t, unanalyzed), wsdelimited)
end