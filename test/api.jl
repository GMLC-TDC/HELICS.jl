include("init.jl")

@testset "Broker API tests" begin

    @test h.helicsIsCoreTypeAvailable("zmq") == 1
    broker1 = h.helicsCreateBroker("zmq", "broker1", "-f 3 --loglevel ERROR")
    broker2 = h.helicsBrokerClone(broker1)
    address_string = h.helicsBrokerGetAddress(broker1)
    occursin("tcp://127.0.0.1:23404", address_string)
    occursin("broker1", h.helicsBrokerGetIdentifier(broker1))
    err = Ref(h.helicsErrorInitialize())
    h.helicsErrorClear(err)
    @test err[].error_code == 0
    @test unsafe_string(err[].message) == ""
    @test h.helicsBrokerIsValid(broker1) == 1
    @test h.helicsBrokerIsConnected(broker1) == 1
    h.helicsBrokerDisconnect(broker1)
    @test h.helicsBrokerIsConnected(broker1) == 0
    h.helicsBrokerDisconnect(broker2)
    h.helicsBrokerFree(broker1)
    h.helicsBrokerFree(broker2)
    h.helicsCloseLibrary()

end

@testset "Core API tests" begin

    core1 = h.helicsCreateCore("inproc", "core1", "--autobroker")
    @test h.helicsCoreIsValid(core1) == true
    core2 = h.helicsCoreClone(core1)
    @test occursin("core1", h.helicsCoreGetIdentifier(core1))

    @test h.helicsCoreIsConnected(core1) == 0

    sourceFilter1 = h.helicsCoreRegisterFilter(core1, h.HELICS_FILTER_TYPE_DELAY, "core1SourceFilter")
    h.helicsFilterAddSourceTarget(sourceFilter1, "ep1")
    destinationFilter1 = h.helicsCoreRegisterFilter(core1, h.HELICS_FILTER_TYPE_DELAY, "core1DestinationFilter")
    h.helicsFilterAddDestinationTarget(destinationFilter1, "ep2")
    cloningFilter1 = h.helicsCoreRegisterCloningFilter(core1, "ep3")
    h.helicsFilterRemoveDeliveryEndpoint(cloningFilter1, "ep3")

    h.helicsCoreSetReadyToInit(core1)
    h.helicsCoreDisconnect(core1)
    h.helicsCoreDisconnect(core2)
    h.helicsCoreFree(core1)
    h.helicsCoreFree(core2)
    h.helicsCloseLibrary()

end

mutable struct UserData
    x::Int
end

function logger(level::Cint, identifier::Cstring, message::Cstring, udata::Ptr{Cvoid})::Cvoid
    m = unsafe_pointer_to_objref(Ptr{UserData}(udata)) # cast
    m.x += 1
    print("$level, $(unsafe_string(identifier)), $(unsafe_string(message)), $(m)\n")
end

@testset "Logging API tests" begin

    fi = h.helicsCreateFederateInfo()
    broker = h.helicsCreateBroker("zmq", "broker", "--federates 1 --loglevel ERROR")
    h.helicsFederateInfoSetCoreInitString(fi, "--federates 1")

    h.helicsFederateInfoSetIntegerProperty(fi, h.HELICS_PROPERTY_INT_LOG_LEVEL, 6)

    fed = h.helicsCreateValueFederate("test1", fi)
    fedLogLevel = h.helicsFederateGetIntegerProperty(fed, h.HELICS_PROPERTY_INT_LOG_LEVEL)
    @test fedLogLevel == 6
    userdata = UserData(5)

    h.helicsFederateSetLoggingCallback(fed, @cfunction(logger, Cvoid, (Cint, Cstring, Cstring, Ptr{Cvoid})), Ref(userdata))

    h.helicsFederateEnterExecutingMode(fed)
    h.helicsFederateLogInfoMessage(fed, "test MEXAGE")
    h.helicsFederateRequestNextStep(fed)
    h.helicsFederateLogInfoMessage(fed, "test MEXAGE")
    h.helicsFederateRequestNextStep(fed)
    h.helicsFederateLogInfoMessage(fed, "test MEXAGE")
    h.helicsFederateRequestNextStep(fed)
    h.helicsFederateLogInfoMessage(fed, "test MEXAGE")
    h.helicsFederateRequestNextStep(fed)

    h.helicsFederateDisconnect(fed)

    @test userdata.x == 9

    h.helicsFederateFree(fed)
    h.helicsFederateInfoFree(fi)

    h.helicsBrokerDisconnect(broker)
    h.helicsBrokerFree(broker)

    h.helicsCleanupLibrary()
    h.helicsCloseLibrary()

end

@testset "Misc API tests" begin
    fedInfo1 = h.helicsCreateFederateInfo()
    h.helicsFederateInfoSetCoreInitString(fedInfo1, "-f 1")
    h.helicsFederateInfoSetCoreName(fedInfo1, "core3")
    h.helicsFederateInfoSetCoreType(fedInfo1, 3)
    h.helicsFederateInfoSetCoreTypeFromString(fedInfo1, "zmq")
    h.helicsFederateInfoSetFlagOption(fedInfo1, 1, true)
    h.helicsFederateInfoSetTimeProperty(fedInfo1,
        h.HELICS_PROPERTY_TIME_INPUT_DELAY, 1.0)
    h.helicsFederateInfoSetIntegerProperty(fedInfo1,
        h.HELICS_PROPERTY_INT_LOG_LEVEL, 1)
    h.helicsFederateInfoSetIntegerProperty(fedInfo1,
        h.HELICS_PROPERTY_INT_MAX_ITERATIONS, 100)
    h.helicsFederateInfoSetTimeProperty(fedInfo1,
        h.HELICS_PROPERTY_TIME_OUTPUT_DELAY, 1.0)
    h.helicsFederateInfoSetTimeProperty(fedInfo1,
        h.HELICS_PROPERTY_TIME_PERIOD, 1.0)
    h.helicsFederateInfoSetTimeProperty(fedInfo1,
        h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    h.helicsFederateInfoSetTimeProperty(fedInfo1,
        h.HELICS_PROPERTY_TIME_OFFSET, 0.1)
    h.helicsFederateInfoFree(fedInfo1)

    broker3 = h.helicsCreateBroker("zmq", "broker3", "--federates 1 --loglevel ERROR")
    fedInfo2 = h.helicsCreateFederateInfo()
    coreInitString = "--federates 1"
    h.helicsFederateInfoSetCoreInitString(fedInfo2, coreInitString)
    h.helicsFederateInfoSetCoreTypeFromString(fedInfo2, "zmq")
    h.helicsFederateInfoSetIntegerProperty(fedInfo2, h.HELICS_PROPERTY_INT_LOG_LEVEL, 1)
    h.helicsFederateInfoSetTimeProperty(fedInfo2, h.HELICS_PROPERTY_TIME_DELTA, 1.0)
    fed1 = h.helicsCreateCombinationFederate("fed1", fedInfo2)
    #    fed2 = h.helicsFederateClone(fed1)
    #    fed3 = h.helicsGetFederateByName("fed1")
    #    h.helicsFederateSetFlagOption(fed2, 1, false)

    h.helicsFederateSetTimeProperty(fed1, h.HELICS_PROPERTY_TIME_INPUT_DELAY, 0.0)
    h.helicsFederateSetTimeProperty(fed1, h.HELICS_PROPERTY_TIME_OFFSET, 0.0)
    h.helicsFederateSetIntegerProperty(fed1, h.HELICS_PROPERTY_INT_LOG_LEVEL, 1)
    h.helicsFederateSetIntegerProperty(fed1, h.HELICS_PROPERTY_INT_MAX_ITERATIONS, 100)
    h.helicsFederateSetTimeProperty(fed1, h.HELICS_PROPERTY_TIME_OUTPUT_DELAY, 0.0)
    h.helicsFederateSetTimeProperty(fed1, h.HELICS_PROPERTY_TIME_PERIOD, 0.0)
    h.helicsFederateSetTimeProperty(fed1, h.HELICS_PROPERTY_TIME_DELTA, 1.0)

    #    fed2CloningFilter = h.helicsFederateRegisterCloningFilter(fed2, "fed2/Ep1")
    #    fed2DestinationFilter = h.helicsFederateRegisterFilter(fed2, h.HELICS_FILTER_TYPE_DELAY, "fed2DestinationFilter")
    #    h.helicsFilterAddDestinationTarget(fed2DestinationFilter, "ep2")

    ep1 = h.helicsFederateRegisterEndpoint(fed1, "Ep1", "string")
    ep2 = h.helicsFederateRegisterGlobalEndpoint(fed1, "Ep2", "string")
    pub1 = h.helicsFederateRegisterGlobalPublication(fed1, "pub1", h.HELICS_DATA_TYPE_DOUBLE, "")
    pub2 = h.helicsFederateRegisterGlobalTypePublication(fed1, "pub2", "complex", "")

    sub1 = h.helicsFederateRegisterSubscription(fed1, "pub1")
    sub2 = h.helicsFederateRegisterSubscription(fed1, "pub2")
    #    h.helicsInputAddTarget(sub2, "Ep2")
    pub3 = h.helicsFederateRegisterPublication(fed1, "pub3", h.HELICS_DATA_TYPE_STRING, "")

    pub1KeyString = h.helicsPublicationGetName(pub1)
    pub1TypeString = h.helicsPublicationGetType(pub1)
    pub1UnitsString = h.helicsPublicationGetUnits(pub1)
    sub1KeyString = h.helicsSubscriptionGetTarget(sub1)
    sub1UnitsString = h.helicsInputGetUnits(sub1)
    @test "pub1" == pub1KeyString
    @test "double" == pub1TypeString
    @test "" == pub1UnitsString
    @test "pub1" == sub1KeyString
    @test "" == sub1UnitsString

    #    fed2SourceFilter = h.helicsFederateRegisterFilter(fed2,
    #            h.HELICS_FILTER_TYPE_DELAY, "fed2SourceFilter")
    #    h.helicsFilterAddSourceTarget(fed2SourceFilter, "Ep2")
    #    h.helicsFilterAddDestinationTarget(fed2SourceFilter, "fed2/Ep1")
    #    h.helicsFilterRemoveTarget(fed2SourceFilter, "fed2/Ep1")
    #    h.helicsFilterAddSourceTarget(fed2SourceFilter, "Ep2")
    #    h.helicsFilterRemoveTarget(fed2SourceFilter, "Ep2")

    #    fed2SourceFilterNameString = h.helicsFilterGetName(fed2SourceFilter)
    #    @test fed2SourceFilterNameString == "fed1/fed2SourceFilter"

    sub3 = h.helicsFederateRegisterSubscription(fed1, "fed1/pub3", "")
    pub4 = h.helicsFederateRegisterTypePublication(fed1, "pub4", "int", "")

    sub4 = h.helicsFederateRegisterSubscription(fed1, "fed1/pub4", "")
    pub5 = h.helicsFederateRegisterGlobalTypePublication(fed1, "pub5", "boolean", "")

    sub5 = h.helicsFederateRegisterSubscription(fed1, "pub5", "")
    pub6 = h.helicsFederateRegisterGlobalPublication(fed1, "pub6", h.HELICS_DATA_TYPE_VECTOR, "")
    sub6 = h.helicsFederateRegisterSubscription(fed1, "pub6", "")
    pub7 = h.helicsFederateRegisterGlobalPublication(fed1, "pub7",
        h.HELICS_DATA_TYPE_NAMED_POINT, "")
    sub7 = h.helicsFederateRegisterSubscription(fed1, "pub7", "")
    pub8 = h.helicsFederateRegisterGlobalPublication(fed1, "pub8", h.HELICS_DATA_TYPE_COMPLEX_VECTOR, "")
    sub8 = h.helicsFederateRegisterSubscription(fed1, "pub8", "")

    h.helicsInputSetDefaultDouble(sub1, 3.4)
    h.helicsInputSetDefaultComplex(sub2, -9.9 + im * 2.5)
    h.helicsInputSetDefaultString(sub3, "default")
    h.helicsInputSetDefaultInteger(sub4, 6)
    h.helicsInputSetDefaultBoolean(sub5, false)
    sub6Default = [3.4, 90.9, 4.5]
    h.helicsInputSetDefaultVector(sub6, sub6Default)
    h.helicsInputSetDefaultNamedPoint(sub7, "hollow", 20.0)
    sub8Default = [3.4 + im * 2.5, 90.9 + im * 0.0, 4.5 + im * 0.0]
    h.helicsInputSetDefaultComplexVector(sub8, sub8Default)

    #    h.helicsEndpointSubscribe(ep2, "fed1/pub3")
    h.helicsFederateEnterInitializingModeAsync(fed1)
    rs = h.helicsFederateIsAsyncOperationCompleted(fed1)
    if (rs == 0)
        sleep(0.500)
        rs = h.helicsFederateIsAsyncOperationCompleted(fed1)
        if (rs == 0)
            sleep(0.500)
            rs = h.helicsFederateIsAsyncOperationCompleted(fed1)
            if (rs == 0)
                @test true == false
            end
        end
    end
    h.helicsFederateEnterInitializingModeComplete(fed1)
    h.helicsFederateEnterExecutingModeAsync(fed1)
    h.helicsFederateEnterExecutingModeComplete(fed1)

    mesg1 = h.helicsFederateCreateMessage(fed1)
    h.helicsMessageSetString(mesg1, "Hello")
    h.helicsMessageSetSource(mesg1, "fed1/Ep1")
    h.helicsMessageSetOriginalSource(mesg1, "fed1/Ep1")
    h.helicsMessageSetDestination(mesg1, "Ep2")
    h.helicsMessageSetOriginalDestination(mesg1, "Ep2")

    h.helicsEndpointSendMessage(ep1, mesg1)
    mesg1 = h.helicsFederateCreateMessage(fed1)
    h.helicsMessageSetString(mesg1, "There")
    h.helicsMessageSetSource(mesg1, "fed1/Ep1")
    h.helicsMessageSetOriginalSource(mesg1, "fed1/Ep1")
    h.helicsMessageSetDestination(mesg1, "Ep2")
    h.helicsMessageSetOriginalDestination(mesg1, "Ep2")
    h.helicsEndpointSendMessage(ep1, mesg1)
    h.helicsEndpointSetDefaultDestination(ep2, "fed1/Ep1")

    ep1NameString = h.helicsEndpointGetName(ep1)
    ep1TypeString = h.helicsEndpointGetType(ep1)

    @test ep1NameString == "fed1/Ep1"
    @test ep1TypeString == "string"

    coreFed1 = h.helicsFederateGetCore(fed1)

    fed1Time = h.helicsFederateGetCurrentTime(fed1)
    @test fed1Time == 0.0
    fed1EndpointCount = h.helicsFederateGetEndpointCount(fed1)
    @test fed1EndpointCount == 2

    fed1NameString = h.helicsFederateGetName(fed1)
    @test fed1NameString == "fed1"

    fed1State = h.helicsFederateGetState(fed1)
    @test fed1State == 2
    fed1PubCount = h.helicsFederateGetPublicationCount(fed1)
    @test fed1PubCount == 7
    fed1SubCount = h.helicsFederateGetInputCount(fed1)
    @test fed1SubCount == 7

    h.helicsPublicationPublishBoolean(pub5, true)
    h.helicsPublicationPublishComplex(pub2, 5.6 + im * -0.67)
    h.helicsPublicationPublishDouble(pub1, 457.234)
    h.helicsPublicationPublishInteger(pub4, 1)
    h.helicsPublicationPublishNamedPoint(pub7, "Blah Blah", 20.0)
    h.helicsPublicationPublishString(pub3, "Mayhem")
    pub6Vector = [4.5, 56.5]
    h.helicsPublicationPublishVector(pub6, pub6Vector)
    pub8Vector = [4.5 + im * -0.67, 56.5 + im * 0.0]
    h.helicsPublicationPublishVector(pub8, pub8Vector)
    sleep(0.500)
    h.helicsFederateRequestTimeAsync(fed1, 1.0)

    returnTime = h.helicsFederateRequestTimeComplete(fed1)
    @test returnTime == 1.0
    ep2MsgCount = h.helicsEndpointPendingMessageCount(ep2)
    @test ep2MsgCount == 2
    ep2HasMsg = h.helicsEndpointHasMessage(ep2)
    @test ep2HasMsg == 1

    msg2 = h.helicsEndpointGetMessage(ep2)
    @test h.helicsMessageGetTime(msg2) == 0.0
    @test h.helicsMessageGetString(msg2) == "Hello"
    @test h.helicsMessageGetOriginalSource(msg2) == "fed1/Ep1"
    @test h.helicsMessageGetSource(msg2) == "fed1/Ep1"
    @test h.helicsMessageGetDestination(msg2) == "Ep2"
    @test h.helicsMessageGetOriginalDestination(msg2) == "Ep2"

    fed1MsgCount = h.helicsFederatePendingMessageCount(fed1)
    @test fed1MsgCount == 1

    @test h.helicsFederateHasMessage(fed1) == 1

    msg3 = h.helicsFederateGetMessage(fed1)
    @test h.helicsMessageGetTime(msg3) == 0.0
    @test h.helicsMessageGetString(msg3) == "There"
    @test h.helicsMessageGetOriginalSource(msg3) == "fed1/Ep1"
    @test h.helicsMessageGetSource(msg3) == "fed1/Ep1"
    @test h.helicsMessageGetDestination(msg3) == "Ep2"
    @test h.helicsMessageGetOriginalDestination(msg3) == "Ep2"

    sub1Updated = h.helicsInputIsUpdated(sub1)
    @test sub1Updated == 1

    @test h.helicsInputLastUpdateTime(sub2) == 1.0

    @test h.helicsInputGetComplex(sub2) == 5.6 - im * 0.67

    @test h.helicsInputGetDouble(sub1) == 457.234
    @test h.helicsInputGetInteger(sub4) == 1
    sub7PointString, sub7DoubleValue = h.helicsInputGetNamedPoint(sub7)
    @test sub7PointString == "Blah Blah"
    @test sub7DoubleValue == 20.0
    @test h.helicsInputGetBoolean(sub5) == 1
    @test h.helicsInputGetString(sub3) == "Mayhem"

    sub3ValueSize = h.helicsInputGetStringSize(sub3)
    @test sub3ValueSize == 7

    @test h.helicsInputGetVector(sub6) == pub6Vector

    @test h.helicsInputGetVector(sub8) == pub8Vector

    h.helicsFederateDisconnect(fed1)
    #    h.helicsFederateDisconnect(fed2)
    h.helicsFederateFree(fed1)
    #    h.helicsFederateDisconnect(fed2)
    #    h.helicsFederateFree(fed2)
    h.helicsFederateInfoFree(fedInfo2)
    h.helicsBrokerDisconnect(broker3)

    h.helicsBrokerFree(broker3)

    h.helicsCleanupLibrary()
    h.helicsCloseLibrary()
end
