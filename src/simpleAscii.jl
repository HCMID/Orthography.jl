"An orthographic system for a basic alphabetic subset of the ASCII characater set."
struct SimpleAscii <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

"Construct a `SimpleAscii` with correct member values."
function simpleAscii()
    SimpleAscii(
        asciiCPs(),
        basicTypes(),
        asciiTokenizer
    )
end


"""
$(SIGNATURES)
Define a string including all valid code points
in the `SimpleAscii` orthography.
"""
function asciiCPs()
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphaupper = uppercase(alphabet)
    punct = "-.,:;!?"
    quotes = "'\""
    brackets = "()[]"
    alphabet * alphaupper * punct * quotes * brackets
end

"""
$(SIGNATURES)
Define an Array with all valid `TokenCategory`systems
in the `SimpleAscii` orthography.
"""
function basicTypes()
    [LexicalToken(), NumericToken(), PunctuationToken()]
end

"""
$(SIGNATURES)
Parse a string into an array of classified tokens.
"""
function asciiTokenizer(s::AbstractString)
    unanalyzed = UnanalyzedToken()
    wsdelimited = split(s)
    map(t -> OrthographicToken(t, unanalyzed), wsdelimited)
end