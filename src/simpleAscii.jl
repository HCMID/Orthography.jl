

"Singleton type for parameterizing"

struct SimpleAscii <: OrthographicSystem
    codepoints
    tokencategories
end

struct Latin23  <: OrthographicSystem
end


function codepoints(ortho::T) where {T <: OrthographicSystem}
    ortho.codepoints
end

function codepoints(ortho::Latin23)
    "UVIJ"
end
