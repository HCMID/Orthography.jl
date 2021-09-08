

# Tokenization


You can use a tokenizer to tokenize strings, citable passages of texts, or entire text corpora.

## Strings

You can tokenize a literal string.  The result is a list of `OrthographicToken`s.

```jldoctest simpleseries
using Orthography
orthography = simpleAscii()
s = "The 3 stooges, Larry, Curly and Moe."
tokens = tokenize(orthography, s)
tokens[1] |> typeof 

# output

OrthographicToken
```

Each `OrthographicToken` has a string value and a classifying category.



```jldoctest simpleseries
tokens[1]

# output

OrthographicToken("The", LexicalToken())
```

```jldoctest simpleseries
tokens[2]

# output

OrthographicToken("3", NumericToken())
```

## `CitableNode`s

When you tokenize a `CitableNode`, the result is a list of `CitableNode`s paired with token categories.  The text value of each node is the token, and the URN value is cited with one level of citation beyond the original passage so that each token node is uniquely identified.


```jldoctest simpleseries
using CitableText, CitableCorpus
urn = CtsUrn("urn:cts:orthodocs:tokenization.v1:stooges")
cn = CitableNode(urn, s)
tokenizednodes = tokenize(orthography, cn)
tokenizednodes[1]

# output

(CitableNode(CtsUrn("urn:cts:orthodocs:tokenization.v1:stooges.1"), "The"), LexicalToken())
```



## `CitableTextCorpus`

If you tokenize a `CitableTextCorpus`, you get the same kind of pairing of citable nodes with token categories as when you parse a `CitableNode`.

```jldoctest simpleseries
corpus = CitableTextCorpus([cn])
tokenizedcorpus = tokenize(orthography, corpus)
tokenizedcorpus == tokenizednodes

# output

true
```