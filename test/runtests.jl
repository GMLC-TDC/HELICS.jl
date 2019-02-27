
using HELICS
using Test
const h = HELICS

@test h.helicsGetVersion() isa String
@test h.helicsGetVersion() == "2.0.0-rc1 (01-18-19)"

include("valuefederate.jl")
include("messagefederate.jl")
include("messagefilter.jl")
