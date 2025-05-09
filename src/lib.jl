function helicsCreateDataBuffer(initialCapacity)
    ccall((:helicsCreateDataBuffer, libhelics), HelicsDataBuffer, (Int32,), initialCapacity)
end

function helicsDataBufferIsValid(data)
    ccall((:helicsDataBufferIsValid, libhelics), HelicsBool, (HelicsDataBuffer,), data)
end

function helicsWrapDataInBuffer(data, dataSize, dataCapacity)
    ccall((:helicsWrapDataInBuffer, libhelics), HelicsDataBuffer, (Ptr{Cvoid}, Cint, Cint), data, dataSize, dataCapacity)
end

function helicsDataBufferFree(data)
    ccall((:helicsDataBufferFree, libhelics), Cvoid, (HelicsDataBuffer,), data)
end

function helicsDataBufferSize(data)
    ccall((:helicsDataBufferSize, libhelics), Int32, (HelicsDataBuffer,), data)
end

function helicsDataBufferCapacity(data)
    ccall((:helicsDataBufferCapacity, libhelics), Int32, (HelicsDataBuffer,), data)
end

function helicsDataBufferData(data)
    ccall((:helicsDataBufferData, libhelics), Ptr{Cvoid}, (HelicsDataBuffer,), data)
end

function helicsDataBufferReserve(data, newCapacity)
    ccall((:helicsDataBufferReserve, libhelics), HelicsBool, (HelicsDataBuffer, Int32), data, newCapacity)
end

function helicsDataBufferClone(data)
    ccall((:helicsDataBufferClone, libhelics), HelicsDataBuffer, (HelicsDataBuffer,), data)
end

function helicsDataBufferFillFromInteger(data, value)
    ccall((:helicsDataBufferFillFromInteger, libhelics), Int32, (HelicsDataBuffer, Int64), data, value)
end

function helicsDataBufferFillFromDouble(data, value)
    ccall((:helicsDataBufferFillFromDouble, libhelics), Int32, (HelicsDataBuffer, Cdouble), data, value)
end

function helicsDataBufferFillFromString(data, value)
    ccall((:helicsDataBufferFillFromString, libhelics), Int32, (HelicsDataBuffer, Ptr{Cchar}), data, value)
end

function helicsDataBufferFillFromRawString(data, str, stringSize)
    ccall((:helicsDataBufferFillFromRawString, libhelics), Int32, (HelicsDataBuffer, Ptr{Cchar}, Cint), data, str, stringSize)
end

function helicsDataBufferFillFromBoolean(data, value)
    ccall((:helicsDataBufferFillFromBoolean, libhelics), Int32, (HelicsDataBuffer, HelicsBool), data, value)
end

function helicsDataBufferFillFromChar(data, value)
    ccall((:helicsDataBufferFillFromChar, libhelics), Int32, (HelicsDataBuffer, Cchar), data, value)
end

function helicsDataBufferFillFromTime(data, value)
    ccall((:helicsDataBufferFillFromTime, libhelics), Int32, (HelicsDataBuffer, HelicsTime), data, value)
end

function helicsDataBufferFillFromComplex(data, real, imag)
    ccall((:helicsDataBufferFillFromComplex, libhelics), Int32, (HelicsDataBuffer, Cdouble, Cdouble), data, real, imag)
end

function helicsDataBufferFillFromComplexObject(data, value)
    ccall((:helicsDataBufferFillFromComplexObject, libhelics), Int32, (HelicsDataBuffer, HelicsComplex), data, value)
end

function helicsDataBufferFillFromVector(data, value, dataSize)
    ccall((:helicsDataBufferFillFromVector, libhelics), Int32, (HelicsDataBuffer, Ptr{Cdouble}, Cint), data, value, dataSize)
end

function helicsDataBufferFillFromNamedPoint(data, name, value)
    ccall((:helicsDataBufferFillFromNamedPoint, libhelics), Int32, (HelicsDataBuffer, Ptr{Cchar}, Cdouble), data, name, value)
end

function helicsDataBufferFillFromComplexVector(data, value, dataSize)
    ccall((:helicsDataBufferFillFromComplexVector, libhelics), Int32, (HelicsDataBuffer, Ptr{Cdouble}, Cint), data, value, dataSize)
end

function helicsDataBufferType(data)
    ccall((:helicsDataBufferType, libhelics), Cint, (HelicsDataBuffer,), data)
end

function helicsDataBufferToInteger(data)
    ccall((:helicsDataBufferToInteger, libhelics), Int64, (HelicsDataBuffer,), data)
end

function helicsDataBufferToDouble(data)
    ccall((:helicsDataBufferToDouble, libhelics), Cdouble, (HelicsDataBuffer,), data)
end

function helicsDataBufferToBoolean(data)
    ccall((:helicsDataBufferToBoolean, libhelics), HelicsBool, (HelicsDataBuffer,), data)
end

function helicsDataBufferToChar(data)
    ccall((:helicsDataBufferToChar, libhelics), Cchar, (HelicsDataBuffer,), data)
end

function helicsDataBufferStringSize(data)
    ccall((:helicsDataBufferStringSize, libhelics), Cint, (HelicsDataBuffer,), data)
end

function helicsDataBufferToString(data, outputString, maxStringLen, actualLength)
    ccall((:helicsDataBufferToString, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cchar}, Cint, Ptr{Cint}), data, outputString, maxStringLen, actualLength)
end

function helicsDataBufferToRawString(data, outputString, maxStringLen, actualLength)
    ccall((:helicsDataBufferToRawString, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cchar}, Cint, Ptr{Cint}), data, outputString, maxStringLen, actualLength)
end

function helicsDataBufferToTime(data)
    ccall((:helicsDataBufferToTime, libhelics), HelicsTime, (HelicsDataBuffer,), data)
end

function helicsDataBufferToComplexObject(data)
    ccall((:helicsDataBufferToComplexObject, libhelics), HelicsComplex, (HelicsDataBuffer,), data)
end

function helicsDataBufferToComplex(data, real, imag)
    ccall((:helicsDataBufferToComplex, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cdouble}, Ptr{Cdouble}), data, real, imag)
end

function helicsDataBufferVectorSize(data)
    ccall((:helicsDataBufferVectorSize, libhelics), Cint, (HelicsDataBuffer,), data)
end

function helicsDataBufferToVector(data, values, maxlen, actualSize)
    ccall((:helicsDataBufferToVector, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cdouble}, Cint, Ptr{Cint}), data, values, maxlen, actualSize)
end

function helicsDataBufferToComplexVector(data, values, maxlen, actualSize)
    ccall((:helicsDataBufferToComplexVector, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cdouble}, Cint, Ptr{Cint}), data, values, maxlen, actualSize)
end

function helicsDataBufferToNamedPoint(data, outputString, maxStringLength, actualLength, val)
    ccall((:helicsDataBufferToNamedPoint, libhelics), Cvoid, (HelicsDataBuffer, Ptr{Cchar}, Cint, Ptr{Cint}, Ptr{Cdouble}), data, outputString, maxStringLength, actualLength, val)
end

function helicsDataBufferConvertToType(data, newDataType)
    ccall((:helicsDataBufferConvertToType, libhelics), HelicsBool, (HelicsDataBuffer, Cint), data, newDataType)
end

function helicsGetVersion()
    ccall((:helicsGetVersion, libhelics), Ptr{Cchar}, ())
end

function helicsGetBuildFlags()
    ccall((:helicsGetBuildFlags, libhelics), Ptr{Cchar}, ())
end

function helicsGetCompilerVersion()
    ccall((:helicsGetCompilerVersion, libhelics), Ptr{Cchar}, ())
end

function helicsGetSystemInfo()
    ccall((:helicsGetSystemInfo, libhelics), Ptr{Cchar}, ())
end

function helicsErrorInitialize()
    ccall((:helicsErrorInitialize, libhelics), HelicsError, ())
end

function helicsErrorClear(err)
    ccall((:helicsErrorClear, libhelics), Cvoid, (Ptr{HelicsError},), err)
end

# no prototype is found for this function at helics.h:851:20, please use with caution
function helicsLoadSignalHandler()
    ccall((:helicsLoadSignalHandler, libhelics), Cvoid, ())
end

# no prototype is found for this function at helics.h:856:20, please use with caution
function helicsLoadThreadedSignalHandler()
    ccall((:helicsLoadThreadedSignalHandler, libhelics), Cvoid, ())
end

# no prototype is found for this function at helics.h:859:20, please use with caution
function helicsClearSignalHandler()
    ccall((:helicsClearSignalHandler, libhelics), Cvoid, ())
end

function helicsLoadSignalHandlerCallback(handler, useSeparateThread)
    ccall((:helicsLoadSignalHandlerCallback, libhelics), Cvoid, (Ptr{Cvoid}, HelicsBool), handler, useSeparateThread)
end

function helicsLoadSignalHandlerCallbackNoExit(handler, useSeparateThread)
    ccall((:helicsLoadSignalHandlerCallbackNoExit, libhelics), Cvoid, (Ptr{Cvoid}, HelicsBool), handler, useSeparateThread)
end

function helicsAbort(errorCode, errorString)
    ccall((:helicsAbort, libhelics), Cvoid, (Cint, Ptr{Cchar}), errorCode, errorString)
end

function helicsIsCoreTypeAvailable(type)
    ccall((:helicsIsCoreTypeAvailable, libhelics), HelicsBool, (Ptr{Cchar},), type)
end

function helicsCreateCore(type, name, initString, err)
    ccall((:helicsCreateCore, libhelics), HelicsCore, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), type, name, initString, err)
end

function helicsCreateCoreFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateCoreFromArgs, libhelics), HelicsCore, (Ptr{Cchar}, Ptr{Cchar}, Cint, Ptr{Ptr{Cchar}}, Ptr{HelicsError}), type, name, argc, argv, err)
end

function helicsCoreClone(core, err)
    ccall((:helicsCoreClone, libhelics), HelicsCore, (HelicsCore, Ptr{HelicsError}), core, err)
end

function helicsCoreIsValid(core)
    ccall((:helicsCoreIsValid, libhelics), HelicsBool, (HelicsCore,), core)
end

function helicsCreateBroker(type, name, initString, err)
    ccall((:helicsCreateBroker, libhelics), HelicsBroker, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), type, name, initString, err)
end

function helicsCreateBrokerFromArgs(type, name, argc, argv, err)
    ccall((:helicsCreateBrokerFromArgs, libhelics), HelicsBroker, (Ptr{Cchar}, Ptr{Cchar}, Cint, Ptr{Ptr{Cchar}}, Ptr{HelicsError}), type, name, argc, argv, err)
end

function helicsBrokerClone(broker, err)
    ccall((:helicsBrokerClone, libhelics), HelicsBroker, (HelicsBroker, Ptr{HelicsError}), broker, err)
end

function helicsBrokerIsValid(broker)
    ccall((:helicsBrokerIsValid, libhelics), HelicsBool, (HelicsBroker,), broker)
end

function helicsBrokerIsConnected(broker)
    ccall((:helicsBrokerIsConnected, libhelics), HelicsBool, (HelicsBroker,), broker)
end

function helicsBrokerDataLink(broker, source, target, err)
    ccall((:helicsBrokerDataLink, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, source, target, err)
end

function helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddSourceFilterToEndpoint, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, filter, endpoint, err)
end

function helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint, err)
    ccall((:helicsBrokerAddDestinationFilterToEndpoint, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, filter, endpoint, err)
end

function helicsBrokerMakeConnections(broker, file, err)
    ccall((:helicsBrokerMakeConnections, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{HelicsError}), broker, file, err)
end

function helicsCoreWaitForDisconnect(core, msToWait, err)
    ccall((:helicsCoreWaitForDisconnect, libhelics), HelicsBool, (HelicsCore, Cint, Ptr{HelicsError}), core, msToWait, err)
end

function helicsBrokerWaitForDisconnect(broker, msToWait, err)
    ccall((:helicsBrokerWaitForDisconnect, libhelics), HelicsBool, (HelicsBroker, Cint, Ptr{HelicsError}), broker, msToWait, err)
end

function helicsCoreIsConnected(core)
    ccall((:helicsCoreIsConnected, libhelics), HelicsBool, (HelicsCore,), core)
end

function helicsCoreDataLink(core, source, target, err)
    ccall((:helicsCoreDataLink, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, source, target, err)
end

function helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddSourceFilterToEndpoint, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, filter, endpoint, err)
end

function helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint, err)
    ccall((:helicsCoreAddDestinationFilterToEndpoint, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, filter, endpoint, err)
end

function helicsCoreMakeConnections(core, file, err)
    ccall((:helicsCoreMakeConnections, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{HelicsError}), core, file, err)
end

function helicsBrokerGetIdentifier(broker)
    ccall((:helicsBrokerGetIdentifier, libhelics), Ptr{Cchar}, (HelicsBroker,), broker)
end

function helicsCoreGetIdentifier(core)
    ccall((:helicsCoreGetIdentifier, libhelics), Ptr{Cchar}, (HelicsCore,), core)
end

function helicsBrokerGetAddress(broker)
    ccall((:helicsBrokerGetAddress, libhelics), Ptr{Cchar}, (HelicsBroker,), broker)
end

function helicsCoreGetAddress(core)
    ccall((:helicsCoreGetAddress, libhelics), Ptr{Cchar}, (HelicsCore,), core)
end

function helicsCoreSetReadyToInit(core, err)
    ccall((:helicsCoreSetReadyToInit, libhelics), Cvoid, (HelicsCore, Ptr{HelicsError}), core, err)
end

function helicsCoreConnect(core, err)
    ccall((:helicsCoreConnect, libhelics), HelicsBool, (HelicsCore, Ptr{HelicsError}), core, err)
end

function helicsCoreDisconnect(core, err)
    ccall((:helicsCoreDisconnect, libhelics), Cvoid, (HelicsCore, Ptr{HelicsError}), core, err)
end

function helicsGetFederateByName(fedName, err)
    ccall((:helicsGetFederateByName, libhelics), HelicsFederate, (Ptr{Cchar}, Ptr{HelicsError}), fedName, err)
end

function helicsBrokerDisconnect(broker, err)
    ccall((:helicsBrokerDisconnect, libhelics), Cvoid, (HelicsBroker, Ptr{HelicsError}), broker, err)
end

function helicsFederateDestroy(fed)
    ccall((:helicsFederateDestroy, libhelics), Cvoid, (HelicsFederate,), fed)
end

function helicsBrokerDestroy(broker)
    ccall((:helicsBrokerDestroy, libhelics), Cvoid, (HelicsBroker,), broker)
end

function helicsCoreDestroy(core)
    ccall((:helicsCoreDestroy, libhelics), Cvoid, (HelicsCore,), core)
end

function helicsCoreFree(core)
    ccall((:helicsCoreFree, libhelics), Cvoid, (HelicsCore,), core)
end

function helicsBrokerFree(broker)
    ccall((:helicsBrokerFree, libhelics), Cvoid, (HelicsBroker,), broker)
end

function helicsCreateValueFederate(fedName, fedInfo, err)
    ccall((:helicsCreateValueFederate, libhelics), HelicsFederate, (Ptr{Cchar}, HelicsFederateInfo, Ptr{HelicsError}), fedName, fedInfo, err)
end

function helicsCreateValueFederateFromConfig(configFile, err)
    ccall((:helicsCreateValueFederateFromConfig, libhelics), HelicsFederate, (Ptr{Cchar}, Ptr{HelicsError}), configFile, err)
end

function helicsCreateMessageFederate(fedName, fedInfo, err)
    ccall((:helicsCreateMessageFederate, libhelics), HelicsFederate, (Ptr{Cchar}, HelicsFederateInfo, Ptr{HelicsError}), fedName, fedInfo, err)
end

function helicsCreateMessageFederateFromConfig(configFile, err)
    ccall((:helicsCreateMessageFederateFromConfig, libhelics), HelicsFederate, (Ptr{Cchar}, Ptr{HelicsError}), configFile, err)
end

function helicsCreateCombinationFederate(fedName, fedInfo, err)
    ccall((:helicsCreateCombinationFederate, libhelics), HelicsFederate, (Ptr{Cchar}, HelicsFederateInfo, Ptr{HelicsError}), fedName, fedInfo, err)
end

function helicsCreateCombinationFederateFromConfig(configFile, err)
    ccall((:helicsCreateCombinationFederateFromConfig, libhelics), HelicsFederate, (Ptr{Cchar}, Ptr{HelicsError}), configFile, err)
end

function helicsCreateCallbackFederate(fedName, fedInfo, err)
    ccall((:helicsCreateCallbackFederate, libhelics), HelicsFederate, (Ptr{Cchar}, HelicsFederateInfo, Ptr{HelicsError}), fedName, fedInfo, err)
end

function helicsCreateCallbackFederateFromConfig(configFile, err)
    ccall((:helicsCreateCallbackFederateFromConfig, libhelics), HelicsFederate, (Ptr{Cchar}, Ptr{HelicsError}), configFile, err)
end

function helicsFederateClone(fed, err)
    ccall((:helicsFederateClone, libhelics), HelicsFederate, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateProtect(fedName, err)
    ccall((:helicsFederateProtect, libhelics), Cvoid, (Ptr{Cchar}, Ptr{HelicsError}), fedName, err)
end

function helicsFederateUnProtect(fedName, err)
    ccall((:helicsFederateUnProtect, libhelics), Cvoid, (Ptr{Cchar}, Ptr{HelicsError}), fedName, err)
end

function helicsFederateIsProtected(fedName, err)
    ccall((:helicsFederateIsProtected, libhelics), HelicsBool, (Ptr{Cchar}, Ptr{HelicsError}), fedName, err)
end

function helicsCreateFederateInfo()
    ccall((:helicsCreateFederateInfo, libhelics), HelicsFederateInfo, ())
end

function helicsFederateInfoClone(fedInfo, err)
    ccall((:helicsFederateInfoClone, libhelics), HelicsFederateInfo, (HelicsFederateInfo, Ptr{HelicsError}), fedInfo, err)
end

function helicsFederateInfoLoadFromArgs(fedInfo, argc, argv, err)
    ccall((:helicsFederateInfoLoadFromArgs, libhelics), Cvoid, (HelicsFederateInfo, Cint, Ptr{Ptr{Cchar}}, Ptr{HelicsError}), fedInfo, argc, argv, err)
end

function helicsFederateInfoLoadFromString(fedInfo, args, err)
    ccall((:helicsFederateInfoLoadFromString, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, args, err)
end

function helicsFederateInfoFree(fedInfo)
    ccall((:helicsFederateInfoFree, libhelics), Cvoid, (HelicsFederateInfo,), fedInfo)
end

function helicsFederateIsValid(fed)
    ccall((:helicsFederateIsValid, libhelics), HelicsBool, (HelicsFederate,), fed)
end

function helicsFederateInfoSetCoreName(fedInfo, corename, err)
    ccall((:helicsFederateInfoSetCoreName, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, corename, err)
end

function helicsFederateInfoSetCoreInitString(fedInfo, coreInit, err)
    ccall((:helicsFederateInfoSetCoreInitString, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, coreInit, err)
end

function helicsFederateInfoSetBrokerInitString(fedInfo, brokerInit, err)
    ccall((:helicsFederateInfoSetBrokerInitString, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, brokerInit, err)
end

function helicsFederateInfoSetCoreType(fedInfo, coretype, err)
    ccall((:helicsFederateInfoSetCoreType, libhelics), Cvoid, (HelicsFederateInfo, Cint, Ptr{HelicsError}), fedInfo, coretype, err)
end

function helicsFederateInfoSetCoreTypeFromString(fedInfo, coretype, err)
    ccall((:helicsFederateInfoSetCoreTypeFromString, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, coretype, err)
end

function helicsFederateInfoSetBroker(fedInfo, broker, err)
    ccall((:helicsFederateInfoSetBroker, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, broker, err)
end

function helicsFederateInfoSetBrokerKey(fedInfo, brokerkey, err)
    ccall((:helicsFederateInfoSetBrokerKey, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, brokerkey, err)
end

function helicsFederateInfoSetBrokerPort(fedInfo, brokerPort, err)
    ccall((:helicsFederateInfoSetBrokerPort, libhelics), Cvoid, (HelicsFederateInfo, Cint, Ptr{HelicsError}), fedInfo, brokerPort, err)
end

function helicsFederateInfoSetLocalPort(fedInfo, localPort, err)
    ccall((:helicsFederateInfoSetLocalPort, libhelics), Cvoid, (HelicsFederateInfo, Ptr{Cchar}, Ptr{HelicsError}), fedInfo, localPort, err)
end

function helicsGetPropertyIndex(val)
    ccall((:helicsGetPropertyIndex, libhelics), Cint, (Ptr{Cchar},), val)
end

function helicsGetFlagIndex(val)
    ccall((:helicsGetFlagIndex, libhelics), Cint, (Ptr{Cchar},), val)
end

function helicsGetOptionIndex(val)
    ccall((:helicsGetOptionIndex, libhelics), Cint, (Ptr{Cchar},), val)
end

function helicsGetOptionValue(val)
    ccall((:helicsGetOptionValue, libhelics), Cint, (Ptr{Cchar},), val)
end

function helicsGetDataType(val)
    ccall((:helicsGetDataType, libhelics), Cint, (Ptr{Cchar},), val)
end

function helicsFederateInfoSetFlagOption(fedInfo, flag, value, err)
    ccall((:helicsFederateInfoSetFlagOption, libhelics), Cvoid, (HelicsFederateInfo, Cint, HelicsBool, Ptr{HelicsError}), fedInfo, flag, value, err)
end

function helicsFederateInfoSetSeparator(fedInfo, separator, err)
    ccall((:helicsFederateInfoSetSeparator, libhelics), Cvoid, (HelicsFederateInfo, Cchar, Ptr{HelicsError}), fedInfo, separator, err)
end

function helicsFederateInfoSetTimeProperty(fedInfo, timeProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetTimeProperty, libhelics), Cvoid, (HelicsFederateInfo, Cint, HelicsTime, Ptr{HelicsError}), fedInfo, timeProperty, propertyValue, err)
end

function helicsFederateInfoSetIntegerProperty(fedInfo, intProperty, propertyValue, err)
    ccall((:helicsFederateInfoSetIntegerProperty, libhelics), Cvoid, (HelicsFederateInfo, Cint, Cint, Ptr{HelicsError}), fedInfo, intProperty, propertyValue, err)
end

function helicsFederateRegisterInterfaces(fed, file, err)
    ccall((:helicsFederateRegisterInterfaces, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, file, err)
end

function helicsFederateGlobalError(fed, errorCode, errorString, err)
    ccall((:helicsFederateGlobalError, libhelics), Cvoid, (HelicsFederate, Cint, Ptr{Cchar}, Ptr{HelicsError}), fed, errorCode, errorString, err)
end

function helicsFederateLocalError(fed, errorCode, errorString, err)
    ccall((:helicsFederateLocalError, libhelics), Cvoid, (HelicsFederate, Cint, Ptr{Cchar}, Ptr{HelicsError}), fed, errorCode, errorString, err)
end

function helicsFederateFinalize(fed, err)
    ccall((:helicsFederateFinalize, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateFinalizeAsync(fed, err)
    ccall((:helicsFederateFinalizeAsync, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateFinalizeComplete(fed, err)
    ccall((:helicsFederateFinalizeComplete, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateDisconnect(fed, err)
    ccall((:helicsFederateDisconnect, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateDisconnectAsync(fed, err)
    ccall((:helicsFederateDisconnectAsync, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateDisconnectComplete(fed, err)
    ccall((:helicsFederateDisconnectComplete, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateFree(fed)
    ccall((:helicsFederateFree, libhelics), Cvoid, (HelicsFederate,), fed)
end

function helicsCloseLibrary()
    ccall((:helicsCloseLibrary, libhelics), Cvoid, ())
end

function helicsFederateEnterInitializingMode(fed, err)
    ccall((:helicsFederateEnterInitializingMode, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterInitializingModeAsync(fed, err)
    ccall((:helicsFederateEnterInitializingModeAsync, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterInitializingModeComplete(fed, err)
    ccall((:helicsFederateEnterInitializingModeComplete, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterInitializingModeIterative(fed, err)
    ccall((:helicsFederateEnterInitializingModeIterative, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterInitializingModeIterativeAsync(fed, err)
    ccall((:helicsFederateEnterInitializingModeIterativeAsync, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterInitializingModeIterativeComplete(fed, err)
    ccall((:helicsFederateEnterInitializingModeIterativeComplete, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateIsAsyncOperationCompleted(fed, err)
    ccall((:helicsFederateIsAsyncOperationCompleted, libhelics), HelicsBool, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterExecutingMode(fed, err)
    ccall((:helicsFederateEnterExecutingMode, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterExecutingModeAsync(fed, err)
    ccall((:helicsFederateEnterExecutingModeAsync, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterExecutingModeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeComplete, libhelics), Cvoid, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateEnterExecutingModeIterative(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterative, libhelics), HelicsIterationResult, (HelicsFederate, HelicsIterationRequest, Ptr{HelicsError}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeAsync(fed, iterate, err)
    ccall((:helicsFederateEnterExecutingModeIterativeAsync, libhelics), Cvoid, (HelicsFederate, HelicsIterationRequest, Ptr{HelicsError}), fed, iterate, err)
end

function helicsFederateEnterExecutingModeIterativeComplete(fed, err)
    ccall((:helicsFederateEnterExecutingModeIterativeComplete, libhelics), HelicsIterationResult, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateGetState(fed, err)
    ccall((:helicsFederateGetState, libhelics), HelicsFederateState, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateGetCore(fed, err)
    ccall((:helicsFederateGetCore, libhelics), HelicsCore, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateRequestTime(fed, requestTime, err)
    ccall((:helicsFederateRequestTime, libhelics), HelicsTime, (HelicsFederate, HelicsTime, Ptr{HelicsError}), fed, requestTime, err)
end

function helicsFederateRequestTimeAdvance(fed, timeDelta, err)
    ccall((:helicsFederateRequestTimeAdvance, libhelics), HelicsTime, (HelicsFederate, HelicsTime, Ptr{HelicsError}), fed, timeDelta, err)
end

function helicsFederateRequestNextStep(fed, err)
    ccall((:helicsFederateRequestNextStep, libhelics), HelicsTime, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIteration, err)
    ccall((:helicsFederateRequestTimeIterative, libhelics), HelicsTime, (HelicsFederate, HelicsTime, HelicsIterationRequest, Ptr{HelicsIterationResult}, Ptr{HelicsError}), fed, requestTime, iterate, outIteration, err)
end

function helicsFederateRequestTimeAsync(fed, requestTime, err)
    ccall((:helicsFederateRequestTimeAsync, libhelics), Cvoid, (HelicsFederate, HelicsTime, Ptr{HelicsError}), fed, requestTime, err)
end

function helicsFederateRequestTimeComplete(fed, err)
    ccall((:helicsFederateRequestTimeComplete, libhelics), HelicsTime, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate, err)
    ccall((:helicsFederateRequestTimeIterativeAsync, libhelics), Cvoid, (HelicsFederate, HelicsTime, HelicsIterationRequest, Ptr{HelicsError}), fed, requestTime, iterate, err)
end

function helicsFederateRequestTimeIterativeComplete(fed, outIterate, err)
    ccall((:helicsFederateRequestTimeIterativeComplete, libhelics), HelicsTime, (HelicsFederate, Ptr{HelicsIterationResult}, Ptr{HelicsError}), fed, outIterate, err)
end

function helicsFederateProcessCommunications(fed, period, err)
    ccall((:helicsFederateProcessCommunications, libhelics), Cvoid, (HelicsFederate, HelicsTime, Ptr{HelicsError}), fed, period, err)
end

function helicsFederateGetName(fed)
    ccall((:helicsFederateGetName, libhelics), Ptr{Cchar}, (HelicsFederate,), fed)
end

function helicsFederateSetTimeProperty(fed, timeProperty, time, err)
    ccall((:helicsFederateSetTimeProperty, libhelics), Cvoid, (HelicsFederate, Cint, HelicsTime, Ptr{HelicsError}), fed, timeProperty, time, err)
end

function helicsFederateSetFlagOption(fed, flag, flagValue, err)
    ccall((:helicsFederateSetFlagOption, libhelics), Cvoid, (HelicsFederate, Cint, HelicsBool, Ptr{HelicsError}), fed, flag, flagValue, err)
end

function helicsFederateSetSeparator(fed, separator, err)
    ccall((:helicsFederateSetSeparator, libhelics), Cvoid, (HelicsFederate, Cchar, Ptr{HelicsError}), fed, separator, err)
end

function helicsFederateSetIntegerProperty(fed, intProperty, propertyVal, err)
    ccall((:helicsFederateSetIntegerProperty, libhelics), Cvoid, (HelicsFederate, Cint, Cint, Ptr{HelicsError}), fed, intProperty, propertyVal, err)
end

function helicsFederateGetTimeProperty(fed, timeProperty, err)
    ccall((:helicsFederateGetTimeProperty, libhelics), HelicsTime, (HelicsFederate, Cint, Ptr{HelicsError}), fed, timeProperty, err)
end

function helicsFederateGetFlagOption(fed, flag, err)
    ccall((:helicsFederateGetFlagOption, libhelics), HelicsBool, (HelicsFederate, Cint, Ptr{HelicsError}), fed, flag, err)
end

function helicsFederateGetIntegerProperty(fed, intProperty, err)
    ccall((:helicsFederateGetIntegerProperty, libhelics), Cint, (HelicsFederate, Cint, Ptr{HelicsError}), fed, intProperty, err)
end

function helicsFederateGetCurrentTime(fed, err)
    ccall((:helicsFederateGetCurrentTime, libhelics), HelicsTime, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateAddAlias(fed, interfaceName, alias, err)
    ccall((:helicsFederateAddAlias, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, interfaceName, alias, err)
end

function helicsFederateSetGlobal(fed, valueName, value, err)
    ccall((:helicsFederateSetGlobal, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, valueName, value, err)
end

function helicsFederateSetTag(fed, tagName, value, err)
    ccall((:helicsFederateSetTag, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, tagName, value, err)
end

function helicsFederateGetTag(fed, tagName, err)
    ccall((:helicsFederateGetTag, libhelics), Ptr{Cchar}, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, tagName, err)
end

function helicsFederateAddDependency(fed, fedName, err)
    ccall((:helicsFederateAddDependency, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, fedName, err)
end

function helicsFederateSetLogFile(fed, logFile, err)
    ccall((:helicsFederateSetLogFile, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, logFile, err)
end

function helicsFederateLogErrorMessage(fed, logmessage, err)
    ccall((:helicsFederateLogErrorMessage, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, logmessage, err)
end

function helicsFederateLogWarningMessage(fed, logmessage, err)
    ccall((:helicsFederateLogWarningMessage, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, logmessage, err)
end

function helicsFederateLogInfoMessage(fed, logmessage, err)
    ccall((:helicsFederateLogInfoMessage, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, logmessage, err)
end

function helicsFederateLogDebugMessage(fed, logmessage, err)
    ccall((:helicsFederateLogDebugMessage, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, logmessage, err)
end

function helicsFederateLogLevelMessage(fed, loglevel, logmessage, err)
    ccall((:helicsFederateLogLevelMessage, libhelics), Cvoid, (HelicsFederate, Cint, Ptr{Cchar}, Ptr{HelicsError}), fed, loglevel, logmessage, err)
end

function helicsFederateSendCommand(fed, target, command, err)
    ccall((:helicsFederateSendCommand, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, target, command, err)
end

function helicsFederateGetCommand(fed, err)
    ccall((:helicsFederateGetCommand, libhelics), Ptr{Cchar}, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateGetCommandSource(fed, err)
    ccall((:helicsFederateGetCommandSource, libhelics), Ptr{Cchar}, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateWaitCommand(fed, err)
    ccall((:helicsFederateWaitCommand, libhelics), Ptr{Cchar}, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsCoreSetGlobal(core, valueName, value, err)
    ccall((:helicsCoreSetGlobal, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, valueName, value, err)
end

function helicsBrokerSetGlobal(broker, valueName, value, err)
    ccall((:helicsBrokerSetGlobal, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, valueName, value, err)
end

function helicsCoreAddAlias(core, interfaceName, alias, err)
    ccall((:helicsCoreAddAlias, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, interfaceName, alias, err)
end

function helicsBrokerAddAlias(broker, interfaceName, alias, err)
    ccall((:helicsBrokerAddAlias, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, interfaceName, alias, err)
end

function helicsCoreSendCommand(core, target, command, err)
    ccall((:helicsCoreSendCommand, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, target, command, err)
end

function helicsCoreSendOrderedCommand(core, target, command, err)
    ccall((:helicsCoreSendOrderedCommand, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), core, target, command, err)
end

function helicsBrokerSendCommand(broker, target, command, err)
    ccall((:helicsBrokerSendCommand, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, target, command, err)
end

function helicsBrokerSendOrderedCommand(broker, target, command, err)
    ccall((:helicsBrokerSendOrderedCommand, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), broker, target, command, err)
end

function helicsCoreSetLogFile(core, logFileName, err)
    ccall((:helicsCoreSetLogFile, libhelics), Cvoid, (HelicsCore, Ptr{Cchar}, Ptr{HelicsError}), core, logFileName, err)
end

function helicsBrokerSetLogFile(broker, logFileName, err)
    ccall((:helicsBrokerSetLogFile, libhelics), Cvoid, (HelicsBroker, Ptr{Cchar}, Ptr{HelicsError}), broker, logFileName, err)
end

function helicsBrokerSetTimeBarrier(broker, barrierTime, err)
    ccall((:helicsBrokerSetTimeBarrier, libhelics), Cvoid, (HelicsBroker, HelicsTime, Ptr{HelicsError}), broker, barrierTime, err)
end

function helicsBrokerClearTimeBarrier(broker)
    ccall((:helicsBrokerClearTimeBarrier, libhelics), Cvoid, (HelicsBroker,), broker)
end

function helicsBrokerGlobalError(broker, errorCode, errorString, err)
    ccall((:helicsBrokerGlobalError, libhelics), Cvoid, (HelicsBroker, Cint, Ptr{Cchar}, Ptr{HelicsError}), broker, errorCode, errorString, err)
end

function helicsCoreGlobalError(core, errorCode, errorString, err)
    ccall((:helicsCoreGlobalError, libhelics), Cvoid, (HelicsCore, Cint, Ptr{Cchar}, Ptr{HelicsError}), core, errorCode, errorString, err)
end

function helicsCreateQuery(target, query)
    ccall((:helicsCreateQuery, libhelics), HelicsQuery, (Ptr{Cchar}, Ptr{Cchar}), target, query)
end

function helicsQueryExecute(query, fed, err)
    ccall((:helicsQueryExecute, libhelics), Ptr{Cchar}, (HelicsQuery, HelicsFederate, Ptr{HelicsError}), query, fed, err)
end

function helicsQueryCoreExecute(query, core, err)
    ccall((:helicsQueryCoreExecute, libhelics), Ptr{Cchar}, (HelicsQuery, HelicsCore, Ptr{HelicsError}), query, core, err)
end

function helicsQueryBrokerExecute(query, broker, err)
    ccall((:helicsQueryBrokerExecute, libhelics), Ptr{Cchar}, (HelicsQuery, HelicsBroker, Ptr{HelicsError}), query, broker, err)
end

function helicsQueryExecuteAsync(query, fed, err)
    ccall((:helicsQueryExecuteAsync, libhelics), Cvoid, (HelicsQuery, HelicsFederate, Ptr{HelicsError}), query, fed, err)
end

function helicsQueryExecuteComplete(query, err)
    ccall((:helicsQueryExecuteComplete, libhelics), Ptr{Cchar}, (HelicsQuery, Ptr{HelicsError}), query, err)
end

function helicsQueryIsCompleted(query)
    ccall((:helicsQueryIsCompleted, libhelics), HelicsBool, (HelicsQuery,), query)
end

function helicsQuerySetTarget(query, target, err)
    ccall((:helicsQuerySetTarget, libhelics), Cvoid, (HelicsQuery, Ptr{Cchar}, Ptr{HelicsError}), query, target, err)
end

function helicsQuerySetQueryString(query, queryString, err)
    ccall((:helicsQuerySetQueryString, libhelics), Cvoid, (HelicsQuery, Ptr{Cchar}, Ptr{HelicsError}), query, queryString, err)
end

function helicsQuerySetOrdering(query, mode, err)
    ccall((:helicsQuerySetOrdering, libhelics), Cvoid, (HelicsQuery, Int32, Ptr{HelicsError}), query, mode, err)
end

function helicsQueryFree(query)
    ccall((:helicsQueryFree, libhelics), Cvoid, (HelicsQuery,), query)
end

function helicsCleanupLibrary()
    ccall((:helicsCleanupLibrary, libhelics), Cvoid, ())
end

# no prototype is found for this function at helics.h:2623:26, please use with caution
function helicsAppEnabled()
    ccall((:helicsAppEnabled, libhelics), HelicsBool, ())
end

function helicsCreateApp(appName, appType, configFile, fedInfo, err)
    ccall((:helicsCreateApp, libhelics), HelicsApp, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, HelicsFederateInfo, Ptr{HelicsError}), appName, appType, configFile, fedInfo, err)
end

function helicsAppGetFederate(app, err)
    ccall((:helicsAppGetFederate, libhelics), HelicsFederate, (HelicsApp, Ptr{HelicsError}), app, err)
end

function helicsAppLoadFile(app, configFile, err)
    ccall((:helicsAppLoadFile, libhelics), Cvoid, (HelicsApp, Ptr{Cchar}, Ptr{HelicsError}), app, configFile, err)
end

function helicsAppInitialize(app, err)
    ccall((:helicsAppInitialize, libhelics), Cvoid, (HelicsApp, Ptr{HelicsError}), app, err)
end

function helicsAppRun(app, err)
    ccall((:helicsAppRun, libhelics), Cvoid, (HelicsApp, Ptr{HelicsError}), app, err)
end

function helicsAppRunTo(app, stopTime, err)
    ccall((:helicsAppRunTo, libhelics), Cvoid, (HelicsApp, HelicsTime, Ptr{HelicsError}), app, stopTime, err)
end

function helicsAppFinalize(app, err)
    ccall((:helicsAppFinalize, libhelics), Cvoid, (HelicsApp, Ptr{HelicsError}), app, err)
end

function helicsAppFree(app)
    ccall((:helicsAppFree, libhelics), Cvoid, (HelicsApp,), app)
end

function helicsAppDestroy(app)
    ccall((:helicsAppDestroy, libhelics), Cvoid, (HelicsApp,), app)
end

function helicsAppIsActive(app)
    ccall((:helicsAppIsActive, libhelics), HelicsBool, (HelicsApp,), app)
end

function helicsFederateRegisterSubscription(fed, key, units, err)
    ccall((:helicsFederateRegisterSubscription, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, key, units, err)
end

function helicsFederateRegisterPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterPublication, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, HelicsDataTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypePublication, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalPublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalPublication, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, HelicsDataTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypePublication(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypePublication, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterInput, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, HelicsDataTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterTypeInput, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalInput, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, HelicsDataTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateRegisterGlobalTypeInput(fed, key, type, units, err)
    ccall((:helicsFederateRegisterGlobalTypeInput, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, key, type, units, err)
end

function helicsFederateGetPublication(fed, key, err)
    ccall((:helicsFederateGetPublication, libhelics), HelicsPublication, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, key, err)
end

function helicsFederateGetPublicationByIndex(fed, index, err)
    ccall((:helicsFederateGetPublicationByIndex, libhelics), HelicsPublication, (HelicsFederate, Cint, Ptr{HelicsError}), fed, index, err)
end

function helicsFederateGetInput(fed, key, err)
    ccall((:helicsFederateGetInput, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, key, err)
end

function helicsFederateGetInputByIndex(fed, index, err)
    ccall((:helicsFederateGetInputByIndex, libhelics), HelicsInput, (HelicsFederate, Cint, Ptr{HelicsError}), fed, index, err)
end

function helicsFederateGetSubscription(fed, key, err)
    ccall((:helicsFederateGetSubscription, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, key, err)
end

function helicsFederateGetInputByTarget(fed, target, err)
    ccall((:helicsFederateGetInputByTarget, libhelics), HelicsInput, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, target, err)
end

function helicsFederateClearUpdates(fed)
    ccall((:helicsFederateClearUpdates, libhelics), Cvoid, (HelicsFederate,), fed)
end

function helicsFederateRegisterFromPublicationJSON(fed, json, err)
    ccall((:helicsFederateRegisterFromPublicationJSON, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, json, err)
end

function helicsFederatePublishJSON(fed, json, err)
    ccall((:helicsFederatePublishJSON, libhelics), Cvoid, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, json, err)
end

function helicsPublicationIsValid(pub)
    ccall((:helicsPublicationIsValid, libhelics), HelicsBool, (HelicsPublication,), pub)
end

function helicsPublicationPublishBytes(pub, data, inputDataLength, err)
    ccall((:helicsPublicationPublishBytes, libhelics), Cvoid, (HelicsPublication, Ptr{Cvoid}, Cint, Ptr{HelicsError}), pub, data, inputDataLength, err)
end

function helicsPublicationPublishString(pub, val, err)
    ccall((:helicsPublicationPublishString, libhelics), Cvoid, (HelicsPublication, Ptr{Cchar}, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishInteger(pub, val, err)
    ccall((:helicsPublicationPublishInteger, libhelics), Cvoid, (HelicsPublication, Int64, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishBoolean(pub, val, err)
    ccall((:helicsPublicationPublishBoolean, libhelics), Cvoid, (HelicsPublication, HelicsBool, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishDouble(pub, val, err)
    ccall((:helicsPublicationPublishDouble, libhelics), Cvoid, (HelicsPublication, Cdouble, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishTime(pub, val, err)
    ccall((:helicsPublicationPublishTime, libhelics), Cvoid, (HelicsPublication, HelicsTime, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishChar(pub, val, err)
    ccall((:helicsPublicationPublishChar, libhelics), Cvoid, (HelicsPublication, Cchar, Ptr{HelicsError}), pub, val, err)
end

function helicsPublicationPublishComplex(pub, real, imag, err)
    ccall((:helicsPublicationPublishComplex, libhelics), Cvoid, (HelicsPublication, Cdouble, Cdouble, Ptr{HelicsError}), pub, real, imag, err)
end

function helicsPublicationPublishVector(pub, vectorInput, vectorLength, err)
    ccall((:helicsPublicationPublishVector, libhelics), Cvoid, (HelicsPublication, Ptr{Cdouble}, Cint, Ptr{HelicsError}), pub, vectorInput, vectorLength, err)
end

function helicsPublicationPublishComplexVector(pub, vectorInput, vectorLength, err)
    ccall((:helicsPublicationPublishComplexVector, libhelics), Cvoid, (HelicsPublication, Ptr{Cdouble}, Cint, Ptr{HelicsError}), pub, vectorInput, vectorLength, err)
end

function helicsPublicationPublishNamedPoint(pub, field, val, err)
    ccall((:helicsPublicationPublishNamedPoint, libhelics), Cvoid, (HelicsPublication, Ptr{Cchar}, Cdouble, Ptr{HelicsError}), pub, field, val, err)
end

function helicsPublicationPublishDataBuffer(pub, buffer, err)
    ccall((:helicsPublicationPublishDataBuffer, libhelics), Cvoid, (HelicsPublication, HelicsDataBuffer, Ptr{HelicsError}), pub, buffer, err)
end

function helicsPublicationAddTarget(pub, target, err)
    ccall((:helicsPublicationAddTarget, libhelics), Cvoid, (HelicsPublication, Ptr{Cchar}, Ptr{HelicsError}), pub, target, err)
end

function helicsInputIsValid(ipt)
    ccall((:helicsInputIsValid, libhelics), HelicsBool, (HelicsInput,), ipt)
end

function helicsInputAddTarget(ipt, target, err)
    ccall((:helicsInputAddTarget, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Ptr{HelicsError}), ipt, target, err)
end

function helicsInputGetByteCount(ipt)
    ccall((:helicsInputGetByteCount, libhelics), Cint, (HelicsInput,), ipt)
end

function helicsInputGetBytes(ipt, data, maxDataLength, actualSize, err)
    ccall((:helicsInputGetBytes, libhelics), Cvoid, (HelicsInput, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{HelicsError}), ipt, data, maxDataLength, actualSize, err)
end

function helicsInputGetDataBuffer(inp, err)
    ccall((:helicsInputGetDataBuffer, libhelics), HelicsDataBuffer, (HelicsInput, Ptr{HelicsError}), inp, err)
end

function helicsInputGetStringSize(ipt)
    ccall((:helicsInputGetStringSize, libhelics), Cint, (HelicsInput,), ipt)
end

function helicsInputGetString(ipt, outputString, maxStringLength, actualLength, err)
    ccall((:helicsInputGetString, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Cint, Ptr{Cint}, Ptr{HelicsError}), ipt, outputString, maxStringLength, actualLength, err)
end

function helicsInputGetInteger(ipt, err)
    ccall((:helicsInputGetInteger, libhelics), Int64, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetBoolean(ipt, err)
    ccall((:helicsInputGetBoolean, libhelics), HelicsBool, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetDouble(ipt, err)
    ccall((:helicsInputGetDouble, libhelics), Cdouble, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetTime(ipt, err)
    ccall((:helicsInputGetTime, libhelics), HelicsTime, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetChar(ipt, err)
    ccall((:helicsInputGetChar, libhelics), Cchar, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetComplexObject(ipt, err)
    ccall((:helicsInputGetComplexObject, libhelics), HelicsComplex, (HelicsInput, Ptr{HelicsError}), ipt, err)
end

function helicsInputGetComplex(ipt, real, imag, err)
    ccall((:helicsInputGetComplex, libhelics), Cvoid, (HelicsInput, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{HelicsError}), ipt, real, imag, err)
end

function helicsInputGetVectorSize(ipt)
    ccall((:helicsInputGetVectorSize, libhelics), Cint, (HelicsInput,), ipt)
end

function helicsInputGetVector(ipt, data, maxLength, actualSize, err)
    ccall((:helicsInputGetVector, libhelics), Cvoid, (HelicsInput, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{HelicsError}), ipt, data, maxLength, actualSize, err)
end

function helicsInputGetComplexVector(ipt, data, maxLength, actualSize, err)
    ccall((:helicsInputGetComplexVector, libhelics), Cvoid, (HelicsInput, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{HelicsError}), ipt, data, maxLength, actualSize, err)
end

function helicsInputGetNamedPoint(ipt, outputString, maxStringLength, actualLength, val, err)
    ccall((:helicsInputGetNamedPoint, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{HelicsError}), ipt, outputString, maxStringLength, actualLength, val, err)
end

function helicsInputSetDefaultBytes(ipt, data, inputDataLength, err)
    ccall((:helicsInputSetDefaultBytes, libhelics), Cvoid, (HelicsInput, Ptr{Cvoid}, Cint, Ptr{HelicsError}), ipt, data, inputDataLength, err)
end

function helicsInputSetDefaultString(ipt, defaultString, err)
    ccall((:helicsInputSetDefaultString, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Ptr{HelicsError}), ipt, defaultString, err)
end

function helicsInputSetDefaultInteger(ipt, val, err)
    ccall((:helicsInputSetDefaultInteger, libhelics), Cvoid, (HelicsInput, Int64, Ptr{HelicsError}), ipt, val, err)
end

function helicsInputSetDefaultBoolean(ipt, val, err)
    ccall((:helicsInputSetDefaultBoolean, libhelics), Cvoid, (HelicsInput, HelicsBool, Ptr{HelicsError}), ipt, val, err)
end

function helicsInputSetDefaultTime(ipt, val, err)
    ccall((:helicsInputSetDefaultTime, libhelics), Cvoid, (HelicsInput, HelicsTime, Ptr{HelicsError}), ipt, val, err)
end

function helicsInputSetDefaultChar(ipt, val, err)
    ccall((:helicsInputSetDefaultChar, libhelics), Cvoid, (HelicsInput, Cchar, Ptr{HelicsError}), ipt, val, err)
end

function helicsInputSetDefaultDouble(ipt, val, err)
    ccall((:helicsInputSetDefaultDouble, libhelics), Cvoid, (HelicsInput, Cdouble, Ptr{HelicsError}), ipt, val, err)
end

function helicsInputSetDefaultComplex(ipt, real, imag, err)
    ccall((:helicsInputSetDefaultComplex, libhelics), Cvoid, (HelicsInput, Cdouble, Cdouble, Ptr{HelicsError}), ipt, real, imag, err)
end

function helicsInputSetDefaultVector(ipt, vectorInput, vectorLength, err)
    ccall((:helicsInputSetDefaultVector, libhelics), Cvoid, (HelicsInput, Ptr{Cdouble}, Cint, Ptr{HelicsError}), ipt, vectorInput, vectorLength, err)
end

function helicsInputSetDefaultComplexVector(ipt, vectorInput, vectorLength, err)
    ccall((:helicsInputSetDefaultComplexVector, libhelics), Cvoid, (HelicsInput, Ptr{Cdouble}, Cint, Ptr{HelicsError}), ipt, vectorInput, vectorLength, err)
end

function helicsInputSetDefaultNamedPoint(ipt, defaultName, val, err)
    ccall((:helicsInputSetDefaultNamedPoint, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Cdouble, Ptr{HelicsError}), ipt, defaultName, val, err)
end

function helicsInputGetType(ipt)
    ccall((:helicsInputGetType, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsInputGetPublicationType(ipt)
    ccall((:helicsInputGetPublicationType, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsInputGetPublicationDataType(ipt)
    ccall((:helicsInputGetPublicationDataType, libhelics), Cint, (HelicsInput,), ipt)
end

function helicsPublicationGetType(pub)
    ccall((:helicsPublicationGetType, libhelics), Ptr{Cchar}, (HelicsPublication,), pub)
end

function helicsInputGetName(ipt)
    ccall((:helicsInputGetName, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsSubscriptionGetTarget(ipt)
    ccall((:helicsSubscriptionGetTarget, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsInputGetTarget(ipt)
    ccall((:helicsInputGetTarget, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsPublicationGetName(pub)
    ccall((:helicsPublicationGetName, libhelics), Ptr{Cchar}, (HelicsPublication,), pub)
end

function helicsInputGetUnits(ipt)
    ccall((:helicsInputGetUnits, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsInputGetInjectionUnits(ipt)
    ccall((:helicsInputGetInjectionUnits, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsInputGetExtractionUnits(ipt)
    ccall((:helicsInputGetExtractionUnits, libhelics), Ptr{Cchar}, (HelicsInput,), ipt)
end

function helicsPublicationGetUnits(pub)
    ccall((:helicsPublicationGetUnits, libhelics), Ptr{Cchar}, (HelicsPublication,), pub)
end

function helicsInputGetInfo(inp)
    ccall((:helicsInputGetInfo, libhelics), Ptr{Cchar}, (HelicsInput,), inp)
end

function helicsInputSetInfo(inp, info, err)
    ccall((:helicsInputSetInfo, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Ptr{HelicsError}), inp, info, err)
end

function helicsInputGetTag(inp, tagname)
    ccall((:helicsInputGetTag, libhelics), Ptr{Cchar}, (HelicsInput, Ptr{Cchar}), inp, tagname)
end

function helicsInputSetTag(inp, tagname, tagvalue, err)
    ccall((:helicsInputSetTag, libhelics), Cvoid, (HelicsInput, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), inp, tagname, tagvalue, err)
end

function helicsPublicationGetInfo(pub)
    ccall((:helicsPublicationGetInfo, libhelics), Ptr{Cchar}, (HelicsPublication,), pub)
end

function helicsPublicationSetInfo(pub, info, err)
    ccall((:helicsPublicationSetInfo, libhelics), Cvoid, (HelicsPublication, Ptr{Cchar}, Ptr{HelicsError}), pub, info, err)
end

function helicsPublicationGetTag(pub, tagname)
    ccall((:helicsPublicationGetTag, libhelics), Ptr{Cchar}, (HelicsPublication, Ptr{Cchar}), pub, tagname)
end

function helicsPublicationSetTag(pub, tagname, tagvalue, err)
    ccall((:helicsPublicationSetTag, libhelics), Cvoid, (HelicsPublication, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), pub, tagname, tagvalue, err)
end

function helicsInputGetOption(inp, option)
    ccall((:helicsInputGetOption, libhelics), Cint, (HelicsInput, Cint), inp, option)
end

function helicsInputSetOption(inp, option, value, err)
    ccall((:helicsInputSetOption, libhelics), Cvoid, (HelicsInput, Cint, Cint, Ptr{HelicsError}), inp, option, value, err)
end

function helicsPublicationGetOption(pub, option)
    ccall((:helicsPublicationGetOption, libhelics), Cint, (HelicsPublication, Cint), pub, option)
end

function helicsPublicationSetOption(pub, option, val, err)
    ccall((:helicsPublicationSetOption, libhelics), Cvoid, (HelicsPublication, Cint, Cint, Ptr{HelicsError}), pub, option, val, err)
end

function helicsPublicationSetMinimumChange(pub, tolerance, err)
    ccall((:helicsPublicationSetMinimumChange, libhelics), Cvoid, (HelicsPublication, Cdouble, Ptr{HelicsError}), pub, tolerance, err)
end

function helicsInputSetMinimumChange(inp, tolerance, err)
    ccall((:helicsInputSetMinimumChange, libhelics), Cvoid, (HelicsInput, Cdouble, Ptr{HelicsError}), inp, tolerance, err)
end

function helicsInputIsUpdated(ipt)
    ccall((:helicsInputIsUpdated, libhelics), HelicsBool, (HelicsInput,), ipt)
end

function helicsInputLastUpdateTime(ipt)
    ccall((:helicsInputLastUpdateTime, libhelics), HelicsTime, (HelicsInput,), ipt)
end

function helicsInputClearUpdate(ipt)
    ccall((:helicsInputClearUpdate, libhelics), Cvoid, (HelicsInput,), ipt)
end

function helicsFederateGetPublicationCount(fed)
    ccall((:helicsFederateGetPublicationCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsFederateGetInputCount(fed)
    ccall((:helicsFederateGetInputCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsFederateRegisterEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterEndpoint, libhelics), HelicsEndpoint, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, name, type, err)
end

function helicsFederateRegisterGlobalEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterGlobalEndpoint, libhelics), HelicsEndpoint, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, name, type, err)
end

function helicsFederateRegisterTargetedEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterTargetedEndpoint, libhelics), HelicsEndpoint, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, name, type, err)
end

function helicsFederateRegisterGlobalTargetedEndpoint(fed, name, type, err)
    ccall((:helicsFederateRegisterGlobalTargetedEndpoint, libhelics), HelicsEndpoint, (HelicsFederate, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), fed, name, type, err)
end

function helicsFederateGetEndpoint(fed, name, err)
    ccall((:helicsFederateGetEndpoint, libhelics), HelicsEndpoint, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, name, err)
end

function helicsFederateGetEndpointByIndex(fed, index, err)
    ccall((:helicsFederateGetEndpointByIndex, libhelics), HelicsEndpoint, (HelicsFederate, Cint, Ptr{HelicsError}), fed, index, err)
end

function helicsEndpointIsValid(endpoint)
    ccall((:helicsEndpointIsValid, libhelics), HelicsBool, (HelicsEndpoint,), endpoint)
end

function helicsEndpointSetDefaultDestination(endpoint, dst, err)
    ccall((:helicsEndpointSetDefaultDestination, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, dst, err)
end

function helicsEndpointGetDefaultDestination(endpoint)
    ccall((:helicsEndpointGetDefaultDestination, libhelics), Ptr{Cchar}, (HelicsEndpoint,), endpoint)
end

function helicsEndpointSendString(endpoint, message, err)
    ccall((:helicsEndpointSendString, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, message, err)
end

function helicsEndpointSendStringTo(endpoint, message, dst, err)
    ccall((:helicsEndpointSendStringTo, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), endpoint, message, dst, err)
end

function helicsEndpointSendStringToAt(endpoint, message, dst, time, err)
    ccall((:helicsEndpointSendStringToAt, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{Cchar}, HelicsTime, Ptr{HelicsError}), endpoint, message, dst, time, err)
end

function helicsEndpointSendStringAt(endpoint, message, time, err)
    ccall((:helicsEndpointSendStringAt, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, HelicsTime, Ptr{HelicsError}), endpoint, message, time, err)
end

function helicsEndpointSendBytes(endpoint, data, inputDataLength, err)
    ccall((:helicsEndpointSendBytes, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cvoid}, Cint, Ptr{HelicsError}), endpoint, data, inputDataLength, err)
end

function helicsEndpointSendBytesTo(endpoint, data, inputDataLength, dst, err)
    ccall((:helicsEndpointSendBytesTo, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cvoid}, Cint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, data, inputDataLength, dst, err)
end

function helicsEndpointSendBytesToAt(endpoint, data, inputDataLength, dst, time, err)
    ccall((:helicsEndpointSendBytesToAt, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cvoid}, Cint, Ptr{Cchar}, HelicsTime, Ptr{HelicsError}), endpoint, data, inputDataLength, dst, time, err)
end

function helicsEndpointSendBytesAt(endpoint, data, inputDataLength, time, err)
    ccall((:helicsEndpointSendBytesAt, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cvoid}, Cint, HelicsTime, Ptr{HelicsError}), endpoint, data, inputDataLength, time, err)
end

function helicsEndpointSendMessage(endpoint, message, err)
    ccall((:helicsEndpointSendMessage, libhelics), Cvoid, (HelicsEndpoint, HelicsMessage, Ptr{HelicsError}), endpoint, message, err)
end

function helicsEndpointSendMessageZeroCopy(endpoint, message, err)
    ccall((:helicsEndpointSendMessageZeroCopy, libhelics), Cvoid, (HelicsEndpoint, HelicsMessage, Ptr{HelicsError}), endpoint, message, err)
end

function helicsEndpointSubscribe(endpoint, key, err)
    ccall((:helicsEndpointSubscribe, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, key, err)
end

function helicsFederateHasMessage(fed)
    ccall((:helicsFederateHasMessage, libhelics), HelicsBool, (HelicsFederate,), fed)
end

function helicsEndpointHasMessage(endpoint)
    ccall((:helicsEndpointHasMessage, libhelics), HelicsBool, (HelicsEndpoint,), endpoint)
end

function helicsFederatePendingMessageCount(fed)
    ccall((:helicsFederatePendingMessageCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsEndpointPendingMessageCount(endpoint)
    ccall((:helicsEndpointPendingMessageCount, libhelics), Cint, (HelicsEndpoint,), endpoint)
end

function helicsEndpointGetMessage(endpoint)
    ccall((:helicsEndpointGetMessage, libhelics), HelicsMessage, (HelicsEndpoint,), endpoint)
end

function helicsEndpointCreateMessage(endpoint, err)
    ccall((:helicsEndpointCreateMessage, libhelics), HelicsMessage, (HelicsEndpoint, Ptr{HelicsError}), endpoint, err)
end

function helicsEndpointClearMessages(endpoint)
    ccall((:helicsEndpointClearMessages, libhelics), Cvoid, (HelicsEndpoint,), endpoint)
end

function helicsFederateGetMessage(fed)
    ccall((:helicsFederateGetMessage, libhelics), HelicsMessage, (HelicsFederate,), fed)
end

function helicsFederateCreateMessage(fed, err)
    ccall((:helicsFederateCreateMessage, libhelics), HelicsMessage, (HelicsFederate, Ptr{HelicsError}), fed, err)
end

function helicsFederateClearMessages(fed)
    ccall((:helicsFederateClearMessages, libhelics), Cvoid, (HelicsFederate,), fed)
end

function helicsEndpointGetType(endpoint)
    ccall((:helicsEndpointGetType, libhelics), Ptr{Cchar}, (HelicsEndpoint,), endpoint)
end

function helicsEndpointGetName(endpoint)
    ccall((:helicsEndpointGetName, libhelics), Ptr{Cchar}, (HelicsEndpoint,), endpoint)
end

function helicsFederateGetEndpointCount(fed)
    ccall((:helicsFederateGetEndpointCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsEndpointGetInfo(_end)
    ccall((:helicsEndpointGetInfo, libhelics), Ptr{Cchar}, (HelicsEndpoint,), _end)
end

function helicsEndpointSetInfo(endpoint, info, err)
    ccall((:helicsEndpointSetInfo, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, info, err)
end

function helicsEndpointGetTag(endpoint, tagname)
    ccall((:helicsEndpointGetTag, libhelics), Ptr{Cchar}, (HelicsEndpoint, Ptr{Cchar}), endpoint, tagname)
end

function helicsEndpointSetTag(endpoint, tagname, tagvalue, err)
    ccall((:helicsEndpointSetTag, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), endpoint, tagname, tagvalue, err)
end

function helicsEndpointSetOption(endpoint, option, value, err)
    ccall((:helicsEndpointSetOption, libhelics), Cvoid, (HelicsEndpoint, Cint, Cint, Ptr{HelicsError}), endpoint, option, value, err)
end

function helicsEndpointGetOption(endpoint, option)
    ccall((:helicsEndpointGetOption, libhelics), Cint, (HelicsEndpoint, Cint), endpoint, option)
end

function helicsEndpointAddSourceTarget(endpoint, targetEndpoint, err)
    ccall((:helicsEndpointAddSourceTarget, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, targetEndpoint, err)
end

function helicsEndpointAddDestinationTarget(endpoint, targetEndpoint, err)
    ccall((:helicsEndpointAddDestinationTarget, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, targetEndpoint, err)
end

function helicsEndpointRemoveTarget(endpoint, targetEndpoint, err)
    ccall((:helicsEndpointRemoveTarget, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, targetEndpoint, err)
end

function helicsEndpointAddSourceFilter(endpoint, filterName, err)
    ccall((:helicsEndpointAddSourceFilter, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, filterName, err)
end

function helicsEndpointAddDestinationFilter(endpoint, filterName, err)
    ccall((:helicsEndpointAddDestinationFilter, libhelics), Cvoid, (HelicsEndpoint, Ptr{Cchar}, Ptr{HelicsError}), endpoint, filterName, err)
end

function helicsMessageGetSource(message)
    ccall((:helicsMessageGetSource, libhelics), Ptr{Cchar}, (HelicsMessage,), message)
end

function helicsMessageGetDestination(message)
    ccall((:helicsMessageGetDestination, libhelics), Ptr{Cchar}, (HelicsMessage,), message)
end

function helicsMessageGetOriginalSource(message)
    ccall((:helicsMessageGetOriginalSource, libhelics), Ptr{Cchar}, (HelicsMessage,), message)
end

function helicsMessageGetOriginalDestination(message)
    ccall((:helicsMessageGetOriginalDestination, libhelics), Ptr{Cchar}, (HelicsMessage,), message)
end

function helicsMessageGetTime(message)
    ccall((:helicsMessageGetTime, libhelics), HelicsTime, (HelicsMessage,), message)
end

function helicsMessageGetString(message)
    ccall((:helicsMessageGetString, libhelics), Ptr{Cchar}, (HelicsMessage,), message)
end

function helicsMessageGetMessageID(message)
    ccall((:helicsMessageGetMessageID, libhelics), Cint, (HelicsMessage,), message)
end

function helicsMessageGetFlagOption(message, flag)
    ccall((:helicsMessageGetFlagOption, libhelics), HelicsBool, (HelicsMessage, Cint), message, flag)
end

function helicsMessageGetByteCount(message)
    ccall((:helicsMessageGetByteCount, libhelics), Cint, (HelicsMessage,), message)
end

function helicsMessageGetBytes(message, data, maxMessageLength, actualSize, err)
    ccall((:helicsMessageGetBytes, libhelics), Cvoid, (HelicsMessage, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{HelicsError}), message, data, maxMessageLength, actualSize, err)
end

function helicsMessageGetBytesPointer(message)
    ccall((:helicsMessageGetBytesPointer, libhelics), Ptr{Cvoid}, (HelicsMessage,), message)
end

function helicsMessageDataBuffer(message, err)
    ccall((:helicsMessageDataBuffer, libhelics), HelicsDataBuffer, (HelicsMessage, Ptr{HelicsError}), message, err)
end

function helicsMessageIsValid(message)
    ccall((:helicsMessageIsValid, libhelics), HelicsBool, (HelicsMessage,), message)
end

function helicsMessageSetSource(message, src, err)
    ccall((:helicsMessageSetSource, libhelics), Cvoid, (HelicsMessage, Ptr{Cchar}, Ptr{HelicsError}), message, src, err)
end

function helicsMessageSetDestination(message, dst, err)
    ccall((:helicsMessageSetDestination, libhelics), Cvoid, (HelicsMessage, Ptr{Cchar}, Ptr{HelicsError}), message, dst, err)
end

function helicsMessageSetOriginalSource(message, src, err)
    ccall((:helicsMessageSetOriginalSource, libhelics), Cvoid, (HelicsMessage, Ptr{Cchar}, Ptr{HelicsError}), message, src, err)
end

function helicsMessageSetOriginalDestination(message, dst, err)
    ccall((:helicsMessageSetOriginalDestination, libhelics), Cvoid, (HelicsMessage, Ptr{Cchar}, Ptr{HelicsError}), message, dst, err)
end

function helicsMessageSetTime(message, time, err)
    ccall((:helicsMessageSetTime, libhelics), Cvoid, (HelicsMessage, HelicsTime, Ptr{HelicsError}), message, time, err)
end

function helicsMessageResize(message, newSize, err)
    ccall((:helicsMessageResize, libhelics), Cvoid, (HelicsMessage, Cint, Ptr{HelicsError}), message, newSize, err)
end

function helicsMessageReserve(message, reserveSize, err)
    ccall((:helicsMessageReserve, libhelics), Cvoid, (HelicsMessage, Cint, Ptr{HelicsError}), message, reserveSize, err)
end

function helicsMessageSetMessageID(message, messageID, err)
    ccall((:helicsMessageSetMessageID, libhelics), Cvoid, (HelicsMessage, Int32, Ptr{HelicsError}), message, messageID, err)
end

function helicsMessageClearFlags(message)
    ccall((:helicsMessageClearFlags, libhelics), Cvoid, (HelicsMessage,), message)
end

function helicsMessageSetFlagOption(message, flag, flagValue, err)
    ccall((:helicsMessageSetFlagOption, libhelics), Cvoid, (HelicsMessage, Cint, HelicsBool, Ptr{HelicsError}), message, flag, flagValue, err)
end

function helicsMessageSetString(message, data, err)
    ccall((:helicsMessageSetString, libhelics), Cvoid, (HelicsMessage, Ptr{Cchar}, Ptr{HelicsError}), message, data, err)
end

function helicsMessageSetData(message, data, inputDataLength, err)
    ccall((:helicsMessageSetData, libhelics), Cvoid, (HelicsMessage, Ptr{Cvoid}, Cint, Ptr{HelicsError}), message, data, inputDataLength, err)
end

function helicsMessageSetDataBuffer(message, data, err)
    ccall((:helicsMessageSetDataBuffer, libhelics), Cvoid, (HelicsMessage, HelicsDataBuffer, Ptr{HelicsError}), message, data, err)
end

function helicsMessageAppendData(message, data, inputDataLength, err)
    ccall((:helicsMessageAppendData, libhelics), Cvoid, (HelicsMessage, Ptr{Cvoid}, Cint, Ptr{HelicsError}), message, data, inputDataLength, err)
end

function helicsMessageCopy(src_message, dst_message, err)
    ccall((:helicsMessageCopy, libhelics), Cvoid, (HelicsMessage, HelicsMessage, Ptr{HelicsError}), src_message, dst_message, err)
end

function helicsMessageClone(message, err)
    ccall((:helicsMessageClone, libhelics), HelicsMessage, (HelicsMessage, Ptr{HelicsError}), message, err)
end

function helicsMessageFree(message)
    ccall((:helicsMessageFree, libhelics), Cvoid, (HelicsMessage,), message)
end

function helicsMessageClear(message, err)
    ccall((:helicsMessageClear, libhelics), Cvoid, (HelicsMessage, Ptr{HelicsError}), message, err)
end

function helicsFederateRegisterFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterFilter, libhelics), HelicsFilter, (HelicsFederate, HelicsFilterTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, type, name, err)
end

function helicsFederateRegisterGlobalFilter(fed, type, name, err)
    ccall((:helicsFederateRegisterGlobalFilter, libhelics), HelicsFilter, (HelicsFederate, HelicsFilterTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, type, name, err)
end

function helicsFederateRegisterCloningFilter(fed, name, err)
    ccall((:helicsFederateRegisterCloningFilter, libhelics), HelicsFilter, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, name, err)
end

function helicsFederateRegisterGlobalCloningFilter(fed, name, err)
    ccall((:helicsFederateRegisterGlobalCloningFilter, libhelics), HelicsFilter, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, name, err)
end

function helicsCoreRegisterFilter(core, type, name, err)
    ccall((:helicsCoreRegisterFilter, libhelics), HelicsFilter, (HelicsCore, HelicsFilterTypes, Ptr{Cchar}, Ptr{HelicsError}), core, type, name, err)
end

function helicsCoreRegisterCloningFilter(core, name, err)
    ccall((:helicsCoreRegisterCloningFilter, libhelics), HelicsFilter, (HelicsCore, Ptr{Cchar}, Ptr{HelicsError}), core, name, err)
end

function helicsFederateGetFilterCount(fed)
    ccall((:helicsFederateGetFilterCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsFederateGetFilter(fed, name, err)
    ccall((:helicsFederateGetFilter, libhelics), HelicsFilter, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, name, err)
end

function helicsFederateGetFilterByIndex(fed, index, err)
    ccall((:helicsFederateGetFilterByIndex, libhelics), HelicsFilter, (HelicsFederate, Cint, Ptr{HelicsError}), fed, index, err)
end

function helicsFilterIsValid(filt)
    ccall((:helicsFilterIsValid, libhelics), HelicsBool, (HelicsFilter,), filt)
end

function helicsFilterGetName(filt)
    ccall((:helicsFilterGetName, libhelics), Ptr{Cchar}, (HelicsFilter,), filt)
end

function helicsFilterSet(filt, prop, val, err)
    ccall((:helicsFilterSet, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Cdouble, Ptr{HelicsError}), filt, prop, val, err)
end

function helicsFilterSetString(filt, prop, val, err)
    ccall((:helicsFilterSetString, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), filt, prop, val, err)
end

function helicsFilterGetPropertyDouble(filt, prop)
    ccall((:helicsFilterGetPropertyDouble, libhelics), Cdouble, (HelicsFilter, Ptr{Cchar}), filt, prop)
end

function helicsFilterGetPropertyString(filt, prop)
    ccall((:helicsFilterGetPropertyString, libhelics), Ptr{Cchar}, (HelicsFilter, Ptr{Cchar}), filt, prop)
end

function helicsFilterAddDestinationTarget(filt, dst, err)
    ccall((:helicsFilterAddDestinationTarget, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, dst, err)
end

function helicsFilterAddSourceTarget(filt, source, err)
    ccall((:helicsFilterAddSourceTarget, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, source, err)
end

function helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterAddDeliveryEndpoint, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, deliveryEndpoint, err)
end

function helicsFilterRemoveTarget(filt, target, err)
    ccall((:helicsFilterRemoveTarget, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, target, err)
end

function helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint, err)
    ccall((:helicsFilterRemoveDeliveryEndpoint, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, deliveryEndpoint, err)
end

function helicsFilterGetInfo(filt)
    ccall((:helicsFilterGetInfo, libhelics), Ptr{Cchar}, (HelicsFilter,), filt)
end

function helicsFilterSetInfo(filt, info, err)
    ccall((:helicsFilterSetInfo, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{HelicsError}), filt, info, err)
end

function helicsFilterGetTag(filt, tagname)
    ccall((:helicsFilterGetTag, libhelics), Ptr{Cchar}, (HelicsFilter, Ptr{Cchar}), filt, tagname)
end

function helicsFilterSetTag(filt, tagname, tagvalue, err)
    ccall((:helicsFilterSetTag, libhelics), Cvoid, (HelicsFilter, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), filt, tagname, tagvalue, err)
end

function helicsFilterSetOption(filt, option, value, err)
    ccall((:helicsFilterSetOption, libhelics), Cvoid, (HelicsFilter, Cint, Cint, Ptr{HelicsError}), filt, option, value, err)
end

function helicsFilterGetOption(filt, option)
    ccall((:helicsFilterGetOption, libhelics), Cint, (HelicsFilter, Cint), filt, option)
end

function helicsFederateRegisterTranslator(fed, type, name, err)
    ccall((:helicsFederateRegisterTranslator, libhelics), HelicsTranslator, (HelicsFederate, HelicsTranslatorTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, type, name, err)
end

function helicsFederateRegisterGlobalTranslator(fed, type, name, err)
    ccall((:helicsFederateRegisterGlobalTranslator, libhelics), HelicsTranslator, (HelicsFederate, HelicsTranslatorTypes, Ptr{Cchar}, Ptr{HelicsError}), fed, type, name, err)
end

function helicsCoreRegisterTranslator(core, type, name, err)
    ccall((:helicsCoreRegisterTranslator, libhelics), HelicsTranslator, (HelicsCore, HelicsTranslatorTypes, Ptr{Cchar}, Ptr{HelicsError}), core, type, name, err)
end

function helicsFederateGetTranslatorCount(fed)
    ccall((:helicsFederateGetTranslatorCount, libhelics), Cint, (HelicsFederate,), fed)
end

function helicsFederateGetTranslator(fed, name, err)
    ccall((:helicsFederateGetTranslator, libhelics), HelicsTranslator, (HelicsFederate, Ptr{Cchar}, Ptr{HelicsError}), fed, name, err)
end

function helicsFederateGetTranslatorByIndex(fed, index, err)
    ccall((:helicsFederateGetTranslatorByIndex, libhelics), HelicsTranslator, (HelicsFederate, Cint, Ptr{HelicsError}), fed, index, err)
end

function helicsTranslatorIsValid(trans)
    ccall((:helicsTranslatorIsValid, libhelics), HelicsBool, (HelicsTranslator,), trans)
end

function helicsTranslatorGetName(trans)
    ccall((:helicsTranslatorGetName, libhelics), Ptr{Cchar}, (HelicsTranslator,), trans)
end

function helicsTranslatorSet(trans, prop, val, err)
    ccall((:helicsTranslatorSet, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Cdouble, Ptr{HelicsError}), trans, prop, val, err)
end

function helicsTranslatorSetString(trans, prop, val, err)
    ccall((:helicsTranslatorSetString, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), trans, prop, val, err)
end

function helicsTranslatorAddInputTarget(trans, input, err)
    ccall((:helicsTranslatorAddInputTarget, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, input, err)
end

function helicsTranslatorAddPublicationTarget(trans, pub, err)
    ccall((:helicsTranslatorAddPublicationTarget, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, pub, err)
end

function helicsTranslatorAddSourceEndpoint(trans, ept, err)
    ccall((:helicsTranslatorAddSourceEndpoint, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, ept, err)
end

function helicsTranslatorAddDestinationEndpoint(trans, ept, err)
    ccall((:helicsTranslatorAddDestinationEndpoint, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, ept, err)
end

function helicsTranslatorRemoveTarget(trans, target, err)
    ccall((:helicsTranslatorRemoveTarget, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, target, err)
end

function helicsTranslatorGetInfo(trans)
    ccall((:helicsTranslatorGetInfo, libhelics), Ptr{Cchar}, (HelicsTranslator,), trans)
end

function helicsTranslatorSetInfo(trans, info, err)
    ccall((:helicsTranslatorSetInfo, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{HelicsError}), trans, info, err)
end

function helicsTranslatorGetTag(trans, tagname)
    ccall((:helicsTranslatorGetTag, libhelics), Ptr{Cchar}, (HelicsTranslator, Ptr{Cchar}), trans, tagname)
end

function helicsTranslatorSetTag(trans, tagname, tagvalue, err)
    ccall((:helicsTranslatorSetTag, libhelics), Cvoid, (HelicsTranslator, Ptr{Cchar}, Ptr{Cchar}, Ptr{HelicsError}), trans, tagname, tagvalue, err)
end

function helicsTranslatorSetOption(trans, option, value, err)
    ccall((:helicsTranslatorSetOption, libhelics), Cvoid, (HelicsTranslator, Cint, Cint, Ptr{HelicsError}), trans, option, value, err)
end

function helicsTranslatorGetOption(trans, option)
    ccall((:helicsTranslatorGetOption, libhelics), Cint, (HelicsTranslator, Cint), trans, option)
end

function helicsBrokerSetLoggingCallback(broker, logger, userdata, err)
    ccall((:helicsBrokerSetLoggingCallback, libhelics), Cvoid, (HelicsBroker, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), broker, logger, userdata, err)
end

function helicsCoreSetLoggingCallback(core, logger, userdata, err)
    ccall((:helicsCoreSetLoggingCallback, libhelics), Cvoid, (HelicsCore, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), core, logger, userdata, err)
end

function helicsFederateSetLoggingCallback(fed, logger, userdata, err)
    ccall((:helicsFederateSetLoggingCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, logger, userdata, err)
end

function helicsFilterSetCustomCallback(filter, filtCall, userdata, err)
    ccall((:helicsFilterSetCustomCallback, libhelics), Cvoid, (HelicsFilter, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), filter, filtCall, userdata, err)
end

function helicsTranslatorSetCustomCallback(translator, toMessageCall, toValueCall, userdata, err)
    ccall((:helicsTranslatorSetCustomCallback, libhelics), Cvoid, (HelicsTranslator, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), translator, toMessageCall, toValueCall, userdata, err)
end

function helicsFederateSetQueryCallback(fed, queryAnswer, userdata, err)
    ccall((:helicsFederateSetQueryCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, queryAnswer, userdata, err)
end

function helicsFederateSetTimeRequestEntryCallback(fed, requestTime, userdata, err)
    ccall((:helicsFederateSetTimeRequestEntryCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, requestTime, userdata, err)
end

function helicsFederateSetTimeUpdateCallback(fed, timeUpdate, userdata, err)
    ccall((:helicsFederateSetTimeUpdateCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, timeUpdate, userdata, err)
end

function helicsFederateSetStateChangeCallback(fed, stateChange, userdata, err)
    ccall((:helicsFederateSetStateChangeCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, stateChange, userdata, err)
end

function helicsFederateSetTimeRequestReturnCallback(fed, requestTimeReturn, userdata, err)
    ccall((:helicsFederateSetTimeRequestReturnCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, requestTimeReturn, userdata, err)
end

function helicsFederateInitializingEntryCallback(fed, initializingEntry, userdata, err)
    ccall((:helicsFederateInitializingEntryCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, initializingEntry, userdata, err)
end

function helicsFederateExecutingEntryCallback(fed, executingEntry, userdata, err)
    ccall((:helicsFederateExecutingEntryCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, executingEntry, userdata, err)
end

function helicsFederateCosimulationTerminationCallback(fed, cosimTermination, userdata, err)
    ccall((:helicsFederateCosimulationTerminationCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, cosimTermination, userdata, err)
end

function helicsFederateErrorHandlerCallback(fed, errorHandler, userdata, err)
    ccall((:helicsFederateErrorHandlerCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, errorHandler, userdata, err)
end

function helicsCallbackFederateNextTimeCallback(fed, timeUpdate, userdata, err)
    ccall((:helicsCallbackFederateNextTimeCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, timeUpdate, userdata, err)
end

function helicsCallbackFederateNextTimeIterativeCallback(fed, timeUpdate, userdata, err)
    ccall((:helicsCallbackFederateNextTimeIterativeCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, timeUpdate, userdata, err)
end

function helicsCallbackFederateInitializeCallback(fed, initialize, userdata, err)
    ccall((:helicsCallbackFederateInitializeCallback, libhelics), Cvoid, (HelicsFederate, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{HelicsError}), fed, initialize, userdata, err)
end

function helicsQueryBufferFill(buffer, queryResult, strSize, err)
    ccall((:helicsQueryBufferFill, libhelics), Cvoid, (HelicsQueryBuffer, Ptr{Cchar}, Cint, Ptr{HelicsError}), buffer, queryResult, strSize, err)
end

