
"An abstract type for orthographic systems."
abstract type OrthographicSystem end

"An abstract type for token categories."
abstract type TokenCategory end

"A classified string of text."
struct OrthographicToken
    text::AbstractString
    tokencategory::TokenCategory
end

"""Find text value of an `OrthographicToken`.
$(SIGNATURES)
"""
function tokentext(ot::OrthographicToken)
    ot.text
end


"""Find analytical category of an `OrthographicToken`.
$(SIGNATURES)
"""
function tokencategory(ot::OrthographicToken)
    ot.tokencategory
end


"""The orthography trait."""
abstract type OrthographyTrait end 

"""Value for the OrthographyTrait for orthographic systems."""
struct IsOrthographicSystem <: OrthographyTrait end
"""Value for the OrthographyTrait for non-orthographic systems."""
struct NotOrthographicSystem <: OrthographyTrait end

"""Define default value of OrthographyTrait as OrthographyTrait(::Type) = NotOrthographicSystem()
."""
OrthographyTrait(::Type) = NotOrthographicSystem()

"""Define OrthographyTrait value for all subtypes of OrthographicSystem."""
OrthographyTrait(::Type{<:OrthographicSystem}) = IsOrthographicSystem()

### FUNCTIONS REQUIRED FOR OrthographyTrait  ###
#=
1. codepoints
2. tokentypes
3. tokenize
=#


## 1. First delegate based on type:
"""Delegate to specific functions based on 
type's orthography trait value.

$(SIGNATURES)
"""
function codepoints(x::T) where {T} 
    codepoints(OrthographyTrait(T), x)
end
"""Delegate to specific functions based on 
type's orthography trait value.

$(SIGNATURES)
"""
function tokentypes(x::T) where {T} 
    tokentypes(OrthographyTrait(T), x)
end
"""Delegate to specific functions based on 
type's orthography trait value.

$(SIGNATURES)
"""
function tokenize(s::AbstractString, x::T) where {T} 
    tokenize(OrthographyTrait(T), s, x)
end



## 2. Override application to nonorthographic types.
"""It is an error to invoke the `codepoints` function on anything but an orthographic system.

$(SIGNATURES)
"""
function codepoints(::NotOrthographicSystem, x)
    throw(DomainError(x, string("Objects of type ", typeof(x), " are not orthographic systems.")))
end
"""It is an error to invoke the `tokentypes` function on anything but an orthographic system.

$(SIGNATURES)
"""
function tokentypes(::NotOrthographicSystem, x)
    throw(DomainError(x, string("Objects of type ", typeof(x), " are not orthographic systems.")))
end
"""It is an error to invoke the `tokenize` function on anything but an orthographic system.

$(SIGNATURES)
"""
function tokenize(::NotOrthographicSystem, s::AbstractString, x)
    throw(DomainError(x, string("Objects of type ", typeof(x), " are not orthographic systems.")))
end


## 3. Impose required function on all citable texts:
"""Orthographic systems must implement codepoints.

$(SIGNATURES)
"""
function codepoints(::OrthographicSystem, ortho)
    throw(DomainError(ortho, string("Please implement the codepoints function for type ", typeof(ortho))))
end

"""Orthographic systems must implement tokentypes.

$(SIGNATURES)
"""
function tokentypes(::OrthographicSystem, ortho, s::AbstractString)
    throw(DomainError(ortho, string("Please implement the tokentypes function for type ", typeof(ortho))))
end



"""Orthographic systems must implement tokenize.

$(SIGNATURES)
"""
function tokenize(::OrthographicSystem, s::AbstractString, ortho)
    throw(DomainError(ortho, string("Please implement the tokenize function for type ", typeof(ortho))))
end