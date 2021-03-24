# User's guide

```@meta
CurrentModule = Orthography
DocTestSetup = quote
    using Orthography
end
```

Subtypes of an `OrthographicSystem` must implement four functions:

- `codepoints`: returns a complete list of codepoints allowed in this orthography
- `tokentypes`: returns a complete list of the types of tokens that can be recognized in this orthography.  These are subtypes of `TokenCategory`.
- `validchar(c)`: true if `c` is a valid character in this orthography 
- `validstring(s)`: true if `s` is a valid string in this orthography
- `tokenize(orthography,s)`: use `orthography` to tokenize `s`.


## Example: `SimpleAscii`

The `SimpleAscii` system is a subtype of `OrthographicSystem` implementing these functions for a basic alphabetic subset of the ASCII characater set.  The `simpleAscii` creates a `SimpleAscii` system for you.


```jldoctest simpleseries
using Orthography
orthography = simpleAscii()
typeof(orthography)

# output

SimpleAscii
```
```jldoctest simpleseries
typeof(orthography) |> supertype

# output

OrthographicSystem
```
```jldoctest simpleseries
codepoints(orthography)

# output

"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-.,:;!?'\"()[]"
```


