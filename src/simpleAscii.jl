




"An orthographic system for a basic alphabetic subset of the ASCII characater set."
struct SimpleAscii <: OrthographicSystem
end

"""
$(SIGNATURES)
Define a string including all valid code points
in the `SimpleAscii` orthography.
"""
function codepoints(ortho::SimpleAscii)
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
function tokentypes(ortho::SimpleAscii)
    [AlphabeticToken(), NumericToken(), PunctuationToken()]
end

function tokenize(ortho::SimpleAscii, s::AbstractString, tokens::Array{OrthographicToken}=[])
    unanalyzed = UnanalyzedToken()
    wsdelimited = split(s)
    map(t -> OrthographicToken(t, unanalyzed), wsdelimited)
end