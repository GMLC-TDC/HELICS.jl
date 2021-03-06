
using HELICS
using Test
const h = HELICS

@testset "Versions" begin

    @test h.helicsGetVersion() isa String
    @test VersionNumber(split(h.helicsGetVersion())[1]) == h.HELICS_LIBRARY_VERSION

end

@testset "API" begin
    include("api.jl")
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

@testset "Query" begin
    include("query.jl")
end

@testset "Filters" begin
    include("filters.jl")
end

@testset "Bad Inputs" begin
    include("badinputs.jl")
end

@testset "System Test" begin
    include("systemtests.jl")
end

@testset "Iteration Test" begin
    include("iteration.jl")
end
