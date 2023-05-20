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
