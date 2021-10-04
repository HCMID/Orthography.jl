# Orthography

The Orthography package supports working with rigorously defined scholarly editions of digital texts adhering to a specified orthography.  

An orthography: 


- explicitly defines a set of token types
- explicitly defines a character set or set of code points that can compose tokens
- uses semantics of the character set to parse text into sequences of tokens with associated token type


The tokenizing functionality can be applied to strings of text, citable text passages, or entire citable corpora.  It can be applied to index a corpus by token, to compile token lists for a corpus, to compute token histograms for a corpus, and to generate a new corpus citable at the level of the token.


Orthography.jl was originally developed to support projects at the Holy Cross Manuscripts, Inscriptions and Documents Club (MID).




```jldoctest simpleseries
using Orthography
orthography = simpleAscii()
typeof(orthography)

# output

SimpleAscii
```

## Contents

```@contents
Pages = [
    "guide/validation.md",
    "guide/tokenization.md",
    "guide/corpora.md",
    "man/index.md"
]
```