
function startBroker(number=1)
    initstring = "-f $number --name=mainbroker --loglevel=0"

    @test_throws h.HelicsErrorInvalidArgument broker = h.helicsCreateBroker("mq", "", initstring)

    broker = h.helicsCreateBroker("zmq", "", initstring)
    @test broker isa h.Broker

    @test h.helicsBrokerIsConnected(broker) == true

    return broker
end

function createMessageFederate(;name="A Federate", start_broker=true)
    fedinitstring = "--broker=mainbroker --federates=1 --tick=0"
    deltat = 0.01

    # Create broker
    if start_broker
        broker = startBroker()
    else
        broker = nothing
    end

    # Create Federate Info object that describes the federate properties #
    fedinfo = h.helicsCreateFederateInfo()
    @test fedinfo isa h.FederateInfo

    # Set Federate name #
    h.helicsFederateInfoSetCoreName(fedinfo, "Core$name")

    # Set core type from string #
    h.helicsFederateInfoSetCoreTypeFromString(fedinfo, "zmq")

    # Federate init string #
    h.helicsFederateInfoSetCoreInitString(fedinfo, fedinitstring)

    # Set the message interval (timedelta) for federate. Note th#
    # HELICS minimum message time interval is 1 ns and by default
    # it uses a time delta of 1 second. What is provided to the
    # setTimedelta routine is a multiplier for the default timedelta.

    # Set one second message interval #
    h.helicsFederateInfoSetTimeProperty(fedinfo, h.HELICS_PROPERTY_TIME_DELTA, deltat)

    h.helicsFederateInfoSetIntegerProperty(fedinfo, h.HELICS_PROPERTY_INT_LOG_LEVEL, -1)

    mFed = h.helicsCreateMessageFederate("Test$name", fedinfo)

    @test mFed isa h.MessageFederate

    return mFed, fedinfo, broker
end

function destroyMessageFederate(mFed, fedinfo, broker=nothing)

    h.helicsFederateFinalize(mFed)
    state = h.helicsFederateGetState(mFed)
    @test state == 3
    if broker != nothing
        while (h.helicsBrokerIsConnected(broker))
            sleep(1)
        end
    end

    h.helicsFederateInfoFree(fedinfo)
    h.helicsFederateFree(mFed)
    if broker != nothing
        h.helicsCloseLibrary()
    end

end


@testset "MessageFederate test_message_federate_initialize" begin
    mFed, fedinfo, broker = createMessageFederate()

    state = h.helicsFederateGetState(mFed)
    @test state == 0
    h.helicsFederateEnterExecutingMode(mFed)

    state = h.helicsFederateGetState(mFed)
    @test state == 2

    destroyMessageFederate(mFed, fedinfo, broker)
end

@testset "MessageFederate test_message_federate_endpoint_registration" begin
    mFed, fedinfo, broker = createMessageFederate()

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

    destroyMessageFederate(mFed, fedinfo, broker)
end

@testset "MessageFederate test_message_federate_send" begin
    mFed, fedinfo, broker = createMessageFederate()

    epid1 = h.helicsFederateRegisterEndpoint(mFed, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed, "ep2", "random")

    h.helicsFederateSetTimeProperty(mFed, h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    h.helicsFederateEnterExecutingMode(mFed)

    data = "random-data"

    h.helicsEndpointSendEventRaw(epid1, "ep2", data, 1.0)

    granted_time = h.helicsFederateRequestTime(mFed, 2.0)
    @test granted_time == 1.0

    res = h.helicsFederateHasMessage(mFed)
    @test res == true

    res = h.helicsEndpointHasMessage(epid1)
    @test res == false

    res = h.helicsEndpointHasMessage(epid2)
    @test res == true

    message = h.helicsEndpointGetMessage(epid2)

    @test message.data == "random-data"
    @test message.length == 11
    @test message.original_dest == ""
    @test message.original_source == "TestA Federate/ep1"
    @test message.source == "TestA Federate/ep1"
    @test message.time == 1.0

    destroyMessageFederate(mFed, fedinfo, broker)
end


@testset "MessageFederate send_receive_2fed_multisend" begin

    broker = startBroker(2)
    mFed1, fedinfo1, ans = createMessageFederate(name="A Federate", start_broker=false)
    mFed2, fedinfo2, ans = createMessageFederate(name="B Federate", start_broker=false)

    epid1 = h.helicsFederateRegisterEndpoint(mFed1, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed2, "ep2", "random")

    h.helicsFederateSetTimeProperty(mFed1, h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    h.helicsFederateSetTimeProperty(mFed2, h.HELICS_PROPERTY_TIME_DELTA, 1.0)

    h.helicsFederateEnterExecutingModeAsync(mFed1)
    h.helicsFederateEnterExecutingMode(mFed2)
    h.helicsFederateEnterExecutingModeComplete(mFed1)

    @test h.HELICS_STATE_EXECUTION == h.helicsFederateGetState(mFed1)
    @test h.HELICS_STATE_EXECUTION == h.helicsFederateGetState(mFed2)

    h.helicsEndpointSetDefaultDestination(epid1, "ep2");

    h.helicsEndpointSendMessageRaw(epid1, "", "a")
    h.helicsEndpointSendMessageRaw(epid1, "", "a")
    h.helicsEndpointSendMessageRaw(epid1, "", "a")

    h.helicsFederateRequestTimeAsync(mFed1, 1.0)
    granted_time = h.helicsFederateRequestTime(mFed2, 1.0)
    complete_time = h.helicsFederateRequestTimeComplete(mFed1)

    @test granted_time == 1.0
    @test complete_time == 1.0

    res = h.helicsEndpointPendingMessages(epid2)
    @test res == 3

    res = h.helicsFederatePendingMessages(mFed2)
    @test res == 3

    @test h.helicsEndpointGetDefaultDestination(epid1) == "ep2"

    destroyMessageFederate(mFed2, fedinfo2)
    destroyMessageFederate(mFed1, fedinfo1, broker)

end

