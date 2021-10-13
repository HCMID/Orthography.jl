
"""Compute a list of unique string values for tokens appearing in this corpus. By default, filter only for tokens of type `LexicalToken()`, or optionally filter by any token category in the corpus, or `nothing` to list all token values without filtering.

$(SIGNATURES)

Values are sorted by frequency in the corpus.
"""
function tokenvalues(c::CitableTextCorpus, orthography::T;  filterby = LexicalToken()) where {T <: OrthographicSystem}
    corpus_histo(c, orthography; filterby = filterby) |> keys |> collect
end

"""
Create an ordered dictionary of text values for tokens in corpus c.
Optionally, filter the results to include only tokens of a specified type.

$(SIGNATURES)

"""
function corpus_histo(c::CitableTextCorpus, ortho::T; filterby = nothing) where {T <: OrthographicSystem}
    corpustokens = tokenize(c, ortho)
    if isnothing(filterby)
        txt = map(tkn -> tkn[1].text, corpustokens)
        sort!(OrderedDict(countmap(txt)); byvalue=true, rev=true)
    else
        filtered = filter(tkn -> tkn[2] == filterby, corpustokens)
        txt = map(tkn -> tkn[1].text, filtered)
        sort!(OrderedDict(countmap(txt)); byvalue=true, rev=true)
    end
end


"""Compose a `CitableTextCorpus` citable at token level.

$(SIGNATURES)
"""
function tokenizedcorpus(c::CitableTextCorpus, orthography::T; filterby = LexicalToken()) where {T <: OrthographicSystem}
    nodepairs = tokenize(c, orthography)
    if isnothing(filterby)
        map(pr -> pr[1], nodepairs) |> CitableTextCorpus
    else
        filtered = filter(pr -> pr[2] == filterby, nodepairs) 
        map(pr -> pr[1], filtered) |> CitableTextCorpus
    end
end





"""Compile an index of token values to token-level URNs.

$(SIGNATURES)

By default, `corpusindex` only includes lexical tokens.  Supply a token category to filter for, or `nothing` to index all token types.
"""
function corpusindex(c::CitableTextCorpus, orthography::T; filterby = LexicalToken())  where {T <: OrthographicSystem}
    tokenpairs = []
    if isnothing(filterby)
        tokenpairs = tokenize(c, orthography)
    else 
        allpairs = tokenize(c, orthography)
        tokenpairs = filter(pr -> pr[2] == filterby, allpairs)
    end
    urns = map(pr -> pr[1].urn, tokenpairs)
    txtvals = map(pr -> pr[1].text, tokenpairs)
    tbl = Table(tkn = txtvals, urn = urns)
    TypedTables.group(getproperty(:tkn), getproperty(:urn), tbl)
end