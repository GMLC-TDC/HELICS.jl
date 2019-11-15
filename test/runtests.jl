
using HELICS
using Test
const h = HELICS

@testset "Versions" begin

    @test h.helicsGetVersion() isa String
    @test VersionNumber(split(h.helicsGetVersion())[1]) == h.HELICS_VERSION

end

@testset "ValueFederate" begin
    include("valuefederate.jl")
end

@testset "MessageFederate" begin
    include("messagefederate.jl")
end

@testset "CombinationFederate" begin
    include("combinationfederate.jl")
end

@testset "MessageFilter" begin
    include("messagefilter.jl")
end

@testset "API" begin
    include("api.jl")
end

@testset "Query" begin
    include("query.jl")
end
