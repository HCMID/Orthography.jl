using Orthography
using Test

@testset "Test enumeration of basic token types" begin
    #@test alphabetictoken < numerictoken

end

@testset "Test constructors of systems" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    ortho = SimpleAscii(charset, tokencats)
    @test isa(ortho, SimpleAscii)
    @test typeof(ortho) <: OrthographicSystem
end


@testset "Test parameterized functions" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    s = codepoints(SimpleAscii(charset, tokencats))
    @test s ==  ['a', 'b', 'c', '!']
end

@testset "Test fake ortho" begin
    latin = Orthography.Latin23()
    @test codepoints(latin) == "UVIJ"
end
