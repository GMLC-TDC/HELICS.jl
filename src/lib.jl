# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/MessageFederate.h
# Automatically generated using Clang.jl wrap_c


function helicsFederateRegisterEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterEndpoint, LIBRARY), helics_endpoint, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, name, type, err)
end

function helicsFederateRegisterGlobalEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterGlobalEndpoint, LIBRARY), helics_endpoint, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, name, type, err)
end

function helicsFederateGetEndpoint(fed, name, err)
    ccall((:helicsFederateGetEndpoint, LIBRARY), helics_endpoint, (helics_federate, Cstring, Ptr{helics_error}), fed, name, err)
end

function helicsFederateGetEndpointByIndex(fed, index, err)
    ccall((:helicsFederateGetEndpointByIndex, LIBRARY), helics_endpoint, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsEndpointSetDefaultDestination(endpoint, dest, err)
    ccall((:helicsEndpointSetDefaultDestination, LIBRARY), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), endpoint, dest, err)
end

function helicsEndpointGetDefaultDestination(endpoint)
    ccall((:helicsEndpointGetDefaultDestination, LIBRARY), Cstring, (helics_endpoint,), endpoint)
end

function helicsEndpointSendMessageRaw(endpoint, dest, data, inputDataLength, err)
    ccall((:helicsEndpointSendMessageRaw, LIBRARY), Cvoid, (helics_endpoint, Cstring, Ptr{Cvoid}, Cint, Ptr{helics_error}), endpoint, dest, data, inputDataLength, err)
end

function helicsEndpointSendEventRaw(endpoint, dest, data, inputDataLength, time, err)
    ccall((:helicsEndpointSendEventRaw, LIBRARY), Cvoid, (helics_endpoint, Cstring, Ptr{Cvoid}, Cint, helics_time, Ptr{helics_error}), endpoint, dest, data, inputDataLength, time, err)
end

function helicsEndpointSendMessage(endpoint, message, err)
    ccall((:helicsEndpointSendMessage, LIBRARY), Cvoid, (helics_endpoint, Ptr{helics_message}, Ptr{helics_error}), endpoint, message, err)
end

function helicsEndpointSubscribe(endpoint, key, err)
    ccall((:helicsEndpointSubscribe, LIBRARY), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), endpoint, key, err)
end

function helicsFederateHasMessage(fed)
    ccall((:helicsFederateHasMessage, LIBRARY), helics_bool, (helics_federate,), fed)
end

function helicsEndpointHasMessage(endpoint)
    ccall((:helicsEndpointHasMessage, LIBRARY), helics_bool, (helics_endpoint,), endpoint)
end

function helicsFederatePendingMessages(fed)
    ccall((:helicsFederatePendingMessages, LIBRARY), Cint, (helics_federate,), fed)
end

function helicsEndpointPendingMessages(endpoint)
    ccall((:helicsEndpointPendingMessages, LIBRARY), Cint, (helics_endpoint,), endpoint)
end

function helicsEndpointGetMessage(endpoint)
    ccall((:helicsEndpointGetMessage, LIBRARY), helics_message, (helics_endpoint,), endpoint)
end

function helicsFederateGetMessage(fed)
    ccall((:helicsFederateGetMessage, LIBRARY), helics_message, (helics_federate,), fed)
end

function helicsEndpointGetType(endpoint)
    ccall((:helicsEndpointGetType, LIBRARY), Cstring, (helics_endpoint,), endpoint)
end

function helicsEndpointGetName(endpoint)
    ccall((:helicsEndpointGetName, LIBRARY), Cstring, (helics_endpoint,), endpoint)
end

function helicsFederateGetEndpointCount(fed)
    ccall((:helicsFederateGetEndpointCount, LIBRARY), Cint, (helics_federate,), fed)
end

function helicsEndpointGetInfo(_end)
    ccall((:helicsEndpointGetInfo, LIBRARY), Cstring, (helics_endpoint,), _end)
end

function helicsEndpointSetInfo(_end, info, err)
    ccall((:helicsEndpointSetInfo, LIBRARY), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), _end, info, err)
end

function helicsEndpointSetOption(_end, option, value, err)
    ccall((:helicsEndpointSetOption, LIBRARY), Cvoid, (helics_endpoint, Cint, helics_bool, Ptr{helics_error}), _end, option, value, err)
end

function helicsEndpointGetOption(_end, option)
    ccall((:helicsEndpointGetOption, LIBRARY), helics_bool, (helics_endpoint, Cint), _end, option)
end
# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/MessageFilters.h
# Automatically generated using Clang.jl wrap_c


function helicsFederateRegisterFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterFilter, LIBRARY), helics_filter, (helics_federate, helics_filter_type, Cstring, Ptr{helics_error}), fed, type, name, err)
end

function helicsFederateRegisterGlobalFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterGlobalFilter, LIBRARY), helics_filter, (helics_federate, helics_filter_type, Cstring, Ptr{helics_error}), fed, type, name, err)
end

function helicsFederateRegisterCloningFilter(fed, deliveryEndpoint, err)
    ccall((:helicsFederateRegisterCloningFilter, LIBRARY), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, deliveryEndpoint, err)
end

function helicsFederateRegisterGlobalCloningFilter(fed, deliveryEndpoint, err)
    ccall((:helicsFederateRegisterGlobalCloningFilter, LIBRARY), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, deliveryEndpoint, err)
end

function helicsCoreRegisterFilter(core, type, name, err)
    ccall((:helicsCoreRegisterFilter, LIBRARY), helics_filter, (helics_core, helics_filter_type, Cstring, Ptr{helics_error}), core, type, name, err)
end

function helicsCoreRegisterCloningFilter(core, deliveryEndpoint, err)
    ccall((:helicsCoreRegisterCloningFilter, LIBRARY), helics_filter, (helics_core, Cstring, Ptr{helics_error}), core, deliveryEndpoint, err)
end

function helicsFederateGetFilterCount(fed)
    ccall((:helicsFederateGetFilterCount, LIBRARY), Cint, (helics_federate,), fed)
end

function helicsFederateGetFilter(fed, name, err)
    ccall((:helicsFederateGetFilter, LIBRARY), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, name, err)
end

function helicsFederateGetFilterByIndex(fed, index, err)
    ccall((:helicsFederateGetFilterByIndex, LIBRARY), helics_filter, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFilterGetName(filt)
    ccall((:helicsFilterGetName, LIBRARY), Cstring, (helics_filter,), filt)
end

function helicsFilterSet(filt, prop, val, err)
    ccall((:helicsFilterSet, LIBRARY), Cvoid, (helics_filter, Cstring, Cdouble, Ptr{helics_error}), filt, prop, val, err)
end

function helicsFilterSetString(filt, prop, val, err)
    ccall((:helicsFilterSetString, LIBRARY), Cvoid, (helics_filter, Cstring, Cstring, Ptr{helics_error}), filt, prop, val, err)
end

function helicsFilterAddDestinationTarget(filt, dest, err)
    ccall((:helicsFilterAddDestinationTarget, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, dest, err)
end

function helicsFilterAddSourceTarget(filt, source, err)
    ccall((:helicsFilterAddSourceTarget, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, source, err)
end

function helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterAddDeliveryEndpoint, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, deliveryEndpoint, err)
end

function helicsFilterRemoveTarget(filt, target, err)
    ccall((:helicsFilterRemoveTarget, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, target, err)
end

function helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterRemoveDeliveryEndpoint, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, deliveryEndpoint, err)
end

function helicsFilterGetInfo(filt)
    ccall((:helicsFilterGetInfo, LIBRARY), Cstring, (helics_filter,), filt)
end

function helicsFilterSetInfo(filt, info, err)
    ccall((:helicsFilterSetInfo, LIBRARY), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, info, err)
end

function helicsFilterSetOption(filt, option, value, err)
    ccall((:helicsFilterSetOption, LIBRARY), Cvoid, (helics_filter, Cint, helics_bool, Ptr{helics_error}), filt, option, value, err)
end

function helicsFilterGetOption(filt, option)
    ccall((:helicsFilterGetOption, LIBRARY), helics_bool, (helics_filter, Cint), filt, option)
end
# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/ValueFederate.h
# Automatically generated using Clang.jl wrap_c


function helicsFederateRegisterSubscription(fed, key, units, err)
    ccall((:helicsFederateRegisterSubscription, LIBRARY), helics_input, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, key, units, err)
end

function helicsFederateRegisterPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterPublication, LIBRARY), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypePublication, LIBRARY), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalPublication, LIBRARY), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypePublication, LIBRARY), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterInput, LIBRARY), helics_input, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypeInput, LIBRARY), helics_input, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalInput, LIBRARY), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypeInput, LIBRARY), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateGetPublication(fed, key, err)
    ccall((:helicsFederateGetPublication, LIBRARY), helics_publication, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsFederateGetPublicationByIndex(fed, index, err)
    ccall((:helicsFederateGetPublicationByIndex, LIBRARY), helics_publication, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFederateGetInput(fed, key, err)
    ccall((:helicsFederateGetInput, LIBRARY), helics_input, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsFederateGetInputByIndex(fed, index, err)
    ccall((:helicsFederateGetInputByIndex, LIBRARY), helics_input, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFederateGetSubscription(fed, key, err)
    ccall((:helicsFederateGetSubscription, LIBRARY), helics_input, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsPublicationPublishRaw(pub, data, inputDataLength, err)
    ccall((:helicsPublicationPublishRaw, LIBRARY), Cvoid, (helics_publication, Ptr{Cvoid}, Cint, Ptr{helics_error}), pub, data, inputDataLength, err)
end

function helicsPublicationPublishString(pub, str, err)
    ccall((:helicsPublicationPublishString, LIBRARY), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, str, err)
end

function helicsPublicationPublishInteger(pub, val, err)
    ccall((:helicsPublicationPublishInteger, LIBRARY), Cvoid, (helics_publication, Int64, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishBoolean(pub, val, err)
    ccall((:helicsPublicationPublishBoolean, LIBRARY), Cvoid, (helics_publication, helics_bool, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishDouble(pub, val, err)
    ccall((:helicsPublicationPublishDouble, LIBRARY), Cvoid, (helics_publication, Cdouble, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishTime(pub, val, err)
    ccall((:helicsPublicationPublishTime, LIBRARY), Cvoid, (helics_publication, helics_time, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishChar(pub, val, err)
    ccall((:helicsPublicationPublishChar, LIBRARY), Cvoid, (helics_publication, UInt8, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishComplex(pub, real, imag, err)
    ccall((:helicsPublicationPublishComplex, LIBRARY), Cvoid, (helics_publication, Cdouble, Cdouble, Ptr{helics_error}), pub, real, imag, err)
end

function helicsPublicationPublishVector(pub, vectorInput, vectorLength, err)
    ccall((:helicsPublicationPublishVector, LIBRARY), Cvoid, (helics_publication, Ptr{Cdouble}, Cint, Ptr{helics_error}), pub, vectorInput, vectorLength, err)
end

function helicsPublicationPublishNamedPoint(pub, str, val, err)
    ccall((:helicsPublicationPublishNamedPoint, LIBRARY), Cvoid, (helics_publication, Cstring, Cdouble, Ptr{helics_error}), pub, str, val, err)
end

function helicsPublicationAddTarget(pub, target, err)
    ccall((:helicsPublicationAddTarget, LIBRARY), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, target, err)
end

function helicsInputAddTarget(ipt, target, err)
    ccall((:helicsInputAddTarget, LIBRARY), Cvoid, (helics_input, Cstring, Ptr{helics_error}), ipt, target, err)
end

function helicsInputGetRawValueSize(ipt)
    ccall((:helicsInputGetRawValueSize, LIBRARY), Cint, (helics_input,), ipt)
end

function helicsInputGetRawValue(ipt, data, maxlen, actualSize, err)
    ccall((:helicsInputGetRawValue, LIBRARY), Cvoid, (helics_input, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, data, maxlen, actualSize, err)
end

function helicsInputGetStringSize(ipt)
    ccall((:helicsInputGetStringSize, LIBRARY), Cint, (helics_input,), ipt)
end

function helicsInputGetString(ipt, outputString, maxStringLen, actualLength, err)
    ccall((:helicsInputGetString, LIBRARY), Cvoid, (helics_input, Cstring, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, outputString, maxStringLen, actualLength, err)
end

function helicsInputGetInteger(ipt, err)
    ccall((:helicsInputGetInteger, LIBRARY), Int64, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetBoolean(ipt, err)
    ccall((:helicsInputGetBoolean, LIBRARY), helics_bool, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetDouble(ipt, err)
    ccall((:helicsInputGetDouble, LIBRARY), Cdouble, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetTime(ipt, err)
    ccall((:helicsInputGetTime, LIBRARY), helics_time, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetChar(ipt, err)
    ccall((:helicsInputGetChar, LIBRARY), UInt8, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetComplexObject(ipt, err)
    ccall((:helicsInputGetComplexObject, LIBRARY), helics_complex, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetComplex(ipt, real, imag, err)
    ccall((:helicsInputGetComplex, LIBRARY), Cvoid, (helics_input, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{helics_error}), ipt, real, imag, err)
end

function helicsInputGetVectorSize(ipt)
    ccall((:helicsInputGetVectorSize, LIBRARY), Cint, (helics_input,), ipt)
end

function helicsInputGetVector(ipt, data, maxlen, actualSize, err)
    ccall((:helicsInputGetVector, LIBRARY), Cvoid, (helics_input, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, data, maxlen, actualSize, err)
end

function helicsInputGetNamedPoint(ipt, outputString, maxStringLen, actualLength, val, err)
    ccall((:helicsInputGetNamedPoint, LIBRARY), Cvoid, (helics_input, Cstring, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{helics_error}), ipt, outputString, maxStringLen, actualLength, val, err)
end

function helicsInputSetDefaultRaw(ipt, data, inputDataLength, err)
    ccall((:helicsInputSetDefaultRaw, LIBRARY), Cvoid, (helics_input, Ptr{Cvoid}, Cint, Ptr{helics_error}), ipt, data, inputDataLength, err)
end

function helicsInputSetDefaultString(ipt, str, err)
    ccall((:helicsInputSetDefaultString, LIBRARY), Cvoid, (helics_input, Cstring, Ptr{helics_error}), ipt, str, err)
end

function helicsInputSetDefaultInteger(ipt, val, err)
    ccall((:helicsInputSetDefaultInteger, LIBRARY), Cvoid, (helics_input, Int64, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultBoolean(ipt, val, err)
    ccall((:helicsInputSetDefaultBoolean, LIBRARY), Cvoid, (helics_input, helics_bool, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultTime(ipt, val, err)
    ccall((:helicsInputSetDefaultTime, LIBRARY), Cvoid, (helics_input, helics_time, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultChar(ipt, val, err)
    ccall((:helicsInputSetDefaultChar, LIBRARY), Cvoid, (helics_input, UInt8, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultDouble(ipt, val, err)
    ccall((:helicsInputSetDefaultDouble, LIBRARY), Cvoid, (helics_input, Cdouble, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultComplex(ipt, real, imag, err)
    ccall((:helicsInputSetDefaultComplex, LIBRARY), Cvoid, (helics_input, Cdouble, Cdouble, Ptr{helics_error}), ipt, real, imag, err)
end

function helicsInputSetDefaultVector(ipt, vectorInput, vectorLength, err)
    ccall((:helicsInputSetDefaultVector, LIBRARY), Cvoid, (helics_input, Ptr{Cdouble}, Cint, Ptr{helics_error}), ipt, vectorInput, vectorLength, err)
end

function helicsInputSetDefaultNamedPoint(ipt, str, val, err)
    ccall((:helicsInputSetDefaultNamedPoint, LIBRARY), Cvoid, (helics_input, Cstring, Cdouble, Ptr{helics_error}), ipt, str, val, err)
end

function helicsInputGetType(ipt)
    ccall((:helicsInputGetType, LIBRARY), Cstring, (helics_input,), ipt)
end

function helicsInputGetPublicationType(ipt)
    ccall((:helicsInputGetPublicationType, LIBRARY), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetType(pub)
    ccall((:helicsPublicationGetType, LIBRARY), Cstring, (helics_publication,), pub)
end

function helicsInputGetKey(ipt)
    ccall((:helicsInputGetKey, LIBRARY), Cstring, (helics_input,), ipt)
end

function helicsSubscriptionGetKey(ipt)
    ccall((:helicsSubscriptionGetKey, LIBRARY), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetKey(pub)
    ccall((:helicsPublicationGetKey, LIBRARY), Cstring, (helics_publication,), pub)
end

function helicsInputGetUnits(ipt)
    ccall((:helicsInputGetUnits, LIBRARY), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetUnits(pub)
    ccall((:helicsPublicationGetUnits, LIBRARY), Cstring, (helics_publication,), pub)
end

function helicsInputGetInfo(inp)
    ccall((:helicsInputGetInfo, LIBRARY), Cstring, (helics_input,), inp)
end

function helicsInputSetInfo(inp, info, err)
    ccall((:helicsInputSetInfo, LIBRARY), Cvoid, (helics_input, Cstring, Ptr{helics_error}), inp, info, err)
end

function helicsPublicationGetInfo(pub)
    ccall((:helicsPublicationGetInfo, LIBRARY), Cstring, (helics_publication,), pub)
end

function helicsPublicationSetInfo(pub, info, err)
    ccall((:helicsPublicationSetInfo, LIBRARY), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, info, err)
end

function helicsInputGetOption(inp, option)
    ccall((:helicsInputGetOption, LIBRARY), helics_bool, (helics_input, Cint), inp, option)
end

function helicsInputSetOption(inp, option, value, err)
    ccall((:helicsInputSetOption, LIBRARY), Cvoid, (helics_input, Cint, helics_bool, Ptr{helics_error}), inp, option, value, err)
end

function helicsPublicationGetOption(pub, option)
    ccall((:helicsPublicationGetOption, LIBRARY), helics_bool, (helics_publication, Cint), pub, option)
end

function helicsPublicationSetOption(pub, option, val, err)
    ccall((:helicsPublicationSetOption, LIBRARY), Cvoid, (helics_publication, Cint, helics_bool, Ptr{helics_error}), pub, option, val, err)
end

function helicsInputIsUpdated(ipt)
    ccall((:helicsInputIsUpdated, LIBRARY), helics_bool, (helics_input,), ipt)
end

function helicsInputLastUpdateTime(ipt)
    ccall((:helicsInputLastUpdateTime, LIBRARY), helics_time, (helics_input,), ipt)
end

function helicsFederateGetPublicationCount(fed)
    ccall((:helicsFederateGetPublicationCount, LIBRARY), Cint, (helics_federate,), fed)
end

function helicsFederateGetInputCount(fed)
    ccall((:helicsFederateGetInputCount, LIBRARY), Cint, (helics_federate,), fed)
end
# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/api-data.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/helics-config.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/helics.h
# Automatically generated using Clang.jl wrap_c


function helicsGetVersion()
    ccall((:helicsGetVersion, LIBRARY), Cstring, ())
end

function helicsErrorInitialize()
    ccall((:helicsErrorInitialize, LIBRARY), helics_error, ())
end

function helicsErrorClear(err)
    ccall((:helicsErrorClear, LIBRARY), Cvoid, (Ptr{helics_error},), err)
end

function helicsIsCoreTypeAvailable(type)
    ccall((:helicsIsCoreTypeAvailable, LIBRARY), helics_bool, (Cstring,), type)
end

function helicsCreateCore(type, name, initString, err)
    ccall((:helicsCreateCore, LIBRARY), helics_core, (Cstring, Cstring, Cstring, Ptr{helics_error}), type, name, initString, err)
end

function helicsCreateCoreFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateCoreFromArgs, LIBRARY), helics_core, (Cstring, Cstring, Cint, Ptr{Cstring}, Ptr{helics_error}), type, name, argc, argv, err)
end

function helicsCoreClone(core, err)
    ccall((:helicsCoreClone, LIBRARY), helics_core, (helics_core, Ptr{helics_error}), core, err)
end

function helicsCoreIsValid(core)
    ccall((:helicsCoreIsValid, LIBRARY), helics_bool, (helics_core,), core)
end

function helicsCreateBroker(type, name, initString, err)
    ccall((:helicsCreateBroker, LIBRARY), helics_broker, (Cstring, Cstring, Cstring, Ptr{helics_error}), type, name, initString, err)
end

function helicsCreateBrokerFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateBrokerFromArgs, LIBRARY), helics_broker, (Cstring, Cstring, Cint, Ptr{Cstring}, Ptr{helics_error}), type, name, argc, argv, err)
end

function helicsBrokerClone(broker, err)
    ccall((:helicsBrokerClone, LIBRARY), helics_broker, (helics_broker, Ptr{helics_error}), broker, err)
end

function helicsBrokerIsValid(broker)
    ccall((:helicsBrokerIsValid, LIBRARY), helics_bool, (helics_broker,), broker)
end

function helicsBrokerIsConnected(broker)
    ccall((:helicsBrokerIsConnected, LIBRARY), helics_bool, (helics_broker,), broker)
end

function helicsBrokerDataLink(broker, source, target, err)
    ccall((:helicsBrokerDataLink, LIBRARY), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, source, target, err)
end

function helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddSourceFilterToEndpoint, LIBRARY), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, filter, endpoint, err)
end

function helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddDestinationFilterToEndpoint, LIBRARY), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, filter, endpoint, err)
end

function helicsBrokerWaitForDisconnect(broker, msToWait, err)
    ccall((:helicsBrokerWaitForDisconnect, LIBRARY), helics_bool, (helics_broker, Cint, Ptr{helics_error}), broker, msToWait, err)
end

function helicsCoreIsConnected(core)
    ccall((:helicsCoreIsConnected, LIBRARY), helics_bool, (helics_core,), core)
end

function helicsCoreDataLink(core, source, target, err)
    ccall((:helicsCoreDataLink, LIBRARY), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, source, target, err)
end

function helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddSourceFilterToEndpoint, LIBRARY), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, filter, endpoint, err)
end

function helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddDestinationFilterToEndpoint, LIBRARY), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, filter, endpoint, err)
end

function helicsBrokerGetIdentifier(broker)
    ccall((:helicsBrokerGetIdentifier, LIBRARY), Cstring, (helics_broker,), broker)
end

function helicsCoreGetIdentifier(core)
    ccall((:helicsCoreGetIdentifier, LIBRARY), Cstring, (helics_core,), core)
end

function helicsBrokerGetAddress(broker)
    ccall((:helicsBrokerGetAddress, LIBRARY), Cstring, (helics_broker,), broker)
end

function helicsCoreSetReadyToInit(core, err)
    ccall((:helicsCoreSetReadyToInit, LIBRARY), Cvoid, (helics_core, Ptr{helics_error}), core, err)
end

function helicsCoreDisconnect(core, err)
    ccall((:helicsCoreDisconnect, LIBRARY), Cvoid, (helics_core, Ptr{helics_error}), core, err)
end

function helicsGetFederateByName(fedName, err)
    ccall((:helicsGetFederateByName, LIBRARY), helics_federate, (Cstring, Ptr{helics_error}), fedName, err)
end

function helicsBrokerDisconnect(broker, err)
    ccall((:helicsBrokerDisconnect, LIBRARY), Cvoid, (helics_broker, Ptr{helics_error}), broker, err)
end

function helicsFederateDestroy(fed)
    ccall((:helicsFederateDestroy, LIBRARY), Cvoid, (helics_federate,), fed)
end

function helicsBrokerDestroy(broker)
    ccall((:helicsBrokerDestroy, LIBRARY), Cvoid, (helics_broker,), broker)
end

function helicsCoreDestroy(core)
    ccall((:helicsCoreDestroy, LIBRARY), Cvoid, (helics_core,), core)
end

function helicsCoreFree(core)
    ccall((:helicsCoreFree, LIBRARY), Cvoid, (helics_core,), core)
end

function helicsBrokerFree(broker)
    ccall((:helicsBrokerFree, LIBRARY), Cvoid, (helics_broker,), broker)
end

function helicsCreateValueFederate(fedName, fi, err)
    ccall((:helicsCreateValueFederate, LIBRARY), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateValueFederateFromConfig(configFile, err)
    ccall((:helicsCreateValueFederateFromConfig, LIBRARY), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsCreateMessageFederate(fedName, fi, err)
    ccall((:helicsCreateMessageFederate, LIBRARY), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateMessageFederateFromConfig(configFile, err)
    ccall((:helicsCreateMessageFederateFromConfig, LIBRARY), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsCreateCombinationFederate(fedName, fi, err)
    ccall((:helicsCreateCombinationFederate, LIBRARY), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateCombinationFederateFromConfig(configFile, err)
    ccall((:helicsCreateCombinationFederateFromConfig, LIBRARY), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsFederateClone(fed, err)
    ccall((:helicsFederateClone, LIBRARY), helics_federate, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsCreateFederateInfo()
    ccall((:helicsCreateFederateInfo, LIBRARY), helics_federate_info, ())
end

function helicsFederateInfoClone(fi, err)
    ccall((:helicsFederateInfoClone, LIBRARY), helics_federate_info, (helics_federate_info, Ptr{helics_error}), fi, err)
end

function helicsFederateInfoLoadFromArgs(fi, argc, argv, err)
    ccall((:helicsFederateInfoLoadFromArgs, LIBRARY), Cvoid, (helics_federate_info, Cint, Ptr{Cstring}, Ptr{helics_error}), fi, argc, argv, err)
end

function helicsFederateInfoFree(fi)
    ccall((:helicsFederateInfoFree, LIBRARY), Cvoid, (helics_federate_info,), fi)
end

function helicsFederateIsValid(fed)
    ccall((:helicsFederateIsValid, LIBRARY), helics_bool, (helics_federate,), fed)
end

function helicsFederateInfoSetCoreName(fi, corename, err)
    ccall((:helicsFederateInfoSetCoreName, LIBRARY), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, corename, err)
end

function helicsFederateInfoSetCoreInitString(fi, coreInit, err)
    ccall((:helicsFederateInfoSetCoreInitString, LIBRARY), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, coreInit, err)
end

function helicsFederateInfoSetCoreType(fi, coretype, err)
    ccall((:helicsFederateInfoSetCoreType, LIBRARY), Cvoid, (helics_federate_info, Cint, Ptr{helics_error}), fi, coretype, err)
end

function helicsFederateInfoSetCoreTypeFromString(fi, coretype, err)
    ccall((:helicsFederateInfoSetCoreTypeFromString, LIBRARY), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, coretype, err)
end

function helicsFederateInfoSetBroker(fi, broker, err)
    ccall((:helicsFederateInfoSetBroker, LIBRARY), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, broker, err)
end

function helicsFederateInfoSetBrokerPort(fi, brokerPort, err)
    ccall((:helicsFederateInfoSetBrokerPort, LIBRARY), Cvoid, (helics_federate_info, Cint, Ptr{helics_error}), fi, brokerPort, err)
end

function helicsFederateInfoSetLocalPort(fi, localPort, err)
    ccall((:helicsFederateInfoSetLocalPort, LIBRARY), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, localPort, err)
end

function helicsGetPropertyIndex(val)
    ccall((:helicsGetPropertyIndex, LIBRARY), Cint, (Cstring,), val)
end

function helicsGetOptionIndex(val)
    ccall((:helicsGetOptionIndex, LIBRARY), Cint, (Cstring,), val)
end

function helicsFederateInfoSetFlagOption(fi, flag, value, err)
    ccall((:helicsFederateInfoSetFlagOption, LIBRARY), Cvoid, (helics_federate_info, Cint, helics_bool, Ptr{helics_error}), fi, flag, value, err)
end

function helicsFederateInfoSetSeparator(fi, separator, err)
    ccall((:helicsFederateInfoSetSeparator, LIBRARY), Cvoid, (helics_federate_info, UInt8, Ptr{helics_error}), fi, separator, err)
end

function helicsFederateInfoSetTimeProperty(fi, timeProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetTimeProperty, LIBRARY), Cvoid, (helics_federate_info, Cint, helics_time, Ptr{helics_error}), fi, timeProperty, propertyValue, err)
end

function helicsFederateInfoSetIntegerProperty(fi, intProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetIntegerProperty, LIBRARY), Cvoid, (helics_federate_info, Cint, Cint, Ptr{helics_error}), fi, intProperty, propertyValue, err)
end

function helicsFederateRegisterInterfaces(fed, file, err)
    ccall((:helicsFederateRegisterInterfaces, LIBRARY), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, file, err)
end

function helicsFederateFinalize(fed, err)
    ccall((:helicsFederateFinalize, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFinalizeAsync(fed, err)
    ccall((:helicsFederateFinalizeAsync, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFinalizeComplete(fed, err)
    ccall((:helicsFederateFinalizeComplete, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFree(fed)
    ccall((:helicsFederateFree, LIBRARY), Cvoid, (helics_federate,), fed)
end

function helicsCloseLibrary()
    ccall((:helicsCloseLibrary, LIBRARY), Cvoid, ())
end

function helicsFederateEnterInitializingMode(fed, err)
    ccall((:helicsFederateEnterInitializingMode, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterInitializingModeAsync(fed, err)
    ccall((:helicsFederateEnterInitializingModeAsync, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateIsAsyncOperationCompleted(fed, err)
    ccall((:helicsFederateIsAsyncOperationCompleted, LIBRARY), helics_bool, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterInitializingModeComplete(fed, err)
    ccall((:helicsFederateEnterInitializingModeComplete, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingMode(fed, err)
    ccall((:helicsFederateEnterExecutingMode, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeAsync(fed, err)
    ccall((:helicsFederateEnterExecutingModeAsync, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeComplete, LIBRARY), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeIterative(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterative, LIBRARY), helics_iteration_result, (helics_federate, helics_iteration_request, Ptr{helics_error}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeAsync(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterativeAsync, LIBRARY), Cvoid, (helics_federate, helics_iteration_request, Ptr{helics_error}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeIterativeComplete, LIBRARY), helics_iteration_result, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateGetState(fed, err)
    ccall((:helicsFederateGetState, LIBRARY), helics_federate_state, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateGetCoreObject(fed, err)
    ccall((:helicsFederateGetCoreObject, LIBRARY), helics_core, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTime(fed, requestTime, err)
    ccall((:helicsFederateRequestTime, LIBRARY), helics_time, (helics_federate, helics_time, Ptr{helics_error}), fed, requestTime, err)
end

function helicsFederateRequestNextStep(fed, err)
    ccall((:helicsFederateRequestNextStep, LIBRARY), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIterate, err)
    ccall((:helicsFederateRequestTimeIterative, LIBRARY), helics_time, (helics_federate, helics_time, helics_iteration_request, Ptr{helics_iteration_result}, Ptr{helics_error}), fed, requestTime, iterate, outIterate, err)
end

function helicsFederateRequestTimeAsync(fed, requestTime, err)
    ccall((:helicsFederateRequestTimeAsync, LIBRARY), Cvoid, (helics_federate, helics_time, Ptr{helics_error}), fed, requestTime, err)
end

function helicsFederateRequestTimeComplete(fed, err)
    ccall((:helicsFederateRequestTimeComplete, LIBRARY), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate, err)
    ccall((:helicsFederateRequestTimeIterativeAsync, LIBRARY), Cvoid, (helics_federate, helics_time, helics_iteration_request, Ptr{helics_error}), fed, requestTime, iterate, err)
end

function helicsFederateRequestTimeIterativeComplete(fed, outIterate, err)
    ccall((:helicsFederateRequestTimeIterativeComplete, LIBRARY), helics_time, (helics_federate, Ptr{helics_iteration_result}, Ptr{helics_error}), fed, outIterate, err)
end

function helicsFederateGetName(fed)
    ccall((:helicsFederateGetName, LIBRARY), Cstring, (helics_federate,), fed)
end

function helicsFederateSetTimeProperty(fed, timeProperty, time, err)
    ccall((:helicsFederateSetTimeProperty, LIBRARY), Cvoid, (helics_federate, Cint, helics_time, Ptr{helics_error}), fed, timeProperty, time, err)
end

function helicsFederateSetFlagOption(fed, flag, flagValue, err)
    ccall((:helicsFederateSetFlagOption, LIBRARY), Cvoid, (helics_federate, Cint, helics_bool, Ptr{helics_error}), fed, flag, flagValue, err)
end

function helicsFederateSetSeparator(fed, separator, err)
    ccall((:helicsFederateSetSeparator, LIBRARY), Cvoid, (helics_federate, UInt8, Ptr{helics_error}), fed, separator, err)
end

function helicsFederateSetIntegerProperty(fed, intProperty, propertyVal, err)
    ccall((:helicsFederateSetIntegerProperty, LIBRARY), Cvoid, (helics_federate, Cint, Cint, Ptr{helics_error}), fed, intProperty, propertyVal, err)
end

function helicsFederateGetTimeProperty(fed, timeProperty, err)
    ccall((:helicsFederateGetTimeProperty, LIBRARY), helics_time, (helics_federate, Cint, Ptr{helics_error}), fed, timeProperty, err)
end

function helicsFederateGetFlagOption(fed, flag, err)
    ccall((:helicsFederateGetFlagOption, LIBRARY), helics_bool, (helics_federate, Cint, Ptr{helics_error}), fed, flag, err)
end

function helicsFederateGetIntegerProperty(fed, intProperty, err)
    ccall((:helicsFederateGetIntegerProperty, LIBRARY), Cint, (helics_federate, Cint, Ptr{helics_error}), fed, intProperty, err)
end

function helicsFederateGetCurrentTime(fed, err)
    ccall((:helicsFederateGetCurrentTime, LIBRARY), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateSetGlobal(fed, valueName, value, err)
    ccall((:helicsFederateSetGlobal, LIBRARY), Cvoid, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, valueName, value, err)
end

function helicsCoreSetGlobal(core, valueName, value, err)
    ccall((:helicsCoreSetGlobal, LIBRARY), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, valueName, value, err)
end

function helicsBrokerSetGlobal(broker, valueName, value, err)
    ccall((:helicsBrokerSetGlobal, LIBRARY), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, valueName, value, err)
end

function helicsCreateQuery(target, query)
    ccall((:helicsCreateQuery, LIBRARY), helics_query, (Cstring, Cstring), target, query)
end

function helicsQueryExecute(query, fed, err)
    ccall((:helicsQueryExecute, LIBRARY), Cstring, (helics_query, helics_federate, Ptr{helics_error}), query, fed, err)
end

function helicsQueryCoreExecute(query, core, err)
    ccall((:helicsQueryCoreExecute, LIBRARY), Cstring, (helics_query, helics_core, Ptr{helics_error}), query, core, err)
end

function helicsQueryBrokerExecute(query, broker, err)
    ccall((:helicsQueryBrokerExecute, LIBRARY), Cstring, (helics_query, helics_broker, Ptr{helics_error}), query, broker, err)
end

function helicsQueryExecuteAsync(query, fed, err)
    ccall((:helicsQueryExecuteAsync, LIBRARY), Cvoid, (helics_query, helics_federate, Ptr{helics_error}), query, fed, err)
end

function helicsQueryExecuteComplete(query, err)
    ccall((:helicsQueryExecuteComplete, LIBRARY), Cstring, (helics_query, Ptr{helics_error}), query, err)
end

function helicsQueryIsCompleted(query)
    ccall((:helicsQueryIsCompleted, LIBRARY), helics_bool, (helics_query,), query)
end

function helicsQueryFree(query)
    ccall((:helicsQueryFree, LIBRARY), Cvoid, (helics_query,), query)
end

function helicsCleanupLibrary()
    ccall((:helicsCleanupLibrary, LIBRARY), Cvoid, ())
end
# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/helicsCallbacks.h
# Automatically generated using Clang.jl wrap_c


function helicsBrokerAddLoggingCallback(broker, logger, err)
    ccall((:helicsBrokerAddLoggingCallback, LIBRARY), Cvoid, (helics_broker, Ptr{Cvoid}, Ptr{helics_error}), broker, logger, err)
end

function helicsCoreAddLoggingCallback(core, logger, err)
    ccall((:helicsCoreAddLoggingCallback, LIBRARY), Cvoid, (helics_core, Ptr{Cvoid}, Ptr{helics_error}), core, logger, err)
end

function helicsFederateAddLoggingCallback(fed, logger, err)
    ccall((:helicsFederateAddLoggingCallback, LIBRARY), Cvoid, (helics_federate, Ptr{Cvoid}, Ptr{helics_error}), fed, logger, err)
end
# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/helics_enums.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/$USER/local/helics-v2.0.0-beta.3/include/helics/shared_api_library/helics_export.h
# Automatically generated using Clang.jl wrap_c

