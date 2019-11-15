# Julia wrapper for header: MessageFederate.h
# Automatically generated using Clang.jl


function helicsFederateRegisterEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterEndpoint, libhelicsSharedLib), helics_endpoint, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, name, type, err)
end

function helicsFederateRegisterGlobalEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterGlobalEndpoint, libhelicsSharedLib), helics_endpoint, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, name, type, err)
end

function helicsFederateGetEndpoint(fed, name, err)
    ccall((:helicsFederateGetEndpoint, libhelicsSharedLib), helics_endpoint, (helics_federate, Cstring, Ptr{helics_error}), fed, name, err)
end

function helicsFederateGetEndpointByIndex(fed, index, err)
    ccall((:helicsFederateGetEndpointByIndex, libhelicsSharedLib), helics_endpoint, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsEndpointSetDefaultDestination(endpoint, dest, err)
    ccall((:helicsEndpointSetDefaultDestination, libhelicsSharedLib), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), endpoint, dest, err)
end

function helicsEndpointGetDefaultDestination(endpoint)
    ccall((:helicsEndpointGetDefaultDestination, libhelicsSharedLib), Cstring, (helics_endpoint,), endpoint)
end

function helicsEndpointSendMessageRaw(endpoint, dest, data, inputDataLength, err)
    ccall((:helicsEndpointSendMessageRaw, libhelicsSharedLib), Cvoid, (helics_endpoint, Cstring, Ptr{Cvoid}, Cint, Ptr{helics_error}), endpoint, dest, data, inputDataLength, err)
end

function helicsEndpointSendEventRaw(endpoint, dest, data, inputDataLength, time, err)
    ccall((:helicsEndpointSendEventRaw, libhelicsSharedLib), Cvoid, (helics_endpoint, Cstring, Ptr{Cvoid}, Cint, helics_time, Ptr{helics_error}), endpoint, dest, data, inputDataLength, time, err)
end

function helicsEndpointSendMessage(endpoint, message, err)
    ccall((:helicsEndpointSendMessage, libhelicsSharedLib), Cvoid, (helics_endpoint, Ptr{helics_message}, Ptr{helics_error}), endpoint, message, err)
end

function helicsEndpointSendMessageObject(endpoint, message, err)
    ccall((:helicsEndpointSendMessageObject, libhelicsSharedLib), Cvoid, (helics_endpoint, helics_message_object, Ptr{helics_error}), endpoint, message, err)
end

function helicsEndpointSubscribe(endpoint, key, err)
    ccall((:helicsEndpointSubscribe, libhelicsSharedLib), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), endpoint, key, err)
end

function helicsFederateHasMessage(fed)
    ccall((:helicsFederateHasMessage, libhelicsSharedLib), helics_bool, (helics_federate,), fed)
end

function helicsEndpointHasMessage(endpoint)
    ccall((:helicsEndpointHasMessage, libhelicsSharedLib), helics_bool, (helics_endpoint,), endpoint)
end

function helicsFederatePendingMessages(fed)
    ccall((:helicsFederatePendingMessages, libhelicsSharedLib), Cint, (helics_federate,), fed)
end

function helicsEndpointPendingMessages(endpoint)
    ccall((:helicsEndpointPendingMessages, libhelicsSharedLib), Cint, (helics_endpoint,), endpoint)
end

function helicsEndpointGetMessage(endpoint)
    ccall((:helicsEndpointGetMessage, libhelicsSharedLib), helics_message, (helics_endpoint,), endpoint)
end

function helicsEndpointGetMessageObject(endpoint)
    ccall((:helicsEndpointGetMessageObject, libhelicsSharedLib), helics_message_object, (helics_endpoint,), endpoint)
end

function helicsFederateGetMessage(fed)
    ccall((:helicsFederateGetMessage, libhelicsSharedLib), helics_message, (helics_federate,), fed)
end

function helicsFederateGetMessageObject(fed)
    ccall((:helicsFederateGetMessageObject, libhelicsSharedLib), helics_message_object, (helics_federate,), fed)
end

function helicsFederateCreateMessageObject(fed, err)
    ccall((:helicsFederateCreateMessageObject, libhelicsSharedLib), helics_message_object, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateClearMessages(fed)
    ccall((:helicsFederateClearMessages, libhelicsSharedLib), Cvoid, (helics_federate,), fed)
end

function helicsEndpointClearMessages(endpoint)
    ccall((:helicsEndpointClearMessages, libhelicsSharedLib), Cvoid, (helics_endpoint,), endpoint)
end

function helicsEndpointGetType(endpoint)
    ccall((:helicsEndpointGetType, libhelicsSharedLib), Cstring, (helics_endpoint,), endpoint)
end

function helicsEndpointGetName(endpoint)
    ccall((:helicsEndpointGetName, libhelicsSharedLib), Cstring, (helics_endpoint,), endpoint)
end

function helicsFederateGetEndpointCount(fed)
    ccall((:helicsFederateGetEndpointCount, libhelicsSharedLib), Cint, (helics_federate,), fed)
end

function helicsEndpointGetInfo(_end)
    ccall((:helicsEndpointGetInfo, libhelicsSharedLib), Cstring, (helics_endpoint,), _end)
end

function helicsEndpointSetInfo(_end, info, err)
    ccall((:helicsEndpointSetInfo, libhelicsSharedLib), Cvoid, (helics_endpoint, Cstring, Ptr{helics_error}), _end, info, err)
end

function helicsEndpointSetOption(_end, option, value, err)
    ccall((:helicsEndpointSetOption, libhelicsSharedLib), Cvoid, (helics_endpoint, Cint, helics_bool, Ptr{helics_error}), _end, option, value, err)
end

function helicsEndpointGetOption(_end, option)
    ccall((:helicsEndpointGetOption, libhelicsSharedLib), helics_bool, (helics_endpoint, Cint), _end, option)
end

function helicsMessageGetSource(message)
    ccall((:helicsMessageGetSource, libhelicsSharedLib), Cstring, (helics_message_object,), message)
end

function helicsMessageGetDestination(message)
    ccall((:helicsMessageGetDestination, libhelicsSharedLib), Cstring, (helics_message_object,), message)
end

function helicsMessageGetOriginalSource(message)
    ccall((:helicsMessageGetOriginalSource, libhelicsSharedLib), Cstring, (helics_message_object,), message)
end

function helicsMessageGetOriginalDestination(message)
    ccall((:helicsMessageGetOriginalDestination, libhelicsSharedLib), Cstring, (helics_message_object,), message)
end

function helicsMessageGetTime(message)
    ccall((:helicsMessageGetTime, libhelicsSharedLib), helics_time, (helics_message_object,), message)
end

function helicsMessageGetString(message)
    ccall((:helicsMessageGetString, libhelicsSharedLib), Cstring, (helics_message_object,), message)
end

function helicsMessageGetMessageID(message)
    ccall((:helicsMessageGetMessageID, libhelicsSharedLib), Cint, (helics_message_object,), message)
end

function helicsMessageCheckFlag(message, flag)
    ccall((:helicsMessageCheckFlag, libhelicsSharedLib), helics_bool, (helics_message_object, Cint), message, flag)
end

function helicsMessageGetRawDataSize(message)
    ccall((:helicsMessageGetRawDataSize, libhelicsSharedLib), Cint, (helics_message_object,), message)
end

function helicsMessageGetRawData(message, data, maxMessagelen, actualSize, err)
    ccall((:helicsMessageGetRawData, libhelicsSharedLib), Cvoid, (helics_message_object, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{helics_error}), message, data, maxMessagelen, actualSize, err)
end

function helicsMessageGetRawDataPointer(message)
    ccall((:helicsMessageGetRawDataPointer, libhelicsSharedLib), Ptr{Cvoid}, (helics_message_object,), message)
end

function helicsMessageIsValid(message)
    ccall((:helicsMessageIsValid, libhelicsSharedLib), helics_bool, (helics_message_object,), message)
end

function helicsMessageSetSource(message, src, err)
    ccall((:helicsMessageSetSource, libhelicsSharedLib), Cvoid, (helics_message_object, Cstring, Ptr{helics_error}), message, src, err)
end

function helicsMessageSetDestination(message, dest, err)
    ccall((:helicsMessageSetDestination, libhelicsSharedLib), Cvoid, (helics_message_object, Cstring, Ptr{helics_error}), message, dest, err)
end

function helicsMessageSetOriginalSource(message, src, err)
    ccall((:helicsMessageSetOriginalSource, libhelicsSharedLib), Cvoid, (helics_message_object, Cstring, Ptr{helics_error}), message, src, err)
end

function helicsMessageSetOriginalDestination(message, dest, err)
    ccall((:helicsMessageSetOriginalDestination, libhelicsSharedLib), Cvoid, (helics_message_object, Cstring, Ptr{helics_error}), message, dest, err)
end

function helicsMessageSetTime(message, time, err)
    ccall((:helicsMessageSetTime, libhelicsSharedLib), Cvoid, (helics_message_object, helics_time, Ptr{helics_error}), message, time, err)
end

function helicsMessageResize(message, newSize, err)
    ccall((:helicsMessageResize, libhelicsSharedLib), Cvoid, (helics_message_object, Cint, Ptr{helics_error}), message, newSize, err)
end

function helicsMessageReserve(message, reserveSize, err)
    ccall((:helicsMessageReserve, libhelicsSharedLib), Cvoid, (helics_message_object, Cint, Ptr{helics_error}), message, reserveSize, err)
end

function helicsMessageSetMessageID(message, messageID, err)
    ccall((:helicsMessageSetMessageID, libhelicsSharedLib), Cvoid, (helics_message_object, Int32, Ptr{helics_error}), message, messageID, err)
end

function helicsMessageClearFlags(message)
    ccall((:helicsMessageClearFlags, libhelicsSharedLib), Cvoid, (helics_message_object,), message)
end

function helicsMessageSetFlagOption(message, flag, flagValue, err)
    ccall((:helicsMessageSetFlagOption, libhelicsSharedLib), Cvoid, (helics_message_object, Cint, helics_bool, Ptr{helics_error}), message, flag, flagValue, err)
end

function helicsMessageSetString(message, str, err)
    ccall((:helicsMessageSetString, libhelicsSharedLib), Cvoid, (helics_message_object, Cstring, Ptr{helics_error}), message, str, err)
end

function helicsMessageSetData(message, data, inputDataLength, err)
    ccall((:helicsMessageSetData, libhelicsSharedLib), Cvoid, (helics_message_object, Ptr{Cvoid}, Cint, Ptr{helics_error}), message, data, inputDataLength, err)
end

function helicsMessageAppendData(message, data, inputDataLength, err)
    ccall((:helicsMessageAppendData, libhelicsSharedLib), Cvoid, (helics_message_object, Ptr{Cvoid}, Cint, Ptr{helics_error}), message, data, inputDataLength, err)
end
# Julia wrapper for header: MessageFilters.h
# Automatically generated using Clang.jl


function helicsFederateRegisterFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterFilter, libhelicsSharedLib), helics_filter, (helics_federate, helics_filter_type, Cstring, Ptr{helics_error}), fed, type, name, err)
end

function helicsFederateRegisterGlobalFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterGlobalFilter, libhelicsSharedLib), helics_filter, (helics_federate, helics_filter_type, Cstring, Ptr{helics_error}), fed, type, name, err)
end

function helicsFederateRegisterCloningFilter(fed, deliveryEndpoint, err)
    ccall((:helicsFederateRegisterCloningFilter, libhelicsSharedLib), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, deliveryEndpoint, err)
end

function helicsFederateRegisterGlobalCloningFilter(fed, deliveryEndpoint, err)
    ccall((:helicsFederateRegisterGlobalCloningFilter, libhelicsSharedLib), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, deliveryEndpoint, err)
end

function helicsCoreRegisterFilter(core, type, name, err)
    ccall((:helicsCoreRegisterFilter, libhelicsSharedLib), helics_filter, (helics_core, helics_filter_type, Cstring, Ptr{helics_error}), core, type, name, err)
end

function helicsCoreRegisterCloningFilter(core, deliveryEndpoint, err)
    ccall((:helicsCoreRegisterCloningFilter, libhelicsSharedLib), helics_filter, (helics_core, Cstring, Ptr{helics_error}), core, deliveryEndpoint, err)
end

function helicsFederateGetFilterCount(fed)
    ccall((:helicsFederateGetFilterCount, libhelicsSharedLib), Cint, (helics_federate,), fed)
end

function helicsFederateGetFilter(fed, name, err)
    ccall((:helicsFederateGetFilter, libhelicsSharedLib), helics_filter, (helics_federate, Cstring, Ptr{helics_error}), fed, name, err)
end

function helicsFederateGetFilterByIndex(fed, index, err)
    ccall((:helicsFederateGetFilterByIndex, libhelicsSharedLib), helics_filter, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFilterGetName(filt)
    ccall((:helicsFilterGetName, libhelicsSharedLib), Cstring, (helics_filter,), filt)
end

function helicsFilterSet(filt, prop, val, err)
    ccall((:helicsFilterSet, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Cdouble, Ptr{helics_error}), filt, prop, val, err)
end

function helicsFilterSetString(filt, prop, val, err)
    ccall((:helicsFilterSetString, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Cstring, Ptr{helics_error}), filt, prop, val, err)
end

function helicsFilterAddDestinationTarget(filt, dest, err)
    ccall((:helicsFilterAddDestinationTarget, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, dest, err)
end

function helicsFilterAddSourceTarget(filt, source, err)
    ccall((:helicsFilterAddSourceTarget, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, source, err)
end

function helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterAddDeliveryEndpoint, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, deliveryEndpoint, err)
end

function helicsFilterRemoveTarget(filt, target, err)
    ccall((:helicsFilterRemoveTarget, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, target, err)
end

function helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterRemoveDeliveryEndpoint, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, deliveryEndpoint, err)
end

function helicsFilterGetInfo(filt)
    ccall((:helicsFilterGetInfo, libhelicsSharedLib), Cstring, (helics_filter,), filt)
end

function helicsFilterSetInfo(filt, info, err)
    ccall((:helicsFilterSetInfo, libhelicsSharedLib), Cvoid, (helics_filter, Cstring, Ptr{helics_error}), filt, info, err)
end

function helicsFilterSetOption(filt, option, value, err)
    ccall((:helicsFilterSetOption, libhelicsSharedLib), Cvoid, (helics_filter, Cint, helics_bool, Ptr{helics_error}), filt, option, value, err)
end

function helicsFilterGetOption(filt, option)
    ccall((:helicsFilterGetOption, libhelicsSharedLib), helics_bool, (helics_filter, Cint), filt, option)
end
# Julia wrapper for header: ValueFederate.h
# Automatically generated using Clang.jl


function helicsFederateRegisterSubscription(fed, key, units, err)
    ccall((:helicsFederateRegisterSubscription, libhelicsSharedLib), helics_input, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, key, units, err)
end

function helicsFederateRegisterPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterPublication, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypePublication, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalPublication, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypePublication, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterInput, libhelicsSharedLib), helics_input, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypeInput, libhelicsSharedLib), helics_input, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalInput, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, helics_data_type, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypeInput, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, Cstring, Cstring, Ptr{helics_error}), fed, key, type, units, err)
end

function helicsFederateGetPublication(fed, key, err)
    ccall((:helicsFederateGetPublication, libhelicsSharedLib), helics_publication, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsFederateGetPublicationByIndex(fed, index, err)
    ccall((:helicsFederateGetPublicationByIndex, libhelicsSharedLib), helics_publication, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFederateGetInput(fed, key, err)
    ccall((:helicsFederateGetInput, libhelicsSharedLib), helics_input, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsFederateGetInputByIndex(fed, index, err)
    ccall((:helicsFederateGetInputByIndex, libhelicsSharedLib), helics_input, (helics_federate, Cint, Ptr{helics_error}), fed, index, err)
end

function helicsFederateGetSubscription(fed, key, err)
    ccall((:helicsFederateGetSubscription, libhelicsSharedLib), helics_input, (helics_federate, Cstring, Ptr{helics_error}), fed, key, err)
end

function helicsFederateClearUpdates(fed)
    ccall((:helicsFederateClearUpdates, libhelicsSharedLib), Cvoid, (helics_federate,), fed)
end

function helicsFederateRegisterFromPublicationJSON(fed, json, err)
    ccall((:helicsFederateRegisterFromPublicationJSON, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, json, err)
end

function helicsFederatePublishJSON(fed, json, err)
    ccall((:helicsFederatePublishJSON, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, json, err)
end

function helicsPublicationPublishRaw(pub, data, inputDataLength, err)
    ccall((:helicsPublicationPublishRaw, libhelicsSharedLib), Cvoid, (helics_publication, Ptr{Cvoid}, Cint, Ptr{helics_error}), pub, data, inputDataLength, err)
end

function helicsPublicationPublishString(pub, str, err)
    ccall((:helicsPublicationPublishString, libhelicsSharedLib), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, str, err)
end

function helicsPublicationPublishInteger(pub, val, err)
    ccall((:helicsPublicationPublishInteger, libhelicsSharedLib), Cvoid, (helics_publication, Int64, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishBoolean(pub, val, err)
    ccall((:helicsPublicationPublishBoolean, libhelicsSharedLib), Cvoid, (helics_publication, helics_bool, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishDouble(pub, val, err)
    ccall((:helicsPublicationPublishDouble, libhelicsSharedLib), Cvoid, (helics_publication, Cdouble, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishTime(pub, val, err)
    ccall((:helicsPublicationPublishTime, libhelicsSharedLib), Cvoid, (helics_publication, helics_time, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishChar(pub, val, err)
    ccall((:helicsPublicationPublishChar, libhelicsSharedLib), Cvoid, (helics_publication, UInt8, Ptr{helics_error}), pub, val, err)
end

function helicsPublicationPublishComplex(pub, real, imag, err)
    ccall((:helicsPublicationPublishComplex, libhelicsSharedLib), Cvoid, (helics_publication, Cdouble, Cdouble, Ptr{helics_error}), pub, real, imag, err)
end

function helicsPublicationPublishVector(pub, vectorInput, vectorLength, err)
    ccall((:helicsPublicationPublishVector, libhelicsSharedLib), Cvoid, (helics_publication, Ptr{Cdouble}, Cint, Ptr{helics_error}), pub, vectorInput, vectorLength, err)
end

function helicsPublicationPublishNamedPoint(pub, str, val, err)
    ccall((:helicsPublicationPublishNamedPoint, libhelicsSharedLib), Cvoid, (helics_publication, Cstring, Cdouble, Ptr{helics_error}), pub, str, val, err)
end

function helicsPublicationAddTarget(pub, target, err)
    ccall((:helicsPublicationAddTarget, libhelicsSharedLib), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, target, err)
end

function helicsInputAddTarget(ipt, target, err)
    ccall((:helicsInputAddTarget, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Ptr{helics_error}), ipt, target, err)
end

function helicsInputGetRawValueSize(ipt)
    ccall((:helicsInputGetRawValueSize, libhelicsSharedLib), Cint, (helics_input,), ipt)
end

function helicsInputGetRawValue(ipt, data, maxDatalen, actualSize, err)
    ccall((:helicsInputGetRawValue, libhelicsSharedLib), Cvoid, (helics_input, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, data, maxDatalen, actualSize, err)
end

function helicsInputGetStringSize(ipt)
    ccall((:helicsInputGetStringSize, libhelicsSharedLib), Cint, (helics_input,), ipt)
end

function helicsInputGetString(ipt, outputString, maxStringLen, actualLength, err)
    ccall((:helicsInputGetString, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, outputString, maxStringLen, actualLength, err)
end

function helicsInputGetInteger(ipt, err)
    ccall((:helicsInputGetInteger, libhelicsSharedLib), Int64, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetBoolean(ipt, err)
    ccall((:helicsInputGetBoolean, libhelicsSharedLib), helics_bool, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetDouble(ipt, err)
    ccall((:helicsInputGetDouble, libhelicsSharedLib), Cdouble, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetTime(ipt, err)
    ccall((:helicsInputGetTime, libhelicsSharedLib), helics_time, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetChar(ipt, err)
    ccall((:helicsInputGetChar, libhelicsSharedLib), UInt8, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetComplexObject(ipt, err)
    ccall((:helicsInputGetComplexObject, libhelicsSharedLib), helics_complex, (helics_input, Ptr{helics_error}), ipt, err)
end

function helicsInputGetComplex(ipt, real, imag, err)
    ccall((:helicsInputGetComplex, libhelicsSharedLib), Cvoid, (helics_input, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{helics_error}), ipt, real, imag, err)
end

function helicsInputGetVectorSize(ipt)
    ccall((:helicsInputGetVectorSize, libhelicsSharedLib), Cint, (helics_input,), ipt)
end

function helicsInputGetVector(ipt, data, maxlen, actualSize, err)
    ccall((:helicsInputGetVector, libhelicsSharedLib), Cvoid, (helics_input, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{helics_error}), ipt, data, maxlen, actualSize, err)
end

function helicsInputGetNamedPoint(ipt, outputString, maxStringLen, actualLength, val, err)
    ccall((:helicsInputGetNamedPoint, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{helics_error}), ipt, outputString, maxStringLen, actualLength, val, err)
end

function helicsInputSetDefaultRaw(ipt, data, inputDataLength, err)
    ccall((:helicsInputSetDefaultRaw, libhelicsSharedLib), Cvoid, (helics_input, Ptr{Cvoid}, Cint, Ptr{helics_error}), ipt, data, inputDataLength, err)
end

function helicsInputSetDefaultString(ipt, str, err)
    ccall((:helicsInputSetDefaultString, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Ptr{helics_error}), ipt, str, err)
end

function helicsInputSetDefaultInteger(ipt, val, err)
    ccall((:helicsInputSetDefaultInteger, libhelicsSharedLib), Cvoid, (helics_input, Int64, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultBoolean(ipt, val, err)
    ccall((:helicsInputSetDefaultBoolean, libhelicsSharedLib), Cvoid, (helics_input, helics_bool, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultTime(ipt, val, err)
    ccall((:helicsInputSetDefaultTime, libhelicsSharedLib), Cvoid, (helics_input, helics_time, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultChar(ipt, val, err)
    ccall((:helicsInputSetDefaultChar, libhelicsSharedLib), Cvoid, (helics_input, UInt8, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultDouble(ipt, val, err)
    ccall((:helicsInputSetDefaultDouble, libhelicsSharedLib), Cvoid, (helics_input, Cdouble, Ptr{helics_error}), ipt, val, err)
end

function helicsInputSetDefaultComplex(ipt, real, imag, err)
    ccall((:helicsInputSetDefaultComplex, libhelicsSharedLib), Cvoid, (helics_input, Cdouble, Cdouble, Ptr{helics_error}), ipt, real, imag, err)
end

function helicsInputSetDefaultVector(ipt, vectorInput, vectorLength, err)
    ccall((:helicsInputSetDefaultVector, libhelicsSharedLib), Cvoid, (helics_input, Ptr{Cdouble}, Cint, Ptr{helics_error}), ipt, vectorInput, vectorLength, err)
end

function helicsInputSetDefaultNamedPoint(ipt, str, val, err)
    ccall((:helicsInputSetDefaultNamedPoint, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Cdouble, Ptr{helics_error}), ipt, str, val, err)
end

function helicsInputGetType(ipt)
    ccall((:helicsInputGetType, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsInputGetPublicationType(ipt)
    ccall((:helicsInputGetPublicationType, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetType(pub)
    ccall((:helicsPublicationGetType, libhelicsSharedLib), Cstring, (helics_publication,), pub)
end

function helicsInputGetKey(ipt)
    ccall((:helicsInputGetKey, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsSubscriptionGetKey(ipt)
    ccall((:helicsSubscriptionGetKey, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetKey(pub)
    ccall((:helicsPublicationGetKey, libhelicsSharedLib), Cstring, (helics_publication,), pub)
end

function helicsInputGetUnits(ipt)
    ccall((:helicsInputGetUnits, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsInputGetInjectionUnits(ipt)
    ccall((:helicsInputGetInjectionUnits, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsInputGetExtractionUnits(ipt)
    ccall((:helicsInputGetExtractionUnits, libhelicsSharedLib), Cstring, (helics_input,), ipt)
end

function helicsPublicationGetUnits(pub)
    ccall((:helicsPublicationGetUnits, libhelicsSharedLib), Cstring, (helics_publication,), pub)
end

function helicsInputGetInfo(inp)
    ccall((:helicsInputGetInfo, libhelicsSharedLib), Cstring, (helics_input,), inp)
end

function helicsInputSetInfo(inp, info, err)
    ccall((:helicsInputSetInfo, libhelicsSharedLib), Cvoid, (helics_input, Cstring, Ptr{helics_error}), inp, info, err)
end

function helicsPublicationGetInfo(pub)
    ccall((:helicsPublicationGetInfo, libhelicsSharedLib), Cstring, (helics_publication,), pub)
end

function helicsPublicationSetInfo(pub, info, err)
    ccall((:helicsPublicationSetInfo, libhelicsSharedLib), Cvoid, (helics_publication, Cstring, Ptr{helics_error}), pub, info, err)
end

function helicsInputGetOption(inp, option)
    ccall((:helicsInputGetOption, libhelicsSharedLib), helics_bool, (helics_input, Cint), inp, option)
end

function helicsInputSetOption(inp, option, value, err)
    ccall((:helicsInputSetOption, libhelicsSharedLib), Cvoid, (helics_input, Cint, helics_bool, Ptr{helics_error}), inp, option, value, err)
end

function helicsPublicationGetOption(pub, option)
    ccall((:helicsPublicationGetOption, libhelicsSharedLib), helics_bool, (helics_publication, Cint), pub, option)
end

function helicsPublicationSetOption(pub, option, val, err)
    ccall((:helicsPublicationSetOption, libhelicsSharedLib), Cvoid, (helics_publication, Cint, helics_bool, Ptr{helics_error}), pub, option, val, err)
end

function helicsInputIsUpdated(ipt)
    ccall((:helicsInputIsUpdated, libhelicsSharedLib), helics_bool, (helics_input,), ipt)
end

function helicsInputLastUpdateTime(ipt)
    ccall((:helicsInputLastUpdateTime, libhelicsSharedLib), helics_time, (helics_input,), ipt)
end

function helicsInputClearUpdate(ipt)
    ccall((:helicsInputClearUpdate, libhelicsSharedLib), Cvoid, (helics_input,), ipt)
end

function helicsFederateGetPublicationCount(fed)
    ccall((:helicsFederateGetPublicationCount, libhelicsSharedLib), Cint, (helics_federate,), fed)
end

function helicsFederateGetInputCount(fed)
    ccall((:helicsFederateGetInputCount, libhelicsSharedLib), Cint, (helics_federate,), fed)
end
# Julia wrapper for header: api-data.h
# Automatically generated using Clang.jl

# Julia wrapper for header: helics.h
# Automatically generated using Clang.jl


function helicsGetVersion()
    ccall((:helicsGetVersion, libhelicsSharedLib), Cstring, ())
end

function helicsErrorInitialize()
    ccall((:helicsErrorInitialize, libhelicsSharedLib), helics_error, ())
end

function helicsErrorClear(err)
    ccall((:helicsErrorClear, libhelicsSharedLib), Cvoid, (Ptr{helics_error},), err)
end

function helicsIsCoreTypeAvailable(type)
    ccall((:helicsIsCoreTypeAvailable, libhelicsSharedLib), helics_bool, (Cstring,), type)
end

function helicsCreateCore(type, name, initString, err)
    ccall((:helicsCreateCore, libhelicsSharedLib), helics_core, (Cstring, Cstring, Cstring, Ptr{helics_error}), type, name, initString, err)
end

function helicsCreateCoreFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateCoreFromArgs, libhelicsSharedLib), helics_core, (Cstring, Cstring, Cint, Ptr{Cstring}, Ptr{helics_error}), type, name, argc, argv, err)
end

function helicsCoreClone(core, err)
    ccall((:helicsCoreClone, libhelicsSharedLib), helics_core, (helics_core, Ptr{helics_error}), core, err)
end

function helicsCoreIsValid(core)
    ccall((:helicsCoreIsValid, libhelicsSharedLib), helics_bool, (helics_core,), core)
end

function helicsCreateBroker(type, name, initString, err)
    ccall((:helicsCreateBroker, libhelicsSharedLib), helics_broker, (Cstring, Cstring, Cstring, Ptr{helics_error}), type, name, initString, err)
end

function helicsCreateBrokerFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateBrokerFromArgs, libhelicsSharedLib), helics_broker, (Cstring, Cstring, Cint, Ptr{Cstring}, Ptr{helics_error}), type, name, argc, argv, err)
end

function helicsBrokerClone(broker, err)
    ccall((:helicsBrokerClone, libhelicsSharedLib), helics_broker, (helics_broker, Ptr{helics_error}), broker, err)
end

function helicsBrokerIsValid(broker)
    ccall((:helicsBrokerIsValid, libhelicsSharedLib), helics_bool, (helics_broker,), broker)
end

function helicsBrokerIsConnected(broker)
    ccall((:helicsBrokerIsConnected, libhelicsSharedLib), helics_bool, (helics_broker,), broker)
end

function helicsBrokerDataLink(broker, source, target, err)
    ccall((:helicsBrokerDataLink, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, source, target, err)
end

function helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddSourceFilterToEndpoint, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, filter, endpoint, err)
end

function helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddDestinationFilterToEndpoint, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, filter, endpoint, err)
end

function helicsBrokerMakeConnections(broker, file, err)
    ccall((:helicsBrokerMakeConnections, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Ptr{helics_error}), broker, file, err)
end

function helicsCoreWaitForDisconnect(core, msToWait, err)
    ccall((:helicsCoreWaitForDisconnect, libhelicsSharedLib), helics_bool, (helics_core, Cint, Ptr{helics_error}), core, msToWait, err)
end

function helicsBrokerWaitForDisconnect(broker, msToWait, err)
    ccall((:helicsBrokerWaitForDisconnect, libhelicsSharedLib), helics_bool, (helics_broker, Cint, Ptr{helics_error}), broker, msToWait, err)
end

function helicsCoreIsConnected(core)
    ccall((:helicsCoreIsConnected, libhelicsSharedLib), helics_bool, (helics_core,), core)
end

function helicsCoreDataLink(core, source, target, err)
    ccall((:helicsCoreDataLink, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, source, target, err)
end

function helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddSourceFilterToEndpoint, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, filter, endpoint, err)
end

function helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddDestinationFilterToEndpoint, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, filter, endpoint, err)
end

function helicsCoreMakeConnections(core, file, err)
    ccall((:helicsCoreMakeConnections, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Ptr{helics_error}), core, file, err)
end

function helicsBrokerGetIdentifier(broker)
    ccall((:helicsBrokerGetIdentifier, libhelicsSharedLib), Cstring, (helics_broker,), broker)
end

function helicsCoreGetIdentifier(core)
    ccall((:helicsCoreGetIdentifier, libhelicsSharedLib), Cstring, (helics_core,), core)
end

function helicsBrokerGetAddress(broker)
    ccall((:helicsBrokerGetAddress, libhelicsSharedLib), Cstring, (helics_broker,), broker)
end

function helicsCoreGetAddress(core)
    ccall((:helicsCoreGetAddress, libhelicsSharedLib), Cstring, (helics_core,), core)
end

function helicsCoreSetReadyToInit(core, err)
    ccall((:helicsCoreSetReadyToInit, libhelicsSharedLib), Cvoid, (helics_core, Ptr{helics_error}), core, err)
end

function helicsCoreDisconnect(core, err)
    ccall((:helicsCoreDisconnect, libhelicsSharedLib), Cvoid, (helics_core, Ptr{helics_error}), core, err)
end

function helicsGetFederateByName(fedName, err)
    ccall((:helicsGetFederateByName, libhelicsSharedLib), helics_federate, (Cstring, Ptr{helics_error}), fedName, err)
end

function helicsBrokerDisconnect(broker, err)
    ccall((:helicsBrokerDisconnect, libhelicsSharedLib), Cvoid, (helics_broker, Ptr{helics_error}), broker, err)
end

function helicsFederateDestroy(fed)
    ccall((:helicsFederateDestroy, libhelicsSharedLib), Cvoid, (helics_federate,), fed)
end

function helicsBrokerDestroy(broker)
    ccall((:helicsBrokerDestroy, libhelicsSharedLib), Cvoid, (helics_broker,), broker)
end

function helicsCoreDestroy(core)
    ccall((:helicsCoreDestroy, libhelicsSharedLib), Cvoid, (helics_core,), core)
end

function helicsCoreFree(core)
    ccall((:helicsCoreFree, libhelicsSharedLib), Cvoid, (helics_core,), core)
end

function helicsBrokerFree(broker)
    ccall((:helicsBrokerFree, libhelicsSharedLib), Cvoid, (helics_broker,), broker)
end

function helicsCreateValueFederate(fedName, fi, err)
    ccall((:helicsCreateValueFederate, libhelicsSharedLib), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateValueFederateFromConfig(configFile, err)
    ccall((:helicsCreateValueFederateFromConfig, libhelicsSharedLib), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsCreateMessageFederate(fedName, fi, err)
    ccall((:helicsCreateMessageFederate, libhelicsSharedLib), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateMessageFederateFromConfig(configFile, err)
    ccall((:helicsCreateMessageFederateFromConfig, libhelicsSharedLib), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsCreateCombinationFederate(fedName, fi, err)
    ccall((:helicsCreateCombinationFederate, libhelicsSharedLib), helics_federate, (Cstring, helics_federate_info, Ptr{helics_error}), fedName, fi, err)
end

function helicsCreateCombinationFederateFromConfig(configFile, err)
    ccall((:helicsCreateCombinationFederateFromConfig, libhelicsSharedLib), helics_federate, (Cstring, Ptr{helics_error}), configFile, err)
end

function helicsFederateClone(fed, err)
    ccall((:helicsFederateClone, libhelicsSharedLib), helics_federate, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsCreateFederateInfo()
    ccall((:helicsCreateFederateInfo, libhelicsSharedLib), helics_federate_info, ())
end

function helicsFederateInfoClone(fi, err)
    ccall((:helicsFederateInfoClone, libhelicsSharedLib), helics_federate_info, (helics_federate_info, Ptr{helics_error}), fi, err)
end

function helicsFederateInfoLoadFromArgs(fi, argc, argv, err)
    ccall((:helicsFederateInfoLoadFromArgs, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, Ptr{Cstring}, Ptr{helics_error}), fi, argc, argv, err)
end

function helicsFederateInfoFree(fi)
    ccall((:helicsFederateInfoFree, libhelicsSharedLib), Cvoid, (helics_federate_info,), fi)
end

function helicsFederateIsValid(fed)
    ccall((:helicsFederateIsValid, libhelicsSharedLib), helics_bool, (helics_federate,), fed)
end

function helicsFederateInfoSetCoreName(fi, corename, err)
    ccall((:helicsFederateInfoSetCoreName, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, corename, err)
end

function helicsFederateInfoSetCoreInitString(fi, coreInit, err)
    ccall((:helicsFederateInfoSetCoreInitString, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, coreInit, err)
end

function helicsFederateInfoSetBrokerInitString(fi, brokerInit, err)
    ccall((:helicsFederateInfoSetBrokerInitString, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, brokerInit, err)
end

function helicsFederateInfoSetCoreType(fi, coretype, err)
    ccall((:helicsFederateInfoSetCoreType, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, Ptr{helics_error}), fi, coretype, err)
end

function helicsFederateInfoSetCoreTypeFromString(fi, coretype, err)
    ccall((:helicsFederateInfoSetCoreTypeFromString, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, coretype, err)
end

function helicsFederateInfoSetBroker(fi, broker, err)
    ccall((:helicsFederateInfoSetBroker, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, broker, err)
end

function helicsFederateInfoSetBrokerKey(fi, brokerkey, err)
    ccall((:helicsFederateInfoSetBrokerKey, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, brokerkey, err)
end

function helicsFederateInfoSetBrokerPort(fi, brokerPort, err)
    ccall((:helicsFederateInfoSetBrokerPort, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, Ptr{helics_error}), fi, brokerPort, err)
end

function helicsFederateInfoSetLocalPort(fi, localPort, err)
    ccall((:helicsFederateInfoSetLocalPort, libhelicsSharedLib), Cvoid, (helics_federate_info, Cstring, Ptr{helics_error}), fi, localPort, err)
end

function helicsGetPropertyIndex(val)
    ccall((:helicsGetPropertyIndex, libhelicsSharedLib), Cint, (Cstring,), val)
end

function helicsGetOptionIndex(val)
    ccall((:helicsGetOptionIndex, libhelicsSharedLib), Cint, (Cstring,), val)
end

function helicsFederateInfoSetFlagOption(fi, flag, value, err)
    ccall((:helicsFederateInfoSetFlagOption, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, helics_bool, Ptr{helics_error}), fi, flag, value, err)
end

function helicsFederateInfoSetSeparator(fi, separator, err)
    ccall((:helicsFederateInfoSetSeparator, libhelicsSharedLib), Cvoid, (helics_federate_info, UInt8, Ptr{helics_error}), fi, separator, err)
end

function helicsFederateInfoSetTimeProperty(fi, timeProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetTimeProperty, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, helics_time, Ptr{helics_error}), fi, timeProperty, propertyValue, err)
end

function helicsFederateInfoSetIntegerProperty(fi, intProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetIntegerProperty, libhelicsSharedLib), Cvoid, (helics_federate_info, Cint, Cint, Ptr{helics_error}), fi, intProperty, propertyValue, err)
end

function helicsFederateRegisterInterfaces(fed, file, err)
    ccall((:helicsFederateRegisterInterfaces, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, file, err)
end

function helicsFederateFinalize(fed, err)
    ccall((:helicsFederateFinalize, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFinalizeAsync(fed, err)
    ccall((:helicsFederateFinalizeAsync, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFinalizeComplete(fed, err)
    ccall((:helicsFederateFinalizeComplete, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateFree(fed)
    ccall((:helicsFederateFree, libhelicsSharedLib), Cvoid, (helics_federate,), fed)
end

function helicsCloseLibrary()
    ccall((:helicsCloseLibrary, libhelicsSharedLib), Cvoid, ())
end

function helicsFederateEnterInitializingMode(fed, err)
    ccall((:helicsFederateEnterInitializingMode, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterInitializingModeAsync(fed, err)
    ccall((:helicsFederateEnterInitializingModeAsync, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateIsAsyncOperationCompleted(fed, err)
    ccall((:helicsFederateIsAsyncOperationCompleted, libhelicsSharedLib), helics_bool, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterInitializingModeComplete(fed, err)
    ccall((:helicsFederateEnterInitializingModeComplete, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingMode(fed, err)
    ccall((:helicsFederateEnterExecutingMode, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeAsync(fed, err)
    ccall((:helicsFederateEnterExecutingModeAsync, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeComplete, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateEnterExecutingModeIterative(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterative, libhelicsSharedLib), helics_iteration_result, (helics_federate, helics_iteration_request, Ptr{helics_error}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeAsync(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterativeAsync, libhelicsSharedLib), Cvoid, (helics_federate, helics_iteration_request, Ptr{helics_error}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeIterativeComplete, libhelicsSharedLib), helics_iteration_result, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateGetState(fed, err)
    ccall((:helicsFederateGetState, libhelicsSharedLib), helics_federate_state, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateGetCoreObject(fed, err)
    ccall((:helicsFederateGetCoreObject, libhelicsSharedLib), helics_core, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTime(fed, requestTime, err)
    ccall((:helicsFederateRequestTime, libhelicsSharedLib), helics_time, (helics_federate, helics_time, Ptr{helics_error}), fed, requestTime, err)
end

function helicsFederateRequestTimeAdvance(fed, timeDelta, err)
    ccall((:helicsFederateRequestTimeAdvance, libhelicsSharedLib), helics_time, (helics_federate, helics_time, Ptr{helics_error}), fed, timeDelta, err)
end

function helicsFederateRequestNextStep(fed, err)
    ccall((:helicsFederateRequestNextStep, libhelicsSharedLib), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIterate, err)
    ccall((:helicsFederateRequestTimeIterative, libhelicsSharedLib), helics_time, (helics_federate, helics_time, helics_iteration_request, Ptr{helics_iteration_result}, Ptr{helics_error}), fed, requestTime, iterate, outIterate, err)
end

function helicsFederateRequestTimeAsync(fed, requestTime, err)
    ccall((:helicsFederateRequestTimeAsync, libhelicsSharedLib), Cvoid, (helics_federate, helics_time, Ptr{helics_error}), fed, requestTime, err)
end

function helicsFederateRequestTimeComplete(fed, err)
    ccall((:helicsFederateRequestTimeComplete, libhelicsSharedLib), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate, err)
    ccall((:helicsFederateRequestTimeIterativeAsync, libhelicsSharedLib), Cvoid, (helics_federate, helics_time, helics_iteration_request, Ptr{helics_error}), fed, requestTime, iterate, err)
end

function helicsFederateRequestTimeIterativeComplete(fed, outIterate, err)
    ccall((:helicsFederateRequestTimeIterativeComplete, libhelicsSharedLib), helics_time, (helics_federate, Ptr{helics_iteration_result}, Ptr{helics_error}), fed, outIterate, err)
end

function helicsFederateGetName(fed)
    ccall((:helicsFederateGetName, libhelicsSharedLib), Cstring, (helics_federate,), fed)
end

function helicsFederateSetTimeProperty(fed, timeProperty, time, err)
    ccall((:helicsFederateSetTimeProperty, libhelicsSharedLib), Cvoid, (helics_federate, Cint, helics_time, Ptr{helics_error}), fed, timeProperty, time, err)
end

function helicsFederateSetFlagOption(fed, flag, flagValue, err)
    ccall((:helicsFederateSetFlagOption, libhelicsSharedLib), Cvoid, (helics_federate, Cint, helics_bool, Ptr{helics_error}), fed, flag, flagValue, err)
end

function helicsFederateSetSeparator(fed, separator, err)
    ccall((:helicsFederateSetSeparator, libhelicsSharedLib), Cvoid, (helics_federate, UInt8, Ptr{helics_error}), fed, separator, err)
end

function helicsFederateSetIntegerProperty(fed, intProperty, propertyVal, err)
    ccall((:helicsFederateSetIntegerProperty, libhelicsSharedLib), Cvoid, (helics_federate, Cint, Cint, Ptr{helics_error}), fed, intProperty, propertyVal, err)
end

function helicsFederateGetTimeProperty(fed, timeProperty, err)
    ccall((:helicsFederateGetTimeProperty, libhelicsSharedLib), helics_time, (helics_federate, Cint, Ptr{helics_error}), fed, timeProperty, err)
end

function helicsFederateGetFlagOption(fed, flag, err)
    ccall((:helicsFederateGetFlagOption, libhelicsSharedLib), helics_bool, (helics_federate, Cint, Ptr{helics_error}), fed, flag, err)
end

function helicsFederateGetIntegerProperty(fed, intProperty, err)
    ccall((:helicsFederateGetIntegerProperty, libhelicsSharedLib), Cint, (helics_federate, Cint, Ptr{helics_error}), fed, intProperty, err)
end

function helicsFederateGetCurrentTime(fed, err)
    ccall((:helicsFederateGetCurrentTime, libhelicsSharedLib), helics_time, (helics_federate, Ptr{helics_error}), fed, err)
end

function helicsFederateSetGlobal(fed, valueName, value, err)
    ccall((:helicsFederateSetGlobal, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Cstring, Ptr{helics_error}), fed, valueName, value, err)
end

function helicsFederateSetLogFile(fed, logFile, err)
    ccall((:helicsFederateSetLogFile, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, logFile, err)
end

function helicsFederateLogErrorMessage(fed, logmessage, err)
    ccall((:helicsFederateLogErrorMessage, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, logmessage, err)
end

function helicsFederateLogWarningMessage(fed, logmessage, err)
    ccall((:helicsFederateLogWarningMessage, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, logmessage, err)
end

function helicsFederateLogInfoMessage(fed, logmessage, err)
    ccall((:helicsFederateLogInfoMessage, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, logmessage, err)
end

function helicsFederateLogDebugMessage(fed, logmessage, err)
    ccall((:helicsFederateLogDebugMessage, libhelicsSharedLib), Cvoid, (helics_federate, Cstring, Ptr{helics_error}), fed, logmessage, err)
end

function helicsFederateLogLevelMessage(fed, loglevel, logmessage, err)
    ccall((:helicsFederateLogLevelMessage, libhelicsSharedLib), Cvoid, (helics_federate, Cint, Cstring, Ptr{helics_error}), fed, loglevel, logmessage, err)
end

function helicsCoreSetGlobal(core, valueName, value, err)
    ccall((:helicsCoreSetGlobal, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Cstring, Ptr{helics_error}), core, valueName, value, err)
end

function helicsBrokerSetGlobal(broker, valueName, value, err)
    ccall((:helicsBrokerSetGlobal, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Cstring, Ptr{helics_error}), broker, valueName, value, err)
end

function helicsCoreSetLogFile(core, logFileName, err)
    ccall((:helicsCoreSetLogFile, libhelicsSharedLib), Cvoid, (helics_core, Cstring, Ptr{helics_error}), core, logFileName, err)
end

function helicsBrokerSetLogFile(broker, logFileName, err)
    ccall((:helicsBrokerSetLogFile, libhelicsSharedLib), Cvoid, (helics_broker, Cstring, Ptr{helics_error}), broker, logFileName, err)
end

function helicsCreateQuery(target, query)
    ccall((:helicsCreateQuery, libhelicsSharedLib), helics_query, (Cstring, Cstring), target, query)
end

function helicsQueryExecute(query, fed, err)
    ccall((:helicsQueryExecute, libhelicsSharedLib), Cstring, (helics_query, helics_federate, Ptr{helics_error}), query, fed, err)
end

function helicsQueryCoreExecute(query, core, err)
    ccall((:helicsQueryCoreExecute, libhelicsSharedLib), Cstring, (helics_query, helics_core, Ptr{helics_error}), query, core, err)
end

function helicsQueryBrokerExecute(query, broker, err)
    ccall((:helicsQueryBrokerExecute, libhelicsSharedLib), Cstring, (helics_query, helics_broker, Ptr{helics_error}), query, broker, err)
end

function helicsQueryExecuteAsync(query, fed, err)
    ccall((:helicsQueryExecuteAsync, libhelicsSharedLib), Cvoid, (helics_query, helics_federate, Ptr{helics_error}), query, fed, err)
end

function helicsQueryExecuteComplete(query, err)
    ccall((:helicsQueryExecuteComplete, libhelicsSharedLib), Cstring, (helics_query, Ptr{helics_error}), query, err)
end

function helicsQueryIsCompleted(query)
    ccall((:helicsQueryIsCompleted, libhelicsSharedLib), helics_bool, (helics_query,), query)
end

function helicsQueryFree(query)
    ccall((:helicsQueryFree, libhelicsSharedLib), Cvoid, (helics_query,), query)
end

function helicsCleanupLibrary()
    ccall((:helicsCleanupLibrary, libhelicsSharedLib), Cvoid, ())
end
# Julia wrapper for header: helicsCallbacks.h
# Automatically generated using Clang.jl


function helicsBrokerSetLoggingCallback(broker, logger, userdata, err)
    ccall((:helicsBrokerSetLoggingCallback, libhelicsSharedLib), Cvoid, (helics_broker, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{helics_error}), broker, logger, userdata, err)
end

function helicsCoreSetLoggingCallback(core, logger, userdata, err)
    ccall((:helicsCoreSetLoggingCallback, libhelicsSharedLib), Cvoid, (helics_core, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{helics_error}), core, logger, userdata, err)
end

function helicsFederateSetLoggingCallback(fed, logger, userdata, err)
    ccall((:helicsFederateSetLoggingCallback, libhelicsSharedLib), Cvoid, (helics_federate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{helics_error}), fed, logger, userdata, err)
end
# Julia wrapper for header: helics_export.h
# Automatically generated using Clang.jl

