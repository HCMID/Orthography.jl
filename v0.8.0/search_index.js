var documenterSearchIndex = {"docs":
[{"location":"man/internals/#Internals","page":"Internals","title":"Internals","text":"","category":"section"},{"location":"man/internals/","page":"Internals","title":"Internals","text":"Orthography.collecttail\nOrthography.trimtail\nOrthography.basicTypes\nOrthography.asciiTokenizer\nOrthography.splitAsciiPunctuation\nOrthography.asciialphabetic\nOrthography.asciinumeric\nOrthography.asciipunctuation\nOrthography.asciiCPs\nOrthography.asciitokenforstring","category":"page"},{"location":"man/internals/#Orthography.collecttail","page":"Internals","title":"Orthography.collecttail","text":"collecttail(s, arr)\ncollecttail(s, arr, stripped)\n\n\nRemove all trailing characters belong to list in arr, and collect them.  This is useful to collect punctuation from a token, for example.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.trimtail","page":"Internals","title":"Orthography.trimtail","text":"Remove all trailing characters belong to list in arr, and and return the trimmed string.  \n\ntrimtail(s, arr)\n\n\nThis is useful to remove punctuation from a token, for example.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.basicTypes","page":"Internals","title":"Orthography.basicTypes","text":"Define an Array with all valid TokenCategorysystems in the SimpleAscii orthography.\n\nbasicTypes()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciiTokenizer","page":"Internals","title":"Orthography.asciiTokenizer","text":"Tokenize a string in SimpleAscii orthography.\n\nasciiTokenizer(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.splitAsciiPunctuation","page":"Internals","title":"Orthography.splitAsciiPunctuation","text":"Split off any trailing punctuation and return an Array of leading strim + trailing punctuation.\n\nsplitAsciiPunctuation(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciialphabetic","page":"Internals","title":"Orthography.asciialphabetic","text":"Compose list of alphabetic characters in SimpleAscii.\n\nasciialphabetic()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciinumeric","page":"Internals","title":"Orthography.asciinumeric","text":"Compose list of numeric characters in SimpleAscii.\n\nasciinumeric()\n\n\nAllow notation of positive or negative decimals.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciipunctuation","page":"Internals","title":"Orthography.asciipunctuation","text":"Compose list of punctuation characters in SimpleAscii.\n\nasciipunctuation()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciiCPs","page":"Internals","title":"Orthography.asciiCPs","text":"Define a string including all valid code points in the SimpleAscii orthography.\n\nasciiCPs()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciitokenforstring","page":"Internals","title":"Orthography.asciitokenforstring","text":"Construct an OrthographicToken from a string.\n\nasciitokenforstring(s)\n\n\ns is a string representing a single token in the SimpleAscii orthography.\n\n\n\n\n\n","category":"function"},{"location":"guide/guide/#User's-guide","page":"User's guide","title":"User's guide","text":"","category":"section"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"CurrentModule = Orthography\nDocTestSetup = quote\n    using Orthography\nend","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"Subtypes of an OrthographicSystem must implement five functions:","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"codepoints: returns a complete list of codepoints allowed in this orthography\ntokentypes: returns a complete list of the types of tokens that can be recognized in this orthography.  These are subtypes of TokenCategory.\nvalidchar(c): true if c is a valid character in this orthography.  c is a string value representing a single character in this orthography. It may be longer than one Julia Char.\nvalidstring(s): true if s is a valid string in this orthography\ntokenize(orthography,s): use orthography to tokenize s.","category":"page"},{"location":"guide/guide/#Example:-SimpleAscii","page":"User's guide","title":"Example: SimpleAscii","text":"","category":"section"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"The SimpleAscii orthography implements these functions for a basic alphabetic subset of the ASCII character set. The simpleAscii function creates a SimpleAscii orthography for you.","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"warning: Warning\nSimpleAscii is meant only to demonstrate the functionality of an orthographic system.  Its definition of numeric tokens is naive and not suitable for real-world use.","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"using Orthography\northography = simpleAscii()\ntypeof(orthography)\n\n# output\n\nSimpleAscii","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"typeof(orthography) |> supertype\n\n# output\n\nOrthographicSystem","category":"page"},{"location":"guide/guide/#Enumerating-codepoints-and-tokens","page":"User's guide","title":"Enumerating codepoints and tokens","text":"","category":"section"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"codepoints(orthography)\n\n# output\n\n\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-:;!?'\\\"()[]\"","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"tokentypes(orthography)\n\n# output\n\n3-element Array{TokenCategory,1}:\n LexicalToken()\n NumericToken()\n PunctuationToken()","category":"page"},{"location":"guide/guide/#Testing-valid-strings","page":"User's guide","title":"Testing valid strings","text":"","category":"section"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"validstring(orthography, \"OK!\")\n\n# output\n\ntrue","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"cam = \"Thë ōnly thîng bëttër than havîng a qualîty cîgar... îs havîng gōōd cōnvërsatîon tō accōmpany ît wîth\"\nvalidstring(orthography, cam)\n\n# output\n\nfalse","category":"page"},{"location":"guide/guide/#Tokenizing-strings","page":"User's guide","title":"Tokenizing strings","text":"","category":"section"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"s = \"The 3 stooges, Larry, Curly and Moe.\"\ntokens = tokenize(orthography, s)\ntokens[1].tokencategory\n\n# output\n\nLexicalToken()","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"tokens[2].tokencategory\n\n# output\n\nNumericToken()","category":"page"},{"location":"guide/guide/","page":"User's guide","title":"User's guide","text":"tokens[end].tokencategory\n\n# output\n\nPunctuationToken()","category":"page"},{"location":"#Orthography","page":"Home","title":"Orthography","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The Orthography package supports working with rigorously defined scholarly editions of digital texts adhering to a specified orthography.  ","category":"page"},{"location":"","page":"Home","title":"Home","text":"An orthography: ","category":"page"},{"location":"","page":"Home","title":"Home","text":"explicitly defines a set of token types\nexplicitly defines a character set or set of code points that can compose tokens\nuses semantics of the character set to parse text into sequences of tokens with associated token type","category":"page"},{"location":"","page":"Home","title":"Home","text":"Orthography.jl was originally developed to support projects at the Holy Cross Manuscripts, Inscriptions and Documents Club (MID).","category":"page"},{"location":"#Contents","page":"Home","title":"Contents","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = [\n    \"guide/guide.md\",\n    \"man/index.md\"\n]","category":"page"},{"location":"man/#Exported-types-and-functions","page":"Exported types and functions","title":"Exported types and functions","text":"","category":"section"},{"location":"man/#Types","page":"Exported types and functions","title":"Types","text":"","category":"section"},{"location":"man/","page":"Exported types and functions","title":"Exported types and functions","text":"OrthographicSystem\nTokenCategory\nLexicalToken\nNumericToken\nPunctuationToken","category":"page"},{"location":"man/#Orthography.OrthographicSystem","page":"Exported types and functions","title":"Orthography.OrthographicSystem","text":"An abstract type for orthographic systems.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.TokenCategory","page":"Exported types and functions","title":"Orthography.TokenCategory","text":"An abstract type for token categories.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.LexicalToken","page":"Exported types and functions","title":"Orthography.LexicalToken","text":"Category of alphabetic tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.NumericToken","page":"Exported types and functions","title":"Orthography.NumericToken","text":"Category of alphabetic tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.PunctuationToken","page":"Exported types and functions","title":"Orthography.PunctuationToken","text":"Category of punctuation tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Functions","page":"Exported types and functions","title":"Functions","text":"","category":"section"},{"location":"man/","page":"Exported types and functions","title":"Exported types and functions","text":"Public functions implemented for all subtypes of OrthographicSystem.","category":"page"},{"location":"man/","page":"Exported types and functions","title":"Exported types and functions","text":"codepoints(ortho::T) where {T <: OrthographicSystem}\ntokentypes(ortho::T) where {T <: OrthographicSystem}\n\nvalidchar\nvalidstring\ntokenize\nnfkc","category":"page"},{"location":"man/#Orthography.codepoints-Tuple{T} where T<:OrthographicSystem","page":"Exported types and functions","title":"Orthography.codepoints","text":"Generic function to retrieve codepoints member of an OrthographicSystem.\n\ncodepoints(ortho)\n\n\n\n\n\n\n","category":"method"},{"location":"man/#Orthography.tokentypes-Tuple{T} where T<:OrthographicSystem","page":"Exported types and functions","title":"Orthography.tokentypes","text":"Generic function to retrieve tokentypes member of an OrthographicSystem.\n\n\n\n\n\n","category":"method"},{"location":"man/#Orthography.validchar","page":"Exported types and functions","title":"Orthography.validchar","text":"True if ch appears in list of all valid characters for this orthography.\n\nvalidchar(ortho, ch)\n\n\nch is a string possibly including more than one char but representing  a single character in the orthographic system ortho.\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.validstring","page":"Exported types and functions","title":"Orthography.validstring","text":"True if all chars in s are valid.\n\nvalidstring(ortho, s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.tokenize","page":"Exported types and functions","title":"Orthography.tokenize","text":"Tokenize s using the tokenizer of the given orthographic system.\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.nfkc","page":"Exported types and functions","title":"Orthography.nfkc","text":"Shorthand function to normalize string s to Unicode form NFKC.\n\nnfkc(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Generic-implementations","page":"Exported types and functions","title":"Generic implementations","text":"","category":"section"},{"location":"man/","page":"Exported types and functions","title":"Exported types and functions","text":"GenericOrthography\nSimpleAscii\nsimpleAscii","category":"page"},{"location":"man/#Orthography.SimpleAscii","page":"Exported types and functions","title":"Orthography.SimpleAscii","text":"An orthographic system for a basic alphabetic subset of the ASCII characater set.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.simpleAscii","page":"Exported types and functions","title":"Orthography.simpleAscii","text":"Construct a SimpleAscii with correct member values.\n\nsimpleAscii()\n\n\n\n\n\n\n","category":"function"}]
}
