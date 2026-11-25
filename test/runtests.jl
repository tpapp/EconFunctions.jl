using EconFunctions, Test

using JET
@testset "static analysis with JET.jl" begin
    JET.test_package(EconFunctions, target_modules=(EconFunctions,))
end

@testset "QA with Aqua" begin
    import Aqua
    Aqua.test_all(EconFunctions)
end
