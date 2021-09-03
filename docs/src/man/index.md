# API documentation: exported types and functions

## Types



```@docs
OrthographicSystem
TokenCategory
LexicalToken
NumericToken
PunctuationToken
```

## Functions

Public functions implemented for all subtypes of `OrthographicSystem`.

```@docs
codepoints
tokentypes
validchar
validstring
tokenize
```
Working with text corpora:

```@docs
corpus_histo
tokenvalues
```

Other utilities

```@docs
nfkc
```

## Example implementation

```@docs
SimpleAscii
simpleAscii
```
