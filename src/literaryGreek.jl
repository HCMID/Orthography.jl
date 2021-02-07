import Base.show


#Base.show(io::IO, gs::Orthography.GreekString) = print(io, gs.raw)


struct GreekString
    raw::AbstractString
end
#=
function show(io::IO = stdout, gs::GreekString = GreekString(""))
    tidy = replace(gs, "~" => ":")
    print(io, tidy)
end
=#
"An orthographic system for encoding the Lycian alphabet primarily using ASCII characaters."
struct LiteraryGreek <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

"Instantiate a LycianAscii with correct code points and token types."
function LiteraryGreek()
    # Collect:
    # simple alphabetic
    # breathing/accent combos for vowels
    # punctuation
    #
    #collect('α':'ω' )
    # typeof('α':'ω')
    #StepRange{Char,Int64}
    # :NFKC
    cps = "aebBgdiwzΘykqlmnMNopKrstTAEhx" *
    " \t\n"
    ttypes = [
        Orthography.LexicalToken,
        Orthography.PunctuationToken
    ]
    LiteraryGreek(cps, ttypes, tokenizeLitGreek)
end


"Create correct `OrthographicToken` for a given string."
function tokenforstring(raw::AbstractString)
    s = Unicode.normalize(raw, :NFKC)
    if isAlphabetic(s)
        OrthographicToken(s, LexicalToken())
    elseif isPunctuation(s)
        OrthographicToken(s, PunctuationToken())
    else
        OrthographicToken(s, Orthography.UnanalyzedToken())
    end
end

"Tokenize literary Greek text."
function tokenizeLitGreek(s::AbstractString)
    wsdelimited = split(s)
    tkns = map(t -> tokenforstring(t), wsdelimited)
end


"Compose a string with all alphabetic characters."
function alphabetic()
    "aebBgdiwzΘykqlmnMNopKrstTAEhx"
end


"True if all characters in s are alphabetic."
function isAlphabetic(s::AbstractString)
    chlist = split(s,"")
    alphas = alphabetic()
    tfs = map(c -> occursin(c, alphas), chlist)
    nogood = false in tfs
   
    !nogood
end
