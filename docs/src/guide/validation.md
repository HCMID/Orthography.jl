# Validating orthography

```@meta
CurrentModule = Orthography

```

Subtypes of an `OrthographicSystem` must implement five functions:

- `codepoints()`: returns a complete list of codepoints allowed in this orthography
- `tokentypes()`: returns a complete list of the types of tokens that can be recognized in this orthography.  These are subtypes of `TokenCategory`.
- `validchar(orthography, c)`: true if `c` is a valid character in this orthography.  `c` is a string value representing a single character in this orthography. It may be longer than one Julia `Char`.
- `validstring(orthography, s)`: true if `s` is a valid string in this orthography
- `tokenize(orthography,s)`: use `orthography` to tokenize `s`.  This function is the basis for the higher-order functions presented in the following pages.


## Example: `SimpleAscii`



!!! warning
    `SimpleAscii` is meant only to demonstrate the functionality of an orthographic system.  Its definitions of lexical and punctuation tokens are reasonable, but the treatment of
    numeric tokens is naive and not suitable for real-world use.

The `SimpleAscii` orthography implements these five functions for a basic alphabetic subset of the ASCII character set. The `simpleAscii` function creates a `SimpleAscii` orthography for you.


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


### Enumerating codepoints and tokens


```jldoctest simpleseries
codepoints(orthography)

# output

"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-:;!?'\"()[] \t\n"
```



```
tokentypes(orthography)

# output

3-element Array{TokenCategory,1}:
 LexicalToken()
 NumericToken()
 PunctuationToken()
```

### Testing valid strings

```jldoctest simpleseries
validstring(orthography, "OK!")

# output

true
```

```jldoctest simpleseries
cam = "Thë ōnly thîng bëttër than havîng a qualîty cîgar... îs havîng gōōd cōnvërsatîon tō accōmpany ît wîth"
validstring(orthography, cam)

# output

false
```



### Tokenization

See the following section for an overview of how to use an orthographic system for tokenization.