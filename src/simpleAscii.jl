


struct GenericOrthography <: OrthographicSystem
    codepoints
    tokencategories
end


"An orthographic for a basic alphabetic subset of the ASCII characater set."
struct SimpleAscii <: OrthographicSystem
end

function codepoints(ortho::SimpleAscii)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphaupper = uppercase(alphabet)
    punct = "-.,:;!?"
    quotes = "'\""
    brackets = "()[]"
    alphabet * alphaupper * punct * quotes * brackets
end





