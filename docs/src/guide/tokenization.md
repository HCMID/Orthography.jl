

# Tokenization

Tokenization parses a string value into a sequence of classified substrings.  For substrings that are valid in the orthographic system, the classification will be one of the token types enumerated for that orthographic system.

You can use a tokenizer to tokenize strings, citable passages of texts, or entire text corpora.

## Strings

When you tokenize a literal string, the result is a list of `OrthographicToken`s.

```jldoctest simpleseries
using Orthography
orthography = simpleAscii()
s = "The 3 stooges, Larry, Curly and Moe."
tokens = tokenize(s, orthography)
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

## `CitablePassage`s

When you tokenize a `CitablePassage`, the result is a list of `CitablePassage`s paired with token categories.  The text value of each node is the token, and the URN value is cited with one level of citation beyond the original passage so that each token node is uniquely identified.


```jldoctest simpleseries
using CitableText, CitableCorpus
urn = CtsUrn("urn:cts:orthodocs:tokenization.v1:stooges")
cn = CitablePassage(urn, s)
tokenizednodes = tokenize(cn, orthography)
tokenizednodes[1]

# output

(<urn:cts:orthodocs:tokenization.v1:stooges.1> The, LexicalToken())
```


```jldoctest simpleseries
tokenizednodes[2]

# output

(<urn:cts:orthodocs:tokenization.v1:stooges.1a> 3, NumericToken())
```


## `CitableTextCorpus`

If you tokenize a `CitableTextCorpus`, you get the same kind of pairing of citable nodes with token categories as when you parse a `CitablePassage`.  If your text corpus has only a single node, the results will therefore be equal to parsing that node separately, as this example shows.

```jldoctest simpleseries
corpus = CitableTextCorpus([cn])
tokenizedcorpus = tokenize(corpus, orthography)
tokenizedcorpus == tokenizednodes

# output

true
```