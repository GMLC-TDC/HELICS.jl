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
    "text": "(Image: Travis Build Status) (Image: Appveyor Build Status) (Image: Docs) (Image: Codecov) (Image: Gitter) (Image: Releases)HELICS.jl is a cross-platform Julia wrapper around the HELICS library.This package is now available for Windows, Mac, and Linux."
},

{
    "location": "#Documentation-1",
    "page": "HELICS.jl",
    "title": "Documentation",
    "category": "section",
    "text": "The documentation for the development latest of this package is here."
},

{
    "location": "#Installation-1",
    "page": "HELICS.jl",
    "title": "Installation",
    "category": "section",
    "text": "Use the Julia package manager to install HELICS.jljulia> ]\n(v1.1)> add HELICSOpen the package manager REPL (using ])To install the latest development version, use the following from within Julia:(v1.1) pkg> add HELICS#masterThis package includes HELICS as a library. You do not have to install HELICS separately.Note that this should work on 32 and 64-bit Windows systems and 64-bit Linux and Mac systems.If you wish to develop HELICS.jl you may want to use the following:(v1.1) pkg> dev HELICSYou can also get a specific version,(v1.1) pkg> add HELICS#33c98625or specific branch,(v1.1) pkg> add HELICS#kd/some-new-featureif these features haven\'t been merged to master yet."
},

{
    "location": "#Troubleshooting-1",
    "page": "HELICS.jl",
    "title": "Troubleshooting",
    "category": "section",
    "text": "This package interfaces with HELICS, so a good understanding of HELICS will help troubleshooting. There are plenty of useful resources located here.If you are having issues using this Julia interface, feel free to open an issue on GitHub here."
},

{
    "location": "#Acknowledgements-1",
    "page": "HELICS.jl",
    "title": "Acknowledgements",
    "category": "section",
    "text": "This work was developed as an extension to work done as part of the Scalable Integrated Infrastructure Planning (SIIP) initiative at the U.S. Department of Energy\'s National Renewable Energy Laboratory (NREL)."
},

{
    "location": "api/#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api/#HELICS.helicsBrokerAddDestinationFilterToEndpoint-Tuple{HELICS.Broker,String,String}",
    "page": "API",
    "title": "HELICS.helicsBrokerAddDestinationFilterToEndpoint",
    "category": "method",
    "text": "helicsBrokerAddDestinationFilterToEndpoint(broker::HELICS.Broker, filter::String, endpoint::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerAddSourceFilterToEndpoint-Tuple{HELICS.Broker,String,String}",
    "page": "API",
    "title": "HELICS.helicsBrokerAddSourceFilterToEndpoint",
    "category": "method",
    "text": "helicsBrokerAddSourceFilterToEndpoint(broker::HELICS.Broker, filter::String, endpoint::String)\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsBrokerSetGlobal-Tuple{HELICS.Broker,String,String}",
    "page": "API",
    "title": "HELICS.helicsBrokerSetGlobal",
    "category": "method",
    "text": "helicsBrokerSetGlobal(broker::HELICS.Broker, valueName::String, value::String)\n\n\nSet a federation global value\n\nthis overwrites any previous value for this name\n\nArguments\n\nbroker: the broker to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsBrokerWaitForDisconnect-Tuple{HELICS.Broker,Int64}",
    "page": "API",
    "title": "HELICS.helicsBrokerWaitForDisconnect",
    "category": "method",
    "text": "helicsBrokerWaitForDisconnect(broker::HELICS.Broker, msToWait::Int64) -> Bool\n\n\nWait for the broker to disconnect\n\nArguments\n\nbroker: the broker to wait for\nmsToWait: the time out in millisecond (<0 for infinite timeout)\n\nReturns\n\ntrue if the disconnect was successful, false if there was a timeout\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsCoreAddDestinationFilterToEndpoint-Tuple{HELICS.Core,String,String}",
    "page": "API",
    "title": "HELICS.helicsCoreAddDestinationFilterToEndpoint",
    "category": "method",
    "text": "helicsCoreAddDestinationFilterToEndpoint(core::HELICS.Core, filter::String, endpoint::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreAddSourceFilterToEndpoint-Tuple{HELICS.Core,String,String}",
    "page": "API",
    "title": "HELICS.helicsCoreAddSourceFilterToEndpoint",
    "category": "method",
    "text": "helicsCoreAddSourceFilterToEndpoint(core::HELICS.Core, filter::String, endpoint::String)\n\n\nLink a named filter to a source endpoint\n\nArguments\n\ncore: the core to generate the connection from\nfilter: the name of the filter (cannot be NULL)\nendpoint: the name of the endpoint to filter the data from (cannot be NULL)\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsCoreRegisterCloningFilter-Tuple{HELICS.Core,String}",
    "page": "API",
    "title": "HELICS.helicsCoreRegisterCloningFilter",
    "category": "method",
    "text": "helicsCoreRegisterCloningFilter(core::HELICS.Core, deliveryEndpoint::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreRegisterFilter-Tuple{HELICS.Core,Union{Int64, helics_filter_type},String}",
    "page": "API",
    "title": "HELICS.helicsCoreRegisterFilter",
    "category": "method",
    "text": "helicsCoreRegisterFilter(core::HELICS.Core, kind::Union{Int64, helics_filter_type}, name::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCoreSetGlobal-Tuple{HELICS.Core,String,String}",
    "page": "API",
    "title": "HELICS.helicsCoreSetGlobal",
    "category": "method",
    "text": "helicsCoreSetGlobal(core::HELICS.Core, valueName::String, value::String)\n\n\nSet a global value in a core\n\nthis overwrites any previous value for this name\n\nArguments\n\ncore: the core to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsCreateBrokerFromArgs-Tuple{String,String,Int64,Array{String,1}}",
    "page": "API",
    "title": "HELICS.helicsCreateBrokerFromArgs",
    "category": "method",
    "text": "helicsCreateBrokerFromArgs(kind::String, name::String, argc::Int64, argv::Array{String,1}) -> HELICS.Broker\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCombinationFederate-Tuple{String,HELICS.FederateInfo}",
    "page": "API",
    "title": "HELICS.helicsCreateCombinationFederate",
    "category": "method",
    "text": "helicsCreateCombinationFederate(fedName::String, fi::HELICS.FederateInfo) -> HELICS.CombinationFederate\n\n\nCreate a combination federate from a federate info object\n\ncombination federates are both value federates and message federates, objects can be used in all functions that take a helicsfederate, helicsmessagefederate or helicsfederate object as an argument\n\nArguments\n\nfedName: a string with the name of the federate, can be NULL or an empty string to pull the default name from fi\nfi: the federate info object that contains details on the federate\n\nReturns\n\nan opaque value federate object nullptr if the object creation failed\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCombinationFederateFromConfig-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsCreateCombinationFederateFromConfig",
    "category": "method",
    "text": "helicsCreateCombinationFederateFromConfig(configFile::String) -> HELICS.CombinationFederate\n\n\nCreate a combination federate from a JSON file or JSON string\n\ncombination federates are both value federates and message federates, objects can be used in all functions that take a helicsfederate, helicsmessagefederate or helicsfederate object as an argument\n\nArguments\n\nconfigFile:  a JSON file or a JSON string or TOML file that contains setup and configuration information\n\nReturns\n\nan opaque combination federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCore-Tuple{String,String,String}",
    "page": "API",
    "title": "HELICS.helicsCreateCore",
    "category": "method",
    "text": "helicsCreateCore(kind::String, name::String, initString::String) -> HELICS.Core\n\n\nCreate a core object\n\nArguments\n\ntype: the type of the core to create\nname: the name of the core , may be a nullptr or empty string to have a name automatically assigned\ninitString: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  –broker=\"XSSAF\" or the number of federates or the address\n\nReturns\n\na helics_core object if the core is invalid err will contain some indication\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsCreateCoreFromArgs-Tuple{String,String,Int64,Array{String,1}}",
    "page": "API",
    "title": "HELICS.helicsCreateCoreFromArgs",
    "category": "method",
    "text": "helicsCreateCoreFromArgs(kind::String, name::String, argc::Int64, argv::Array{String,1}) -> HELICS.Core\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsCreateMessageFederateFromConfig-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsCreateMessageFederateFromConfig",
    "category": "method",
    "text": "helicsCreateMessageFederateFromConfig(configFile::String) -> HELICS.MessageFederate\n\n\nCreate a message federate from a JSON file or JSON string or TOML file\n\nhelicsmessagefederate objects can be used in all functions that take a helicsmessagefederate or helics_federate object as an argument\n\nArguments\n\nconfigFile:  a Config(JSON,TOML) file or a JSON string that contains setup and configuration information\n\nReturns\n\nan opaque message federate object\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsCreateValueFederateFromConfig-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsCreateValueFederateFromConfig",
    "category": "method",
    "text": "helicsCreateValueFederateFromConfig(configFile::String) -> HELICS.ValueFederate\n\n\nCreate a value federate from a JSON file, JSON string, or TOML file\n\nhelicsfederate objects can be used in all functions that take a helicsfederate or helics_federate object as an argument\n\nArguments\n\nconfigFile:  a JSON file or a JSON string or TOML file that contains setup and configuration information\n\nReturns\n\nan opaque value federate object\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetDefaultDestination-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetDefaultDestination",
    "category": "method",
    "text": "helicsEndpointGetDefaultDestination(endpoint::HELICS.Endpoint) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetInfo-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetInfo",
    "category": "method",
    "text": "helicsEndpointGetInfo(_end::HELICS.Endpoint) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetMessage-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetMessage",
    "category": "method",
    "text": "helicsEndpointGetMessage(endpoint::HELICS.Endpoint) -> HELICS.Message\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetName-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetName",
    "category": "method",
    "text": "helicsEndpointGetName(endpoint::HELICS.Endpoint) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetOption-Tuple{HELICS.Endpoint,Int64}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetOption",
    "category": "method",
    "text": "helicsEndpointGetOption(_end::HELICS.Endpoint, option::Int64) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointGetType-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointGetType",
    "category": "method",
    "text": "helicsEndpointGetType(endpoint::HELICS.Endpoint) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointHasMessage-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointHasMessage",
    "category": "method",
    "text": "helicsEndpointHasMessage(endpoint::HELICS.Endpoint) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointPendingMessages-Tuple{HELICS.Endpoint}",
    "page": "API",
    "title": "HELICS.helicsEndpointPendingMessages",
    "category": "method",
    "text": "helicsEndpointPendingMessages(endpoint::HELICS.Endpoint) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSendEventRaw-Tuple{HELICS.Endpoint,String,String,Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsEndpointSendEventRaw",
    "category": "method",
    "text": "helicsEndpointSendEventRaw(endpoint::HELICS.Endpoint, dest::String, data::String, time::Union{Float64, Int64})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSendMessage-Tuple{HELICS.Endpoint,HELICS.Message}",
    "page": "API",
    "title": "HELICS.helicsEndpointSendMessage",
    "category": "method",
    "text": "helicsEndpointSendMessage(endpoint::HELICS.Endpoint, message::HELICS.Message)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSendMessageRaw-Tuple{HELICS.Endpoint,String,String}",
    "page": "API",
    "title": "HELICS.helicsEndpointSendMessageRaw",
    "category": "method",
    "text": "helicsEndpointSendMessageRaw(endpoint::HELICS.Endpoint, dest::String, data::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSetDefaultDestination-Tuple{HELICS.Endpoint,String}",
    "page": "API",
    "title": "HELICS.helicsEndpointSetDefaultDestination",
    "category": "method",
    "text": "helicsEndpointSetDefaultDestination(endpoint::HELICS.Endpoint, dest::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSetInfo-Tuple{HELICS.Endpoint,String}",
    "page": "API",
    "title": "HELICS.helicsEndpointSetInfo",
    "category": "method",
    "text": "helicsEndpointSetInfo(_end::HELICS.Endpoint, info::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSetOption-Tuple{HELICS.Endpoint,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsEndpointSetOption",
    "category": "method",
    "text": "helicsEndpointSetOption(_end::HELICS.Endpoint, option::Int64, value::Bool)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsEndpointSubscribe-Tuple{HELICS.Endpoint,String}",
    "page": "API",
    "title": "HELICS.helicsEndpointSubscribe",
    "category": "method",
    "text": "helicsEndpointSubscribe(endpoint::HELICS.Endpoint, key::String)\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederateEnterExecutingModeIterative-Tuple{HELICS.Federate,Union{Int64, helics_iteration_request}}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeIterative",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeIterative(fed::HELICS.Federate, iterate::Union{Int64, helics_iteration_request}) -> HELICS.Lib.helics_iteration_result\n\n\nRequest an iterative time\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time and iteration request and return a time and iteration status.\n\nArguments\n\nfed: the federate to make the request of\niterate: the requested iteration mode\n\nReturns\n\nan iteration structure with field containing the time and iteration status\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateEnterExecutingModeIterativeAsync-Tuple{HELICS.Federate,Union{Int64, helics_iteration_request}}",
    "page": "API",
    "title": "HELICS.helicsFederateEnterExecutingModeIterativeAsync",
    "category": "method",
    "text": "helicsFederateEnterExecutingModeIterativeAsync(fed::HELICS.Federate, iterate::Union{Int64, helics_iteration_request})\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederateGetEndpoint-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateGetEndpoint",
    "category": "method",
    "text": "helicsFederateGetEndpoint(fed::HELICS.Federate, name::String) -> HELICS.Endpoint\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetEndpointByIndex-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetEndpointByIndex",
    "category": "method",
    "text": "helicsFederateGetEndpointByIndex(fed::HELICS.Federate, index::Int64) -> HELICS.Endpoint\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetEndpointCount-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetEndpointCount",
    "category": "method",
    "text": "helicsFederateGetEndpointCount(fed::HELICS.Federate) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetFilter-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateGetFilter",
    "category": "method",
    "text": "helicsFederateGetFilter(fed::HELICS.Federate, name::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetFilterByIndex-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetFilterByIndex",
    "category": "method",
    "text": "helicsFederateGetFilterByIndex(fed::HELICS.Federate, index::Int64) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetFilterCount-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetFilterCount",
    "category": "method",
    "text": "helicsFederateGetFilterCount(fed::HELICS.Federate) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetFlagOption-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetFlagOption",
    "category": "method",
    "text": "helicsFederateGetFlagOption(fed::HELICS.Federate, flag::Int64) -> Bool\n\n\nGet a flag value for a federate\n\nArguments\n\nfed: the federate to get the flag for\nflag: the flag to query\n\nReturns\n\nthe value of the flag\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetInput-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateGetInput",
    "category": "method",
    "text": "helicsFederateGetInput(fed::HELICS.Federate, key::String) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetInputByIndex-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetInputByIndex",
    "category": "method",
    "text": "helicsFederateGetInputByIndex(fed::HELICS.Federate, index::Int64) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetInputCount-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetInputCount",
    "category": "method",
    "text": "helicsFederateGetInputCount(fed::HELICS.Federate) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetIntegerProperty-Tuple{HELICS.Federate,Union{Int64, helics_handle_options}}",
    "page": "API",
    "title": "HELICS.helicsFederateGetIntegerProperty",
    "category": "method",
    "text": "helicsFederateGetIntegerProperty(fed::HELICS.Federate, intProperty::Union{Int64, helics_handle_options}) -> Int32\n\n\nSet the logging level for the federate\n\ndebug and trace only do anything if they were enabled in the compilation\n\nArguments\n\nfed: the federate to get the flag for\nintProperty: a code for the property to set /ref helicshandleoptions\n\nReturns\n\nthe value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetMessage-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetMessage",
    "category": "method",
    "text": "helicsFederateGetMessage(fed::HELICS.Federate) -> HELICS.Message\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetName-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetName",
    "category": "method",
    "text": "helicsFederateGetName(fed::HELICS.Federate) -> String\n\n\nGet the name of the federate\n\nArguments\n\nfed: the federate object to query\n\nReturns\n\na pointer to a string with the name\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetPublication-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateGetPublication",
    "category": "method",
    "text": "helicsFederateGetPublication(fed::HELICS.Federate, key::String) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetPublicationByIndex-Tuple{HELICS.Federate,Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateGetPublicationByIndex",
    "category": "method",
    "text": "helicsFederateGetPublicationByIndex(fed::HELICS.Federate, index::Int64) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetPublicationCount-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetPublicationCount",
    "category": "method",
    "text": "helicsFederateGetPublicationCount(fed::HELICS.Federate) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetState-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateGetState",
    "category": "method",
    "text": "helicsFederateGetState(fed::HELICS.Federate) -> HELICS.Lib.helics_federate_state\n\n\nGet the current state of a federate\n\nArguments\n\nfed: the fed to query\n\nReturns\n\nstate the resulting state if void return helics_ok\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetSubscription-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateGetSubscription",
    "category": "method",
    "text": "helicsFederateGetSubscription(fed::HELICS.Federate, key::String) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateGetTimeProperty-Tuple{HELICS.Federate,Union{Int64, helics_properties}}",
    "page": "API",
    "title": "HELICS.helicsFederateGetTimeProperty",
    "category": "method",
    "text": "helicsFederateGetTimeProperty(fed::HELICS.Federate, timeProperty::Union{Int64, helics_properties}) -> Float64\n\n\nGet the current value of a time based property in a federate\n\nArguments\n\nfed: the federate query\ntimeProperty: the property to query\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateHasMessage-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateHasMessage",
    "category": "method",
    "text": "helicsFederateHasMessage(fed::HELICS.Federate) -> Bool\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederateInfoLoadFromArgs-Tuple{HELICS.FederateInfo,Int64,Array{String,1}}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoLoadFromArgs",
    "category": "method",
    "text": "helicsFederateInfoLoadFromArgs(fi::HELICS.FederateInfo, argc::Int64, argv::Array{String,1})\n\n\nLoad a federate info from command line arguments\n\nArguments\n\nfi: a federateInfo object\nargc: the number of command line arguments\nargv: an array of strings from the command line\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederateInfoSetCoreType-Tuple{HELICS.FederateInfo,Union{Int64, helics_core_type}}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreType",
    "category": "method",
    "text": "helicsFederateInfoSetCoreType(fi::HELICS.FederateInfo, coretype::Union{Int64, helics_core_type})\n\n\nSet the core type by integer code\n\nvalid values available by definitions in api-data.h\n\nArguments\n\nfi: the federate info object to alter\ncoretype: an numerical code for a core type see /ref helicscoretype\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetCoreTypeFromString-Tuple{HELICS.FederateInfo,String}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetCoreTypeFromString",
    "category": "method",
    "text": "helicsFederateInfoSetCoreTypeFromString(fi::HELICS.FederateInfo, coretype::String)\n\n\nSet the core type from a string\n\nArguments\n\nfi: the federate info object to alter\ncoretype: a string naming a core type\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetFlagOption-Tuple{HELICS.FederateInfo,Union{Int64, helics_federate_flags},Bool}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetFlagOption",
    "category": "method",
    "text": "helicsFederateInfoSetFlagOption(fi::HELICS.FederateInfo, flag::Union{Int64, helics_federate_flags}, value::Bool)\n\n\nSet a flag in the info structure\n\nvalid flags are available /ref helicsfederateflags\n\nArguments\n\nfi: the federate info object to alter\nflag: a numerical index for a flag\nvalue: the desired value of the flag true or false\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateInfoSetIntegerProperty-Tuple{HELICS.FederateInfo,Union{Int64, helics_properties},Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetIntegerProperty",
    "category": "method",
    "text": "helicsFederateInfoSetIntegerProperty(fi::HELICS.FederateInfo, intProperty::Union{Int64, helics_properties}, propertyValue::Int64)\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederateInfoSetTimeProperty-Tuple{HELICS.FederateInfo,Union{Int64, helics_properties},Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsFederateInfoSetTimeProperty",
    "category": "method",
    "text": "helicsFederateInfoSetTimeProperty(fi::HELICS.FederateInfo, timeProperty::Union{Int64, helics_properties}, propertyValue::Union{Float64, Int64})\n\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsFederatePendingMessages-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederatePendingMessages",
    "category": "method",
    "text": "helicsFederatePendingMessages(fed::HELICS.Federate) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterCloningFilter-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterCloningFilter",
    "category": "method",
    "text": "helicsFederateRegisterCloningFilter(fed::HELICS.Federate, deliveryEndpoint::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterEndpoint-Tuple{HELICS.Federate,String,String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterEndpoint",
    "category": "method",
    "text": "helicsFederateRegisterEndpoint(fed::HELICS.Federate, name::String, kind::String) -> HELICS.Endpoint\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterFilter-Tuple{HELICS.Federate,Union{Int64, helics_filter_type},String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterFilter",
    "category": "method",
    "text": "helicsFederateRegisterFilter(fed::HELICS.Federate, kind::Union{Int64, helics_filter_type}, name::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalCloningFilter-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalCloningFilter",
    "category": "method",
    "text": "helicsFederateRegisterGlobalCloningFilter(fed::HELICS.Federate, deliveryEndpoint::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalEndpoint-Tuple{HELICS.Federate,String,String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalEndpoint",
    "category": "method",
    "text": "helicsFederateRegisterGlobalEndpoint(fed::HELICS.Federate, name::String, kind::String) -> HELICS.Endpoint\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalFilter-Tuple{HELICS.Federate,Union{Int64, helics_filter_type},String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalFilter",
    "category": "method",
    "text": "helicsFederateRegisterGlobalFilter(fed::HELICS.Federate, kind::Union{Int64, helics_filter_type}, name::String) -> HELICS.Filter\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalInput",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalInput",
    "category": "function",
    "text": "helicsFederateRegisterGlobalInput(fed::HELICS.Federate, key::String, kind::String)\nhelicsFederateRegisterGlobalInput(fed::HELICS.Federate, key::String, kind::String, units::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalPublication",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalPublication",
    "category": "function",
    "text": "helicsFederateRegisterGlobalPublication(fed::HELICS.Federate, key::String, kind::Union{Int64, helics_data_type}) -> HELICS.Publication\nhelicsFederateRegisterGlobalPublication(fed::HELICS.Federate, key::String, kind::Union{Int64, helics_data_type}, units::String) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalTypeInput",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalTypeInput",
    "category": "function",
    "text": "helicsFederateRegisterGlobalTypeInput(fed::HELICS.Federate, key::String, kind::String) -> HELICS.Subscription\nhelicsFederateRegisterGlobalTypeInput(fed::HELICS.Federate, key::String, kind::String, units::String) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterGlobalTypePublication",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterGlobalTypePublication",
    "category": "function",
    "text": "helicsFederateRegisterGlobalTypePublication(fed::HELICS.Federate, key::String, kind::String) -> HELICS.Publication\nhelicsFederateRegisterGlobalTypePublication(fed::HELICS.Federate, key::String, kind::String, units::String) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterInput",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterInput",
    "category": "function",
    "text": "helicsFederateRegisterInput(fed::HELICS.Federate, key::String, kind::String)\nhelicsFederateRegisterInput(fed::HELICS.Federate, key::String, kind::String, units::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterInterfaces-Tuple{HELICS.Federate,String}",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterInterfaces",
    "category": "method",
    "text": "helicsFederateRegisterInterfaces(fed::HELICS.Federate, file::String)\n\n\nLoad interfaces from a file\n\nArguments\n\nfed: the federate to which to load interfaces\nfile: the name of a file to load the interfaces from either JSON, or TOML\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterPublication",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterPublication",
    "category": "function",
    "text": "helicsFederateRegisterPublication(fed::HELICS.Federate, key::String, kind::Union{Int64, helics_data_type}) -> HELICS.Publication\nhelicsFederateRegisterPublication(fed::HELICS.Federate, key::String, kind::Union{Int64, helics_data_type}, units::String) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterSubscription",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterSubscription",
    "category": "function",
    "text": "helicsFederateRegisterSubscription(fed::HELICS.Federate, key::String) -> HELICS.Subscription\nhelicsFederateRegisterSubscription(fed::HELICS.Federate, key::String, units::String) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterTypeInput",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterTypeInput",
    "category": "function",
    "text": "helicsFederateRegisterTypeInput(fed::HELICS.Federate, key::String, kind::String) -> HELICS.Subscription\nhelicsFederateRegisterTypeInput(fed::HELICS.Federate, key::String, kind::String, units::String) -> HELICS.Subscription\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRegisterTypePublication",
    "page": "API",
    "title": "HELICS.helicsFederateRegisterTypePublication",
    "category": "function",
    "text": "helicsFederateRegisterTypePublication(fed::HELICS.Federate, key::String, kind::String) -> HELICS.Publication\nhelicsFederateRegisterTypePublication(fed::HELICS.Federate, key::String, kind::String, units::String) -> HELICS.Publication\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestNextStep-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestNextStep",
    "category": "method",
    "text": "helicsFederateRequestNextStep(fed::HELICS.Federate) -> Float64\n\n\nRequest the next time step for federate execution\n\nfeds should have setup the period or minDelta for this to work well but it will request the next time step which is the current time plus the minimum time step.\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nthe time granted to the federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTime-Tuple{HELICS.Federate,Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTime",
    "category": "method",
    "text": "helicsFederateRequestTime(fed::HELICS.Federate, requestTime::Union{Float64, Int64}) -> Float64\n\n\nRequest the next time for federate execution\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next requested time\n\nReturns\n\nthe time granted to the federate   invalid\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeAsync-Tuple{HELICS.Federate,Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeAsync",
    "category": "method",
    "text": "helicsFederateRequestTimeAsync(fed::HELICS.Federate, requestTime::Union{Float64, Int64})\n\n\nRequest the next time for federate execution in an asynchronous call\n\ncall /ref helicsFederateRequestTimeComplete to finish the call\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next requested time\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeComplete",
    "category": "method",
    "text": "helicsFederateRequestTimeComplete(fed::HELICS.Federate) -> Float64\n\n\nComplete an asynchronous requestTime call\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nthe time granted to the federate\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterative-Tuple{HELICS.Federate,Union{Float64, Int64},Union{Int64, helics_iteration_request}}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterative",
    "category": "method",
    "text": "helicsFederateRequestTimeIterative(fed::HELICS.Federate, requestTime::Union{Float64, Int64}, iterate::Union{Int64, helics_iteration_request})\n\n\nRequest an iterative time\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time and iteration request and return a time and iteration status.\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next desired time\niterate: the requested iteration mode\n\nReturns\n\nthe granted time\nthe iteration specification of the result\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterativeAsync-Tuple{HELICS.Federate,Union{Float64, Int64},Union{Int64, helics_iteration_request}}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterativeAsync",
    "category": "method",
    "text": "helicsFederateRequestTimeIterativeAsync(fed::HELICS.Federate, requestTime::Union{Float64, Int64}, iterate::Union{Int64, helics_iteration_request})\n\n\nRequest an iterative time through an asynchronous call\n\nthis call allows for finer grain control of the iterative process then /ref helicsFederateRequestTime it takes a time an iteration request and returns a time and iteration status call /ref helicsFederateRequestTimeIterativeComplete to finish the process.\n\nArguments\n\nfed: the federate to make the request of\nrequestTime: the next desired time\niterate: the requested iteration mode\n\nReturns\n\na void object with a return code of the result\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateRequestTimeIterativeComplete-Tuple{HELICS.Federate}",
    "page": "API",
    "title": "HELICS.helicsFederateRequestTimeIterativeComplete",
    "category": "method",
    "text": "helicsFederateRequestTimeIterativeComplete(fed::HELICS.Federate) -> Tuple{Float64,HELICS.Lib.helics_iteration_result}\n\n\nComplete an iterative time request asynchronous call\n\nArguments\n\nfed: the federate to make the request of\n\nReturns\n\nthe granted time\noutIterate  the iteration specification of the result\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetFlagOption-Tuple{HELICS.Federate,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsFederateSetFlagOption",
    "category": "method",
    "text": "helicsFederateSetFlagOption(fed::HELICS.Federate, flag::Int64, flagValue::Bool)\n\n\nSet a flag for the federate\n\nArguments\n\nfed: the federate to alter a flag for\nflag: the flag to change\nflagValue: the new value of the flag 0 for false !=0 for true\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetGlobal-Tuple{HELICS.Federate,String,String}",
    "page": "API",
    "title": "HELICS.helicsFederateSetGlobal",
    "category": "method",
    "text": "helicsFederateSetGlobal(fed::HELICS.Federate, valueName::String, value::String)\n\n\nSet a federation global value through a federate\n\nthis overwrites any previous value for this name\n\nArguments\n\nfed: the federate to set the global through\nvalueName: the name of the global to set\nvalue: the value of the global\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetIntegerProperty-Tuple{HELICS.Federate,Union{Int64, helics_properties},Int64}",
    "page": "API",
    "title": "HELICS.helicsFederateSetIntegerProperty",
    "category": "method",
    "text": "helicsFederateSetIntegerProperty(fed::HELICS.Federate, intProperty::Union{Int64, helics_properties}, propertyVal::Int64)\n\n\nSet an integer based property of a federate\n\nArguments\n\nfed: the federate to change the property for\nintProperty: the property to set\npropertyVal: the value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetSeparator-Tuple{HELICS.Federate,Char}",
    "page": "API",
    "title": "HELICS.helicsFederateSetSeparator",
    "category": "method",
    "text": "helicsFederateSetSeparator(fed::HELICS.Federate, separator::Char)\n\n\nSet the separator character in a federate\n\nthe separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is \'/\'  then a local endpoint would have a globally reachable name of fedName/localName.\n\nArguments\n\nfed: the federate info object to alter\nseparator: the character to use as a separator\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFederateSetTimeProperty-Tuple{HELICS.Federate,Union{Int64, helics_properties},Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsFederateSetTimeProperty",
    "category": "method",
    "text": "helicsFederateSetTimeProperty(fed::HELICS.Federate, timeProperty::Union{Int64, helics_properties}, time::Union{Float64, Int64})\n\n\nSet a time based property for a federate\n\nArguments\n\nfed: the federate object set the property for\ntimeProperty: a integer code for a time property\ntime: the requested value of the property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterAddDeliveryEndpoint-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterAddDeliveryEndpoint",
    "category": "method",
    "text": "helicsFilterAddDeliveryEndpoint(filt::HELICS.Filter, deliveryEndpoint::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterAddDestinationTarget-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterAddDestinationTarget",
    "category": "method",
    "text": "helicsFilterAddDestinationTarget(filt::HELICS.Filter, dest::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterAddSourceTarget-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterAddSourceTarget",
    "category": "method",
    "text": "helicsFilterAddSourceTarget(filt::HELICS.Filter, source::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterGetInfo-Tuple{HELICS.Filter}",
    "page": "API",
    "title": "HELICS.helicsFilterGetInfo",
    "category": "method",
    "text": "helicsFilterGetInfo(filt::HELICS.Filter) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterGetName-Tuple{HELICS.Filter}",
    "page": "API",
    "title": "HELICS.helicsFilterGetName",
    "category": "method",
    "text": "helicsFilterGetName(filt::HELICS.Filter) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterGetOption-Tuple{HELICS.Filter,Int64}",
    "page": "API",
    "title": "HELICS.helicsFilterGetOption",
    "category": "method",
    "text": "helicsFilterGetOption(filt::HELICS.Filter, option::Int64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterRemoveDeliveryEndpoint-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterRemoveDeliveryEndpoint",
    "category": "method",
    "text": "helicsFilterRemoveDeliveryEndpoint(filt::HELICS.Filter, deliveryEndpoint::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterRemoveTarget-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterRemoveTarget",
    "category": "method",
    "text": "helicsFilterRemoveTarget(filt::HELICS.Filter, target::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterSet-Tuple{HELICS.Filter,String,Float64}",
    "page": "API",
    "title": "HELICS.helicsFilterSet",
    "category": "method",
    "text": "helicsFilterSet(filt::HELICS.Filter, prop::String, val::Float64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterSetInfo-Tuple{HELICS.Filter,String}",
    "page": "API",
    "title": "HELICS.helicsFilterSetInfo",
    "category": "method",
    "text": "helicsFilterSetInfo(filt::HELICS.Filter, info::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterSetOption-Tuple{HELICS.Filter,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsFilterSetOption",
    "category": "method",
    "text": "helicsFilterSetOption(filt::HELICS.Filter, option::Int64, value::Bool)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsFilterSetString-Tuple{HELICS.Filter,String,String}",
    "page": "API",
    "title": "HELICS.helicsFilterSetString",
    "category": "method",
    "text": "helicsFilterSetString(filt::HELICS.Filter, prop::String, val::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetFederateByName-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsGetFederateByName",
    "category": "method",
    "text": "helicsGetFederateByName(fedName::String) -> HELICS.CombinationFederate\n\n\nGet an existing federate object from a core by name\n\nthe federate must have been created by one of the other functions and at least one of the objects referencing the created     federate must still be active in the process\n\nArguments\n\n`fedName`: the name of the federate to retrieve\n\nReturns\n\nNULL if no fed is available by that name otherwise a helics_federate with that name\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetOptionIndex-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsGetOptionIndex",
    "category": "method",
    "text": "helicsGetOptionIndex(val::String) -> Int64\n\n\nGet an option index for use in /ref helicsPublicationSetOption, /ref helicsInputSetOption, /ref helicsEndpointSetOption, /ref     helicsFilterSetOption, and the corresponding get functions\n\nArguments\n\nval: a string with the option name\n\nReturns\n\nan int with the option index (-1) if not a valid property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetPropertyIndex-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsGetPropertyIndex",
    "category": "method",
    "text": "helicsGetPropertyIndex(val::String) -> Int64\n\n\nGet a property index for use in /ref helicsFederateInfoSetFlagOption, /ref helicsFederateInfoSetTimeProperty,     helicsFederateInfoSetIntegerProperty\n\nArguments\n\nval: a string with the property name\n\nReturns\n\nan int with the property code (-1) if not a valid property\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsGetVersion-Tuple{}",
    "page": "API",
    "title": "HELICS.helicsGetVersion",
    "category": "method",
    "text": "helicsGetVersion() -> String\n\n\nGet a version string for HELICS\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputAddTarget-Tuple{HELICS.Subscription,String}",
    "page": "API",
    "title": "HELICS.helicsInputAddTarget",
    "category": "method",
    "text": "helicsInputAddTarget(ipt::HELICS.Subscription, target::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetBoolean-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetBoolean",
    "category": "method",
    "text": "helicsInputGetBoolean(ipt::HELICS.Subscription) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetChar-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetChar",
    "category": "method",
    "text": "helicsInputGetChar(ipt::HELICS.Subscription) -> Char\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetComplex-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetComplex",
    "category": "method",
    "text": "helicsInputGetComplex(ipt::HELICS.Subscription) -> Complex{Float64}\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetComplexObject-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetComplexObject",
    "category": "method",
    "text": "helicsInputGetComplexObject(ipt::HELICS.Subscription) -> Complex{Float64}\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetDouble-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetDouble",
    "category": "method",
    "text": "helicsInputGetDouble(ipt::HELICS.Subscription) -> Float64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetInfo-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetInfo",
    "category": "method",
    "text": "helicsInputGetInfo(inp::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetInteger-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetInteger",
    "category": "method",
    "text": "helicsInputGetInteger(ipt::HELICS.Subscription) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetKey-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetKey",
    "category": "method",
    "text": "helicsInputGetKey(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetNamedPoint-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetNamedPoint",
    "category": "method",
    "text": "helicsInputGetNamedPoint(ipt::HELICS.Subscription) -> Tuple{String,Float64}\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetOption-Tuple{HELICS.Subscription,Int64}",
    "page": "API",
    "title": "HELICS.helicsInputGetOption",
    "category": "method",
    "text": "helicsInputGetOption(inp::HELICS.Subscription, option::Int64) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetPublicationType-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetPublicationType",
    "category": "method",
    "text": "helicsInputGetPublicationType(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetRawValue-Union{Tuple{T}, Tuple{Subscription,T}} where T",
    "page": "API",
    "title": "HELICS.helicsInputGetRawValue",
    "category": "method",
    "text": "helicsInputGetRawValue(ipt::T, data::T)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetRawValueSize-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetRawValueSize",
    "category": "method",
    "text": "helicsInputGetRawValueSize(ipt::HELICS.Subscription) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetString-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetString",
    "category": "method",
    "text": "helicsInputGetString(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetStringSize-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetStringSize",
    "category": "method",
    "text": "helicsInputGetStringSize(ipt::HELICS.Subscription) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetTime-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetTime",
    "category": "method",
    "text": "helicsInputGetTime(ipt::HELICS.Subscription) -> Float64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetType-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetType",
    "category": "method",
    "text": "helicsInputGetType(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetUnits-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetUnits",
    "category": "method",
    "text": "helicsInputGetUnits(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetVector-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetVector",
    "category": "method",
    "text": "helicsInputGetVector(ipt::HELICS.Subscription) -> Array{Float64,1}\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputGetVectorSize-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputGetVectorSize",
    "category": "method",
    "text": "helicsInputGetVectorSize(ipt::HELICS.Subscription) -> Int64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputIsUpdated-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputIsUpdated",
    "category": "method",
    "text": "helicsInputIsUpdated(ipt::HELICS.Subscription) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputLastUpdateTime-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsInputLastUpdateTime",
    "category": "method",
    "text": "helicsInputLastUpdateTime(ipt::HELICS.Subscription) -> Float64\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultBoolean-Tuple{HELICS.Subscription,Bool}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultBoolean",
    "category": "method",
    "text": "helicsInputSetDefaultBoolean(ipt::HELICS.Subscription, val::Bool)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultChar-Tuple{HELICS.Subscription,Char}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultChar",
    "category": "method",
    "text": "helicsInputSetDefaultChar(ipt::HELICS.Subscription, val::Char)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultComplex-Tuple{HELICS.Subscription,Complex{Float64}}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultComplex",
    "category": "method",
    "text": "helicsInputSetDefaultComplex(ipt::HELICS.Subscription, c::Complex{Float64})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultDouble-Tuple{HELICS.Subscription,Float64}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultDouble",
    "category": "method",
    "text": "helicsInputSetDefaultDouble(ipt::HELICS.Subscription, val::Float64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultInteger-Tuple{HELICS.Subscription,Int64}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultInteger",
    "category": "method",
    "text": "helicsInputSetDefaultInteger(ipt::HELICS.Subscription, val::Int64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultNamedPoint-Tuple{HELICS.Subscription,String,Float64}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultNamedPoint",
    "category": "method",
    "text": "helicsInputSetDefaultNamedPoint(ipt::HELICS.Subscription, str::String, val::Float64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultRaw-Tuple{HELICS.Subscription,Any}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultRaw",
    "category": "method",
    "text": "helicsInputSetDefaultRaw(ipt::HELICS.Subscription, data::Any)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultString-Tuple{HELICS.Subscription,String}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultString",
    "category": "method",
    "text": "helicsInputSetDefaultString(ipt::HELICS.Subscription, str::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultTime-Tuple{HELICS.Subscription,Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultTime",
    "category": "method",
    "text": "helicsInputSetDefaultTime(ipt::HELICS.Subscription, val::Union{Float64, Int64})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetDefaultVector-Tuple{HELICS.Subscription,Array{Float64,1}}",
    "page": "API",
    "title": "HELICS.helicsInputSetDefaultVector",
    "category": "method",
    "text": "helicsInputSetDefaultVector(ipt::HELICS.Subscription, vectorInput::Array{Float64,1})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetInfo-Tuple{HELICS.Subscription,String}",
    "page": "API",
    "title": "HELICS.helicsInputSetInfo",
    "category": "method",
    "text": "helicsInputSetInfo(inp::HELICS.Subscription, info::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsInputSetOption-Tuple{HELICS.Subscription,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsInputSetOption",
    "category": "method",
    "text": "helicsInputSetOption(inp::HELICS.Subscription, option::Int64, value::Bool)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsIsCoreTypeAvailable-Tuple{String}",
    "page": "API",
    "title": "HELICS.helicsIsCoreTypeAvailable",
    "category": "method",
    "text": "helicsIsCoreTypeAvailable(kind::String) -> Bool\n\n\nReturns true if core/broker type specified is available in current compilation.\n\nArguments\n\ntype: a string representing a core type\n\npossible options include \"test\",\"zmq\",\"udp\",\"ipc\",\"interprocess\",\"tcp\",\"default\", \"mpi\"\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationAddTarget-Tuple{HELICS.Publication,String}",
    "page": "API",
    "title": "HELICS.helicsPublicationAddTarget",
    "category": "method",
    "text": "helicsPublicationAddTarget(pub::HELICS.Publication, target::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationGetInfo-Tuple{HELICS.Publication}",
    "page": "API",
    "title": "HELICS.helicsPublicationGetInfo",
    "category": "method",
    "text": "helicsPublicationGetInfo(pub::HELICS.Publication) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationGetKey-Tuple{HELICS.Publication}",
    "page": "API",
    "title": "HELICS.helicsPublicationGetKey",
    "category": "method",
    "text": "helicsPublicationGetKey(pub::HELICS.Publication) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationGetOption-Tuple{HELICS.Publication,Int64}",
    "page": "API",
    "title": "HELICS.helicsPublicationGetOption",
    "category": "method",
    "text": "helicsPublicationGetOption(pub::HELICS.Publication, option::Int64) -> Bool\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationGetType-Tuple{HELICS.Publication}",
    "page": "API",
    "title": "HELICS.helicsPublicationGetType",
    "category": "method",
    "text": "helicsPublicationGetType(pub::HELICS.Publication) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationGetUnits-Tuple{HELICS.Publication}",
    "page": "API",
    "title": "HELICS.helicsPublicationGetUnits",
    "category": "method",
    "text": "helicsPublicationGetUnits(pub::HELICS.Publication) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishBoolean-Tuple{HELICS.Publication,Bool}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishBoolean",
    "category": "method",
    "text": "helicsPublicationPublishBoolean(pub::HELICS.Publication, val::Bool)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishChar-Tuple{HELICS.Publication,Char}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishChar",
    "category": "method",
    "text": "helicsPublicationPublishChar(pub::HELICS.Publication, val::Char)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishComplex-Tuple{HELICS.Publication,Complex{Float64}}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishComplex",
    "category": "method",
    "text": "helicsPublicationPublishComplex(pub::HELICS.Publication, c::Complex{Float64})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishDouble-Tuple{HELICS.Publication,Float64}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishDouble",
    "category": "method",
    "text": "helicsPublicationPublishDouble(pub::HELICS.Publication, val::Float64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishInteger-Tuple{HELICS.Publication,Int64}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishInteger",
    "category": "method",
    "text": "helicsPublicationPublishInteger(pub::HELICS.Publication, val::Int64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishNamedPoint-Tuple{HELICS.Publication,String,Float64}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishNamedPoint",
    "category": "method",
    "text": "helicsPublicationPublishNamedPoint(pub::HELICS.Publication, str::String, val::Float64)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishRaw-Tuple{HELICS.Publication,Any}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishRaw",
    "category": "method",
    "text": "helicsPublicationPublishRaw(pub::HELICS.Publication, data::Any)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishString-Tuple{HELICS.Publication,String}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishString",
    "category": "method",
    "text": "helicsPublicationPublishString(pub::HELICS.Publication, str::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishTime-Tuple{HELICS.Publication,Union{Float64, Int64}}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishTime",
    "category": "method",
    "text": "helicsPublicationPublishTime(pub::HELICS.Publication, val::Union{Float64, Int64})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationPublishVector-Tuple{HELICS.Publication,Array{Float64,1}}",
    "page": "API",
    "title": "HELICS.helicsPublicationPublishVector",
    "category": "method",
    "text": "helicsPublicationPublishVector(pub::HELICS.Publication, vectorInput::Array{Float64,1})\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationSetInfo-Tuple{HELICS.Publication,String}",
    "page": "API",
    "title": "HELICS.helicsPublicationSetInfo",
    "category": "method",
    "text": "helicsPublicationSetInfo(pub::HELICS.Publication, info::String)\n\n\n\n\n\n\n"
},

{
    "location": "api/#HELICS.helicsPublicationSetOption-Tuple{HELICS.Publication,Int64,Bool}",
    "page": "API",
    "title": "HELICS.helicsPublicationSetOption",
    "category": "method",
    "text": "helicsPublicationSetOption(pub::HELICS.Publication, option::Int64, val::Bool)\n\n\n\n\n\n\n"
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
    "text": "helicsQueryExecuteAsync(query::HELICS.Query, fed::HELICS.Federate)\n\n\nExecute a query in a non-blocking call\n\nArguments\n\nquery: the query object to use in the query\nfed: a federate to send the query through\n\n\n\n\n\n"
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
    "location": "api/#HELICS.helicsSubscriptionGetKey-Tuple{HELICS.Subscription}",
    "page": "API",
    "title": "HELICS.helicsSubscriptionGetKey",
    "category": "method",
    "text": "helicsSubscriptionGetKey(ipt::HELICS.Subscription) -> String\n\n\n\n\n\n\n"
},

{
    "location": "api/#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "Modules = [HELICS]\nOrder   = [:function, :type]"
},

]}
