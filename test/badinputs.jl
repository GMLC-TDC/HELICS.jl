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

@testset "Bad Input filter core tests" begin

    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    cr = h.helicsFederateGetCoreObject(mFed1)

    filt1 = h.helicsCoreRegisterFilter(cr, h.HELICS_FILTER_TYPE_DELAY, "filt1")
    @test_throws h.HELICSErrorRegistrationFailure filt2 = h.helicsCoreRegisterFilter(cr, h.HELICS_FILTER_TYPE_DELAY, "filt1")
    h.helicsFilterSetOption(filt1, h.HELICS_HANDLE_OPTION_CONNECTION_OPTIONAL, true)
    @test h.helicsFilterGetOption(filt1, h.HELICS_HANDLE_OPTION_CONNECTION_OPTIONAL)
    h.helicsFederateFinalize(mFed1)
    h.helicsCoreDestroy(cr)

end


@testset "Bad Input type publication 2 tests" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "test")

    pubid = h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "string", "")
    @test_throws h.HELICSErrorRegistrationFailure pubid2 = h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "string", "")

    @test_throws h.HELICSErrorInvalidArgument h.helicsFederateRegisterFromPublicationJSON(vFed1, "unknownfile.json")

    @test_throws h.HELICSErrorExternalType h.helicsFederateRegisterInterfaces(vFed1, "unknownfile.json")

    subid = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "string", "")
    @test_throws h.HELICSErrorRegistrationFailure subid2 = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "string", "")

    h.helicsInputAddTarget(subid, "pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    h.helicsFederateEnterExecutingModeIterativeAsync(vFed1, h.HELICS_ITERATION_REQUEST_NO_ITERATION)
    res = h.helicsFederateEnterExecutingModeIterativeComplete(vFed1)
    @test res == h.HELICS_ITERATION_RESULT_NEXT_STEP

    h.helicsPublicationPublishTime(pubid, 27.0)

    @test_throws h.HELICSErrorInvalidArgument h.helicsFederatePublishJSON(vFed1, "unknownfile.json")

    h.helicsFederateRequestNextStep(vFed1)
    str = h.helicsInputGetString(subid)
    @test str[1] == '2'
    @test str[2] == '7'
    h.helicsFederateClearUpdates(vFed1)

    h.helicsFederateFinalize(vFed1)

    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishRaw(pubid, str)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishString(pubid, str)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishInteger(pubid, 5)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishBoolean(pubid, true)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishDouble(pubid, 39.2)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishTime(pubid, 19.2)
    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishChar(pubid, 'a')

    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishComplex(pubid, 2.5 + -9.8im)

    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishVector(pubid, [1.3, 2.9])

    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsPublicationPublishNamedPoint(pubid, "hello world", 2.0)

end

@testset "Bad Input tests raw tests" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "test")

    pubid = h.helicsFederateRegisterPublication(vFed1, "pub1", h.HELICS_DATA_TYPE_RAW, "")

    subid = h.helicsFederateRegisterGlobalInput(vFed1, "inp1", h.HELICS_DATA_TYPE_RAW, "")

    h.helicsPublicationAddTarget(pubid, "inp1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    h.helicsFederateEnterExecutingMode(vFed1)

    h.helicsPublicationPublishDouble(pubid, 27.0)
    h.helicsFederateRequestNextStep(vFed1)
    h.helicsInputGetRawValue(subid)

    s = h.helicsInputGetString(subid)
    @test s == "0.000000"
    val = h.helicsInputGetComplexObject(subid)
    @test val == 0.0 + 0.0im

    h.helicsFederateFinalize(vFed1)

    t, res = h.helicsFederateRequestTimeIterative(vFed1, 1.0, h.HELICS_ITERATION_REQUEST_NO_ITERATION)
    @test res == h.HELICS_ITERATION_RESULT_HALTED

end

@testset "Bad Input duplicate publication and input pathways" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    pubid = h.helicsFederateRegisterTypePublication(vFed1, "pub1", "string", "")

    @test_throws h.HELICSErrorRegistrationFailure pubid2 = h.helicsFederateRegisterTypePublication(vFed1, "pub1", "string", "")

    subid = h.helicsFederateRegisterGlobalTypeInput(vFed1, "inp1", "string", "")
    @test_throws h.HELICSErrorRegistrationFailure subid2 = h.helicsFederateRegisterGlobalTypeInput(vFed1, "inp1", "string", "")

    @test_throws h.HELICSErrorInvalidObject ept = h.helicsFederateRegisterEndpoint(vFed1, "ept1", "")

    h.helicsInputAddTarget(subid, "Testfed0/pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    h.helicsFederateEnterExecutingMode(vFed1)

    h.helicsPublicationPublishDouble(pubid, 27.0)
    h.helicsFederateRequestNextStep(vFed1)
    str = h.helicsInputGetString(subid)
    @test str[1] == '2'
    @test str[2] == '7'

    messages = h.helicsFederatePendingMessages(vFed1)
    @test messages == 0

    h.helicsFederateFinalize(vFed1)

end

@testset "Bad input init error" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    # register the publications

    # the types here don't match which causes an error when initializing the federation
    h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "custom1", "")

    subid = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "custom2", "")
    k1 = h.helicsInputGetKey(subid)

    # check some other calls
    inp2 = h.helicsFederateGetInput(vFed1, "inp1")
    k2 = h.helicsInputGetKey(inp2)
    @test k1 == k2

    inp3 = h.helicsFederateGetInputByIndex(vFed1, 0)
    k3 = h.helicsInputGetKey(inp3)
    @test k1 == k3

    h.helicsInputAddTarget(subid, "pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    # unknown publication
    @test_throws h.HELICSErrorInvalidArgument pub3 = h.helicsFederateGetPublication(vFed1, "unknown")

    # error in this call from the mismatch
    @test_throws h.HELICSErrorConnectionFailure h.helicsFederateEnterInitializingMode(vFed1)

    @test_throws h.HELICSErrorInvalidFunctionCall h.helicsFederateRequestTimeAdvance(vFed1, 0.1)

    # unknown input
    @test_throws h.HELICSErrorInvalidArgument inp4 = h.helicsFederateGetInput(vFed1, "unknown")

    # invalid input index
    # TODO: does this test segfault some times?
    @test_throws h.HELICSErrorInvalidArgument inp5 = h.helicsFederateGetInputByIndex(vFed1, 4)

    h.helicsFederateFinalize(vFed1)

end
