include("init.jl")

@testset "Bad Input message federate message" begin
    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    ept1 = h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")
    @test_throws h.HELICSErrorRegistrationFailure h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")

    h.helicsFederateEnterExecutingMode(mFed1)
    h.helicsEndpointSetDefaultDestination(ept1, "ept1")

    mess0 = h.helicsEndpointGetMessage(ept1)
    @test mess0.length == 0

    mess0 = h.helicsFederateGetMessage(mFed1)
    @test mess0.length == 0

    h.helicsEndpointSendMessage(ept1, mess0)

    h.helicsFederateRequestNextStep(mFed1)
    cnt = h.helicsEndpointPendingMessages(ept1)
    @test cnt == 1

    h.helicsFederateFinalize(mFed1)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsEndpointSendMessage(ept1, mess0)
end

@testset "Bad Input filter test4" begin

    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    filt1 = h.helicsFederateRegisterCloningFilter(mFed1, "filt1")
    @test_throws h.HELICSErrorRegistrationFailure filt2 = h.helicsFederateRegisterCloningFilter(mFed1, "filt1")

    @test_throws h.HELICSErrorInvalidArgument h.helicsFilterSetString(filt1, "unknown", "string")

    h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")

    h.helicsFilterAddDeliveryEndpoint(filt1, "ept1")
    h.helicsFilterAddSourceTarget(filt1, "ept1")
    h.helicsFilterAddDestinationTarget(filt1, "ept1")
    h.helicsFilterRemoveTarget(filt1, "ept1")

    @test_throws h.HELICSErrorInvalidArgument h.helicsFilterSet(filt1, "unknown", 10.0)
    h.helicsFederateFinalize(mFed1)

end
