include("init.jl")

@testset "Combination Federate" begin

    broker = createBroker();

    cfed = h.helicsCreateCombinationFederateFromConfig(joinpath(@__DIR__, "combinationfederate.json"))

    @test h.helicsFederateIsValid(cfed)

    @test h.helicsFederateGetEndpointCount(cfed) == 6
    @test h.helicsFederateGetFilterCount(cfed) == 6
    @test h.helicsFederateGetInputCount(cfed) == 7

    ept = h.helicsFederateGetEndpointByIndex(cfed, 0);

    @test h.helicsEndpointGetName(ept) == "EV_Controller/EV6"

    filt = h.helicsFederateGetFilterByIndex(cfed, 3)

    @test h.helicsFilterGetName(filt) == "EV_Controller/filterEV3"

    f = h.helicsFederateGetFilter(cfed, "EV_Controller/filterEV3")
    @test h.helicsFilterGetName(f) == "EV_Controller/filterEV3"

    ipt = h.helicsFederateGetInputByIndex(cfed, 4)
    @test h.helicsInputGetExtractionUnits(ipt) == ""
    @test h.helicsSubscriptionGetKey(ipt) == "IEEE_123_feeder_0/charge_EV3"

    h.helicsEndpointClearMessages(ept)

    h.helicsFederateDestroy(cfed)
    h.helicsBrokerDestroy(broker)

end
