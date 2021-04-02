# Exported structs and functions

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
codepoints(ortho::T) where {T <: OrthographicSystem}
tokentypes(ortho::T) where {T <: OrthographicSystem}

validchar
validstring
tokenize
nfkc
```

## Generic implementations

```@docs
GenericOrthography
SimpleAscii
simpleAscii
```
