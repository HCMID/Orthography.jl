module Orthography



export OrthographicSystem, SimpleAscii #, BasicTokenTypes
export codepoints

"A basic structure for orthographic systems."
abstract type OrthographicSystem end


include("simpleAscii.jl")

 

#=
"A useful set of widely usable categories of token."
@enum BasicTokenTypes begin
    alphabetictoken=1
    numerictoken=2
    punctuationtoken=3
end
=#

end # module
