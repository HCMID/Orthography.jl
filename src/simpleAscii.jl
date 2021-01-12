

"An orthographic for a basic alphabetic subset of the ASCII characater set."
struct SimpleAscii <: OrthographicSystem
    codepoints
    tokencategories
end



struct Latin23  <: OrthographicSystem
end




function codepoints(ortho::Latin23)
    "UVIJ"
end
