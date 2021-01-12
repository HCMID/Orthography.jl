

@testset "Test constructors of concrete orthographic systems" begin
    charset = ['a', 'b', 'c', '!']
    tokencats = ["alphas", "bangs"]
    ortho = SimpleAscii(charset, tokencats)
    @test isa(ortho, SimpleAscii)
    @test typeof(ortho) <: OrthographicSystem
end