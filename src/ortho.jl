
"An abstract type for orthographic systems."
abstract type OrthographicSystem end


"An abstract type for token categories."
abstract type TokenCategory end

"A classified string of text."
struct OrthographicToken
    text::AbstractString
    tokencategory::TokenCategory
end