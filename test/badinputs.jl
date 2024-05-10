include("init.jl")

@testset "Bad Input message federate message" begin
    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    ept1 = h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")

    h.helicsFederateEnterExecutingMode(mFed1)
    h.helicsEndpointSetDefaultDestination(ept1, "ept1")

    @test_throws ErrorException h.helicsEndpointGetMessage(ept1)

    @test_throws ErrorException h.helicsFederateGetMessage(mFed1)
    mess0 = h.helicsEndpointCreateMessage(ept1)
    h.helicsFederateDisconnect(mFed1)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsEndpointSendMessage(ept1, mess0)

    destroyFederate(mFed1, fedinfo)
    destroyBroker(broker)

end

@testset "Bad Input filter test4" begin

    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    filt1 = h.helicsFederateRegisterCloningFilter(mFed1, "filt1")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE filt2 = h.helicsFederateRegisterCloningFilter(mFed1, "filt1")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsFilterSetString(filt1, "unknown", "string")

    h.helicsFederateRegisterGlobalEndpoint(mFed1, "ept1", "")

    h.helicsFilterAddDeliveryEndpoint(filt1, "ept1")
    h.helicsFilterAddSourceTarget(filt1, "ept1")
    h.helicsFilterAddDestinationTarget(filt1, "ept1")
    h.helicsFilterRemoveTarget(filt1, "ept1")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsFilterSet(filt1, "unknown", 10.0)
    h.helicsFederateDisconnect(mFed1)

    destroyFederate(mFed1, fedinfo)
    destroyBroker(broker)

end

@testset "Bad Input filter core tests" begin

    broker = createBroker(1)
    mFed1, fedinfo = createMessageFederate(1, "test")

    cr = h.helicsFederateGetCore(mFed1)

    filt1 = h.helicsCoreRegisterFilter(cr, h.HELICS_FILTER_TYPE_DELAY, "filt1")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE filt2 = h.helicsCoreRegisterFilter(cr, h.HELICS_FILTER_TYPE_DELAY, "filt1")
    h.helicsFilterSetOption(filt1, h.HELICS_HANDLE_OPTION_CONNECTION_OPTIONAL, true)
    @test h.helicsFilterGetOption(filt1, h.HELICS_HANDLE_OPTION_CONNECTION_OPTIONAL)
    h.helicsFederateDisconnect(mFed1)
    h.helicsCoreDestroy(cr)

    destroyFederate(mFed1, fedinfo)
    destroyBroker(broker)
end


@testset "Bad Input type publication 2 tests" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "test")

    pubid = h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "string", "")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE pubid2 = h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "string", "")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsFederateRegisterFromPublicationJSON(vFed1, "unknownfile.json")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsFederateRegisterInterfaces(vFed1, "unknownfile.json")

    subid = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "string", "")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE subid2 = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "string", "")

    h.helicsInputAddTarget(subid, "pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    h.helicsFederateEnterExecutingModeIterativeAsync(vFed1, h.HELICS_ITERATION_REQUEST_NO_ITERATION)
    res = h.helicsFederateEnterExecutingModeIterativeComplete(vFed1)
    @test res == h.HELICS_ITERATION_RESULT_NEXT_STEP

    h.helicsPublicationPublishTime(pubid, 27.0)

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsFederatePublishJSON(vFed1, "unknownfile.json")

    h.helicsFederateRequestNextStep(vFed1)
    str = h.helicsInputGetString(subid)
    @test str[1] == '2'
    @test str[2] == '7'
    h.helicsFederateClearUpdates(vFed1)

    h.helicsFederateDisconnect(vFed1)

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishBytes(pubid, str)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishString(pubid, str)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishInteger(pubid, 5)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishBoolean(pubid, true)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishDouble(pubid, 39.2)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishTime(pubid, 19.2)
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishChar(pubid, 'a')

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishComplex(pubid, 2.5 + -9.8im)

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishVector(pubid, [1.3, 2.9])

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsPublicationPublishNamedPoint(pubid, "hello world", 2.0)

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)
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
    h.helicsInputGetBytes(subid)

    s = h.helicsInputGetString(subid)
    #@test_broken s == "0.000000"
    val = h.helicsInputGetComplexObject(subid)
    #@test_broken val == 0.0 + 0.0im

    h.helicsFederateDisconnect(vFed1)

    t, res = h.helicsFederateRequestTimeIterative(vFed1, 1.0, h.HELICS_ITERATION_REQUEST_NO_ITERATION)
    @test res == h.HELICS_ITERATION_RESULT_HALTED

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)
end

@testset "Bad Input duplicate publication and input pathways" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    pubid = h.helicsFederateRegisterTypePublication(vFed1, "pub1", "string", "")

    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE pubid2 = h.helicsFederateRegisterTypePublication(vFed1, "pub1", "string", "")

    subid = h.helicsFederateRegisterGlobalTypeInput(vFed1, "inp1", "string", "")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE subid2 = h.helicsFederateRegisterGlobalTypeInput(vFed1, "inp1", "string", "")

    @test_throws h.Utils.HELICS_ERROR_INVALID_OBJECT ept = h.helicsFederateRegisterEndpoint(vFed1, "ept1", "")

    h.helicsInputAddTarget(subid, "Testfed0/pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    h.helicsFederateEnterExecutingMode(vFed1)

    h.helicsPublicationPublishDouble(pubid, 27.0)
    h.helicsFederateRequestNextStep(vFed1)
    str = h.helicsInputGetString(subid)
    @test str[1] == '2'
    @test str[2] == '7'

    messages = h.helicsFederatePendingMessageCount(vFed1)
    @test messages == 0

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)

end

@testset "Bad input init error" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    # register the publications

    # the types here don't match which causes an error when initializing the federation
    h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "custom1", "")

    subid = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "custom2", "")
    k1 = h.helicsInputGetName(subid)

    # check some other calls
    inp2 = h.helicsFederateGetInput(vFed1, "inp1")
    k2 = h.helicsInputGetName(inp2)
    @test k1 == k2

    inp3 = h.helicsFederateGetInputByIndex(vFed1, 0)
    k3 = h.helicsInputGetName(inp3)
    @test k1 == k3

    h.helicsInputAddTarget(subid, "pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    # unknown publication
    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT pub3 = h.helicsFederateGetPublication(vFed1, "unknown")

    # error in this call from the mismatch
    @test_throws h.Utils.HELICS_ERROR_CONNECTION_FAILURE h.helicsFederateEnterInitializingMode(vFed1)

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsFederateRequestTimeAdvance(vFed1, 0.1)

    # unknown input
    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT inp4 = h.helicsFederateGetInput(vFed1, "unknown")

    # invalid input index
    # TODO: does this test segfault some times?
    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT inp5 = h.helicsFederateGetInputByIndex(vFed1, 4)

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)

end

@testset "Bad Inputs input tests" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    # register the publications

    pubid = h.helicsFederateRegisterGlobalPublication(vFed1, "pub1", h.HELICS_DATA_TYPE_DOUBLE, "")

    subid = h.helicsFederateRegisterInput(vFed1, "inp1", h.HELICS_DATA_TYPE_DOUBLE, "")
    @test_throws h.Utils.HELICS_ERROR_REGISTRATION_FAILURE subid2 = h.helicsFederateRegisterInput(vFed1, "inp1", h.HELICS_DATA_TYPE_DOUBLE, "")

    h.helicsInputAddTarget(subid, "pub1")

    vf2 = h.helicsFederateClone(vFed1)
    @test h.helicsFederateGetName(vFed1) == h.helicsFederateGetName(vf2)

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    @test_throws h.Utils.HELICS_ERROR_INVALID_OBJECT ept = h.helicsFederateRegisterEndpoint(vFed1, "ept1", "")

    h.helicsFederateEnterInitializingMode(vFed1)

    h.helicsPublicationPublishDouble(pubid, 27.0)

    comp = h.helicsFederateEnterExecutingModeIterative(vFed1, h.HELICS_ITERATION_REQUEST_FORCE_ITERATION)
    @test comp == h.HELICS_ITERATION_RESULT_ITERATING
    val = h.helicsInputGetDouble(subid)
    @test val == 27.0
    valt = h.helicsInputGetTime(subid)
    @test valt == 27.0

    comp = h.helicsFederateEnterExecutingModeIterative(vFed1, h.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED)

    @test comp == h.HELICS_ITERATION_RESULT_NEXT_STEP

    val2 = h.helicsInputGetDouble(subid)
    @test val2 == val
    #expect error entering initializing Mode again
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsFederateEnterInitializingMode(vFed1)

    #expect error entering initializing Mode again
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsFederateEnterInitializingModeAsync(vFed1)

    #expect error entering initializing Mode again
    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsFederateEnterInitializingModeComplete(vFed1)

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)

end

@testset "Bad Inputs Core Link" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    # register the publications

    h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "custom1", "")

    h.helicsFederateRegisterTypeInput(vFed1, "inp1", "custom2", "")

    fed2 = h.helicsGetFederateByName(h.helicsFederateGetName(vFed1))
    @test h.helicsFederateGetName(fed2) == h.helicsFederateGetName(vFed1)

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT fed3 = h.helicsGetFederateByName("fed_unknown")

    cr = h.helicsFederateGetCore(vFed1)
    h.helicsCoreDataLink(cr, "pub1", "fed0/inp1")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsCoreMakeConnections(cr, "unknownfile.json")

    # TODO: This test should throw an error
    # @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsCoreDataLink(cr, "pub1", "")

    cr2 = h.helicsCoreClone(cr)
    @test h.helicsCoreGetAddress(cr2) == h.helicsCoreGetAddress(cr)

    # TODO: this should error as well
    h.helicsFederateEnterExecutingMode(vFed1)

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)
end

@testset "Bad Inputs broker link" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    # register the publications

    h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "custom1", "")

    h.helicsFederateRegisterTypeInput(vFed1, "inp1", "custom2", "")

    br = h.helicsBrokerClone(broker)

    h.helicsBrokerDataLink(br, "pub1", "Testfed0/inp1")

    # TODO: This test should throw an error
    # @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsBrokerDataLink(br, "pub1", "")

    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT h.helicsBrokerMakeConnections(br, "unknownfile.json")

    @test_throws h.Utils.HELICS_ERROR_CONNECTION_FAILURE h.helicsFederateEnterExecutingMode(vFed1)

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)

    h.helicsBrokerWaitForDisconnect(broker, 200)

    destroyBroker(broker)

end


@testset "Bad Inputs frees" begin
    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")

    fi = h.helicsCreateFederateInfo()
    h.helicsFederateInfoSetBroker(fi, "broker test")
    h.helicsFederateEnterInitializingMode(vFed1)
    h.helicsFederateDisconnect(vFed1)

    h.helicsFederateInfoSetBrokerPort(fi, 8929)
    h.helicsFederateInfoSetLocalPort(fi, "8229")

    h.helicsFederateInfoFree(fi)
    h.helicsFederateFree(vFed1)

    @test_throws h.Utils.HELICS_ERROR_INVALID_OBJECT destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)
end


@testset "Bad Inputs init error 5" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")
    # register the publications

    h.helicsFederateInfoSetSeparator(fedinfo, '-')
    h.helicsFederateSetSeparator(vFed1, '-')

    h.helicsFederateRegisterGlobalTypePublication(vFed1, "pub1", "custom1", "")

    subid = h.helicsFederateRegisterTypeInput(vFed1, "inp1", "custom2", "")

    h.helicsInputAddTarget(subid, "pub1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)

    @test_throws h.Utils.HELICS_ERROR_CONNECTION_FAILURE resIt = h.helicsFederateEnterExecutingModeIterative(vFed1, h.HELICS_ITERATION_REQUEST_NO_ITERATION)

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL h.helicsFederateRequestTimeIterativeAsync(vFed1, 1.0, h.HELICS_ITERATION_REQUEST_NO_ITERATION)

    @test_throws h.Utils.HELICS_ERROR_INVALID_FUNCTION_CALL res = h.helicsFederateRequestTimeIterativeComplete(vFed1)

    h.helicsFederateDisconnect(vFed1)

    destroyFederate(vFed1, fedinfo)

    destroyBroker(broker)

end

@testset "Bad Inputs misc tests" begin

    @test h.helicsGetPropertyIndex("") == -101
    @test h.helicsGetPropertyIndex("not_a_property") == -101

    @test h.helicsGetOptionIndex("") == -101
    @test h.helicsGetOptionIndex("not_a_property") == -101

end
