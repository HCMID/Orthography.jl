

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
    tkns = tokenize(c, ortho)
    if isnothing(filterby)
        txt = map(tkn -> tkn.passage.text, tkns)
        sort!(OrderedDict(countmap(txt)); byvalue=true, rev=true)
    else
        filtered = filter(t -> t.tokentype == filterby, tkns)
        txt = map(tkn -> tkn.passage.text, filtered)
        sort!(OrderedDict(countmap(txt)); byvalue=true, rev=true)
    end
end


"""Compose a `CitableTextCorpus` citable at token level.

$(SIGNATURES)
"""
function tokenizedcorpus(c::CitableTextCorpus, orthography::T; filterby = nothing) where {T <: OrthographicSystem}
    tkns = tokenize(c, orthography)
    tokenizedcorpus(tkns, filterby = filterby)
end


"""Compose a `CitableTextCorpus` citable at token level.

$(SIGNATURES)
"""
function tokenizedcorpus(v::Vector{CitableToken}; filterby = nothing)
    if isnothing(filterby)
        map(t -> t.passage, v) |> CitableTextCorpus
    else
        filtered = filter(t -> t.tokentype == filterby, v) 
        map(t -> t.passage, filtered) |> CitableTextCorpus
    end
end

"""Compile an index of token values to token-level URNs.

$(SIGNATURES)

By default, `corpusindex` only includes lexical tokens.  Supply a token category to filter for, or `nothing` to index all token types.
"""
function corpusindex(c::CitableTextCorpus, orthography::T; filterby = LexicalToken())  where {T <: OrthographicSystem}
    tkns = CitableToken[]
    if isnothing(filterby)
        tkns = tokenize(c, orthography)
    else 
        tkns = tokenize(c, orthography)
        tokenpairs = filter(t -> t.tokentype == filterby, tkns)
    end
    urns = map(t -> t.passage.urn, tkns)
    txtvals = map(t -> t.passage.text, tkns)
    tbl = Table(tkn = txtvals, urn = urns)
    TypedTables.group(getproperty(:tkn), getproperty(:urn), tbl)
end

