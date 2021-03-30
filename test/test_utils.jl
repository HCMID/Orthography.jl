@testset "Test Unicode normalization utility" begin
    fat = Unicode.normalize("μῆνιν", :NFKD)
    skinny = nfkc(fat)
    @test length(fat) == 6
    @test length(skinny) == 5
end