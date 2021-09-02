# Some commonly used `TokenCategory`s

"Category of alphabetic tokens."
struct LexicalToken <: TokenCategory end

"Category of numeric tokens."
struct NumericToken <: TokenCategory end

"Category of punctuation tokens."
struct PunctuationToken <: TokenCategory end


"Singleton type for unanalyzed tokens."
struct UnanalyzedToken <: TokenCategory end