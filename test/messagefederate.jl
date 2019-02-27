
function createMessageFederate(start_broker=true)
    initstring = "-f 1 --name=mainbroker --loglevel=0"
    fedinitstring = "--broker=mainbroker --federates=1 --tick=0"
    deltat = 0.01

    # Create broker
    if start_broker
        @test_throws h.HelicsErrorInvalidArgument broker = h.helicsCreateBroker("mq", "", initstring)

        broker = h.helicsCreateBroker("zmq", "", initstring)
        @test broker isa h.Broker

        @test h.helicsBrokerIsConnected(broker) == true
    else
        broker = nothing
    end

    # Create Federate Info object that describes the federate properties #
    fedinfo = h.helicsCreateFederateInfo()
    @test fedinfo isa h.FederateInfo

    # Set Federate name #
    h.helicsFederateInfoSetCoreName(fedinfo, "CoreA Federate")

    # Set core type from string #
    h.helicsFederateInfoSetCoreTypeFromString(fedinfo, "zmq")

    # Federate init string #
    h.helicsFederateInfoSetCoreInitString(fedinfo, fedinitstring)

    # Set the message interval (timedelta) for federate. Note th#
    # HELICS minimum message time interval is 1 ns and by default
    # it uses a time delta of 1 second. What is provided to the
    # setTimedelta routine is a multiplier for the default timedelta.

    # Set one second message interval #
    h.helicsFederateInfoSetTimeProperty(fedinfo, h.helics_property_time_delta, deltat)

    h.helicsFederateInfoSetIntegerProperty(fedinfo, h.helics_property_int_log_level, -1)

    mFed = h.helicsCreateMessageFederate("TestA Federate", fedinfo)

    @test mFed isa h.MessageFederate

    return mFed, fedinfo, broker
end

function destroyMessageFederate(mFed, fedinfo, broker=nothing)

    h.helicsFederateFinalize(mFed)
    state = h.helicsFederateGetState(mFed)
    @test state == 3
    while (h.helicsBrokerIsConnected(broker))
        sleep(1)
    end

    h.helicsFederateInfoFree(fedinfo)
    h.helicsFederateFree(mFed)
    h.helicsCloseLibrary()

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

    endpoint_name = h.helicsEndpointGetName(epid1)
    @test endpoint_name == "TestA Federate/ep1"

    endpoint_name = h.helicsEndpointGetName(epid2)
    @test endpoint_name == "ep2"

    endpoint_name = h.helicsEndpointGetType(epid1)
    @test endpoint_name == ""

    endpoint_name = h.helicsEndpointGetType(epid2)
    @test endpoint_name == "random"

    destroyMessageFederate(mFed, fedinfo, broker)
end

@testset "MessageFederate test_message_federate_send" begin
    mFed, fedinfo, broker = createMessageFederate()

    epid1 = h.helicsFederateRegisterEndpoint(mFed, "ep1", "")
    epid2 = h.helicsFederateRegisterGlobalEndpoint(mFed, "ep2", "random")

    h.helicsFederateSetTimeProperty(mFed, h.helics_property_time_delta, 1.0)
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
