using Orthography
using Test

@testset "Test enumeration of basic token types" begin
    #@test alphabetictoken < numerictoken

end

@testset "Test constructors of systems" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    #ortho = OrthographicSystem(charset, tokencats)
    #@test isa(ortho, OrthographicSystem)
end


@testset "Test parameterized functions" begin
    s = cps(SimpleAscii)
    @test s == "XX"
end
