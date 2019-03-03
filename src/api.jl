function helicsFederateRegisterEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    @invoke_and_check Lib.helicsFederateRegisterEndpoint(fed, name, kind)
end

function helicsFederateRegisterGlobalEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    @invoke_and_check Lib.helicsFederateRegisterGlobalEndpoint(fed, name, kind)
end

function helicsFederateGetEndpoint(fed::Federate, name::String)::Endpoint
    @invoke_and_check Lib.helicsFederateGetEndpoint(fed, name)
end

function helicsFederateGetEndpointByIndex(fed::Federate, index::Int)::Endpoint
    @invoke_and_check Lib.helicsFederateGetEndpointByIndex(fed, index)
end

function helicsEndpointSetDefaultDestination(endpoint::Endpoint, dest::String)
    @invoke_and_check Lib.helicsEndpointSetDefaultDestination(endpoint, dest)
end

function helicsEndpointGetDefaultDestination(endpoint::Endpoint)::String
    Lib.helicsEndpointGetDefaultDestination(endpoint) |> unsafe_string
end

function helicsEndpointSendMessageRaw(endpoint::Endpoint, dest::String, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsEndpointSendMessageRaw(endpoint, dest, data, inputDataLength)
end

function helicsEndpointSendEventRaw(endpoint::Endpoint, dest::String, data::String, time)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsEndpointSendEventRaw(endpoint, dest, data, inputDataLength, time)
end

function helicsEndpointSendMessage(endpoint::Endpoint, message::Message)
    @invoke_and_check Lib.helicsEndpointSendMessage(endpoint, message)
end

function helicsEndpointSubscribe(endpoint::Endpoint, key::String)
    @invoke_and_check Lib.helicsEndpointSubscribe(endpoint, key)
end

function helicsFederateHasMessage(fed::Federate)::Bool
    Lib.helicsFederateHasMessage(fed) == 1 ? true : false
end

function helicsEndpointHasMessage(endpoint::Endpoint)::Bool
    Lib.helicsEndpointHasMessage(endpoint) == 1 ? true : false
end

function helicsFederatePendingMessages(fed::Federate)::Int
    Lib.helicsFederatePendingMessages(fed)
end

function helicsEndpointPendingMessages(endpoint::Endpoint)::Int
    Lib.helicsEndpointPendingMessages(endpoint)
end

function helicsEndpointGetMessage(endpoint::Endpoint)::Message
    Lib.helicsEndpointGetMessage(endpoint)
end

function helicsFederateGetMessage(fed::Federate)::Message
    Lib.helicsFederateGetMessage(fed)
end

function helicsEndpointGetType(endpoint::Endpoint)::String
    Lib.helicsEndpointGetType(endpoint) |> unsafe_string
end

function helicsEndpointGetName(endpoint::Endpoint)::String
    Lib.helicsEndpointGetName(endpoint) |> unsafe_string
end

function helicsFederateGetEndpointCount(fed::Federate)::Int
    Lib.helicsFederateGetEndpointCount(fed)
end

function helicsEndpointGetInfo(_end)::String
    Lib.helicsEndpointGetInfo(_end) |> unsafe_string
end

function helicsEndpointSetInfo(_end, info)
    @invoke_and_check Lib.helicsEndpointSetInfo(_end, info)
end

function helicsEndpointSetOption(_end, option, value)
    @invoke_and_check Lib.helicsEndpointSetOption(_end, option, value)
end

function helicsEndpointGetOption(_end, option)
    Lib.helicsEndpointGetOption(_end, option)
end

function helicsFederateRegisterFilter(fed::Federate, kind::Lib.helics_filter_type, name::String)::Filter
    @invoke_and_check Lib.helicsFederateRegisterFilter(fed, kind, name)
end

function helicsFederateRegisterGlobalFilter(fed::Federate, kind::Lib.helics_filter_type, name::String)::Filter
    @invoke_and_check Lib.helicsFederateRegisterGlobalFilter(fed, kind, name)
end

function helicsFederateRegisterCloningFilter(fed::Federate, deliveryEndpoint)::Filter
    @invoke_and_check Lib.helicsFederateRegisterCloningFilter(fed, deliveryEndpoint)
end

function helicsFederateRegisterGlobalCloningFilter(fed::Federate, deliveryEndpoint)::Filter
    @invoke_and_check Lib.helicsFederateRegisterGlobalCloningFilter(fed, deliveryEndpoint)
end

function helicsCoreRegisterFilter(core::Core, kind::Lib.helics_filter_type, name::String)::Filter
    @invoke_and_check Lib.helicsCoreRegisterFilter(core, kind, name)
end

function helicsCoreRegisterCloningFilter(core::Core, deliveryEndpoint)::Filter
    @invoke_and_check Lib.helicsCoreRegisterCloningFilter(core, deliveryEndpoint)
end

function helicsFederateGetFilterCount(fed::Federate)
    Lib.helicsFederateGetFilterCount(fed)
end

function helicsFederateGetFilter(fed::Federate, name::String)
    @invoke_and_check Lib.helicsFederateGetFilter(fed, name)
end

function helicsFederateGetFilterByIndex(fed::Federate, index)
    @invoke_and_check Lib.helicsFederateGetFilterByIndex(fed, index)
end

function helicsFilterGetName(filt::Filter)::String
    Lib.helicsFilterGetName(filt) |> unsafe_string
end

function helicsFilterSet(filt::Filter, prop, val)
    @invoke_and_check Lib.helicsFilterSet(filt, prop, val)
end

function helicsFilterSetString(filt::Filter, prop, val)
    @invoke_and_check Lib.helicsFilterSetString(filt, prop, val)
end

function helicsFilterAddDestinationTarget(filt::Filter, dest::String)
    @invoke_and_check Lib.helicsFilterAddDestinationTarget(filt, dest)
end

function helicsFilterAddSourceTarget(filt::Filter, source::String)
    @invoke_and_check Lib.helicsFilterAddSourceTarget(filt, source)
end

function helicsFilterAddDeliveryEndpoint(filt::Filter, deliveryEndpoint)
    @invoke_and_check Lib.helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint)
end

function helicsFilterRemoveTarget(filt::Filter, target::String)
    @invoke_and_check Lib.helicsFilterRemoveTarget(filt, target)
end

function helicsFilterRemoveDeliveryEndpoint(filt::Filter, deliveryEndpoint)
    @invoke_and_check Lib.helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint)
end

function helicsFilterGetInfo(filt::Filter)
    Lib.helicsFilterGetInfo(filt)
end

function helicsFilterSetInfo(filt::Filter, info)
    @invoke_and_check Lib.helicsFilterSetInfo(filt, info)
end

function helicsFilterSetOption(filt::Filter, option, value)
    @invoke_and_check Lib.helicsFilterSetOption(filt, option, value)
end

function helicsFilterGetOption(filt::Filter, option)
    @invoke_and_check Lib.helicsFilterGetOption(filt, option)
end

function helicsFederateRegisterSubscription(fed::Federate, key::String, units::String)::Subscription
    @invoke_and_check Lib.helicsFederateRegisterSubscription(fed, key, units)
end

function helicsFederateRegisterPublication(fed::Federate, key::String, kind::Lib.helics_data_type, units::String)::Publication
    @invoke_and_check Lib.helicsFederateRegisterPublication(fed, key, kind, units)
end

function helicsFederateRegisterTypePublication(fed::Federate, key::String, kind::String, units::String)::Publication
    @invoke_and_check Lib.helicsFederateRegisterTypePublication(fed, key, kind, units)
end

function helicsFederateRegisterGlobalPublication(fed::Federate, key::String, kind::Lib.helics_data_type, units::String)::Publication
    @invoke_and_check Lib.helicsFederateRegisterGlobalPublication(fed, key, kind, units)
end

function helicsFederateRegisterGlobalTypePublication(fed::Federate, key::String, kind::String, units::String)::Publication
    @invoke_and_check Lib.helicsFederateRegisterGlobalTypePublication(fed, key, kind, units)
end

function helicsFederateRegisterInput(fed::Federate, key::String, kind::String, units::String)::Input
    @invoke_and_check Lib.helicsFederateRegisterInput(fed, key, kind, units)
end

function helicsFederateRegisterTypeInput(fed::Federate, key::String, kind::String, units::String)::Input
    @invoke_and_check Lib.helicsFederateRegisterTypeInput(fed, key, kind, units)
end

function helicsFederateRegisterGlobalInput(fed::Federate, key::String, kind::String, units::String)::Input
    @invoke_and_check Lib.helicsFederateRegisterGlobalInput(fed, key, kind, units)
end

function helicsFederateRegisterGlobalTypeInput(fed::Federate, key::String, kind::String, units::String)::Input
    @invoke_and_check Lib.helicsFederateRegisterGlobalTypeInput(fed, key, kind, units)
end

function helicsFederateGetPublication(fed::Federate, key::String)::Publication
    @invoke_and_check Lib.helicsFederateGetPublication(fed, key)
end

function helicsFederateGetPublicationByIndex(fed::Federate, index)::Publication
    @invoke_and_check Lib.helicsFederateGetPublicationByIndex(fed, index)
end

function helicsFederateGetInput(fed::Federate, key::String)::Input
    @invoke_and_check Lib.helicsFederateGetInput(fed, key)
end

function helicsFederateGetInputByIndex(fed::Federate, index)::Input
    @invoke_and_check Lib.helicsFederateGetInputByIndex(fed, index)
end

function helicsFederateGetSubscription(fed::Federate, key::String)::Subscription
    @invoke_and_check Lib.helicsFederateGetSubscription(fed, key)
end

function helicsPublicationPublishRaw(pub::Publication, data)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsPublicationPublishRaw(pub, data, inputDataLength)
end

function helicsPublicationPublishString(pub::Publication, str::String)
    @invoke_and_check Lib.helicsPublicationPublishString(pub, str)
end

function helicsPublicationPublishInteger(pub::Publication, val)
    @invoke_and_check Lib.helicsPublicationPublishInteger(pub, val)
end

function helicsPublicationPublishBoolean(pub::Publication, val::Bool)
    @invoke_and_check Lib.helicsPublicationPublishBoolean(pub, val ? 1 : 0)
end

function helicsPublicationPublishDouble(pub::Publication, val::Float64)
    @invoke_and_check Lib.helicsPublicationPublishDouble(pub, val)
end

function helicsPublicationPublishTime(pub::Publication, val)
    @invoke_and_check Lib.helicsPublicationPublishTime(pub, val)
end

function helicsPublicationPublishChar(pub::Publication, val)
    @invoke_and_check Lib.helicsPublicationPublishChar(pub, val)
end

function helicsPublicationPublishComplex(pub::Publication, c::ComplexF64)
    @invoke_and_check Lib.helicsPublicationPublishComplex(pub, c.re, c.im)
end

function helicsPublicationPublishVector(pub::Publication, vectorInput)
    vectorLength = length(vectorInput)
    @invoke_and_check Lib.helicsPublicationPublishVector(pub, vectorInput, vectorLength)
end

function helicsPublicationPublishNamedPoint(pub::Publication, str::String, val::Float64)
    @invoke_and_check Lib.helicsPublicationPublishNamedPoint(pub, str, val)
end

function helicsPublicationAddTarget(pub::Publication, target::String)
    @invoke_and_check Lib.helicsPublicationAddTarget(pub, target)
end

function helicsInputAddTarget(ipt::Input, target::String)
    @invoke_and_check Lib.helicsInputAddTarget(ipt, target)
end

function helicsInputGetRawValueSize(ipt::Input)
    Lib.helicsInputGetRawValueSize(ipt)
end

function helicsInputGetRawValue(ipt::Input, data, maxlen, actualSize)
    @invoke_and_check Lib.helicsInputGetRawValue(ipt, data, maxlen, actualSize)
end

function helicsInputGetStringSize(ipt::Input)
    Lib.helicsInputGetStringSize(ipt)
end

function helicsInputGetString(ipt::Input)::String
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref(maxStringLen)
    @invoke_and_check Lib.helicsInputGetString(ipt, outputString, maxStringLen, actualLength)
    return outputString[1:(actualLength[]-1)]
end

function helicsInputGetInteger(ipt::Input)
    @invoke_and_check Lib.helicsInputGetInteger(ipt)
end

function helicsInputGetBoolean(ipt::Input)::Bool
    r = @invoke_and_check Lib.helicsInputGetBoolean(ipt)
    return r == 1 ? true : false
end

function helicsInputGetDouble(ipt::Input)::Float64
    @invoke_and_check Lib.helicsInputGetDouble(ipt)
end

function helicsInputGetTime(ipt::Input)
    @invoke_and_check Lib.helicsInputGetTime(ipt)
end

function helicsInputGetChar(ipt::Input)
    @invoke_and_check Lib.helicsInputGetChar(ipt)
end

function helicsInputGetComplexObject(ipt::Input)
    @invoke_and_check Lib.helicsInputGetComplexObject(ipt)
end

function helicsInputGetComplex(ipt::Input)::ComplexF64
    real = Ref{Float64}(0)
    imag = Ref{Float64}(0)
    @invoke_and_check Lib.helicsInputGetComplex(ipt, real, imag)
    return real[] + im * imag[]
end

function helicsInputGetVectorSize(ipt::Input)::Int64
    Lib.helicsInputGetVectorSize(ipt)
end

function helicsInputGetVector(ipt::Input)::Vector{Float64}
    maxlen = Cint(helicsInputGetVectorSize(ipt))
    data = Vector{Float64}(undef, maxlen)
    actualSize = Ref(maxlen)
    @invoke_and_check Lib.helicsInputGetVector(ipt, data, maxlen, actualSize)
    return data[1:actualSize[]]
end

function helicsInputGetNamedPoint(ipt::Input)::Tuple{String, Float64}
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref(maxStringLen)
    val = Ref{Float64}(0.0)
    @invoke_and_check Lib.helicsInputGetNamedPoint(ipt, outputString, maxStringLen, actualLength, val)
    return outputString[1:(actualLength[]-1)], val[]
end

function helicsInputSetDefaultRaw(ipt::Input, data, inputDataLength)
    @invoke_and_check Lib.helicsInputSetDefaultRaw(ipt, data, inputDataLength)
end

function helicsInputSetDefaultString(ipt::Input, str::String)
    @invoke_and_check Lib.helicsInputSetDefaultString(ipt, str)
end

function helicsInputSetDefaultInteger(ipt::Input, val::Int)
    @invoke_and_check Lib.helicsInputSetDefaultInteger(ipt, val)
end

function helicsInputSetDefaultBoolean(ipt::Input, val::Bool)
    @invoke_and_check Lib.helicsInputSetDefaultBoolean(ipt, val ? 1 : 0)
end

function helicsInputSetDefaultTime(ipt::Input, val)
    @invoke_and_check Lib.helicsInputSetDefaultTime(ipt, val)
end

function helicsInputSetDefaultChar(ipt::Input, val)
    @invoke_and_check Lib.helicsInputSetDefaultChar(ipt, val)
end

function helicsInputSetDefaultDouble(ipt::Input, val::Float64)
    @invoke_and_check Lib.helicsInputSetDefaultDouble(ipt, val)
end

function helicsInputSetDefaultComplex(ipt::Input, c::ComplexF64)
    @invoke_and_check Lib.helicsInputSetDefaultComplex(ipt, c.re, c.im)
end

function helicsInputSetDefaultVector(ipt::Input, vectorInput::Vector{Float64})
    vectorLength = length(vectorInput)
    @invoke_and_check Lib.helicsInputSetDefaultVector(ipt, vectorInput, vectorLength)
end

function helicsInputSetDefaultNamedPoint(ipt::Input, str::String, val::Float64)
    @invoke_and_check Lib.helicsInputSetDefaultNamedPoint(ipt, str, val)
end

function helicsInputGetType(ipt::Input)::String
    Lib.helicsInputGetType(ipt) |> unsafe_string
end

function helicsInputGetPublicationType(ipt::Input)::String
    Lib.helicsInputGetPublicationType(ipt) |> unsafe_string
end

function helicsPublicationGetType(pub::Publication)::String
    Lib.helicsPublicationGetType(pub) |> unsafe_string
end

function helicsInputGetKey(ipt::Input)::String
    Lib.helicsInputGetKey(ipt) |> unsafe_string
end

function helicsSubscriptionGetKey(ipt::Input)::String
    Lib.helicsSubscriptionGetKey(ipt) |> unsafe_string
end

function helicsPublicationGetKey(pub::Publication)::String
    Lib.helicsPublicationGetKey(pub) |> unsafe_string
end

function helicsInputGetUnits(ipt::Input)::String
    Lib.helicsInputGetUnits(ipt) |> unsafe_string
end

function helicsPublicationGetUnits(pub::Publication)::String
    Lib.helicsPublicationGetUnits(pub) |> unsafe_string
end

function helicsInputGetInfo(inp)::String
    Lib.helicsInputGetInfo(inp) |> unsafe_string
end

function helicsInputSetInfo(inp, info)
    @invoke_and_check Lib.helicsInputSetInfo(inp, info)
end

function helicsPublicationGetInfo(pub::Publication)
    Lib.helicsPublicationGetInfo(pub) |> unsafe_string
end

function helicsPublicationSetInfo(pub::Publication, info)
    @invoke_and_check Lib.helicsPublicationSetInfo(pub, info)
end

function helicsInputGetOption(inp, option)
    Lib.helicsInputGetOption(inp, option)
end

function helicsInputSetOption(inp, option, value)
    @invoke_and_check Lib.helicsInputSetOption(inp, option, value)
end

function helicsPublicationGetOption(pub::Publication, option)
    Lib.helicsPublicationGetOption(pub, option)
end

function helicsPublicationSetOption(pub::Publication, option, val)
    @invoke_and_check Lib.helicsPublicationSetOption(pub, option, val)
end

function helicsInputIsUpdated(ipt::Input)
    Lib.helicsInputIsUpdated(ipt)
end

function helicsInputLastUpdateTime(ipt::Input)
    Lib.helicsInputLastUpdateTime(ipt)
end

function helicsFederateGetPublicationCount(fed::Federate)
    Lib.helicsFederateGetPublicationCount(fed)
end

function helicsFederateGetInputCount(fed::Federate)
    Lib.helicsFederateGetInputCount(fed)
end

function helicsGetVersion()
    return unsafe_string(Lib.helicsGetVersion())
end

function helicsErrorInitialize()
    Lib.helicsErrorInitialize()
end

function helicsErrorClear(err)
    Lib.helicsErrorClear(err)
end

function helicsIsCoreTypeAvailable(kind::String)
    Lib.helicsIsCoreTypeAvailable(kind)
end

function helicsCreateCore(kind::String, name::String, initString::String)
    @invoke_and_check Lib.helicsCreateCore(kind, name, initString)
end

function helicsCreateCoreFromArgs(kind::String, name::String, argc, argv)
    @invoke_and_check Lib.helicsCreateCoreFromArgs(kind, name, argc, argv)
end

function helicsCoreClone(core::Core)
    @invoke_and_check Lib.helicsCoreClone(core)
end

function helicsCoreIsValid(core::Core)
    Lib.helicsCoreIsValid(core)
end

function helicsCreateBroker(kind::String, name::String, initString::String)::Broker
    @invoke_and_check Lib.helicsCreateBroker(kind, name, initString)
end

function helicsCreateBrokerFromArgs(kind::String, name::String, argc, argv)
    @invoke_and_check Lib.helicsCreateBrokerFromArgs(kind, name, argc, argv)
end

function helicsBrokerClone(broker::Broker)
    @invoke_and_check Lib.helicsBrokerClone(broker)
end

function helicsBrokerIsValid(broker::Broker)
    Lib.helicsBrokerIsValid(broker)
end

function helicsBrokerIsConnected(broker::Broker)::Bool
    Lib.helicsBrokerIsConnected(broker) == 1 ? true : false
end

function helicsBrokerDataLink(broker::Broker, source::String, target::String)
    @invoke_and_check Lib.helicsBrokerDataLink(broker, source, target)
end

function helicsBrokerAddSourceFilterToEndpoint(broker::Broker, filter, endpoint::Endpoint)
    @invoke_and_check Lib.helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint)
end

function helicsBrokerAddDestinationFilterToEndpoint(broker::Broker, filter, endpoint::Endpoint)
    @invoke_and_check Lib.helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint)
end

function helicsBrokerWaitForDisconnect(broker::Broker, msToWait)
    @invoke_and_check Lib.helicsBrokerWaitForDisconnect(broker, msToWait)
end

function helicsCoreIsConnected(core::Core)
    Lib.helicsCoreIsConnected(core)
end

function helicsCoreDataLink(core::Core, source::String, target::String)
    @invoke_and_check Lib.helicsCoreDataLink(core, source, target)
end

function helicsCoreAddSourceFilterToEndpoint(core::Core, filter, endpoint::Endpoint)
    @invoke_and_check Lib.helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint)
end

function helicsCoreAddDestinationFilterToEndpoint(core::Core, filter, endpoint::Endpoint)
    @invoke_and_check Lib.helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint)
end

function helicsBrokerGetIdentifier(broker::Broker)::String
    Lib.helicsBrokerGetIdentifier(broker) |> unsafe_string
end

function helicsCoreGetIdentifier(core::Core)::String
    Lib.helicsCoreGetIdentifier(core) |> unsafe_string
end

function helicsBrokerGetAddress(broker::Broker)::String
    Lib.helicsBrokerGetAddress(broker) |> unsafe_string
end

function helicsCoreSetReadyToInit(core::Core)
    @invoke_and_check Lib.helicsCoreSetReadyToInit(core)
end

function helicsCoreDisconnect(core::Core)
    @invoke_and_check Lib.helicsCoreDisconnect(core)
end

function helicsGetFederateByName(fedName::String)
    @invoke_and_check Lib.helicsGetFederateByName(fedName)
end

function helicsBrokerDisconnect(broker::Broker)
    @invoke_and_check Lib.helicsBrokerDisconnect(broker)
end

function helicsFederateDestroy(fed::Federate)
    Lib.helicsFederateDestroy(fed)
end

function helicsBrokerDestroy(broker::Broker)
    Lib.helicsBrokerDestroy(broker)
end

function helicsCoreDestroy(core::Core)
    Lib.helicsCoreDestroy(core)
end

function helicsCoreFree(core::Core)
    Lib.helicsCoreFree(core)
end

function helicsBrokerFree(broker::Broker)
    Lib.helicsBrokerFree(broker)
end

function helicsCreateValueFederate(fedName::String, fi::FederateInfo)::ValueFederate
    @invoke_and_check Lib.helicsCreateValueFederate(fedName, fi)
end

function helicsCreateValueFederateFromConfig(configFile)::ValueFederate
    @invoke_and_check Lib.helicsCreateValueFederateFromConfig(configFile)
end

function helicsCreateMessageFederate(fedName::String, fi::FederateInfo)::MessageFederate
    @invoke_and_check Lib.helicsCreateMessageFederate(fedName, fi)
end

function helicsCreateMessageFederateFromConfig(configFile)::MessageFederate
    @invoke_and_check Lib.helicsCreateMessageFederateFromConfig(configFile)
end

function helicsCreateCombinationFederate(fedName::String, fi::FederateInfo)::CombinationFederate
    @invoke_and_check Lib.helicsCreateCombinationFederate(fedName, fi)
end

function helicsCreateCombinationFederateFromConfig(configFile)::CombinationFederate
    @invoke_and_check Lib.helicsCreateCombinationFederateFromConfig(configFile)
end

function helicsFederateClone(fed::Federate)
    @invoke_and_check Lib.helicsFederateClone(fed)
end

function helicsCreateFederateInfo()::FederateInfo
    Lib.helicsCreateFederateInfo()
end

function helicsFederateInfoClone(fi::FederateInfo)
    @invoke_and_check Lib.helicsFederateInfoClone(fi)
end

function helicsFederateInfoLoadFromArgs(fi::FederateInfo, argc, argv)
    @invoke_and_check Lib.helicsFederateInfoLoadFromArgs(fi, argc, argv)
end

function helicsFederateInfoFree(fi::FederateInfo)
    Lib.helicsFederateInfoFree(fi)
end

function helicsFederateIsValid(fed::Federate)
    Lib.helicsFederateIsValid(fed)
end

function helicsFederateInfoSetCoreName(fi::FederateInfo, corename::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreName(fi, corename)
end

function helicsFederateInfoSetCoreInitString(fi::FederateInfo, coreInit::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreInitString(fi, coreInit)
end

function helicsFederateInfoSetCoreType(fi::FederateInfo, coretype::Int)
    @invoke_and_check Lib.helicsFederateInfoSetCoreType(fi, coretype)
end

function helicsFederateInfoSetCoreTypeFromString(fi::FederateInfo, coretype::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreTypeFromString(fi, coretype)
end

function helicsFederateInfoSetBroker(fi::FederateInfo, broker::Broker)
    @invoke_and_check Lib.helicsFederateInfoSetBroker(fi, broker)
end

function helicsFederateInfoSetBrokerPort(fi::FederateInfo, brokerPort::Int)
    @invoke_and_check Lib.helicsFederateInfoSetBrokerPort(fi, brokerPort)
end

function helicsFederateInfoSetLocalPort(fi::FederateInfo, localPort::Int)
    @invoke_and_check Lib.helicsFederateInfoSetLocalPort(fi, localPort)
end

function helicsGetPropertyIndex(val)
    Lib.helicsGetPropertyIndex(val)
end

function helicsGetOptionIndex(val)
    Lib.helicsGetOptionIndex(val)
end

function helicsFederateInfoSetFlagOption(fi::FederateInfo, flag, value)
    @invoke_and_check Lib.helicsFederateInfoSetFlagOption(fi, flag, value)
end

function helicsFederateInfoSetSeparator(fi::FederateInfo, separator)
    @invoke_and_check Lib.helicsFederateInfoSetSeparator(fi, separator)
end

function helicsFederateInfoSetTimeProperty(fi::FederateInfo, timeProperty::Lib.helics_properties, propertyValue)
    @invoke_and_check Lib.helicsFederateInfoSetTimeProperty(fi, timeProperty, propertyValue)
end

function helicsFederateInfoSetIntegerProperty(fi::FederateInfo, intProperty::Lib.helics_properties, propertyValue)
    @invoke_and_check Lib.helicsFederateInfoSetIntegerProperty(fi, intProperty, propertyValue)
end

function helicsFederateRegisterInterfaces(fed::Federate, file)
    @invoke_and_check Lib.helicsFederateRegisterInterfaces(fed, file)
end

function helicsFederateFinalize(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalize(fed)
end

function helicsFederateFinalizeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalizeAsync(fed)
end

function helicsFederateFinalizeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalizeComplete(fed)
end

function helicsFederateFree(fed::Federate)
    Lib.helicsFederateFree(fed)
end

function helicsCloseLibrary()
    Lib.helicsCloseLibrary()
end

function helicsFederateEnterInitializingMode(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingMode(fed)
end

function helicsFederateEnterInitializingModeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingModeAsync(fed)
end

function helicsFederateIsAsyncOperationCompleted(fed::Federate)
    @invoke_and_check Lib.helicsFederateIsAsyncOperationCompleted(fed)
end

function helicsFederateEnterInitializingModeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingModeComplete(fed)
end

function helicsFederateEnterExecutingMode(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingMode(fed)
end

function helicsFederateEnterExecutingModeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeAsync(fed)
end

function helicsFederateEnterExecutingModeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeComplete(fed)
end

function helicsFederateEnterExecutingModeIterative(fed::Federate, iterate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeIterative(fed, iterate)
end

function helicsFederateEnterExecutingModeIterativeAsync(fed::Federate, iterate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeAsync(fed, iterate)
end

function helicsFederateEnterExecutingModeIterativeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeComplete(fed)
end

function helicsFederateGetState(fed::Federate)::Int
    @invoke_and_check Lib.helicsFederateGetState(fed)
end

function helicsFederateGetCoreObject(fed::Federate)
    @invoke_and_check Lib.helicsFederateGetCoreObject(fed)
end

function helicsFederateRequestTime(fed::Federate, requestTime::Float64)::Float64
    @invoke_and_check Lib.helicsFederateRequestTime(fed, requestTime)
end

function helicsFederateRequestNextStep(fed::Federate)
    @invoke_and_check Lib.helicsFederateRequestNextStep(fed)
end

function helicsFederateRequestTimeIterative(fed::Federate, requestTime, iterate, outIterate)
    @invoke_and_check Lib.helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIterate)
end

function helicsFederateRequestTimeAsync(fed::Federate, requestTime)
    @invoke_and_check Lib.helicsFederateRequestTimeAsync(fed, requestTime)
end

function helicsFederateRequestTimeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateRequestTimeComplete(fed)
end

function helicsFederateRequestTimeIterativeAsync(fed::Federate, requestTime, iterate)
    @invoke_and_check Lib.helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate)
end

function helicsFederateRequestTimeIterativeComplete(fed::Federate, outIterate)
    @invoke_and_check Lib.helicsFederateRequestTimeIterativeComplete(fed, outIterate)
end

function helicsFederateGetName(fed::Federate)
    Lib.helicsFederateGetName(fed)
end

function helicsFederateSetTimeProperty(fed::Federate, timeProperty::Lib.helics_properties, time::Float64)
    @invoke_and_check Lib.helicsFederateSetTimeProperty(fed, timeProperty, time)
end

function helicsFederateSetFlagOption(fed::Federate, flag, flagValue)
    @invoke_and_check Lib.helicsFederateSetFlagOption(fed, flag, flagValue)
end

function helicsFederateSetSeparator(fed::Federate, separator)
    @invoke_and_check Lib.helicsFederateSetSeparator(fed, separator)
end

function helicsFederateSetIntegerProperty(fed::Federate, intProperty::Lib.helics_properties, propertyVal)
    @invoke_and_check Lib.helicsFederateSetIntegerProperty(fed, intProperty, propertyVal)
end

function helicsFederateGetTimeProperty(fed::Federate, timeProperty::Lib.helics_properties)
    @invoke_and_check Lib.helicsFederateGetTimeProperty(fed, timeProperty)
end

function helicsFederateGetFlagOption(fed::Federate, flag)
    @invoke_and_check Lib.helicsFederateGetFlagOption(fed, flag)
end

function helicsFederateGetIntegerProperty(fed::Federate, intProperty::Lib.helics_properties)
    @invoke_and_check Lib.helicsFederateGetIntegerProperty(fed, intProperty)
end

function helicsFederateGetCurrentTime(fed::Federate)
    @invoke_and_check Lib.helicsFederateGetCurrentTime(fed)
end

function helicsFederateSetGlobal(fed::Federate, valueName, value)
    @invoke_and_check Lib.helicsFederateSetGlobal(fed, valueName, value)
end

function helicsCoreSetGlobal(core::Core, valueName, value)
    @invoke_and_check Lib.helicsCoreSetGlobal(core, valueName, value)
end

function helicsBrokerSetGlobal(broker::Broker, valueName, value)
    @invoke_and_check Lib.helicsBrokerSetGlobal(broker, valueName, value)
end

function helicsCreateQuery(target::String, query::String)::Query
    Lib.helicsCreateQuery(target, query)
end

function helicsQueryExecute(query::Query, fed::Federate)
    @invoke_and_check Lib.helicsQueryExecute(query, fed)
end

function helicsQueryCoreExecute(query::Query, core::Core)
    @invoke_and_check Lib.helicsQueryCoreExecute(query, core)
end

function helicsQueryBrokerExecute(query::Query, broker::Broker)
    @invoke_and_check Lib.helicsQueryBrokerExecute(query, broker)
end

function helicsQueryExecuteAsync(query::Query, fed::Federate)
    @invoke_and_check Lib.helicsQueryExecuteAsync(query, fed)
end

function helicsQueryExecuteComplete(query::Query)
    @invoke_and_check Lib.helicsQueryExecuteComplete(query)
end

function helicsQueryIsCompleted(query::Query)
    Lib.helicsQueryIsCompleted(query)
end

function helicsQueryFree(query::Query)
    Lib.helicsQueryFree(query)
end

function helicsCleanupLibrary()
    Lib.helicsCleanupLibrary()
end

function helicsBrokerAddLoggingCallback(broker::Broker, logger)
    @invoke_and_check Lib.helicsBrokerAddLoggingCallback(broker, logger)
end

function helicsCoreAddLoggingCallback(core::Core, logger)
    @invoke_and_check Lib.helicsCoreAddLoggingCallback(core, logger)
end

function helicsFederateAddLoggingCallback(fed::Federate, logger)
    @invoke_and_check Lib.helicsFederateAddLoggingCallback(fed, logger)
end

