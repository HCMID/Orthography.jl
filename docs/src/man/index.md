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
```@docs
codepoints(ortho::T) where {T <: OrthographicSystem}
tokentypes(ortho::T) where {T <: OrthographicSystem}

validchar
validstring
```

## Generic implementations

```@docs
GenericOrthography
SimpleAscii
```
