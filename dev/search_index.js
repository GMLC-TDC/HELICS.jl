var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "HELICS.jl",
    "title": "HELICS.jl",
    "category": "page",
    "text": ""
},

{
    "location": "#HELICS.jl-1",
    "page": "HELICS.jl",
    "title": "HELICS.jl",
    "category": "section",
    "text": "HELICS.jl is a Julia wrapper for the HELICS package."
},

{
    "location": "#Installation-1",
    "page": "HELICS.jl",
    "title": "Installation",
    "category": "section",
    "text": "For now, this package is registered, so you can use the following to install:Open the package manager REPL (using ])(v1.1) pkg> add HELICSTo install the latest development version, use the following from within Julia:(v1.1) pkg> dev HELICSThis package includes HELICS as a library. You do not have to install HELICS separately.Note that this should work on 32- and 64-bit Windows systems and 64-bit Linux and Mac systems."
},

{
    "location": "api/#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api/#HELICS.helicsBrokerClone-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerClone",
    "category": "method",
    "text": "helicsBrokerClone(broker::HELICS.Broker) -> HELICS.Broker\n\n\nCreate a new reference to an existing broker\n\nthis will create a new broker object that references the existing broker it must be freed as well\n\nArguments\n\nbroker: an existing helics_broker\n\nReturns\n\na new reference to the same broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerDataLink-Tuple{HELICS.Broker,String,String}",
    "page": "API",
    "title": "HELICS.helicsBrokerDataLink",
    "category": "method",
    "text": "helicsBrokerDataLink(broker::HELICS.Broker, source::String, target::String)\n\n\nLink a named publication and named input using a broker\n\nArguments\n\nbroker: the broker to generate the connection from\nsource: the name of the publication (cannot be NULL)\ntarget: the name of the target to send the publication data (cannot be NULL)\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerDestroy-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerDestroy",
    "category": "method",
    "text": "helicsBrokerDestroy(broker::HELICS.Broker)\n\n\nDisconnect and free a broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerDisconnect-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerDisconnect",
    "category": "method",
    "text": "helicsBrokerDisconnect(broker::HELICS.Broker)\n\n\nDisconnect a broker\n\nArguments\n\nbroker: the broker to disconnect\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerFree-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerFree",
    "category": "method",
    "text": "helicsBrokerFree(broker::HELICS.Broker)\n\n\nRelease the memory associated with a broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerGetAddress-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerGetAddress",
    "category": "method",
    "text": "helicsBrokerGetAddress(broker::HELICS.Broker) -> String\n\n\nGet the network address associated with a broker\n\nArguments\n\nbroker: the broker to query\n\nReturns\n\na string with the network address of the broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerGetIdentifier-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerGetIdentifier",
    "category": "method",
    "text": "helicsBrokerGetIdentifier(broker::HELICS.Broker) -> String\n\n\nGet an identifier for the broker\n\nArguments\n\nbroker: the broker to query\n\nReturns\n\na string containing the identifier for the broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerIsConnected-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerIsConnected",
    "category": "method",
    "text": "helicsBrokerIsConnected(broker::HELICS.Broker) -> Bool\n\n\nCheck if a broker is connected. A connected broker implies is attached to cores or cores could reach out to communicate. return 0 if not connected , something else if it is connected.\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerIsValid-Tuple{HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsBrokerIsValid",
    "category": "method",
    "text": "helicsBrokerIsValid(broker::HELICS.Broker) -> Bool\n\n\nCheck if a broker object is a valid object\n\nArguments\n\nbroker: the helics_broker object to test\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerSetGlobal-Tuple{HELICS.Broker,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsBrokerSetGlobal",
    "category": "method",
    "text": "helicsBrokerSetGlobal(broker::HELICS.Broker, valueName::Any, value::Any)\n\n\nSet a federation global value\n\nthis overwrites any previous value for this name\n\nArguments\n\nbroker: the broker to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerWaitForDisconnect-Tuple{HELICS.Broker,Any}",
    "page": "API",
    "title": "HELICS.helicsBrokerWaitForDisconnect",
    "category": "method",
    "text": "helicsBrokerWaitForDisconnect(broker::HELICS.Broker, msToWait::Any) -> Bool\n\n\nWait for the broker to disconnect\n\nArguments\n\nbroker: the broker to wait for\nmsToWait: the time out in millisecond (<0 for infinite timeout)\n\nReturns\n\ntrue if the disconnect was successful, false if there was a timeout\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCleanupLibrary-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsCleanupLibrary",
    "category": "method",
    "text": "helicsCleanupLibrary()\n\n\nFunction to do some housekeeping work\n\nthis runs some cleanup routines and tries to close out any residual thread that haven\'t been shutdown yet.\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCloseLibrary-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsCloseLibrary",
    "category": "method",
    "text": "helicsCloseLibrary()\n\n\nCall when done using the helics library,  this function will ensure the threads are closed properly if possible     this should be the last call before exiting,\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreAddSourceFilterToEndpoint-Tuple{HELICS.Core,Any,HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsCoreAddSourceFilterToEndpoint",
    "category": "method",
    "text": "helicsCoreAddSourceFilterToEndpoint(core::HELICS.Core, filter::Any, endpoint::HELICS.Endpoint)\n\n\nLink a named filter to a source endpoint\n\nArguments\n\ncore: the core to generate the connection from\nfilter: the name of the filter (cannot be NULL)\nendpoint: the name of the endpoint to filter the data from (cannot be NULL)\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreClone-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreClone",
    "category": "method",
    "text": "helicsCoreClone(core::HELICS.Core) -> HELICS.Core\n\n\nCreate a new reference to an existing core\n\nthis will create a new broker object that references the existing broker it must be freed as well\n\nArguments\n\ncore: an existing helics_core\n\nReturns\n\na new reference to the same Core\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreDataLink-Tuple{HELICS.Core,String,String}",
    "page": "API",
    "title": "HELICS.helicsCoreDataLink",
    "category": "method",
    "text": "helicsCoreDataLink(core::HELICS.Core, source::String, target::String)\n\n\nLink a named publication and named input using a core\n\nArguments\n\ncore: the core to generate the connection from\nsource: the name of the publication (cannot be NULL)\ntarget: the named of the target to send the publication data (cannot be NULL)\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreDestroy-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreDestroy",
    "category": "method",
    "text": "helicsCoreDestroy(core::HELICS.Core)\n\n\nDisconnect and free a core\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreDisconnect-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreDisconnect",
    "category": "method",
    "text": "helicsCoreDisconnect(core::HELICS.Core)\n\n\nGet an identifier for the core\n\nArguments\n\ncore: the core to query\n\nReturns\n\na void enumeration indicating any error condition\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreFree-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreFree",
    "category": "method",
    "text": "helicsCoreFree(core::HELICS.Core)\n\n\nRelease the memory associated with a core\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreGetIdentifier-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreGetIdentifier",
    "category": "method",
    "text": "helicsCoreGetIdentifier(core::HELICS.Core) -> String\n\n\nGet an identifier for the core\n\nArguments\n\ncore: the core to query\n\nReturns\n\na string with the identifier of the core\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreIsConnected-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreIsConnected",
    "category": "method",
    "text": "helicsCoreIsConnected(core::HELICS.Core) -> Bool\n\n\nCheck if a core is connected. A connected core implies is attached to federate or federates could be attached to it.\n\nReturns\n\nfalse if not connected, true if it is connected\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreIsValid-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreIsValid",
    "category": "method",
    "text": "helicsCoreIsValid(core::HELICS.Core) -> Bool\n\n\nCheck if a core object is a valid object\n\nArguments\n\ncore: the helics_core object to test\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreSetGlobal-Tuple{HELICS.Core,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsCoreSetGlobal",
    "category": "method",
    "text": "helicsCoreSetGlobal(core::HELICS.Core, valueName::Any, value::Any)\n\n\nSet a global value in a core\n\nthis overwrites any previous value for this name\n\nArguments\n\ncore: the core to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreSetReadyToInit-Tuple{HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsCoreSetReadyToInit",
    "category": "method",
    "text": "helicsCoreSetReadyToInit(core::HELICS.Core)\n\n\nSet the core to ready for init\n\nthis function is used for cores that have filters but no federates so there needs to be a direct signal to the core to trigger the federation initialization\n\nArguments\n\n`core`: the core object to enable init values for\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateBroker-Tuple{String,String,String}",
    "page": "API",
    "title": "HELICS.helicsCreateBroker",
    "category": "method",
    "text": "helicsCreateBroker(kind::String, name::String, initString::String) -> HELICS.Broker\n\n\nCreate a broker object\n\nArguments\n\ntype: the type of the broker to create\nname: the name of the broker , may be a nullptr or empty string to have a name automatically assigned\ninitString: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  –broker=\"XSSAF\" if this is a subbroker or the number of federates or the address\n\nReturns\n\na helics_broker object, will be NULL if there was an error indicated in the err object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCombinationFederate-Tuple{String,HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsCreateCombinationFederate",
    "category": "method",
    "text": "helicsCreateCombinationFederate(fedName::String, fi::HELICS.FederateInfo) -> HELICS.CombinationFederate\n\n\nCreate a combination federate from a federate info object\n\ncombination federates are both value federates and message federates, objects can be used in all functions that take a helicsfederate, helicsmessagefederate or helicsfederate object as an argument\n\nArguments\n\nfedName: a string with the name of the federate, can be NULL or an empty string to pull the default name from fi\nfi: the federate info object that contains details on the federate\n\nReturns\n\nan opaque value federate object nullptr if the object creation failed\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCombinationFederateFromConfig-Tuple{Any}",
    "page": "API",
    "title": "HELICS.helicsCreateCombinationFederateFromConfig",
    "category": "method",
    "text": "helicsCreateCombinationFederateFromConfig(configFile::Any) -> HELICS.CombinationFederate\n\n\nCreate a combination federate from a JSON file or JSON string\n\ncombination federates are both value federates and message federates, objects can be used in all functions that take a helicsfederate, helicsmessagefederate or helicsfederate object as an argument\n\nArguments\n\nconfigFile:  a JSON file or a JSON string or TOML file that contains setup and configuration information\n\nReturns\n\nan opaque combination federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCore-Tuple{String,String,String}",
    "page": "API",
    "title": "HELICS.helicsCreateCore",
    "category": "method",
    "text": "helicsCreateCore(kind::String, name::String, initString::String) -> HELICS.Core\n\n\nCreate a core object\n\nArguments\n\ntype: the type of the core to create\nname: the name of the core , may be a nullptr or empty string to have a name automatically assigned\ninitString: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  –broker=\"XSSAF\" or the number of federates or the address\n\nReturns\n\na helics_core object if the core is invalid err will contain some indication\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateFederateInfo-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsCreateFederateInfo",
    "category": "method",
    "text": "helicsCreateFederateInfo() -> HELICS.FederateInfo\n\n\nCreate a federate info object for specifying federate information when constructing a federate\n\nReturns\n\na helicsfederateinfo object which is a reference to the created object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateMessageFederate-Tuple{String,HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsCreateMessageFederate",
    "category": "method",
    "text": "helicsCreateMessageFederate(fedName::String, fi::HELICS.FederateInfo) -> HELICS.MessageFederate\n\n\nCreate a message federate from a federate info object\n\nhelicsmessagefederate objects can be used in all functions that take a helicsmessagefederate or helics_federate object as an argument\n\nArguments\n\nfedName: the name of the federate to create\nfi: the federate info object that contains details on the federate\n\nReturns\n\nan opaque message federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateMessageFederateFromConfig-Tuple{Any}",
    "page": "API",
    "title": "HELICS.helicsCreateMessageFederateFromConfig",
    "category": "method",
    "text": "helicsCreateMessageFederateFromConfig(configFile::Any) -> HELICS.MessageFederate\n\n\nCreate a message federate from a JSON file or JSON string or TOML file\n\nhelicsmessagefederate objects can be used in all functions that take a helicsmessagefederate or helics_federate object as an argument\n\nArguments\n\nconfigFile:  a Config(JSON,TOML) file or a JSON string that contains setup and configuration information\n\nReturns\n\nan opaque message federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateQuery-Tuple{String,String}",
    "page": "API",
    "title": "HELICS.helicsCreateQuery",
    "category": "method",
    "text": "helicsCreateQuery(target::String, query::String) -> HELICS.Query\n\n\nCreate a query object\n\na query object consists of a target and query string\n\nArguments\n\ntarget: the name of the target to query\nquery: the query to make of the target\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateValueFederate-Tuple{String,HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsCreateValueFederate",
    "category": "method",
    "text": "helicsCreateValueFederate(fedName::String, fi::HELICS.FederateInfo) -> HELICS.ValueFederate\n\n\nCreate a value federate from a federate info object\n\nhelicsfederate objects can be used in all functions that take a helicsfederate or helics_federate object as an argument\n\nArguments\n\nfedName: the name of the federate to create, can NULL or an empty string to use the default name from fi or an assigned name\nfi: the federate info object that contains details on the federate\n\nReturns\n\nan opaque value federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateValueFederateFromConfig-Tuple{Any}",
    "page": "API",
    "title": "HELICS.helicsCreateValueFederateFromConfig",
    "category": "method",
    "text": "helicsCreateValueFederateFromConfig(configFile::Any) -> HELICS.ValueFederate\n\n\nCreate a value federate from a JSON file, JSON string, or TOML file\n\nhelicsfederate objects can be used in all functions that take a helicsfederate or helics_federate object as an argument\n\nArguments\n\nconfigFile:  a JSON file or a JSON string or TOML file that contains setup and configuration information\n\nReturns\n\nan opaque value federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsErrorClear-Tuple{HELICS.Lib.helics_error}",
    "page": "API",
    "title": "HELICS.helicsErrorClear",
    "category": "method",
    "text": "helicsErrorClear(err::HELICS.Lib.helics_error)\n\n\nClear an error object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsErrorInitialize-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsErrorInitialize",
    "category": "method",
    "text": "helicsErrorInitialize() -> HELICS.Lib.helics_error\n\n\nReturn an initialized error object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateClone-Union{Tuple{T}, Tuple{T}} where T<:HELICS.Federate",
    "page": "API",
    "title": "HELICS.helicsFederateClone",
    "category": "method",
    "text": "helicsFederateClone(fed::T<:HELICS.Federate) -> Union{CombinationFederate, MessageFederate, ValueFederate}\n\n\nCreate a new reference to an existing federate\n\nthis will create a new helics_federate object that references the existing federate it must be freed as well\n\nArguments\n\nfed: an existing helics_federate\n\nReturns\n\na new reference to the same federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateDestroy-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateDestroy",
    "category": "method",
    "text": "helicsFederateDestroy(fed::HELICS.Federate)\n\n\nDisconnect and free a broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingMode-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingMode",
    "category": "method",
    "text": "helicsFederateEnterExecutingMode(fed::HELICS.Federate)\n\n\nRequest that the federate enter the Execution mode\n\nthis call is blocking until granted entry by the core object for an asynchronous alternative call /ref helicsFederateEnterExecutingModeAsync  on return from this call the federate will be at time 0.\n\nArguments\n\nfed: a federate to change modes\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingModeAsync-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeAsync",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeAsync(fed::HELICS.Federate)\n\n\nRequest that the federate enter the Execution mode\n\nthis call is non-blocking and will return immediately call /ref helicsFederateEnterExecutingModeComplete to finish the call sequence /ref helicsFederateEnterExecutingModeComplete.\n\nArguments\n\nfed: the federate object to complete the call\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingModeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeComplete",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeComplete(fed::HELICS.Federate)\n\n\nComplete the call to /ref EnterExecutingModeAsync\n\nArguments\n\nfed: the federate object to complete the call\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingModeIterative-Tuple{HELICS.Federate,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeIterative",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeIterative(fed::HELICS.Federate, iterate::Any) -> HELICS.Lib.helics_iteration_result\n\n\nRequest an iterative time\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time and iteration request and return a time and iteration status.\n\nArguments\n\nfed: the federate to make the request of\niterate: the requested iteration mode\n\nReturns\n\nan iteration structure with field containing the time and iteration status\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingModeIterativeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeIterativeComplete",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeIterativeComplete(fed::HELICS.Federate) -> HELICS.Lib.helics_iteration_result\n\n\nComplete the asynchronous iterative call into ExecutionModel\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nan iteration object containing the iteration time and iteration_status\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterInitializingMode-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterInitializingMode",
    "category": "method",
    "text": "helicsFederateEnterInitializingMode(fed::HELICS.Federate)\n\n\nEnter the initialization state of a federate\n\nthe initialization state allows initial values to be set and received if the iteration is requested on entry to the execution state. This is a blocking call and will block until the core allows it to proceed.\n\nArguments\n\nfed: the federate to operate on\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterInitializingModeAsync-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterInitializingModeAsync",
    "category": "method",
    "text": "helicsFederateEnterInitializingModeAsync(fed::HELICS.Federate)\n\n\nNon blocking alternative to  ef helicsFederateEnterInitializingMode     the function helicsFederateEnterInitializationModeFinalize must be called to finish the operation\n\nArguments\n\nfed: the federate to operate on\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterInitializingModeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterInitializingModeComplete",
    "category": "method",
    "text": "helicsFederateEnterInitializingModeComplete(fed::HELICS.Federate)\n\n\nFinalize the entry to initialize mode that was initiated with /ref heliceEnterInitializingModeAsync\n\nArguments\n\nfed: the federate desiring to complete the initialization step function\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateFinalize-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateFinalize",
    "category": "method",
    "text": "helicsFederateFinalize(fed::HELICS.Federate)\n\n\nFinalize the federate this function halts all communication in the federate and disconnects it from the core\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateFinalizeAsync-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateFinalizeAsync",
    "category": "method",
    "text": "helicsFederateFinalizeAsync(fed::HELICS.Federate)\n\n\nFinalize the federate in an async call\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateFinalizeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateFinalizeComplete",
    "category": "method",
    "text": "helicsFederateFinalizeComplete(fed::HELICS.Federate)\n\n\nComplete the asynchronous finalize call\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateFree-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateFree",
    "category": "method",
    "text": "helicsFederateFree(fed::HELICS.Federate)\n\n\nRelease the memory associated withe a federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetCoreObject-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetCoreObject",
    "category": "method",
    "text": "helicsFederateGetCoreObject(fed::HELICS.Federate) -> HELICS.Core\n\n\nGet the core object associated with a federate\n\nArguments\n\nfed: a federate object\n\nReturns\n\na core object, nullptr if invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetCurrentTime-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetCurrentTime",
    "category": "method",
    "text": "helicsFederateGetCurrentTime(fed::HELICS.Federate) -> Float64\n\n\nGet the current time of the federate\n\nArguments\n\nfed: the federate object to query\n\nReturns\n\nthe current time of the federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetFlagOption-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetFlagOption",
    "category": "method",
    "text": "helicsFederateGetFlagOption(fed::HELICS.Federate, flag::Int64) -> Bool\n\n\nGet a flag value for a federate\n\nArguments\n\nfed: the federate to get the flag for\nflag: the flag to query\n\nReturns\n\nthe value of the flag\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetIntegerProperty-Tuple{HELICS.Federate,HELICS.Lib.helics_properties}",
    "page": "API",
    "title": "HELICS.helicsFederateGetIntegerProperty",
    "category": "method",
    "text": "helicsFederateGetIntegerProperty(fed::HELICS.Federate, intProperty::HELICS.Lib.helics_properties) -> Int32\n\n\nSet the logging level for the federate\n\ndebug and trace only do anything if they were enabled in the compilation\n\nArguments\n\nfed: the federate to get the flag for\nintProperty: a code for the property to set /ref helicshandleoptions\n\nReturns\n\nthe value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetName-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetName",
    "category": "method",
    "text": "helicsFederateGetName(fed::HELICS.Federate) -> String\n\n\nGet the name of the federate\n\nArguments\n\nfed: the federate object to query\n\nReturns\n\na pointer to a string with the name\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetState-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetState",
    "category": "method",
    "text": "helicsFederateGetState(fed::HELICS.Federate) -> Int64\n\n\nGet the current state of a federate\n\nArguments\n\nfed: the fed to query\n\nReturns\n\nstate the resulting state if void return helics_ok\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetTimeProperty-Tuple{HELICS.Federate,HELICS.Lib.helics_properties}",
    "page": "API",
    "title": "HELICS.helicsFederateGetTimeProperty",
    "category": "method",
    "text": "helicsFederateGetTimeProperty(fed::HELICS.Federate, timeProperty::HELICS.Lib.helics_properties) -> Float64\n\n\nGet the current value of a time based property in a federate\n\nArguments\n\nfed: the federate query\ntimeProperty: the property to query\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoClone-Tuple{HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoClone",
    "category": "method",
    "text": "helicsFederateInfoClone(fi::HELICS.FederateInfo) -> HELICS.FederateInfo\n\n\nCreate a federate info object from an existing one and clone the information\n\nArguments\n\nfi: a federateInfo object to duplicate\n\nReturns\n\na helicsfederateinfo object which is a reference to the created object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoFree-Tuple{HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoFree",
    "category": "method",
    "text": "helicsFederateInfoFree(fi::HELICS.FederateInfo)\n\n\nDelete the memory associated with a federate info object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoLoadFromArgs-Tuple{HELICS.FederateInfo,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoLoadFromArgs",
    "category": "method",
    "text": "helicsFederateInfoLoadFromArgs(fi::HELICS.FederateInfo, argc::Any, argv::Any)\n\n\nLoad a federate info from command line arguments\n\nArguments\n\nfi: a federateInfo object\nargc: the number of command line arguments\nargv: an array of strings from the command line\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetBroker-Tuple{HELICS.FederateInfo,HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetBroker",
    "category": "method",
    "text": "helicsFederateInfoSetBroker(fi::HELICS.FederateInfo, broker::HELICS.Broker)\n\n\nSet the name or connection information for a broker\n\nthis is only used if the core is automatically created, the broker information will be transferred to the core for connection\n\nArguments\n\nfi: the federate info object to alter\nbroker: a string which defined the connection information for a broker either a name or an address\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetBrokerPort-Tuple{HELICS.FederateInfo,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetBrokerPort",
    "category": "method",
    "text": "helicsFederateInfoSetBrokerPort(fi::HELICS.FederateInfo, brokerPort::Int64)\n\n\nSet the port to use for the broker\n\nthis is only used if the core is automatically created, the broker information will be transferred to the core for connection this will only be useful for network broker connections\n\nArguments\n\nfi: the federate info object to alter\nbrokerPort: the integer port number to use for connection with a broker\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetCoreInitString-Tuple{HELICS.FederateInfo,String}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreInitString",
    "category": "method",
    "text": "helicsFederateInfoSetCoreInitString(fi::HELICS.FederateInfo, coreInit::String)\n\n\nSet the initialization string for the core usually in the form of command line arguments\n\nArguments\n\nfi: the federate info object to alter\ncoreInit: a string with the core initialization strings\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetCoreName-Tuple{HELICS.FederateInfo,String}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreName",
    "category": "method",
    "text": "helicsFederateInfoSetCoreName(fi::HELICS.FederateInfo, corename::String)\n\n\nSet the name of the core to link to for a federate\n\nArguments\n\nfi: the federate info object to alter\ncorename: the identifier for a core to link to\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetCoreType-Tuple{HELICS.FederateInfo,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreType",
    "category": "method",
    "text": "helicsFederateInfoSetCoreType(fi::HELICS.FederateInfo, coretype::Int64)\n\n\nSet the core type by integer code\n\nvalid values available by definitions in api-data.h\n\nArguments\n\nfi: the federate info object to alter\ncoretype: an numerical code for a core type see /ref helicscoretype\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetCoreTypeFromString-Tuple{HELICS.FederateInfo,String}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreTypeFromString",
    "category": "method",
    "text": "helicsFederateInfoSetCoreTypeFromString(fi::HELICS.FederateInfo, coretype::String)\n\n\nSet the core type from a string\n\nArguments\n\nfi: the federate info object to alter\ncoretype: a string naming a core type\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetFlagOption-Tuple{HELICS.FederateInfo,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetFlagOption",
    "category": "method",
    "text": "helicsFederateInfoSetFlagOption(fi::HELICS.FederateInfo, flag::Int64, value::Bool)\n\n\nSet a flag in the info structure\n\nvalid flags are available /ref helicsfederateflags\n\nArguments\n\nfi: the federate info object to alter\nflag: a numerical index for a flag\nvalue: the desired value of the flag true or false\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetLocalPort-Tuple{HELICS.FederateInfo,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetLocalPort",
    "category": "method",
    "text": "helicsFederateInfoSetLocalPort(fi::HELICS.FederateInfo, localPort::Int64)\n\n\nSet the local port to use\n\nthis is only used if the core is automatically created, the port information will be transferred to the core for connection\n\nArguments\n\nfi: the federate info object to alter\nlocalPort: a string with the port information to use as the local server port can be a number or \"auto\" or \"os_local\"\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetSeparator-Tuple{HELICS.FederateInfo,Char}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetSeparator",
    "category": "method",
    "text": "helicsFederateInfoSetSeparator(fi::HELICS.FederateInfo, separator::Char)\n\n\nSet the separator character in the info structure\n\nthe separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is \'/\'  then a local endpoint would have a globally reachable name of fedName/localName\n\nArguments\n\nfi: the federate info object to alter\nseparator: the character to use as a separator\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateIsAsyncOperationCompleted-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateIsAsyncOperationCompleted",
    "category": "method",
    "text": "helicsFederateIsAsyncOperationCompleted(fed::HELICS.Federate) -> Bool\n\n\nCheck if the current Asynchronous operation has completed\n\nArguments\n\nfed: the federate to operate on\n\nReturns\n\nfalse if not completed, true if completed\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateIsValid-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateIsValid",
    "category": "method",
    "text": "helicsFederateIsValid(fed::HELICS.Federate) -> Bool\n\n\nCheck if a federate_object is valid\n\nReturns\n\ntrue if the federate is a valid active federate, false otherwise\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterInterfaces-Tuple{HELICS.Federate,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterInterfaces",
    "category": "method",
    "text": "helicsFederateRegisterInterfaces(fed::HELICS.Federate, file::Any)\n\n\nLoad interfaces from a file\n\nArguments\n\nfed: the federate to which to load interfaces\nfile: the name of a file to load the interfaces from either JSON, or TOML\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestNextStep-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestNextStep",
    "category": "method",
    "text": "helicsFederateRequestNextStep(fed::HELICS.Federate) -> Float64\n\n\nRequest the next time step for federate execution\n\nfeds should have setup the period or minDelta for this to work well but it will request the next time step which is the current time plus the minimum time step.\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nthe time granted to the federate   invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTime-Tuple{HELICS.Federate,Float64}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTime",
    "category": "method",
    "text": "helicsFederateRequestTime(fed::HELICS.Federate, requestTime::Float64) -> Float64\n\n\nRequest the next time for federate execution\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next requested time\n\nReturns\n\nthe time granted to the federate   invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeAsync-Tuple{HELICS.Federate,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeAsync",
    "category": "method",
    "text": "helicsFederateRequestTimeAsync(fed::HELICS.Federate, requestTime::Any)\n\n\nRequest the next time for federate execution in an asynchronous call\n\ncall /ref helicsFederateRequestTimeComplete to finish the call\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next requested time\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeComplete",
    "category": "method",
    "text": "helicsFederateRequestTimeComplete(fed::HELICS.Federate) -> Float64\n\n\nComplete an asynchronous requestTime call\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nthe time granted to the federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterative-Tuple{HELICS.Federate,Any,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterative",
    "category": "method",
    "text": "helicsFederateRequestTimeIterative(fed::HELICS.Federate, requestTime::Any, iterate::Any, outIterate::Any) -> Float64\n\n\nRequest an iterative time\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time and iteration request and return a time and iteration status.\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next desired time\niterate: the requested iteration mode\noutIterate: the iteration specification of the result\n\nReturns\n\nthe granted time\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterativeAsync-Tuple{HELICS.Federate,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterativeAsync",
    "category": "method",
    "text": "helicsFederateRequestTimeIterativeAsync(fed::HELICS.Federate, requestTime::Any, iterate::Any)\n\n\nRequest an iterative time through an asynchronous call\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time an iteration request and returns a time and iteration status call /ref helicsFederateRequestTimeIterativeComplete to finish the process.\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next desired time\niterate: the requested iteration mode\n\nReturns\n\na void object with a return code of the result\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterativeComplete-Tuple{HELICS.Federate,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterativeComplete",
    "category": "method",
    "text": "helicsFederateRequestTimeIterativeComplete(fed::HELICS.Federate, outIterate::Any) -> Float64\n\n\nComplete an iterative time request asynchronous call\n\nArguments\n\nfed: the federate to make the request of\noutIterate  the iteration specification of the result\n\nReturns\n\nthe granted time\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetFlagOption-Tuple{HELICS.Federate,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsFederateSetFlagOption",
    "category": "method",
    "text": "helicsFederateSetFlagOption(fed::HELICS.Federate, flag::Int64, flagValue::Bool)\n\n\nSet a flag for the federate\n\nArguments\n\nfed: the federate to alter a flag for\nflag: the flag to change\nflagValue: the new value of the flag 0 for false !=0 for true\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetGlobal-Tuple{HELICS.Federate,Any,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateSetGlobal",
    "category": "method",
    "text": "helicsFederateSetGlobal(fed::HELICS.Federate, valueName::Any, value::Any)\n\n\nSet a federation global value through a federate\n\nthis overwrites any previous value for this name\n\nArguments\n\nfed: the federate to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetIntegerProperty-Tuple{HELICS.Federate,HELICS.Lib.helics_properties,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateSetIntegerProperty",
    "category": "method",
    "text": "helicsFederateSetIntegerProperty(fed::HELICS.Federate, intProperty::HELICS.Lib.helics_properties, propertyVal::Any)\n\n\nSet an integer based property of a federate\n\nArguments\n\nfed: the federate to change the property for\nintProperty: the property to set\npropertyVal: the value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetSeparator-Tuple{HELICS.Federate,Any}",
    "page": "API",
    "title": "HELICS.helicsFederateSetSeparator",
    "category": "method",
    "text": "helicsFederateSetSeparator(fed::HELICS.Federate, separator::Any)\n\n\nSet the separator character in a federate\n\nthe separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is \'/\'  then a local endpoint would have a globally reachable name of fedName/localName.\n\nArguments\n\nfed: the federate info object to alter\nseparator: the character to use as a separator\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetTimeProperty-Tuple{HELICS.Federate,HELICS.Lib.helics_properties,Float64}",
    "page": "API",
    "title": "HELICS.helicsFederateSetTimeProperty",
    "category": "method",
    "text": "helicsFederateSetTimeProperty(fed::HELICS.Federate, timeProperty::HELICS.Lib.helics_properties, time::Float64)\n\n\nSet a time based property for a federate\n\nArguments\n\nfed: the federate object set the property for\ntimeProperty: a integer code for a time property\ntime: the requested value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetFederateByName-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsGetFederateByName",
    "category": "method",
    "text": "helicsGetFederateByName(fedName::String) -> HELICS.CombinationFederate\n\n\nGet an existing federate object from a core by name\n\nthe federate must have been created by one of the other functions and at least one of the objects referencing the created     federate must still be active in the process\n\nArguments\n\n`fedName`: the name of the federate to retrieve\n\nReturns\n\nNULL if no fed is available by that name otherwise a helics_federate with that name\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetOptionIndex-Tuple{Any}",
    "page": "API",
    "title": "HELICS.helicsGetOptionIndex",
    "category": "method",
    "text": "helicsGetOptionIndex(val::Any) -> Int32\n\n\nGet an option index for use in /ref helicsPublicationSetOption, /ref helicsInputSetOption, /ref helicsEndpointSetOption, /ref     helicsFilterSetOption, and the corresponding get functions\n\nArguments\n\nval: a string with the option name\n\nReturns\n\nan int with the option index (-1) if not a valid property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetPropertyIndex-Tuple{Any}",
    "page": "API",
    "title": "HELICS.helicsGetPropertyIndex",
    "category": "method",
    "text": "helicsGetPropertyIndex(val::Any) -> Int32\n\n\nGet a property index for use in /ref helicsFederateInfoSetFlagOption, /ref helicsFederateInfoSetTimeProperty,     helicsFederateInfoSetIntegerProperty\n\nArguments\n\nval: a string with the property name\n\nReturns\n\nan int with the property code (-1) if not a valid property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetVersion-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsGetVersion",
    "category": "method",
    "text": "helicsGetVersion() -> String\n\n\nGet a version string for HELICS\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsIsCoreTypeAvailable-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsIsCoreTypeAvailable",
    "category": "method",
    "text": "helicsIsCoreTypeAvailable(kind::String) -> Bool\n\n\nReturns true if core/broker type specified is available in current compilation.\n\nArguments\n\ntype: a string representing a core type\n\npossible options include \"test\",\"zmq\",\"udp\",\"ipc\",\"interprocess\",\"tcp\",\"default\", \"mpi\"\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryBrokerExecute-Tuple{HELICS.Query,HELICS.Broker}",
    "page": "API",
    "title": "HELICS.helicsQueryBrokerExecute",
    "category": "method",
    "text": "helicsQueryBrokerExecute(query::HELICS.Query, broker::HELICS.Broker) -> String\n\n\nExecute a query directly on a broker\n\nthe call will block until the query finishes which may require communication or other delays\n\nArguments\n\nquery: the query object to use in the query\nbroker: the broker to send the query to\n\nReturns\n\na pointer to a string.  the string will remain valid until the query is freed or executed again   the return will be nullptr if fed or query is an invalid object, the return string will be \"#invalid\" if the query itself was invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryCoreExecute-Tuple{HELICS.Query,HELICS.Core}",
    "page": "API",
    "title": "HELICS.helicsQueryCoreExecute",
    "category": "method",
    "text": "helicsQueryCoreExecute(query::HELICS.Query, core::HELICS.Core) -> String\n\n\nExecute a query directly on a core\n\nthe call will block until the query finishes which may require communication or other delays\n\nArguments\n\nquery: the query object to use in the query\ncore: the core to send the query to\n\nReturns\n\na pointer to a string.  the string will remain valid until the query is freed or executed again   the return will be nullptr if fed or query is an invalid object, the return string will be \"#invalid\" if the query itself was invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryExecute-Tuple{HELICS.Query,HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsQueryExecute",
    "category": "method",
    "text": "helicsQueryExecute(query::HELICS.Query, fed::HELICS.Federate) -> String\n\n\nExecute a query\n\nthe call will block until the query finishes which may require communication or other delays\n\nArguments\n\nquery: the query object to use in the query\nfed: a federate to send the query through\n\nReturns\n\na pointer to a string.  the string will remain valid until the query is freed or executed again   the return will be nullptr if fed or query is an invalid object, the return string will be \"#invalid\" if the query itself was invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryExecuteAsync-Tuple{HELICS.Query,HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsQueryExecuteAsync",
    "category": "method",
    "text": "helicsQueryExecuteAsync(query::HELICS.Query, fed::HELICS.Federate)\n\n\nExecute a query in a non-blocking call\n\nArguments\n\nquery: the query object to use in the query\nfed: a federate to send the query through\n\nReturns\n\na helics status enumeration with the result of the query specification\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryExecuteComplete-Tuple{HELICS.Query}",
    "page": "API",
    "title": "HELICS.helicsQueryExecuteComplete",
    "category": "method",
    "text": "helicsQueryExecuteComplete(query::HELICS.Query) -> String\n\n\nComplete the return from a query called with /ref helicsExecuteQueryAsync\n\nthe function will block until the query completes /ref isQueryComplete can be called to determine if a query has completed or not.\n\nArguments\n\nquery: the query object to complete execution of\n\nReturns\n\na pointer to a string.  the string will remain valid until the query is freed or executed again   the return will be nullptr if query is an invalid object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryFree-Tuple{HELICS.Query}",
    "page": "API",
    "title": "HELICS.helicsQueryFree",
    "category": "method",
    "text": "helicsQueryFree(query::HELICS.Query)\n\n\nFree the memory associated with a query object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsQueryIsCompleted-Tuple{HELICS.Query}",
    "page": "API",
    "title": "HELICS.helicsQueryIsCompleted",
    "category": "method",
    "text": "helicsQueryIsCompleted(query::HELICS.Query) -> Bool\n\n\nCheck if an asynchronously executed query has completed\n\nthis function should usually be called after a QueryExecuteAsync function has been called.\n\nArguments\n\nquery: the query object to check if completed\n\nReturns\n\nwill return true if an asynchronous query has complete or a regular query call was made with a result and false if an asynchronous query has not completed or is invalid\n\n\n\n\n\n"
},

{
    "location": "api/#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "Modules = [HELICS]\nOrder   = [:function, :type]"
},

]}
