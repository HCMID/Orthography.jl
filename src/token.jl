"""Tokenization produces citable tokens, an assocation of a 
token-level citable passage and a token type. 
"""
struct CitableToken <: Citable
    passage::CitablePassage
    tokentype::TokenCategory
end

"""Override Base.show for `CitableToken`.
$(SIGNATURES)
Required function for `Citable` abstraction.
"""
function show(io::IO, ct::CitableToken)
    print(io, ct.passage, " (", typeof(ct.tokentype), ")")
end



"""Override Base.== for `CitableToken`.
$(SIGNATURES)
"""        
function ==(ct1::CitableToken, ct2::CitableToken)
    ct1.passage == ct2.passage && typeof(ct1.tokentype) == typeof(ct2.tokentype)
end



"Value for CitableTrait."
struct CitableByToken <: CitableTrait end

"""Define`CitableTrait` value for `CitableToken`.
$(SIGNATURES)
"""
function citabletrait(::Type{CitableToken})
    CitableByToken()
end



"""URN identifying `ct`.
$(SIGNATURES)
Required function for `Citable` abstraction.
"""
function urn(ct::CitableToken)
    ct.passage.urn
end

"""Label for `ct`.
$(SIGNATURES)
Required function for `Citable` abstraction.
"""
function label(ct::CitableToken)
    string(ct)
end

"""Identify URN type for a `CitableToken` as `CtsUrn`.
$(SIGNATURES)
Required function for `Citable` abstraction.
"""
function urntype(ct::CitableToken)
    CtsUrn
end





"Value for CexTrait"
struct CexToken <: CexTrait end
"""Define`CexTrait` value for `CitableToken`.
$(SIGNATURES)
"""
function cextrait(::Type{CitableToken})  
    CexToken()
end

"""Format a `CitableToken` as a delimited-text string.
$(SIGNATURES)
Required function for `Citable` abstraction.
"""
function cex(ct::CitableToken; delimiter = "|")
    join([ct.passage.urn, ct.passage.text, typeof(ct.tokentype)], delimiter)
end


"""Parse a delimited-text string into a `CitableToken`.
$(SIGNATURES)
"""
function fromcex(s::AbstractString, ::Type{CitableToken}; delimiter = "|", configuration = nothing, strict = true)
    parts = split(s, delimiter)
    if length(parts) == 3 
        u = CtsUrn(parts[1])
        psg = CitablePassage(u, parts[2])
        ttype =  Meta.parse(parts[3] * "()") |> eval
        CitableToken(psg, ttype)
    else 
        throw(DomainError(s, "Invalid input. Found $(length(parts)) columns delimited by $delimiter"))
    end
end
