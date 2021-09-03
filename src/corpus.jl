
"""Compute a list of unique string values for tokens appearing in this corpus. By default, filter only for tokens of type `LexicalToken()`, or optionally filter by any token category in the corpus, or `nothing` to list all token values without filtering.

$(SIGNATURES)

Values are sorted by frequency in the corpus.
"""
function tokenvalues(orthography::T, c::CitableTextCorpus, filterby = LexicalToken()) where {T <: OrthographicSystem}
    corpus_histo(orthography, c, filterby) |> keys |> collect
end

"""
Create an ordered dictionary of text values for tokens in corpus c.
Optionally, filter the results to include only tokens of a specified type.

$(SIGNATURES)

"""
function corpus_histo(ortho::T, c::CitableTextCorpus, tokenType = nothing) where {T <: OrthographicSystem}

    corpustokens = tokenize(ortho, c)
    if isnothing(tokenType)
        txt = map(tkn -> tkn[1].text, corpustokens)
        sort(countmap(txt), byvalue=true, rev=true)
    else
        filtered = filter(tkn -> tkn[2] == tokenType, corpustokens)
        txt = map(tkn -> tkn[1].text, filtered)
        sort(countmap(txt), byvalue=true, rev=true)
    end
end


"""Compose a `CitableTextCorpus` citable at token level.

$(SIGNATURES)
"""
function tokenizedcorpus(orthography::T, c::CitableTextCorpus) where {T <: OrthographicSystem}
    nodepairs = tokenize(orthography, c)
    map(pr -> pr[1], nodepairs) |> CitableTextCorpus
end
