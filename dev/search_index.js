var documenterSearchIndex = {"docs":
[{"location":"man/#API-documentation:-exported-types-and-functions","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"","category":"section"},{"location":"man/#Types","page":"API documentation: exported types and functions","title":"Types","text":"","category":"section"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"OrthographicSystem\nTokenCategory\nLexicalToken\nNumericToken\nPunctuationToken","category":"page"},{"location":"man/#Orthography.OrthographicSystem","page":"API documentation: exported types and functions","title":"Orthography.OrthographicSystem","text":"An abstract type for orthographic systems.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.TokenCategory","page":"API documentation: exported types and functions","title":"Orthography.TokenCategory","text":"An abstract type for token categories.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.LexicalToken","page":"API documentation: exported types and functions","title":"Orthography.LexicalToken","text":"Category of alphabetic tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.NumericToken","page":"API documentation: exported types and functions","title":"Orthography.NumericToken","text":"Category of numeric tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.PunctuationToken","page":"API documentation: exported types and functions","title":"Orthography.PunctuationToken","text":"Category of punctuation tokens.\n\n\n\n\n\n","category":"type"},{"location":"man/#Functions","page":"API documentation: exported types and functions","title":"Functions","text":"","category":"section"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"Public functions implemented for all subtypes of OrthographicSystem.","category":"page"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"codepoints\ntokentypes\nvalidcp\nvalidstring\ntokenize","category":"page"},{"location":"man/#Orthography.codepoints","page":"API documentation: exported types and functions","title":"Orthography.codepoints","text":"Delegate to specific functions based on  type's orthography trait value.\n\ncodepoints(x)\n\n\n\n\n\n\nIt is an error to invoke the codepoints function on anything but an orthographic system.\n\ncodepoints(_, x)\n\n\n\n\n\n\nOrthographic systems must implement codepoints.\n\ncodepoints(_, ortho)\n\n\n\n\n\n\nImplement codepoints function for SimpleAscii.\n\ncodepoints(ortho)\n\n\n\n\n\n\nImplement codepoints function for SimpleAscii.\n\ncodepoints(ortho)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.tokentypes","page":"API documentation: exported types and functions","title":"Orthography.tokentypes","text":"Delegate to specific functions based on  type's orthography trait value.\n\n\n\n\n\nIt is an error to invoke the tokentypes function on anything but an orthographic system.\n\ntokentypes(_, x)\n\n\n\n\n\n\nOrthographic systems must implement tokentypes.\n\ntokentypes(_, ortho, s)\n\n\n\n\n\n\nImplement tokentypes function for SimpleAscii.\n\ntokentypes(ortho)\n\n\n\n\n\n\nImplement tokentypes function for WSTokenizer.\n\ntokentypes(ortho)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.validcp","page":"API documentation: exported types and functions","title":"Orthography.validcp","text":"True if ch appears in list of all valid characters (codepoints) for this orthography.\n\nvalidcp(ch, ortho)\n\n\nch is a string possibly including more than one Julia Char but representing  a single character in the orthographic system ortho.\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.validstring","page":"API documentation: exported types and functions","title":"Orthography.validstring","text":"True if all chars in s are valid.\n\nvalidstring(s, ortho)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Orthography.tokenize","page":"API documentation: exported types and functions","title":"Orthography.tokenize","text":"Delegate to specific functions based on  type's orthography trait value.\n\ntokenize(s, x)\n\n\n\n\n\n\nIt is an error to invoke the tokenize function on anything but an orthographic system.\n\ntokenize(_, s, x)\n\n\n\n\n\n\nOrthographic systems must implement tokenize.\n\ntokenize(_, s, ortho)\n\n\n\n\n\n\nTokenize citable node cn using the tokenizer of the given orthographic system.\n\ntokenize(psg, ortho; edition, exemplar)\n\n\nThe return value is a list of pairings of a CitablePassage and a token category.  The citable node is citable at the level of the token.\n\n\n\n\n\nTokenize corpus c using the tokenizer of the given orthographic system.\n\ntokenize(c, ortho; edition, exemplar)\n\n\nThe return value is a list of pairings of a CitablePassage and a token category.  The citable node is citable at the level of the token.\n\n\n\n\n\nTokenize document doc using the tokenizer of the given orthographic system.\n\ntokenize(doc, ortho; edition, exemplar)\n\n\nThe return value is a list of pairings of a CitablePassage and a token category.  The citable node is citable at the level of the token.\n\n\n\n\n\nImplement tokenize function for SimpleAscii orthography.\n\ntokenize(s, o)\n\n\n\n\n\n\nImplement tokenize function for WSTokenizer orthography.\n\ntokenize(s, o)\n\n\n\n\n\n\n","category":"function"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"Working with text corpora:","category":"page"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"corpus_histo\n ","category":"page"},{"location":"man/#Orthography.corpus_histo","page":"API documentation: exported types and functions","title":"Orthography.corpus_histo","text":"Create an ordered dictionary of text values for tokens in corpus c. Optionally, filter the results to include only tokens of a specified type.\n\n\n\n\n\n","category":"function"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"Other utilities","category":"page"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"nfkc","category":"page"},{"location":"man/#Orthography.nfkc","page":"API documentation: exported types and functions","title":"Orthography.nfkc","text":"Shorthand function to normalize string s to Unicode form NFKC.\n\nnfkc(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/#Example-implementation","page":"API documentation: exported types and functions","title":"Example implementation","text":"","category":"section"},{"location":"man/","page":"API documentation: exported types and functions","title":"API documentation: exported types and functions","text":"SimpleAscii\nsimpleAscii","category":"page"},{"location":"man/#Orthography.SimpleAscii","page":"API documentation: exported types and functions","title":"Orthography.SimpleAscii","text":"An orthographic system for a basic alphabetic subset of the ASCII character set.\n\n\n\n\n\n","category":"type"},{"location":"man/#Orthography.simpleAscii","page":"API documentation: exported types and functions","title":"Orthography.simpleAscii","text":"Construct a SimpleAscii with correct member values.\n\nsimpleAscii()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#API-documentation:-internals","page":"API documentation: internals","title":"API documentation: internals","text":"","category":"section"},{"location":"man/internals/#Generic-utility-functions","page":"API documentation: internals","title":"Generic utility functions","text":"","category":"section"},{"location":"man/internals/","page":"API documentation: internals","title":"API documentation: internals","text":"Orthography.collecttail\nOrthography.trimtail","category":"page"},{"location":"man/internals/#Orthography.collecttail","page":"API documentation: internals","title":"Orthography.collecttail","text":"collecttail(s, arr)\ncollecttail(s, arr, stripped)\n\n\nRemove all trailing characters belong to list in arr, and collect them.  This is useful to collect punctuation from a token, for example.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.trimtail","page":"API documentation: internals","title":"Orthography.trimtail","text":"Remove all trailing characters belong to list in arr, and and return the trimmed string.  \n\ntrimtail(s, arr)\n\n\nThis is useful to remove punctuation from a token, for example.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Functions-supporting-the-SimpleAscii-implementation","page":"API documentation: internals","title":"Functions supporting the SimpleAscii implementation","text":"","category":"section"},{"location":"man/internals/","page":"API documentation: internals","title":"API documentation: internals","text":"Orthography.asciialphabetic\nOrthography.asciinumeric\nOrthography.asciipunctuation\nOrthography.asciiwhitespace\nOrthography.asciiCPs\nOrthography.basicTypes\nOrthography.splitAsciiPunctuation\nOrthography.asciitokenforstring\nOrthography.isAsciiAlphabetic\nOrthography.isAsciiPunctuation\nOrthography.isAsciiNumeric","category":"page"},{"location":"man/internals/#Orthography.asciialphabetic","page":"API documentation: internals","title":"Orthography.asciialphabetic","text":"Compose list of alphabetic characters in SimpleAscii.\n\nasciialphabetic()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciinumeric","page":"API documentation: internals","title":"Orthography.asciinumeric","text":"Compose list of numeric characters in SimpleAscii.\n\nasciinumeric()\n\n\nAllow notation of positive or negative decimals.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciipunctuation","page":"API documentation: internals","title":"Orthography.asciipunctuation","text":"Compose list of punctuation characters in SimpleAscii.\n\nasciipunctuation()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciiwhitespace","page":"API documentation: internals","title":"Orthography.asciiwhitespace","text":"Compose list of recognized whitespace characters in SimpleAscii.\n\nasciiwhitespace()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciiCPs","page":"API documentation: internals","title":"Orthography.asciiCPs","text":"Define a string including all valid code points in the SimpleAscii orthography.\n\nasciiCPs()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.basicTypes","page":"API documentation: internals","title":"Orthography.basicTypes","text":"Define an Array with all valid TokenCategorysystems in the SimpleAscii orthography.\n\nbasicTypes()\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.splitAsciiPunctuation","page":"API documentation: internals","title":"Orthography.splitAsciiPunctuation","text":"Split off any trailing punctuation and return an Array of leading strim + trailing punctuation.\n\nsplitAsciiPunctuation(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.asciitokenforstring","page":"API documentation: internals","title":"Orthography.asciitokenforstring","text":"Construct an OrthographicToken from a string.\n\nasciitokenforstring(s)\n\n\ns is a string representing a single token in the SimpleAscii orthography.\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.isAsciiAlphabetic","page":"API documentation: internals","title":"Orthography.isAsciiAlphabetic","text":"True if all characters in s are alphabetic.\n\nisAsciiAlphabetic(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.isAsciiPunctuation","page":"API documentation: internals","title":"Orthography.isAsciiPunctuation","text":"True if all characters in s are punctuation.\n\nisAsciiPunctuation(s)\n\n\n\n\n\n\n","category":"function"},{"location":"man/internals/#Orthography.isAsciiNumeric","page":"API documentation: internals","title":"Orthography.isAsciiNumeric","text":"True if all characters in s are numeric characters and at least one is a digits.\n\nisAsciiNumeric(s)\n\n\nObviously not a real-world definition of syntax for a numeric token.\n\n\n\n\n\n","category":"function"},{"location":"guide/corpora/#Working-with-citable-corpora","page":"Working with citable corpora","title":"Working with citable corpora","text":"","category":"section"},{"location":"guide/corpora/#Token-lists","page":"Working with citable corpora","title":"Token lists","text":"","category":"section"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"You can use a tokenizer to compile a list of unique token values in a corpus. The tokens will be sorted by their frequency in the corpus.  Here are the first four tokens in the resulting list for the first lines of the Mr. Ed theme song.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"using Orthography\nusing CitableText, CitableCorpus\ncorpus = CitableTextCorpus([\n        CitablePassage(CtsUrn(\"urn:cts:docstrings:mred.themesong.v1:1\"),\"A horse is a horse, of course, of course,\"),\n        CitablePassage(CtsUrn(\"urn:cts:docstrings:mred.themesong.v1:2\"),\"And no one can talk to a horse of course,\"),\n        CitablePassage(CtsUrn(\"urn:cts:docstrings:mred.themesong.v1:3\"),\"That is, of course, unless the horse is the famous Mr. Ed.\"),\n])\nlexvalues = tokenvalues(corpus, simpleAscii())\nlexvalues[1:4]\n\n# output\n\n4-element Vector{SubString{String}}:\n \"course\"\n \"horse\"\n \"of\"\n \"is\"","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"By default, the tokenvalues function only collects lexical tokens, but you can filter by any token type, or by nothing to get a list of all token values.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":" allvalues = tokenvalues(corpus, simpleAscii(); filterby = nothing)\n allvalues[1:4]\n\n# output\n\n4-element Vector{AbstractString}:\n \",\"\n \"course\"\n \"horse\"\n \"of\"","category":"page"},{"location":"guide/corpora/#Token-histograms","page":"Working with citable corpora","title":"Token histograms","text":"","category":"section"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"You can also count frequencies of tokens.  Like all the other corpus functions, the corpus_histo function counts only lexical tokens by default.  To count all token types, we can pass nothing as the value of an optional filterby parameter.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"\nhisto_all = corpus_histo(corpus, simpleAscii(); filterby = nothing)\nhisto_all[\"course\"]\n\n# output\n\n4","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"There are lots of commas.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"histo_all[\",\"]\n\n# output\n\n6","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"Optionally, you can include a token type to limit results.  If we consider only lexical tokens, we should get the same result for \"course\".","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"histo_lex = corpus_histo(corpus, simpleAscii(); filterby = LexicalToken())\nhisto_lex[\"course\"]\n\n# output\n\n4","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"But punctuation tokens will not be part of the histogram.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"julia> histo_lex[\",\"]\nERROR: KeyError: key \",\" not found\n[...]","category":"page"},{"location":"guide/corpora/#Tokenized-editions","page":"Working with citable corpora","title":"Tokenized editions","text":"","category":"section"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"You can use an orthography's tokenizer to create a new corpus, citable at the level of the token.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"\ntkncorpus = tokenizedcorpus(corpus, simpleAscii())\ntypeof(tkncorpus)\n\n# output\n\nCitableTextCorpus","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"tokenized = tokenizedcorpus(corpus, simpleAscii())\ntokenized.passages[2]\n\n# output\n\n<urn:cts:docstrings:mred.themesong.v1_tokens:1.2> horse","category":"page"},{"location":"guide/corpora/#Token-index","page":"Working with citable corpora","title":"Token index","text":"","category":"section"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"You can index a tokenized edition.  The result is a dictionary.","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"idx = corpusindex(corpus, simpleAscii())\ntypeof(idx)\n\n# output\n\nDictionaries.Dictionary{SubString{String}, Vector{CtsUrn}}","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"idx[\"horse\"]\n\n# output\n\n4-element Vector{CtsUrn}:\n urn:cts:docstrings:mred.themesong.v1_tokens:1.2\n urn:cts:docstrings:mred.themesong.v1_tokens:1.5\n urn:cts:docstrings:mred.themesong.v1_tokens:2.8\n urn:cts:docstrings:mred.themesong.v1_tokens:3.7","category":"page"},{"location":"guide/corpora/","page":"Working with citable corpora","title":"Working with citable corpora","text":"","category":"page"},{"location":"#Orthography","page":"Overview","title":"Orthography","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"The Orthography package supports working with rigorously defined scholarly editions of digital texts adhering to a specified orthography.  ","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"An orthography: ","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"explicitly defines a set of token types\nexplicitly defines a character set or set of code points that can compose tokens\nuses semantics of the character set to parse text into sequences of tokens with associated token type","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"The tokenizing functionality can be applied to strings of text, citable text passages, or entire citable corpora.  It can be applied to index a corpus by token, to compile token lists for a corpus, to compute token histograms for a corpus, and to generate a new corpus citable at the level of the token.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"Orthography.jl was originally developed to support projects at the Holy Cross Manuscripts, Inscriptions and Documents Club (MID).","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"using Orthography\northography = simpleAscii()\ntypeof(orthography)\n\n# output\n\nSimpleAscii","category":"page"},{"location":"#Contents","page":"Overview","title":"Contents","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"Pages = [\n    \"guide/validation.md\",\n    \"guide/tokenization.md\",\n    \"guide/corpora.md\",\n    \"man/index.md\"\n]","category":"page"},{"location":"guide/tokenization/#Tokenization","page":"Tokenization","title":"Tokenization","text":"","category":"section"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"Tokenization parses a string value into a sequence of classified substrings.  For substrings that are valid in the orthographic system, the classification will be one of the token types enumerated for that orthographic system.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"You can use a tokenizer to tokenize strings, citable passages of texts, or entire text corpora.","category":"page"},{"location":"guide/tokenization/#Strings","page":"Tokenization","title":"Strings","text":"","category":"section"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"When you tokenize a literal string, the result is a list of OrthographicTokens.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"using Orthography\northography = simpleAscii()\ns = \"The 3 stooges, Larry, Curly and Moe.\"\ntokens = tokenize(s, orthography)\ntokens[1] |> typeof \n\n# output\n\nOrthographicToken","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"Each OrthographicToken has a string value and a classifying category.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"tokens[1]\n\n# output\n\nOrthographicToken(\"The\", LexicalToken())","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"tokens[2]\n\n# output\n\nOrthographicToken(\"3\", NumericToken())","category":"page"},{"location":"guide/tokenization/#CitablePassages","page":"Tokenization","title":"CitablePassages","text":"","category":"section"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"When you tokenize a CitablePassage, the result is a list of CitablePassages paired with token categories.  The text value of each node is the token, and the URN value is cited with one level of citation beyond the original passage so that each token node is uniquely identified.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"using CitableText, CitableCorpus\nurn = CtsUrn(\"urn:cts:orthodocs:tokenization.docs.v1:stooges\")\ncn = CitablePassage(urn, s)\ntokenizednodes = tokenize(cn, orthography)\ntokenizednodes[1]\n\n# output\n\n(<urn:cts:orthodocs:tokenization.docs.v1_tokens:stooges.1> The, LexicalToken())","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"tokenizednodes[2]\n\n# output\n\n(<urn:cts:orthodocs:tokenization.docs.v1_tokens:stooges.1a> 3, NumericToken())","category":"page"},{"location":"guide/tokenization/#Specifying-resulting-URNs","page":"Tokenization","title":"Specifying resulting URNs","text":"","category":"section"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"When you are tokenizing citable content (either CitablePassages or a CitableTextCorpus), you can include optional parameters to specify the form of the citable tokenized content:","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"edition will be used as the value of the version identifier\nexemplar will be used as the value of the exemplar identifier","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"You may include either or neither.  If neither is specified, the resulting URNs are cited at the version level with a version identifier composed of the source version identifer concatenated with _tokens.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"labellededition = tokenize(cn, orthography, edition = \"special_edition_id\")\nlabellededition[1]\n\n# output\n\n(<urn:cts:orthodocs:tokenization.docs.special_edition_id:stooges.1> The, LexicalToken())","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"labelledexemplars = tokenize(cn, orthography, exemplar = \"tokens\")\nlabelledexemplars[1]\n\n# output\n\n(<urn:cts:orthodocs:tokenization.docs.v1.tokens:stooges.1> The, LexicalToken())","category":"page"},{"location":"guide/tokenization/#CitableTextCorpus","page":"Tokenization","title":"CitableTextCorpus","text":"","category":"section"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"If you tokenize a CitableTextCorpus, you get the same kind of pairing of citable nodes with token categories as when you parse a CitablePassage.  If your text corpus has only a single node, the results will therefore be equal to parsing that node separately, as this example shows.","category":"page"},{"location":"guide/tokenization/","page":"Tokenization","title":"Tokenization","text":"corpus = CitableTextCorpus([cn])\ntokenizedcorpus = tokenize(corpus, orthography)\ntokenizedcorpus == tokenizednodes\n\n# output\n\ntrue","category":"page"},{"location":"guide/validation/#Validating-orthography","page":"Validating orthography","title":"Validating orthography","text":"","category":"section"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"CurrentModule = Orthography\n","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"Subtypes of an OrthographicSystem must implement three functions:","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"codepoints(orthography): returns a complete list of codepoints allowed in this orthography\ntokentypes(orthography): returns a complete list of the types of tokens that can be recognized in this orthography.  These are subtypes of TokenCategory.\ntokenize(s, orthography): use orthography to tokenize s.  This function is the basis for the higher-order functions presented in the following pages.","category":"page"},{"location":"guide/validation/#Example:-SimpleAscii","page":"Validating orthography","title":"Example: SimpleAscii","text":"","category":"section"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"warning: Warning\nSimpleAscii is meant only to demonstrate the functionality of an orthographic system.  Its definitions of lexical and punctuation tokens are reasonable, but the treatment of numeric tokens is naive and not suitable for real-world use.","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"The SimpleAscii orthography implements these five functions for a basic alphabetic subset of the ASCII character set. The simpleAscii function creates a SimpleAscii orthography for you.","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"using Orthography\northography = simpleAscii()\ntypeof(orthography)\n\n# output\n\nSimpleAscii","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"typeof(orthography) |> supertype\n\n# output\n\nOrthographicSystem","category":"page"},{"location":"guide/validation/#Enumerating-codepoints-and-tokens","page":"Validating orthography","title":"Enumerating codepoints and tokens","text":"","category":"section"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"codepoints(orthography)\n\n# output\n\n\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-:;!?'\\\"()[] \\t\\n\"","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"tokentypes(orthography)\n\n# output\n\n3-element Array{TokenCategory,1}:\n LexicalToken()\n NumericToken()\n PunctuationToken()","category":"page"},{"location":"guide/validation/#Testing-valid-strings","page":"Validating orthography","title":"Testing valid strings","text":"","category":"section"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"The validstring function can use the orthographic system's information about what codepoints are valid.","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"validstring( \"OK!\", orthography)\n\n# output\n\ntrue","category":"page"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"cam = \"Thë ōnly thîng bëttër than havîng a qualîty cîgar... îs havîng gōōd cōnvërsatîon tō accōmpany ît wîth\"\nvalidstring(cam, orthography)\n\n# output\n\nfalse","category":"page"},{"location":"guide/validation/#Tokenization","page":"Validating orthography","title":"Tokenization","text":"","category":"section"},{"location":"guide/validation/","page":"Validating orthography","title":"Validating orthography","text":"See the following section for an overview of how to use an orthographic system for tokenization.","category":"page"}]
}
