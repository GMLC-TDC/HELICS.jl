include("init.jl")

@testset "MessageFederate test_message_federate_initialize" begin
    broker = createBroker()
    mFed, fedinfo = createMessageFederate()

    state = h.helicsFederateGetState(mFed)
    @test state == 0
    h.helicsFederateEnterExecutingMode(mFed)

    state = h.helicsFederateGetState(mFed)
    @test state == 2

    destroyFederate(mFed, fedinfo)
    destroyBroker(broker)
end

@testset "MessageFederate test_message_federate_endpoint_registration" begin
    broker = createBroker()
    mFed, fedinfo = createMessageFederate()

    epid1 = h.helicsFederateRegisterEndpoint(mFed, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed, "ep2", "random")

    h.helicsFederateEnterExecutingMode(mFed)

    @test h.HELICS_STATE_EXECUTION == h.helicsFederateGetState(mFed)

    endpoint_name = h.helicsEndpointGetName(epid1)
    @test endpoint_name == "TestA Federate/ep1"

    endpoint_name = h.helicsEndpointGetName(epid2)
    @test endpoint_name == "ep2"

    endpoint_name = h.helicsEndpointGetType(epid1)
    @test endpoint_name == ""

    endpoint_name = h.helicsEndpointGetType(epid2)
    @test endpoint_name == "random"

    epid_b = h.helicsFederateGetEndpoint(mFed, "ep2")
    type = h.helicsEndpointGetType(epid_b)
    @test type == "random"

    epid_c = h.helicsFederateGetEndpointByIndex(mFed, 0)
    name = h.helicsEndpointGetName(epid_c)
    @test name == "TestA Federate/ep1"

    destroyFederate(mFed, fedinfo)
    destroyBroker(broker)
end

@testset "MessageFederate test_message_federate_send" begin
    broker = createBroker()
    mFed, fedinfo = createMessageFederate()

    epid1 = h.helicsFederateRegisterEndpoint(mFed, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed, "ep2", "random")

    h.helicsFederateSetTimeProperty(mFed, h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    h.helicsFederateEnterExecutingMode(mFed)

    data = "random-data"

    h.helicsEndpointSendBytesToAt(epid1, data, "ep2", 1.0)

    granted_time = h.helicsFederateRequestTime(mFed, 2.0)
    @test granted_time == 1.0

    res = h.helicsFederateHasMessage(mFed)
    @test res == true

    res = h.helicsEndpointHasMessage(epid1)
    @test res == false

    res = h.helicsEndpointHasMessage(epid2)
    @test res == true

    message = h.helicsEndpointGetMessage(epid2)

    @test h.helicsMessageGetMessageID(message) == 55
    @test h.helicsMessageIsValid(message) == true
    @test h.helicsMessageGetString(message) == "random-data"
    @test h.helicsMessageGetByteCount(message) == 11
    @test h.helicsMessageGetOriginalDestination(message) == ""
    @test h.helicsMessageGetOriginalSource(message) == "TestA Federate/ep1"
    @test h.helicsMessageGetSource(message) == "TestA Federate/ep1"
    @test h.helicsMessageGetTime(message) == 1.0
    # h.helicsMessageGetRawData(message) crashes

    destroyFederate(mFed, fedinfo)
    destroyBroker(broker)
end

@testset "MessageFederate send_receive_2fed_multisend" begin

    broker = createBroker(2)
    mFed1, fedinfo1 = createMessageFederate(1, "A Federate")
    mFed2, fedinfo2 = createMessageFederate(1, "B Federate")

    epid1 = h.helicsFederateRegisterEndpoint(mFed1, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed2, "ep2", "random")

    h.helicsEndpointSetOption(epid1, h.HELICS_HANDLE_OPTION_IGNORE_INTERRUPTS, true)

    h.helicsFederateSetTimeProperty(mFed1, h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    h.helicsFederateSetTimeProperty(mFed2, h.HELICS_PROPERTY_TIME_DELTA, 1.0)

    h.helicsFederateEnterExecutingModeAsync(mFed1)
    h.helicsFederateEnterExecutingMode(mFed2)
    h.helicsFederateEnterExecutingModeComplete(mFed1)

    @test h.HELICS_STATE_EXECUTION == h.helicsFederateGetState(mFed1)
    @test h.HELICS_STATE_EXECUTION == h.helicsFederateGetState(mFed2)

    h.helicsEndpointSetDefaultDestination(epid1, "ep2");

    h.helicsEndpointSendBytesTo(epid1, "a", "ep2")
    h.helicsEndpointSendBytesTo(epid1, "a", "ep2")
    h.helicsEndpointSendBytesTo(epid1, "a", "ep2")

    h.helicsFederateRequestTimeAsync(mFed1, 1.0)
    granted_time = h.helicsFederateRequestTime(mFed2, 1.0)
    complete_time = h.helicsFederateRequestTimeComplete(mFed1)

    @test granted_time == 1.0
    @test complete_time == 1.0

    res = h.helicsEndpointPendingMessageCount(epid2)
    @test res == 3

    res = h.helicsFederatePendingMessageCount(mFed2)
    @test res == 3

    @test h.helicsEndpointGetDefaultDestination(epid1) == "ep2"

    # FIXME: Someday this will be implemented.
    @test_broken h.helicsEndpointGetOption(epid1, h.HELICS_HANDLE_OPTION_IGNORE_INTERRUPTS) == true

    destroyFederate(mFed1, fedinfo1)
    destroyFederate(mFed2, fedinfo2)
    destroyBroker(broker)

end

@testset "MessageFederate message_object_tests" begin

    broker = createBroker(1)
    mFed1, fedinfo1 = createMessageFederate(1, "test")

    epid1 = h.helicsFederateRegisterEndpoint(mFed1, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed1, "ep2", "random");

    h.helicsFederateSetTimeProperty(mFed1, h.HELICS_PROPERTY_TIME_DELTA, 1.0)

    h.helicsFederateEnterExecutingMode(mFed1)

    @test h.helicsFederateGetState(mFed1) == h.HELICS_STATE_EXECUTION

    msg = h.helicsFederateCreateMessage(mFed1)
    h.helicsMessageSetDestination(msg, "ep2")
    h.helicsMessageGetDestination(msg) == "ep2"
    h.helicsMessageSetData(msg, repeat("a", 500))
    h.helicsMessageSetTime(msg, 0.0)

    h.helicsEndpointSendMessage(epid1, msg)
    time = h.helicsFederateRequestTime(mFed1, 1.0)
    @test time == 1.0

    @test h.helicsFederateHasMessage(mFed1) == true
    @test h.helicsEndpointHasMessage(epid1) == false
    @test h.helicsEndpointHasMessage(epid2) == true

    msg = h.helicsEndpointGetMessage(epid2)
    @test h.helicsMessageGetByteCount(msg) == 500
    # @show h.helicsMessageGeBytes(msg)
    # segfaults
    rdata = h.helicsMessageGetBytesPointer(msg)
    @test Char(unsafe_load(Ptr{Cchar}(rdata), 245)) == 'a'

    h.helicsFederateFinalize(mFed1)

    @test h.helicsFederateGetState(mFed1) == h.HELICS_STATE_FINALIZE

    h.helicsMessageSetFlagOption(msg, 7, true);
    @test h.helicsMessageGetFlagOption(msg, 7) == true
    h.helicsMessageClearFlags(msg);
    @test h.helicsMessageGetFlagOption(msg, 7) == false

    h.helicsEndpointSetDefaultDestination(epid1, "ep2")

    destroyFederate(mFed1, fedinfo1)
    destroyBroker(broker)

end


@testset "MessageFederate timing tests" begin

    broker = createBroker(1)
    vFed1, fedinfo1 = createMessageFederate(1, "fed0")
    vFed2, fedinfo2 = createMessageFederate(1, "fed1")

    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 0.1)
    h.helicsFederateSetTimeProperty(vFed2, h.HELICS_PROPERTY_TIME_PERIOD, 0.1)

    h.helicsFederateSetTimeProperty(vFed2, h.HELICS_PROPERTY_TIME_INPUT_DELAY, 0.1)

    h.helicsFederateSetFlagOption(vFed1, h.HELICS_FLAG_IGNORE_TIME_MISMATCH_WARNINGS, true)
    h.helicsFederateSetFlagOption(vFed2, h.HELICS_FLAG_IGNORE_TIME_MISMATCH_WARNINGS, true)

    ept1 = h.helicsFederateRegisterGlobalEndpoint(vFed1, "e1", "")
    h.helicsFederateRegisterGlobalEndpoint(vFed2, "e2", "")

    h.helicsFederateEnterExecutingModeAsync(vFed1)
    h.helicsFederateEnterExecutingMode(vFed2)
    h.helicsFederateEnterExecutingModeComplete(vFed1)
    h.helicsFederateRequestTimeAsync(vFed2, 2.0)
    gtime = h.helicsFederateRequestTime(vFed1, 1.0)
    # check that the request is only granted at the appropriate period
    @test gtime == 1.0

    @test h.helicsFederateGetIntegerProperty(vFed1, h.HELICS_PROPERTY_INT_CONSOLE_LOG_LEVEL) == -1
    @test h.helicsFederateGetIntegerProperty(vFed2, h.HELICS_PROPERTY_INT_CONSOLE_LOG_LEVEL) == -1

    @test h.helicsFederateGetFlagOption(vFed1, h.HELICS_FLAG_IGNORE_TIME_MISMATCH_WARNINGS) == true
    @test h.helicsFederateGetFlagOption(vFed2, h.HELICS_FLAG_IGNORE_TIME_MISMATCH_WARNINGS) == true

    h.helicsEndpointSendBytesTo(ept1, "test1", "e2")
    h.helicsFederateRequestTimeAsync(vFed1, 1.9)
    gtime = h.helicsFederateRequestTimeComplete(vFed2)
    @test gtime >= 1.1 # the message should show up at the next available time point after the impact window
    h.helicsFederateRequestTimeAsync(vFed2, 2.0)
    gtime = h.helicsFederateRequestTimeComplete(vFed1)
    @test gtime >= 1.9

    tres = h.helicsFederateGetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD)
    @test tres == 0.1

    # m = h.helicsEndpointGetMessage(ept1)
    # @show h.helicsMessageGetRawData(m)
    # TODO: null pointer received from C

    gtime = h.helicsFederateRequestTimeComplete(vFed2)
    @test gtime == 2.0
    h.helicsFederateFinalize(vFed1)
    h.helicsFederateFinalize(vFed2)

    destroyFederate(vFed1, fedinfo1)
    destroyFederate(vFed2, fedinfo2)
    destroyBroker(broker)


end
