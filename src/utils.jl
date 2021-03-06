# Some utility functions.

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
$(SIGNATURES)
Remove all trailing characters belong to list in `arr`,
and and return the trimmed string.  This is useful to remove punctuation
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

