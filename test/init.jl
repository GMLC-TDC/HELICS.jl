function createBroker(number=1)
    initstring = "-f $number --name=mainbroker --loglevel=ERROR"
    @test_throws h.Utils.HELICS_ERROR_INVALID_ARGUMENT broker = h.helicsCreateBroker("mq", "", initstring)
    broker = h.helicsCreateBroker("zmq", "", initstring)
    @test broker isa h.Broker
    @test h.helicsBrokerIsConnected(broker) == true
    return broker
end

function setupFederateInfo(name="A Core", number=1, deltat=0.01)
    fedinitstring = "--broker=mainbroker --federates=$number"

    # Create Federate Info object that describes the federate properties
    fedinfo = h.helicsCreateFederateInfo()
    @test fedinfo isa h.FederateInfo

    # # Set Federate name
    h.helicsFederateInfoSetCoreName(fedinfo, "Test$name")

    # # Set core type from string
    h.helicsFederateInfoSetCoreTypeFromString(fedinfo, "zmq")

    # # Federate init string
    h.helicsFederateInfoSetCoreInitString(fedinfo, fedinitstring)

    # # Set the message interval (timedelta) for federate. Note th#
    # # HELICS minimum message time interval is 1 ns and by default
    # # it uses a time delta of 1 second. What is provided to the
    # # setTimedelta routine is a multiplier for the default timedelta.

    # # Set one second message interval
    h.helicsFederateInfoSetTimeProperty(fedinfo, h.HELICS_PROPERTY_TIME_DELTA, deltat)
    h.helicsFederateInfoSetIntegerProperty(fedinfo, h.HELICS_PROPERTY_INT_LOG_LEVEL, -1)
    return fedinfo
end

function createValueFederate(federates=1, name="A Federate", deltat=0.01)
    fedinfo= setupFederateInfo(name, federates, deltat)
    vFed = h.helicsCreateValueFederate("Test$name", fedinfo)
    @test vFed isa h.ValueFederate
    return vFed, fedinfo
end


function createMessageFederate(federates=1, name="A Federate", deltat=0.01)
    fedinfo = setupFederateInfo(name, federates, deltat)
    mFed = h.helicsCreateMessageFederate("Test$name", fedinfo)
    @test mFed isa h.MessageFederate
    return mFed, fedinfo
end

function destroyBroker(broker)
    h.helicsBrokerDisconnect(broker)
    h.helicsCloseLibrary()
end

function destroyFederate(fed, fedinfo, broker=nothing)
    h.helicsFederateDisconnect(fed)
    state = h.helicsFederateGetState(fed)
    if broker !== nothing
        while (h.helicsBrokerIsConnected(broker))
            sleep(1)
        end
    end
    h.helicsFederateInfoFree(fedinfo)
    h.helicsFederateFree(fed)
    if broker !== nothing
        destroyBroker(broker)
    end
end

destroyValueFederate(args...) = destroyFederate(args...)
destroyMessageFederate(args...) = destroyFederate(args...)
