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
    lexical = LexicalToken()
    punctuation = PunctuationToken()
    wsdelimited = split(s)
    
    
    
    #map(t -> OrthographicToken(t, unanalyzed), wsdelimited)

#=
    depunctuated = map(s -> splitPunctuation(s), wsdelimited)
    tknstrings = collect(Iterators.flatten(depunctuated))
    tkns = map(t -> tokenforstring(t), tknstrings)


    "Split off any trailing punctuation and return an Array of leading strim + trailing punctuation."
function splitPunctuation(s::AbstractString)
    punct = Orthography.collecttail(s, LatinOrthography.punctuation())
    trimmed = Orthography.trimtail(s, LatinOrthography.punctuation())
    filter(s -> ! isempty(s), [trimmed, punct])
end
    =#
end


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





"True if all characters in s are alphabetic."
function isAsciiAlphabetic(s::AbstractString)
    chlist = split(s,"")
    alphas =  alphabetic()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], alphas))
    end
    nogood = false in tfs
   
    !nogood
end

"True if all characters in s are punctuatoin."
function isAsciiPunctuation(s::AbstractString)::Bool
    chlist = split(s,"")
    puncts =  punctuation()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], puncts))
    end
    nogood = false in tfs
   
    !nogood
end



"True if all characters in s are punctuatoin."
function isAsciiNumeric(s::AbstractString)::Bool
    chlist = split(s,"")
    puncts =  punctuation()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], puncts))
    end
    nogood = false in tfs
   
    !nogood
end