# Some utility functions.

"""
$(SIGNATURES)
Remove all leading characters belong to list in `arr`,
and collect them.  This is useful to collect punctuation
from a token, for example.
"""
function collecthead(s::AbstractString, arr, stripped=[])
    if isempty(s)
        join(stripped,"")
    else 
        firstch = string(s[1])
        if occursin(firstch, arr)
            push!(stripped, firstch)
            trimmed = s[2:end]
            collecthead(trimmed, arr, stripped)
        else
            join(stripped,"")
        end
    end
end


"""
Remove all leading characters belong to list in `arr`,
and return the trimmed string.  

$(SIGNATURES)

This is useful to remove punctuation
from a token, for example.
"""
function trimhead(s::AbstractString, arr)
    if (isempty(s))
        s
    else
        firstch = s[1]
        if occursin(firstch,arr)
            trimmed = s[2:end]
            trimhead(trimmed, arr)
        else
            s
        end
    end
end


"""
$(SIGNATURES)
Remove all trailing characters belong to list in `arr`,
and collect them.  This is useful to collect punctuation
from a token, for example.
"""
function collecttail(s::AbstractString, arr, stripped=[])
    
    if isempty(s)
        join(stripped,"")
    else 
        lastch = string(last(s))
        if occursin(lastch,arr)
            push!(stripped, lastch)
            trimmed = chop(s, head=0, tail=1)
            collecttail(trimmed, arr, stripped)
        else
            join(stripped,"")
        end
    end
end

"""
Remove all trailing characters belong to list in `arr`,
and return the trimmed string.  

$(SIGNATURES)

This is useful to remove punctuation
from a token, for example.
"""
function trimtail(s::AbstractString, arr)
    lastch = string(last(s))
    if (isempty(s))
        ""
    elseif occursin(lastch,arr)
        if length(s) == 1
            ""
        else
            trimmed = chop(s, head=0, tail=1)
            trimtail(trimmed, arr)
        end
    else
        s
    end
end


"""Shorthand function to normalize string `s` to Unicode form NFKC.

$(SIGNATURES)
"""
function nfkc(s::AbstractString)
    Unicode.normalize(s, :NFKC)
end