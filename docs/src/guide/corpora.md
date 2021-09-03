# Working with citable corpora

```@meta
CurrentModule = Orthography
```


## Token lists

You can use a tokenizer to compile a list of token values in a corpus. The tokens will be sorted by their frequency in the corpus.  Here are the first four tokens in the resulting list for the first lines of the [Mr. Ed theme song](http://www.lyricsondemand.com/tvthemes/mredlyrics.html).

```jldoctst histo
using Orthography
using CitableText, CitableCorpus
corpus = CitableTextCorpus([
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:1"),"A horse is a horse, of course, of course,"),
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:2"),"And no one can talk to a horse of course,"),
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:3"),"That is, of course, unless the horse is the famous Mr. Ed."),
])
lexvalues = tokenvalues(simpleAscii(), corpus)
lexvalues[1:4]

# output

4-element Vector{SubString{String}}:
 "course"
 "horse"
 "of"
 "is"
```

By default, the `tokenvalues` function only collects lexical tokens, but you can filter by any token type, or by `nothing` to get a list of all token values.


```jldoctst histo
 allvalues = tokenvalues(simpleAscii(), corpus, nothing)
 allvalues[1:4]

# output

4-element Vector{AbstractString}:
 ","
 "course"
 "horse"
 "of"
```

## Token histograms

You can also count frequencies of tokens.  By default, the `corpus_histo` function counts all token types.

```jldoctest histo

histo_all = corpus_histo(simpleAscii(), corpus)
histo_all["course"]

# output

4
```

There are lots of commas.

```jldoctest histo
histo_all[","]

# output

6
```

Optionally, you can include a token type to limit results.  If we consider only lexical tokens, we should get the same result for "course".

```jldoctest histo
histo_lex = corpus_histo(simpleAscii(), corpus, LexicalToken())
histo_lex["course"]

# output

4
```

But punctuation tokens will not be part of the histogram.

```jldoctest histo
julia> histo_lex[","]
ERROR: KeyError: key "," not found
[...]
```

## Tokenized editions

You can use a tokenizer to create a new corpus, citable at the level of the token.


```jldoctest histo

tkncorpus = tokenizedcorpus(simpleAscii(), corpus)
typeof(tkncorpus)

# output

CitableTextCorpus
```

```jldoctest histo
tokenized = tokenizedcorpus(simpleAscii(), corpus)
tokenized.corpus[2]

# output

CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:1.2"), "horse")
```


## Token index