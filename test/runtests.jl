using EconFunctions
using ContinuousTransformations
using Base.Test
using Compat: ∘

@testset "quadrature general" begin
    @test_throws ArgumentError Quadrature(1..2, collect(1:3), collect(1:4))
end
        
@testset "normal quadrature" begin
    q = quadrature_standard_normal(10)
    @test sprint(show, q) == "Quadrature of 10 nodes on " * sprint(show, ℝ)
    @test domain(q) == ℝ
    @test q(one) ≈ 1
    @test isapprox(q(identity), 0, atol=eps()) # FIXME replace with new test syntax
    @test q(x->x^2) ≈ 1
    μ = 2.0
    σ = 3.0
    a = Affine(σ, μ)
    @test q(a) ≈ μ
    @test q((x->x^2) ∘ a) ≈ μ^2 + σ^2
end

@testset "uniform quadrature" begin
    q = quadrature_standard_uniform(9)
    @test sprint(show, q) == "Quadrature of 9 nodes on " * sprint(show, 𝕀)
    @test domain(q) == 𝕀
    @test q(one) ≈ 1
    @test q(identity) ≈ 0.5
    @test q(x->(x-0.5)^2) ≈ 1/12
end
