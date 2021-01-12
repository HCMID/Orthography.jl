

"Singleton type for parameterizing"
struct SimpleAscii <: OrthographicSystem
end


 
# Generic function
function cps(ortho) #  where {T <: OrthographicSystem}
    "Ortho system is " * ortho
end


