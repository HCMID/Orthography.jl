# Working with citable corpora

```@meta
CurrentModule = Orthography
```


## Token lists


You can use a tokenizer to compile a list of token values.


## Token histograms

You can also count frequencies 
Tokenizers can be used to create histograms of token values. We count tokens in the first lines of the [Mr. Ed theme song](http://www.lyricsondemand.com/tvthemes/mredlyrics.html).

```jldoctest histo
using Orthography
using CitableText, CitableCorpus

corpus = CitableTextCorpus([
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:1"),"A horse is a horse, of course, of course,"),
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:2"),"And no one can talk to a horse of course,"),
        CitableNode(CtsUrn("urn:cts:docstrings:mred.themesong:3"),"That is, of course, unless the horse is the famous Mr. Ed."),
])
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

## Token index