

# Orthography.jl

We can’t read a text until we understand its writing system; we can’t meaningfully work with a digital text until we understand how its writing system is encoded digitally.



Problems:

    conflation of language and writing system!
    naive generalizations from a single language (especially English)
    hacks to work around problems that should follow automatically from a well defined digital orthographic system

`Orthography.jl` is a Julia package to address these problems. that defines an interface for rigorously defined orthographic systems.

Work with rigorously defined scholarly editions of digital texts adhering to a specified orthography.  An orthography explicitly defines:

- a set of token *types*
- tokens are composed from an explicitly defined character set or set of code points
- the semantics of the character completely define how to tokenize text in the orthographic system. Each token is classified with one of the orthography's token types.

Documentation is available on [quarto.pub](https://neelsmith.quarto.pub/orthography/).

`Orthography.jl` was originally developed to support projects at the Holy Cross Manuscripts, Inscriptions and Documents Club (MID).


## Overview




