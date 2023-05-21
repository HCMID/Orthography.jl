

"""Compute a list of unique string values for tokens appearing in this corpus. By default, filter only for tokens of type `LexicalToken()`. The `filterby` parameter lets you filter by any token category appearing in the corpus; a value of `nothing` lists all token values without filtering. The `normalizer` parameter lets you supply a function to normalize tokens.

$(SIGNATURES)

Values are sorted by frequency in the corpus.
"""
function tokenvalues(c::CitableTextCorpus, orthography::T;  filterby = LexicalToken(), normalizer = nothing) where {T <: OrthographicSystem}
    corpus_histo(c, orthography; filterby = filterby, normalizer = normalizer) |> keys |> collect
end

"""
Create an ordered dictionary of text values for tokens in corpus c.
Optional parameters let you filter the results to include only tokens of a specified type and normalize the text value of tokens before counting.

$(SIGNATURES)

"""
function corpus_histo(c::CitableTextCorpus, ortho::T; filterby = nothing, normalizer = nothing) where {T <: OrthographicSystem}
    tkns = tokenize(c, ortho)
    rawtext = if isnothing(filterby)
        map(tkn -> tkn.passage.text, tkns)
    else
        filtered = filter(t -> t.tokentype == filterby, tkns)
        map(tkn -> tkn.passage.text, filtered)
    end

    if isnothing(normalizer)
        sort!(OrderedDict(countmap(rawtext)); byvalue=true, rev=true)
    else
        normed = map(s -> normalizer(s), rawtext)
        sort!(OrderedDict(countmap(normed)); byvalue=true, rev=true)
    end
end


"""Compose a `CitableTextCorpus` citable at token level. 
Optional parameters let you filter the results to include only tokens of a specified type and normalize the text value of tokens before counting.

$(SIGNATURES)
"""
function tokenizedcorpus(c::CitableTextCorpus, orthography::T; filterby = nothing, normalizer = nothing) where {T <: OrthographicSystem}
    tkns = tokenize(c, orthography)
    tokenizedcorpus(tkns, filterby = filterby, normalizer = normalizer)
end


"""Compose a `CitableTextCorpus` citable at token level.
Optional parameters allow you to filter the resulting corpus by a specified token type `filterby`, and a function `normalizer` to apply to tokens to normalize their orthography (e.g., to normalize case or accent).
$(SIGNATURES)
"""
function tokenizedcorpus(v::Vector{CitableToken}; filterby = nothing, normalizer = nothing)
    rawtokens = if isnothing(filterby)
        map(t -> t.passage, v)
    else
        filtered = filter(t -> t.tokentype == filterby, v) 
        map(t -> t.passage, filtered)
    end
    if isnothing(normalizer)
        CitableTextCorpus(rawtokens)
    else
        map(t -> CitablePassage(t.urn, normalizer(t.text)), rawtokens) |> CitableTextCorpus
    end
end

"""Compile an index of token values to token-level URNs.

$(SIGNATURES)

By default, `corpusindex` only includes lexical tokens.  Supply a token category to filter for, or `nothing` to index all token types.
"""
function corpusindex(c::CitableTextCorpus, orthography::T; filterby = LexicalToken(), normalizer = nothing)  where {T <: OrthographicSystem}
    corp = tokenizedcorpus(c, orthography, filterby = filterby, normalizer = normalizer)
    urns = map(psg -> psg.urn, corp.passages)
    txtvals = map(psg -> psg.text, corp.passages)
    tbl = Table(token = txtvals, urn = urns)
    TypedTables.group(getproperty(:token), getproperty(:urn), tbl)
end

