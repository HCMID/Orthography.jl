# Orthography.jl

Work with rigorously defined scholarly editions of digital texts adhering to a specified orthography.  An orthography explicitly defines:


- a set of token *types*
- tokens are composed from an explicitly defined character set or set of code points
- the semantics of the character completely define how to tokenize text in the orthographic system. Each token is classified with one of the orthography's token types.

Orthography.jl was originally developed to support projects at the Holy Cross Manuscripts, Inscriptions and Documents Club (MID).