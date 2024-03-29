"An orthographic system for a basic alphabetic subset of the ASCII character set."
struct SimpleAscii <: OrthographicSystem
    codepoints
    tokencategories
end

OrthographyTrait(::Type{SimpleAscii}) = IsOrthographicSystem()

"""Construct a `SimpleAscii` with correct member values.

$(SIGNATURES)
"""
function simpleAscii()
    SimpleAscii(
        asciiCPs(),
        basicTypes()
    )
end

"""Compose list of alphabetic characters in `SimpleAscii`.

$(SIGNATURES)
"""
function asciialphabetic()
    alphalower = "abcdefghijklmnopqrstuvwxyz"
    alphaupper = uppercase(alphalower)
    string(alphalower, alphaupper)
end

"""Compose list of punctuation characters in `SimpleAscii`.

$(SIGNATURES)
"""
function asciipunctuation()
    punct = "-.,:;!?"
    quotes = "'\""
    brackets = "()[]"
    string(punct,quotes,brackets)
end

"""Compose list of numeric characters in `SimpleAscii`.

$(SIGNATURES)

Allow notation of positive or negative decimals.
"""
function asciinumeric()
    "0123456789.,-"
end

"""Compose list of recognized whitespace characters in `SimpleAscii`.

$(SIGNATURES)
"""
function asciiwhitespace()
    " \t\n"
end

"""Define a string including all valid code points
in the `SimpleAscii` orthography.

$(SIGNATURES)
"""
function asciiCPs()
    chars = string(
        asciialphabetic(),
        asciinumeric(),
        asciipunctuation(),
        asciinumeric(),
        asciiwhitespace()
    ) |> unique
    join(chars,"")
end

"""Define an Array with all valid `TokenCategory`systems
in the `SimpleAscii` orthography.

$(SIGNATURES)
"""
function basicTypes()
    [LexicalToken(), NumericToken(), PunctuationToken()]
end

"""Split off any trailing punctuation and return an Array of leading strim + trailing punctuation.

$(SIGNATURES)
"""
function splitAsciiPunctuation(s::AbstractString)
    punct = Orthography.collecttail(s, asciipunctuation())
    trimmed = Orthography.trimtail(s, asciipunctuation())
    filter(s -> ! isempty(s), [trimmed, punct])
end


"""Construct an `OrthographicToken` from a string.

$(SIGNATURES)

`s` is a string representing a single token in the `SimpleAscii` orthography.
"""
function asciitokenforstring(s::AbstractString)
    if isAsciiNumeric(s)
        OrthographicToken(s, NumericToken())
    elseif isAsciiAlphabetic(s)
        OrthographicToken(s, LexicalToken())
    elseif isAsciiPunctuation(s)
        OrthographicToken(s, PunctuationToken())
    else
        OrthographicToken(s, Orthography.UnanalyzedToken())
    end
end


"""True if all characters in `s` are alphabetic.

$(SIGNATURES)
"""
function isAsciiAlphabetic(s::AbstractString)
    #chlist = split(s,"")
    alphas =  asciialphabetic()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], alphas))
    end
    nogood = false in tfs
   
    !nogood
end

"""True if all characters in `s` are punctuation.

$(SIGNATURES)
"""
function isAsciiPunctuation(s::AbstractString)::Bool
    #chlist = split(s,"")
    puncts =  asciipunctuation()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], puncts))
    end
    nogood = false in tfs
   
    !nogood
end


"""True if all characters in `s` are numeric characters and at least one is a digits.

$(SIGNATURES)

Obviously not a real-world definition of syntax for a numeric token.
"""
function isAsciiNumeric(s::AbstractString)::Bool
    # 1. All characters are valid characters for a numeric token
    #chlist = split(s,"")
    puncts =  asciinumeric()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], puncts))
    end
    nogood = false in tfs

    # 2. s contains at least one digit
    digits = "0123456789"
    digitchars = []
    for i in collect(eachindex(s))
        push!(digitchars, occursin(s[i], digits))
    end
    hasdigit = true in digitchars
    hasdigit && !nogood
end

"""Implement tokentypes function for SimpleAscii.

$(SIGNATURES)
"""
function tokentypes(ortho::SimpleAscii)
    ortho.tokencategories
end


"""Implement codepoints function for SimpleAscii.

$(SIGNATURES)
"""
function codepoints(ortho::SimpleAscii)
    ortho.codepoints
end


"""Implement tokenize function for `SimpleAscii` orthography.

$(SIGNATURES)
"""
function tokenize(s::AbstractString, o::SimpleAscii) 
    wsdelimited = split(s)
    depunctuated = map(s -> splitAsciiPunctuation(s), wsdelimited)
    tknstrings = collect(Iterators.flatten(depunctuated))
    map(t -> asciitokenforstring(t), tknstrings)  
end