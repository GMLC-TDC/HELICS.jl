using .Utils
using DocStringExtensions

DocStringExtensions.@template (FUNCTIONS, METHODS) = """
                                                     $(DocStringExtensions.TYPEDSIGNATURES)
                                                     $(DocStringExtensions.DOCSTRING)
                                                     """

const HELICS_TIME = Union{Int,Float64}
const CFunction = Ptr{Cvoid}
const HELICS_TIME_MAXTIME = typemax(Int)

"""
Create an [`Endpoint`](@ref)

The [`Endpoint`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free functions for endpoints.

# Arguments

- `fed`: the [`Federate`](@ref) in which to create an [`Endpoint`](@ref) must have been create with [`helicsCreateMessageFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `name`: the identifier for the [`Endpoint`](@ref),  this will be prepended with the [`Federate`](@ref) name for the global identifier
- `type`: a string describing the expected type of the [`Publication`](@ref) may be NULL

# Returns

- [`Endpoint`](@ref)
"""
function helicsFederateRegisterEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    return @invoke_and_check Lib.helicsFederateRegisterEndpoint(fed, name, kind)
end

"""
Create an [`Endpoint`](@ref)

The [`Endpoint`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the
federate is freed so there are no separate free functions for endpoints

# Arguments

- `fed`: the [`Federate`](@ref) in which to create an [`Endpoint`](@ref) must have been create with [`helicsCreateMessageFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `name`: the identifier for the [`Endpoint`](@ref), the given name is the global identifier
- `type`: a string describing the expected type of the [`Publication`](@ref) may be NULL

# Returns

- [`Endpoint`](@ref)
"""
function helicsFederateRegisterGlobalEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    return @invoke_and_check Lib.helicsFederateRegisterGlobalEndpoint(fed, name, kind)
end

"""
Get an [`Endpoint`](@ref) object from a name

# Arguments

- `fed`: The [`Federate`](@ref) to use to get the [`Endpoint`](@ref)
- `name`: The name of the [`Endpoint`](@ref)

# Returns

- a [`Endpoint`](@ref) object, the object will not be valid and err will contain an error code if no endpoint with the specified name exists
"""
function helicsFederateGetEndpoint(fed::Federate, name::String)::Endpoint
    @invoke_and_check Lib.helicsFederateGetEndpoint(fed, name)
end

"""
Get an [`Endpoint`](@ref) by its index typically already created via helicsFederateRegisterInterfaces file or something of that nature

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `index`: The index of the [`Publication`](@ref) to get

# Returns

- a [`Endpoint`](@ref), which will be NULL if an invalid index
"""
function helicsFederateGetEndpointByIndex(fed::Federate, index::Int)::Endpoint
    return @invoke_and_check Lib.helicsFederateGetEndpointByIndex(fed, index)
end

"""
Set the default destination for an [`Endpoint`](@ref) if no other endpoint is given

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to set the destination for
- `dest`: A string naming the desired default endpoint
"""
function helicsEndpointSetDefaultDestination(endpoint::Endpoint, dest::String)
    @invoke_and_check Lib.helicsEndpointSetDefaultDestination(endpoint, dest)
end

"""
Get the default destination for an [`Endpoint`](@ref)

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to set the destination for

# Returns

- a string with the default destination
"""
function helicsEndpointGetDefaultDestination(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetDefaultDestination(endpoint))
end

"""
Send a message to the specified destination

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to send the data from
- `dest`: The target destination (empty string to use the default destination)
- `data`: The data to send
"""
function helicsEndpointSendMessageRaw(endpoint::Endpoint, dest::String, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsEndpointSendMessageRaw(endpoint, dest, data, inputDataLength)
end

"""
Send a message at a specific time to the specified destination

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to send the data from
- `dest`: The target destination (empty string to use the default destination)
- `data`: The data to send
- `time`: The time the message should be sent
"""
function helicsEndpointSendEventRaw(endpoint::Endpoint, dest::String, data::String, time::HELICS.HELICS_TIME)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsEndpointSendEventRaw(endpoint, dest, data, inputDataLength, time)
end

"""
Send a message object from a specific endpoint

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to send the data from
- `message`: The [`Lib.helics_message`](@ref) to send
"""
function helicsEndpointSendMessage(endpoint::Endpoint, message::Lib.helics_message)
    @invoke_and_check Lib.helicsEndpointSendMessage(endpoint, Ref(message))
end

"""
Send a message object from a specific endpoint

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to send the data from
- `message`: The [`Message`](@ref) to send
"""
function helicsEndpointSendMessageObject(endpoint::Endpoint, message::Message)
    @invoke_and_check Lib.helicsEndpointSendMessageObject(endpoint, message)
end

"""
Subscribe an [`Endpoint`](@ref) to a [`Publication`](@ref)

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to use
- `key`: The name of the [`Publication`](@ref)
"""
function helicsEndpointSubscribe(endpoint::Endpoint, key::String)
    @invoke_and_check Lib.helicsEndpointSubscribe(endpoint, key)
end

"""
Check if the [`Federate`](@ref) has any outstanding messages

# Arguments

- `fed`: The [`Federate`](@ref) to check if it has

# Returns

- `true` if the [`Federate`](@ref) has a message waiting `false` otherwise
"""
function helicsFederateHasMessage(fed::Federate)::Bool
    return Lib.helicsFederateHasMessage(fed) == 1 ? true : false
end

"""
Check if a given endpoint has any unread messages

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to check

# Returns

- `true` if the [`Endpoint`](@ref) has a message, `false` otherwise
"""
function helicsEndpointHasMessage(endpoint::Endpoint)::Bool
    return Lib.helicsEndpointHasMessage(endpoint) == 1 ? true : false
end

"""
Returns the number of pending receives for the specified destination
endpoint.

# Arguments

- `fed`: The [`Federate`](@ref) to get the number of waiting messages
"""
function helicsFederatePendingMessages(fed::Federate)::Int
    return Lib.helicsFederatePendingMessages(fed)
end

"""
Returns the number of pending receives for all endpoints of particular
federate.

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to query
"""
function helicsEndpointPendingMessages(endpoint::Endpoint)::Int
    return Lib.helicsEndpointPendingMessages(endpoint)
end

"""
Receive a packet from a particular endpoint

# Arguments

- `endpoint`: The identifier for the [`Endpoint`](@ref)

# Returns

- [`Message`](@ref) object
"""
function helicsEndpointGetMessage(endpoint::Endpoint)::Lib.helics_message
    return Lib.helicsEndpointGetMessage(endpoint)
end

"""
Receive a packet from a particular endpoint

# Arguments

- `endpoint`: The identifier for the [`Endpoint`](@ref)

# Returns

- [`Message`](@ref) object
"""
function helicsEndpointGetMessageObject(endpoint::Endpoint)::Message
    return Lib.helicsEndpointGetMessageObject(endpoint)
end

"""
Receive a communication message for any endpoint in the [`Federate`](@ref)

The return order will be in order of endpoint creation.
So all messages that are available for the first endpoint, then all for the second, and so on within a single endpoint the messages are ordered by time, then `source_id`, then order of arrival

# Returns

- a `unique_ptr` to a [`HELICS.Lib.helics_message`](@ref) object containing the message data
"""
function helicsFederateGetMessage(fed::Federate)::Lib.helics_message
    return Lib.helicsFederateGetMessage(fed)
end

"""
Receive a communication message for any endpoint in the [`Federate`](@ref)

The return order will be in order of endpoint creation.
So all messages that are available for the first endpoint, then all for the second, and so on within a single endpoint the messages are ordered by time, then `source_id`, then order of arrival

# Returns

- a [`Message`](@ref) which references the
data in the message
"""
function helicsFederateGetMessageObject(fed::Federate)::Message
    return Lib.helicsFederateGetMessageObject(fed)
end

"""
Get the type specified for an [`Endpoint`](@ref)

# Arguments

- `endpoint`: The [`Endpoint`](@ref) object in question

# Returns

- the defined type of the [`Endpoint`](@ref)
"""
function helicsEndpointGetType(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetType(endpoint))
end

"""
get the name of an [`Endpoint`](@ref)

# Arguments

- `endpoint`: The [`Endpoint`](@ref) object in question

# Returns

- the name of the [`Endpoint`](@ref)
"""
function helicsEndpointGetName(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetName(endpoint))
end

"""
Get the number of endpoints in a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to query

# Returns

- (-1) if fed was not a valid federate otherwise returns the number of endpoints
"""
function helicsFederateGetEndpointCount(fed::Federate)::Int
    return Lib.helicsFederateGetEndpointCount(fed)
end

"""
Get the data in the info field of an filter

# Arguments

- `end`: The [`Filter`](@ref) to query

# Returns

- a string with the info field string
"""
function helicsEndpointGetInfo(_end::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetInfo(_end))
end

"""
Set the data in the info field for an filter

# Arguments

- `end`: The [`Endpoint`](@ref) to query
- `info`: The string to set
"""
function helicsEndpointSetInfo(_end::Endpoint, info::String)
    @invoke_and_check Lib.helicsEndpointSetInfo(_end, info)
end

"""
Set a handle option on an [`Endpoint`](@ref)

- `end`: The [`Endpoint`](@ref) to modify
- `option`: Integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
- `value`: The value to set the option
"""
function helicsEndpointSetOption(_end::Endpoint, option::Union{Int, HELICS.HELICS_HANDLE_OPTIONS}, value::Bool)
    @invoke_and_check Lib.helicsEndpointSetOption(_end, option, value ? 1 : 0)
end

"""
Get a handle option on an [`Endpoint`](@ref)

- `end`: The [`Endpoint`](@ref) to modify
- `option`: Integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
"""
function helicsEndpointGetOption(_end::Endpoint, option::Union{Int, HELICS.HELICS_HANDLE_OPTIONS})::Bool
    return Lib.helicsEndpointGetOption(_end, option)
end

"""
Create a source Filter on the specified federate

filters can be created through a [`Federate`](@ref) or a core , linking through a federate allows
a few extra features of name matching to function on the [`Federate`](@ref) interface but otherwise equivalent behavior

# Arguments

- `fed`: the fed to register through
- `type`: the type of filter to create [`HELICS_FILTER_TYPE`](@ref)
- `name`: the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsFederateRegisterFilter(fed::Federate, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return @invoke_and_check Lib.helicsFederateRegisterFilter(fed, kind, name)
end

"""
Create a global source filter through a [`Federate`](@ref)

Filters can be created through a [`Federate`](@ref) or a core , linking through a federate allows
a few extra features of name matching to function on the [`Federate`](@ref) interface but otherwise equivalent behavior

# Arguments

- `fed`: the fed to register through
- `type`: the type of filter to create [`HELICS_FILTER_TYPE`](@ref)
- `name`: the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsFederateRegisterGlobalFilter(fed::Federate, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return @invoke_and_check Lib.helicsFederateRegisterGlobalFilter(fed, kind, name)
end

"""
Create a cloning Filter on the specified federate

Cloning filters copy a message and send it to multiple locations source and destination can be added
through other functions

# Arguments

- `fed`: the fed to register through
- `name`: the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsFederateRegisterCloningFilter(fed::Federate, name::String)::Filter
    return @invoke_and_check Lib.helicsFederateRegisterCloningFilter(fed, name)
end

"""
Create a global cloning Filter on the specified federate

Cloning filters copy a message and send it to multiple locations source and destination can be added
through other functions

# Arguments

- `fed`: the fed to register through
- `name`: the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsFederateRegisterGlobalCloningFilter(fed::Federate, name::String)::Filter
    return @invoke_and_check Lib.helicsFederateRegisterGlobalCloningFilter(fed, name)
end

"""
Create a source Filter on the specified core

Filters can be created through a [`Federate`](@ref) or a core , linking through a federate allows
a few extra features of name matching to function on the [`Federate`](@ref) interface but otherwise equivalent behavior

# Arguments

- `core` the core to register through
- `type` the type of filter to create [`HELICS_FILTER_TYPE`](@ref)
- `name` the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsCoreRegisterFilter(core::Core, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return @invoke_and_check Lib.helicsCoreRegisterFilter(core, kind, name)
end

"""
Create a cloning Filter on the specified core

Cloning filters copy a message and send it to multiple locations source and destination can be added
through other functions

# Arguments

- `core`: the core to register through
- `name`: the name of the [`Filter`](@ref) (can be NULL)

# Returns

- a [`Filter`](@ref) object
"""
function helicsCoreRegisterCloningFilter(core::Core, name::String)::Filter
    return @invoke_and_check Lib.helicsCoreRegisterCloningFilter(core, name)
end

"""
Get a the number of filters registered through a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to use to get the [`Filter`](@ref)

# Returns

- a count of the number of filters registered through a [`Federate`](@ref)
"""
function helicsFederateGetFilterCount(fed::Federate)::Int
    return Lib.helicsFederateGetFilterCount(fed)
end

"""
Get a [`Filter`](@ref) by its name typically already created via helicsFederateRegisterInterfaces file or something of that nature

# Arguments

- `fed`: the [`Federate`](@ref) to use to get the [`Filter`](@ref)
- `name`: the name of the [`Filter`](@ref)

# Returns

- a [`Filter`](@ref) object, the object will not be valid and err will contain an error code if no filter with the specified name exists
"""
function helicsFederateGetFilter(fed::Federate, name::String)::Filter
    return @invoke_and_check Lib.helicsFederateGetFilter(fed, name)
end

"""
Get a [`Filter`](@ref) by its index typically already created via helicsFederateRegisterInterfaces file or something of that nature

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `index`: the index of the [`Publication`](@ref) to get

- a [`Filter`](@ref), which will be NULL if an invalid index
"""
function helicsFederateGetFilterByIndex(fed::Federate, index::Int)::Filter
    return @invoke_and_check Lib.helicsFederateGetFilterByIndex(fed, index)
end

"""
Get the name of the [`Filter`](@ref) and store in the given string

# Arguments

- `filt`: the given [`Filter`](@ref)

# Returns

- a string with the name of the [`Filter`](@ref)
"""
function helicsFilterGetName(filt::Filter)::String
    return unsafe_string(Lib.helicsFilterGetName(filt))
end

"""
Set a property on a [`Filter`](@ref)

# Arguments

- `filt`: the [`Filter`](@ref) to modify
- `prop`: a string containing the property to set
- `val`: a numerical value of the property
"""
function helicsFilterSet(filt::Filter, prop::String, val::Float64)
    @invoke_and_check Lib.helicsFilterSet(filt, prop, val)
end

"""
Set a string property on a [`Filter`](@ref)

# Arguments

- `filt`: the [`Filter`](@ref) to modify
- `prop`: a string containing the property to set
- `val`: a string containing the new value
"""
function helicsFilterSetString(filt::Filter, prop::String, val::String)
    @invoke_and_check Lib.helicsFilterSetString(filt, prop, val)
end

"""
Add a destination target to a [`Filter`](@ref)

All messages going to a destination are copied to the delivery address(es)

# Arguments

- `filt`: the given [`Filter`](@ref) to add a destination target
- `dest`: the name of the [`Endpoint`](@ref) to add as a destination target
"""
function helicsFilterAddDestinationTarget(filt::Filter, dest::String)
    @invoke_and_check Lib.helicsFilterAddDestinationTarget(filt, dest)
end

"""
Add a source target to a [`Filter`](@ref)

All messages coming from a source are copied to the delivery address(es)

- `filt`: the given [`Filter`](@ref)
- `source`: the name of the [`Endpoint`](@ref) to add as a source target
"""
function helicsFilterAddSourceTarget(filt::Filter, source::String)
    @invoke_and_check Lib.helicsFilterAddSourceTarget(filt, source)
end

"""
Add a delivery endpoint to a cloning filter

All cloned messages are sent to the delivery address(es)

# Arguments

- `filt`: the given [`Filter`](@ref)
- `deliveryEndpoint`: the name of the [`Endpoint`](@ref) to deliver messages to
"""
function helicsFilterAddDeliveryEndpoint(filt::Filter, deliveryEndpoint::String)
    @invoke_and_check Lib.helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint)
end

"""
Remove a destination target from a [`Filter`](@ref)

- `filt`: the given [`Filter`](@ref)
- `target`: the named endpoint to remove as a target
"""
function helicsFilterRemoveTarget(filt::Filter, target::String)
    @invoke_and_check Lib.helicsFilterRemoveTarget(filt, target)
end

"""
Remove a delivery destination from a cloning filter

# Arguments

- `filt`: the given [`Filter`](@ref) (must be a cloning filter)
- `deliveryEndpoint`: a string with the deliverEndpoint to remove
"""
function helicsFilterRemoveDeliveryEndpoint(filt::Filter, deliveryEndpoint::String)
    @invoke_and_check Lib.helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint)
end

"""
Get the data in the info field of an filter

# Arguments

- `filt`: the given [`Filter`](@ref)

# Returns

- a string with the info field string
"""
function helicsFilterGetInfo(filt::Filter)::String
    return unsafe_string(Lib.helicsFilterGetInfo(filt))
end

"""
Set the data in the info field for an filter

# Arguments

- `filt`: the given [`Filter`](@ref)
- `info`: the string to set
"""
function helicsFilterSetInfo(filt::Filter, info::String)
    @invoke_and_check Lib.helicsFilterSetInfo(filt, info)
end

"""
Set the data in the info field for an filter

# Arguments

- `filt`: the given [`Filter`](@ref)
- `option`: the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
- `value`: the value of the option (helics_true or helics_false)
"""
function helicsFilterSetOption(filt::Filter, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS}, value::Bool)
    @invoke_and_check Lib.helicsFilterSetOption(filt, option, value ? 1 : 0)
end

"""
Get a handle option for the [`Filter`](@ref)

# Arguments

- `filt`: the given [`Filter`](@ref) to query
- `option`: the option to query [`HELICS_HANDLE_OPTIONS`](@ref)
"""
function helicsFilterGetOption(filt::Filter, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS})::Bool
    return Lib.helicsFilterGetOption(filt, option) == 1 ? true : false
end

"""
Create a [`Subscription`](@ref)

The [`Subscription`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Subscription`](@ref) must have been create with [`helicsCreateValueFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `key`: the identifier matching a [`Publication`](@ref) to get a [`Subscription`](@ref) for
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Subscription`](@ref)
"""
function helicsFederateRegisterSubscription(fed::Federate, key::String, units::String="")::Subscription
    return @invoke_and_check Lib.helicsFederateRegisterSubscription(fed, key, units)
end

"""
Register a [`Publication`](@ref) with a known type

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref) the global publication key will be prepended with the [`Federate`](@ref) name
- `type`: a code identifying the type of the [`Input`](@ref) see [`HELICS_DATA_TYPE`](@ref) for available options
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterPublication(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Publication
    return @invoke_and_check Lib.helicsFederateRegisterPublication(fed, key, kind, units)
end

"""
Register a [`Publication`](@ref) with a defined type

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref)
- `type`: a string labeling the type of the [`Publication`](@ref)
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterTypePublication(fed::Federate, key::String, kind::String, units::String="")::Publication
    return @invoke_and_check Lib.helicsFederateRegisterTypePublication(fed, key, kind, units)
end

"""
Register a global named publication with an arbitrary type

# Arguments

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref)
- `type`: a code identifying the type of the [`Input`](@ref) see [`HELICS_DATA_TYPE`](@ref) for available options
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterGlobalPublication(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Publication
    return @invoke_and_check Lib.helicsFederateRegisterGlobalPublication(fed, key, kind, units)
end

"""
Register a global publication with a defined type

# Arguments

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref)
- `type`: a string describing the expected type of the [`Publication`](@ref)
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterGlobalTypePublication(fed::Federate, key::String, kind::String, units::String="")::Publication
    return @invoke_and_check Lib.helicsFederateRegisterGlobalTypePublication(fed, key, kind, units)
end

"""
Register a named input

The [`Input`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions, inputs, and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create an [`Input`](@ref)
- `key`: the identifier for the [`Publication`](@ref) the global input key will be prepended with the [`Federate`](@ref) name
- `type`: a code identifying the type of the [`Input`](@ref) see [`HELICS_DATA_TYPE`](@ref) for available options
- `units`: a string listing the units of the [`Input`](@ref) maybe NULL

# Returns

- the [`Input`](@ref)
"""
function helicsFederateRegisterInput(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Input
    return @invoke_and_check Lib.helicsFederateRegisterInput(fed, key, kind, units)
end

"""
Register an [`Input`](@ref) with a defined type

The [`Input`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions, inputs and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create an [`Input`](@ref)
- `key`: the identifier for the [`Input`](@ref)
- `type`: a string describing the expected type of the [`Input`](@ref)
- `units`: a string listing the units of the [`Input`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterTypeInput(fed::Federate, key::String, kind::String, units::String="")::Input
    return @invoke_and_check Lib.helicsFederateRegisterTypeInput(fed, key, kind, units)
end

"""
Register a global named input

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref)
- `type`: a code identifying the type of the [`Input`](@ref) see [`HELICS_DATA_TYPE`](@ref) for available options
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterGlobalInput(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Input
    return @invoke_and_check Lib.helicsFederateRegisterGlobalInput(fed, key, kind, units)
end

"""
Register a global publication with an arbitrary type

The [`Publication`](@ref) becomes part of the [`Federate`](@ref) and is destroyed when the [`Federate`](@ref) is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `key`: the identifier for the [`Publication`](@ref)
- `type`: a string defining the type of the [`Input`](@ref)
- `units`: a string listing the units of the [`Subscription`](@ref) maybe NULL

# Returns

- the [`Publication`](@ref)
"""
function helicsFederateRegisterGlobalTypeInput(fed::Federate, key::String, kind::String, units::String="")::Input
    return @invoke_and_check Lib.helicsFederateRegisterGlobalTypeInput(fed, key, kind, units)
end

"""
Get a [`Publication`](@ref) object from a key

# Arguments

- `fed`: the value federate object to use to get the [`Publication`](@ref)
- `key`: the name of the [`Publication`](@ref)

# Returns

- a [`Publication`](@ref) object, the object will not be valid and err will contain an error code if no publication with the
specified key exists
"""
function helicsFederateGetPublication(fed::Federate, key::String)::Publication
    return @invoke_and_check Lib.helicsFederateGetPublication(fed, key)
end

"""
Get a [`Publication`](@ref) by its index typically already created via helicsFederateRegisterInterfaces file or something of that nature

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `index`: the index of the [`Publication`](@ref) to get

# Returns

- a helics_publication
"""
function helicsFederateGetPublicationByIndex(fed::Federate, index::Int)::Publication
    return @invoke_and_check Lib.helicsFederateGetPublicationByIndex(fed, index)
end

"""
Get an [`Input`](@ref) object from a key

# Arguments

- `fed`: the value federate object to use to get the [`Publication`](@ref)
- `key`: the name of the [`Input`](@ref)

# Returns

- a [`Subscription`](@ref) object, the object will not be valid and err will contain an error code if no input with the specified key exists
"""
function helicsFederateGetInput(fed::Federate, key::String)::Input
    return @invoke_and_check Lib.helicsFederateGetInput(fed, key)
end

"""
Get an [`Input`](@ref) by its index typically already created via helicsFederateRegisterInterfaces file or something of that nature

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Publication`](@ref)
- `index`: the index of the [`Publication`](@ref) to get

# Returns

- a helics_input, which will be NULL if an invalid index
"""
function helicsFederateGetInputByIndex(fed::Federate, index::Int)::Input
    return @invoke_and_check Lib.helicsFederateGetInputByIndex(fed, index)
end

"""
Get an [`Input`](@ref) object from a [`Subscription`](@ref) target

# Arguments

- `fed`: the value federate object to use to get the [`Publication`](@ref)
- `key`: the name of the [`Publication`](@ref) that a [`Subscription`](@ref) is targeting

# Returns

- a [`Subscription`](@ref) object, the object will not be valid and err will contain an error code if no input with the specified
key exists
"""
function helicsFederateGetSubscription(fed::Federate, key::String)::Subscription
    return @invoke_and_check Lib.helicsFederateGetSubscription(fed, key)
end

"""
Publish raw data from bytes

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `data`: the raw data
"""
function helicsPublicationPublishRaw(pub::Publication, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsPublicationPublishRaw(pub, data, inputDataLength)
end

"""
Publish a string

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `str`: String
"""
function helicsPublicationPublishString(pub::Publication, str::String)
    @invoke_and_check Lib.helicsPublicationPublishString(pub, str)
end

"""
Publish an integer value

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishInteger(pub::Publication, val::Int)
    @invoke_and_check Lib.helicsPublicationPublishInteger(pub, val)
end

"""
Publish a Boolean Value

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `val`: the boolean value to publish either `true` or `false`
"""
function helicsPublicationPublishBoolean(pub::Publication, val::Bool)
    @invoke_and_check Lib.helicsPublicationPublishBoolean(pub, val ? 1 : 0)
end

"""
Publish a double floating point value

# Arguments

- `pub` the [`Publication`](@ref) to publish for
- `val` the numerical value to publish
"""
function helicsPublicationPublishDouble(pub::Publication, val::Float64)
    @invoke_and_check Lib.helicsPublicationPublishDouble(pub, val)
end

"""
Publish a time value

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishTime(pub::Publication, val::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsPublicationPublishTime(pub, val)
end

"""
Publish a single character

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishChar(pub::Publication, val::Char)
    @invoke_and_check Lib.helicsPublicationPublishChar(pub, val)
end

"""
Publish a complex value (or pair of values)

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `c`: the complex number to publish
"""
function helicsPublicationPublishComplex(pub::Publication, c::ComplexF64)
    @invoke_and_check Lib.helicsPublicationPublishComplex(pub, c.re, c.im)
end

"""
Publish a vector of doubles

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `vectorInput`: Vector of Float64 data
"""
function helicsPublicationPublishVector(pub::Publication, vectorInput::Vector{Float64})
    vectorLength = length(vectorInput)
    @invoke_and_check Lib.helicsPublicationPublishVector(pub, vectorInput, vectorLength)
end

"""
Publish a named point

# Arguments

- `pub`: the [`Publication`](@ref) to publish for
- `str`: a String
- `val`: a Float64 to publish
"""
function helicsPublicationPublishNamedPoint(pub::Publication, str::String, val::Float64)
    @invoke_and_check Lib.helicsPublicationPublishNamedPoint(pub, str, val)
end

"""
Add a named input to the list of targets a [`Publication`](@ref) publishes to

# Arguments

- `pub`: the [`Publication`](@ref) to add the target for
- `target`: the name of an [`Input`](@ref) that the data should be sent to
"""
function helicsPublicationAddTarget(pub::Publication, target::String)
    @invoke_and_check Lib.helicsPublicationAddTarget(pub, target)
end

"""
Add a [`Publication`](@ref) to the list of data that an [`Input`](@ref) subscribes to

# Arguments

- `ipt`: the named input to modify
- `target`: the name of a [`Publication`](@ref) that an [`Input`](@ref) should subscribe to
"""
function helicsInputAddTarget(ipt::Input, target::String)
    @invoke_and_check Lib.helicsInputAddTarget(ipt, target)
end

"""
Get the size of the raw value for subscription

# Returns

- the size of the raw data/string in bytes
"""
function helicsInputGetRawValueSize(ipt::Input)::Int
    return Lib.helicsInputGetRawValueSize(ipt)
end

"""
Get the raw data for the latest value of a [`Subscription`](@ref)
"""
function helicsInputGetRawValue(ipt::Input)::String
    maxlen = Lib.helicsInputGetRawValueSize(ipt)
    actualSize = Ref(maxlen)
    data = Ref(repeat(" ", maxlen))
    @invoke_and_check Lib.helicsInputGetRawValue(ipt, data, maxlen, actualSize)
    return data[]
end

"""
Get the size of a value for subscription assuming return as a string

# Returns

- the size of the string
"""
function helicsInputGetStringSize(ipt::Input)::Int
    return Lib.helicsInputGetStringSize(ipt)
end

"""
Get a string value from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for
"""
function helicsInputGetString(ipt::Input)::String
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref{Int32}(maxStringLen)
    @invoke_and_check Lib.helicsInputGetString(ipt, outputString, maxStringLen, actualLength)
    return outputString[1:(actualLength[]-1)]
end

"""
Get an integer value from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- an int64_t value with the current value of the [`Input`](@ref)
"""
function helicsInputGetInteger(ipt::Input)::Int
    return @invoke_and_check Lib.helicsInputGetInteger(ipt)
end

"""
Get a boolean value from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- a boolean value of current input value
"""
function helicsInputGetBoolean(ipt::Input)::Bool
    r = @invoke_and_check Lib.helicsInputGetBoolean(ipt)
    return r == 1 ? true : false
end

"""
Get a double value from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- the double value of the [`Input`](@ref)
"""
function helicsInputGetDouble(ipt::Input)::Float64
    return @invoke_and_check Lib.helicsInputGetDouble(ipt)
end

"""
Get a double value from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- the resulting double value
"""
function helicsInputGetTime(ipt::Input)::Float64
    return @invoke_and_check Lib.helicsInputGetTime(ipt)
end

"""
Get a single character value from an [`Input`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- the resulting character value
"""
function helicsInputGetChar(ipt::Input)::Char
    return @invoke_and_check Lib.helicsInputGetChar(ipt)
end

"""
Get a complex object from an [`Input`](@ref) object

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- `ComplexF64`
"""
function helicsInputGetComplexObject(ipt::Input)::ComplexF64
    r = @invoke_and_check Lib.helicsInputGetComplexObject(ipt)
    return r.real + im * r.imag
end

"""
Get a pair of double forming a complex number from a [`Subscription`](@ref)s

# Arguments

- `ipt`: the [`Input`](@ref) to get the data for

# Returns

- ComplexF64
"""
function helicsInputGetComplex(ipt::Input)::ComplexF64
    real = Ref{Float64}(0)
    imag = Ref{Float64}(0)
    @invoke_and_check Lib.helicsInputGetComplex(ipt, real, imag)
    return real[] + im * imag[]
end

"""
Get the size of a value for subscription assuming return as an array of doubles

# Returns

- the number of double in a return vector
"""
function helicsInputGetVectorSize(ipt::Input)::Int64
    return Lib.helicsInputGetVectorSize(ipt)
end

"""
Get a vector from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the result for
"""
function helicsInputGetVector(ipt::Input)::Vector{Float64}
    maxlen = Cint(helicsInputGetVectorSize(ipt))
    data = Vector{Float64}(undef, maxlen)
    actualSize = Ref(maxlen)
    @invoke_and_check Lib.helicsInputGetVector(ipt, data, maxlen, actualSize)
    return data[1:actualSize[]]
end

"""
Get a named point from a [`Subscription`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to get the result for

# Returns

- outputString storage for copying a null terminated string
- val the double value for the named point
"""
function helicsInputGetNamedPoint(ipt::Input)::Tuple{String, Float64}
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref{Int32}(maxStringLen)
    val = Ref{Float64}(0.0)
    @invoke_and_check Lib.helicsInputGetNamedPoint(ipt, outputString, maxStringLen, actualLength, val)
    return outputString[1:(actualLength[]-1)], val[]
end

"""
Set the default as a raw data array

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `data`: a pointer to the raw data to use for the default
"""
function helicsInputSetDefaultRaw(ipt::Input, data)
    inputDataLength = length(data)
    @invoke_and_check Lib.helicsInputSetDefaultRaw(ipt, pointer(data), inputDataLength)
end

"""
Set the default as a string

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `str`: a pointer to the default string
"""
function helicsInputSetDefaultString(ipt::Input, str::String)
    @invoke_and_check Lib.helicsInputSetDefaultString(ipt, str)
end

"""
Set the default as an integer

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `val`: the default integer
"""
function helicsInputSetDefaultInteger(ipt::Input, val::Int)
    @invoke_and_check Lib.helicsInputSetDefaultInteger(ipt, val)
end

"""
Set the default as a boolean

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `val`: the default boolean value
"""
function helicsInputSetDefaultBoolean(ipt::Input, val::Bool)
    @invoke_and_check Lib.helicsInputSetDefaultBoolean(ipt, val ? 1 : 0)
end

"""
Set the default as a double

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultTime(ipt::Input, val::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsInputSetDefaultTime(ipt, val)
end

"""
Set the default as a double

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultChar(ipt::Input, val::Char)
    @invoke_and_check Lib.helicsInputSetDefaultChar(ipt, val)
end

"""
Set the default as a double

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultDouble(ipt::Input, val::Float64)
    @invoke_and_check Lib.helicsInputSetDefaultDouble(ipt, val)
end

"""
Set the default as a complex number

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `c`: the default ComplexF64
"""
function helicsInputSetDefaultComplex(ipt::Input, c::ComplexF64)
    @invoke_and_check Lib.helicsInputSetDefaultComplex(ipt, c.re, c.im)
end

"""
Set the default as a vector of doubles

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `vectorInput`: an array of double data
"""
function helicsInputSetDefaultVector(ipt::Input, vectorInput::Vector{Float64})
    vectorLength = length(vectorInput)
    @invoke_and_check Lib.helicsInputSetDefaultVector(ipt, vectorInput, vectorLength)
end

"""
Set the default as a NamedPoint

# Arguments

- `ipt`: the [`Input`](@ref) to set the default for
- `str`: a pointer to a string representing the name
- `val`: a double value for the value of the named point
"""
function helicsInputSetDefaultNamedPoint(ipt::Input, str::String, val::Float64)
    @invoke_and_check Lib.helicsInputSetDefaultNamedPoint(ipt, str, val)
end

"""
Get the type of an [`Input`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- A string with the type name
"""
function helicsInputGetType(ipt::Input)::String
    # TODO: check documentation
    return unsafe_string(Lib.helicsInputGetType(ipt))
end

"""
Get the type of the publisher to an [`Input`](@ref) is sending

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- A string with the type name
"""
function helicsInputGetPublicationType(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetPublicationType(ipt))
end

"""
Get the type of a [`Publication`](@ref)

# Arguments

- `pub`: the [`Publication`](@ref) to query

# Returns

- A string with the type name
"""
function helicsPublicationGetType(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetType(pub))
end

"""
Get the key of an [`Input`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- A string with the type name
"""
function helicsInputGetKey(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetKey(ipt))
end

"""
Get the key of a [`Subscription`](@ref)

# Returns

- a string with the [`Subscription`](@ref) key
"""
function helicsSubscriptionGetKey(ipt::Input)::String
    return unsafe_string(Lib.helicsSubscriptionGetKey(ipt))
end

"""
Get the key of a [`Publication`](@ref)

this will be the global key used to identify the [`Publication`](@ref) to the federation

# Arguments

- `pub`: the [`Publication`](@ref) to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsPublicationGetKey(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetKey(pub))
end

"""
Get the units of an [`Input`](@ref)

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetUnits(ipt))
end

"""
Get the units of the [`Publication`](@ref) that an [`Input`](@ref) is linked to

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsPublicationGetUnits(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetUnits(pub))
end

"""
Get the data in the info field of an [`Input`](@ref)

# Arguments

- `inp`: the [`Input`](@ref) to query

# Returns

- a string with the info field string
"""
function helicsInputGetInfo(inp::Input)::String
    return unsafe_string(Lib.helicsInputGetInfo(inp))
end

"""
Set the data in the info field for an [`Input`](@ref)

# Arguments

- `inp`: the [`Input`](@ref) to query
- `info`: the string to set
"""
function helicsInputSetInfo(inp::Input, info::String)
    @invoke_and_check Lib.helicsInputSetInfo(inp, info)
end

"""
Get the data in the info field of an publication

# Arguments

- `pub`: the [`Publication`](@ref) to query

# Returns

- a string with the info field string
"""
function helicsPublicationGetInfo(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetInfo(pub))
end

"""
Set the data in the info field for an publication

# Arguments

- `pub`: the [`Publication`](@ref) to set the info field for
- `info`: the string to set
"""
function helicsPublicationSetInfo(pub::Publication, info::String)
    @invoke_and_check Lib.helicsPublicationSetInfo(pub, info)
end

"""
Get the data in the info field of an [`Input`](@ref)

# Arguments

- `inp`: the [`Input`](@ref) to query
- `option`: integer representation of the option in question see [`HELICS_HANDLE_OPTIONS`](@ref)

# Returns

- a string with the info field string
"""
function helicsInputGetOption(inp::Input, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS})::Bool
    return Lib.helicsInputGetOption(inp, option) == 1 ? true : false
end

"""
Set the data in the info field for an [`Input`](@ref)

# Arguments

- `inp`: the [`Input`](@ref) to query
- `option`: the option to set for the [`Input`](@ref) [`HELICS_HANDLE_OPTIONS`](@ref)
- `value`: the value to set the option to
"""
function helicsInputSetOption(inp::Input, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS}, value::Bool)
    @invoke_and_check Lib.helicsInputSetOption(inp, option, value ? 1 : 0)
end

"""
Get the data in the info field of an publication

# Arguments

- `pub`: the [`Publication`](@ref) to query
- `option`: the value to query see [`HELICS_HANDLE_OPTIONS`](@ref)

# Arguments

- a string with the info field string
"""
function helicsPublicationGetOption(pub::Publication, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS})::Bool
    return Lib.helicsPublicationGetOption(pub, option) == 1 ? true : false
end

"""
Set the data in the info field for an publication

# Arguments

- `pub`: the [`Publication`](@ref) to query
- `option`: integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
- `val`: the value to set the option to
"""
function helicsPublicationSetOption(pub::Publication, option::Union{Int,HELICS.HELICS_HANDLE_OPTIONS}, val::Bool)
    @invoke_and_check Lib.helicsPublicationSetOption(pub, option, val ? 1 : 0)
end

"""
Check if a particular subscription was updated

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- true if it has been updated since the last value retrieval
"""
function helicsInputIsUpdated(ipt::Input)::Bool
    return Lib.helicsInputIsUpdated(ipt) == 1 ? true : false
end

"""
Get the last time a [`Subscription`](@ref) was updated

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- Float64
"""
function helicsInputLastUpdateTime(ipt::Input)::Float64
    return Lib.helicsInputLastUpdateTime(ipt)
end

"""
Get the number of publications in a [`Federate`](@ref)


# Arguments

- `fed`: an existing [`Federate`](@ref)

# Returns

- (-1) if fed was not a valid federate otherwise returns the number of publications
"""
function helicsFederateGetPublicationCount(fed::Federate)::Int
    return Lib.helicsFederateGetPublicationCount(fed)
end

"""
Get the number of subscriptions in a [`Federate`](@ref)

# Arguments

- `fed`: an existing [`Federate`](@ref)

# Returns

- (-1) if fed was not a valid federate otherwise returns the number of subscriptions
"""
function helicsFederateGetInputCount(fed::Federate)::Int
    return Lib.helicsFederateGetInputCount(fed)
end

"""
Get a version string for HELICS
"""
function helicsGetVersion()::String
    return unsafe_string(Lib.helicsGetVersion())
end

"""
Return an initialized error object
"""
function helicsErrorInitialize()::Lib.helics_error
    return Lib.helicsErrorInitialize()
end

"""
Clear an error object
"""
function helicsErrorClear(err::Ref{Lib.helics_error})
    Lib.helicsErrorClear(err)
end

"""
Returns true if core/broker type specified is available in current compilation.

# Arguments

- `type`: a string representing a core type

# Returns

- a `Bool`

possible options include "test","zmq","udp","ipc","interprocess","tcp","default", "mpi"
"""
function helicsIsCoreTypeAvailable(kind::String)::Bool
    return Lib.helicsIsCoreTypeAvailable(kind) == 1 ? true : false
end

"""
Create a core object

# Arguments

- `type`: the type of the core to create
- `name`: the name of the core , may be a empty string to have a name automatically assigned
- `initString`: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  --broker="XSSAF" or the number of federates or the address

# Returns

- a [`Core`](@ref) object if the core is invalid err will contain some indication
"""
function helicsCreateCore(kind::String, name::String, initString::String)::Core
    return @invoke_and_check Lib.helicsCreateCore(kind, name, initString)
end

"""
"""
function helicsCreateCoreFromArgs(kind::String, name::String, argv::Vector{<:AbstractString})::Core
    return @invoke_and_check Lib.helicsCreateCoreFromArgs(kind, name, length(argv), argv)
end

"""
Create a new reference to an existing core

this will create a new broker object that references the existing broker it must be freed as well

# Arguments

- `core`: an existing [`Core`](@ref)

# Returns

- a new reference to the same [`Core`](@ref)
"""
function helicsCoreClone(core::Core)::Core
    return @invoke_and_check Lib.helicsCoreClone(core)
end

"""
Check if a core object is a valid object

# Arguments

- `core`: the [`Core`](@ref) object to test
"""
function helicsCoreIsValid(core::Core)::Bool
    return Lib.helicsCoreIsValid(core) == 1 ? true : false
end

"""
Create a broker object

# Arguments

- `type`: the type of [`Broker`](@ref) to create
- `name`: the name of [`Broker`](@ref), may be a empty string to have a name automatically assigned
- `initString`: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  --broker="XSSAF" if this is a subbroker or the number of federates or the address

# Returns

- a [`Broker`](@ref) object, will be NULL if there was an error indicated in the err object
"""
function helicsCreateBroker(kind::String, name::String, initString::String)::Broker
    return @invoke_and_check Lib.helicsCreateBroker(kind, name, initString)
end

"""
"""
function helicsCreateBrokerFromArgs(kind::String, name::String, argv::Vector{<:AbstractString})::Broker
    return @invoke_and_check Lib.helicsCreateBrokerFromArgs(kind, name, length(argv), argv)
end

"""
Create a new reference to an existing broker

this will create a new broker object that references the existing broker it must be freed as well

# Arguments

- `broker`: an existing [`Broker`](@ref)

# Returns

- a new reference to the same broker
"""
function helicsBrokerClone(broker::Broker)::Broker
    return @invoke_and_check Lib.helicsBrokerClone(broker)
end

"""
Check if a broker object is a valid object

# Arguments

- `broker`: the [`Broker`](@ref) object to test
"""
function helicsBrokerIsValid(broker::Broker)::Bool
    return Lib.helicsBrokerIsValid(broker) == 1 ? true : false
end

"""
Check if a broker is connected. A connected broker implies is attached to cores or cores could reach out to communicate. return 0 if not connected , something else if it is connected.
"""
function helicsBrokerIsConnected(broker::Broker)::Bool
    return Lib.helicsBrokerIsConnected(broker) == 1 ? true : false
end

"""
Link a named publication and named input using a broker

# Arguments

- `broker`: the [`Broker`](@ref) to generate the connection from
- `source`: the name of the [`Publication`](@ref) (cannot be NULL)
- `target`: the name of the target to send the [`Publication`](@ref) data (cannot be NULL)
"""
function helicsBrokerDataLink(broker::Broker, source::String, target::String)
    @invoke_and_check Lib.helicsBrokerDataLink(broker, source, target)
end

"""
Link a named filter to a source endpoint

# Arguments

- `broker` the [`Broker`](@ref) to generate the connection from
- `filter` the name of the [`Filter`](@ref) (cannot be NULL)
- `endpoint` the name of the [`Endpoint`](@ref) to filter the data from (cannot be NULL)
"""
function helicsBrokerAddSourceFilterToEndpoint(broker::Broker, filter::String, endpoint::String)
    @invoke_and_check Lib.helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint)
end

"""
Link a named filter to a destination endpoint

# Arguments

- `broker` the [`Broker`](@ref) to generate the connection from
- `filter` the name of the [`Filter`](@ref) (cannot be NULL)
- `endpoint` the name of the [`Endpoint`](@ref) to filter the data going to (cannot be NULL)
"""
function helicsBrokerAddDestinationFilterToEndpoint(broker::Broker, filter::String, endpoint::String)
    @invoke_and_check Lib.helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint)
end

"""
Wait for the [`Broker`](@ref) to disconnect

# Arguments

- `broker`: the [`Broker`](@ref) to wait for
- `msToWait`: the time out in millisecond (<0 for infinite timeout)

# Returns

- `true` if the disconnect was successful, `false` if there was a timeout
"""
function helicsBrokerWaitForDisconnect(broker::Broker, msToWait::Int)::Bool
    r = @invoke_and_check Lib.helicsBrokerWaitForDisconnect(broker, msToWait)
    return r == 1 ? true : false
end

"""
Check if a core is connected. A connected core implies is attached to federate or federates could be attached to it.

# Returns

- `false` if not connected, `true` if it is connected
"""
function helicsCoreIsConnected(core::Core)::Bool
    return Lib.helicsCoreIsConnected(core) == 1 ? true : false
end

"""
Link a named publication and named input using a core

# Arguments

- `core`: the core to generate the connection from
- `source`: the name of the [`Publication`](@ref) (cannot be NULL)
- `target`: the named of the target to send the [`Publication`](@ref) data (cannot be NULL)
"""
function helicsCoreDataLink(core::Core, source::String, target::String)
    @invoke_and_check Lib.helicsCoreDataLink(core, source, target)
end

"""
Link a named filter to a source endpoint

# Arguments

- `core`: the core to generate the connection from
- `filter`: the name of the [`Filter`](@ref) (cannot be NULL)
- `endpoint`: the name of the [`Endpoint`](@ref) to filter the data from (cannot be NULL)
"""
function helicsCoreAddSourceFilterToEndpoint(core::Core, filter::String, endpoint::String)
    @invoke_and_check Lib.helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint)
end

"""
"""
function helicsCoreAddDestinationFilterToEndpoint(core::Core, filter::String, endpoint::String)
    @invoke_and_check Lib.helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint)
end

"""
Get an identifier for the [`Broker`](@ref)

# Arguments

- `broker`: the [`Broker`](@ref) to query

# Returns

- a string containing the identifier for the [`Broker`](@ref)
"""
function helicsBrokerGetIdentifier(broker::Broker)::String
    return unsafe_string(Lib.helicsBrokerGetIdentifier(broker))
end

"""
Get an identifier for the core

# Arguments

- `core`: the core to query

# Returns

- a string with the identifier of the core
"""
function helicsCoreGetIdentifier(core::Core)::String
    return unsafe_string(Lib.helicsCoreGetIdentifier(core))
end

"""
Get the network address associated with a broker

# Arguments

- `broker`: the [`Broker`](@ref) to query

# Returns

- a string with the network address of the [`Broker`](@ref)
"""
function helicsBrokerGetAddress(broker::Broker)::String
    return unsafe_string(Lib.helicsBrokerGetAddress(broker))
end

"""
Set the core to ready for init

this function is used for cores that have filters but no federates so there needs to be a direct signal to the core to trigger the federation initialization

# Arguments

- `core`: the core object to enable init values for
"""
function helicsCoreSetReadyToInit(core::Core)
    @invoke_and_check Lib.helicsCoreSetReadyToInit(core)
end

"""
Get an identifier for the core

# Arguments

- `core`: the core to query

# Returns

- a void enumeration indicating any error condition
"""
function helicsCoreDisconnect(core::Core)
    @invoke_and_check Lib.helicsCoreDisconnect(core)
end

"""
Get an existing [`Federate`](@ref) from a core by name

the [`Federate`](@ref) must have been created by one of the other functions and at least one of the objects referencing the created
    federate must still be active in the process

# Arguments

- `fedName`: the name of the [`Federate`](@ref) to retrieve

# Returns

- NULL if no fed is available by that name otherwise a [`Federate`](@ref) with that name
"""
function helicsGetFederateByName(fedName::String)::CombinationFederate
    return @invoke_and_check Lib.helicsGetFederateByName(fedName)
end

"""
Disconnect a broker

# Arguments

- `broker`: the [`Broker`](@ref) to disconnect
"""
function helicsBrokerDisconnect(broker::Broker)
    @invoke_and_check Lib.helicsBrokerDisconnect(broker)
end

"""
Disconnect and free a broker
"""
function helicsFederateDestroy(fed::Federate)
    Lib.helicsFederateDestroy(fed)
end

"""
Disconnect and free a broker
"""
function helicsBrokerDestroy(broker::Broker)
    Lib.helicsBrokerDestroy(broker)
end

"""
Disconnect and free a core
"""
function helicsCoreDestroy(core::Core)
    Lib.helicsCoreDestroy(core)
end

"""
Release the memory associated with a core
"""
function helicsCoreFree(core::Core)
    Lib.helicsCoreFree(core)
end

"""
Release the memory associated with a broker
"""
function helicsBrokerFree(broker::Broker)
    Lib.helicsBrokerFree(broker)
end

"""
Create a value federate from a [`FederateInfo`](@ref) object

[`Federate`](@ref) objects can be used in all functions that take a [`Federate`](@ref) object as an argument

# Arguments

- `fedName`: the name of the [`Federate`](@ref) to create, can NULL or an empty string to use the default name from fi or an assigned name
- `fi`: the [`FederateInfo`](@ref) object that contains details on the [`Federate`](@ref)

# Returns

- [`ValueFederate`](@ref)
"""
function helicsCreateValueFederate(fedName::String, fi::FederateInfo)::ValueFederate
    return @invoke_and_check Lib.helicsCreateValueFederate(fedName, fi)
end

"""
Create a value federate from a JSON file, JSON string, or TOML file

[`Federate`](@ref) objects can be used in all functions that take a [`Federate`](@ref) object as an argument

# Arguments

- `configFile`:  a JSON file or a JSON string or TOML file that contains setup and configuration information

# Returns

- [`ValueFederate`](@ref)
"""
function helicsCreateValueFederateFromConfig(configFile::String)::ValueFederate
    return @invoke_and_check Lib.helicsCreateValueFederateFromConfig(configFile)
end

"""
Create a [`MessageFederate`](@ref) from a [`FederateInfo`](@ref) object

[`MessageFederate`](@ref) objects can be used in all functions that take a [`MessageFederate`](@ref) or [`Federate`](@ref) object as an argument

# Arguments

- `fedName`: the name of the [`Federate`](@ref) to create
- `fi`: the [`FederateInfo`](@ref) object that contains details on the [`Federate`](@ref)

# Returns

- [`MessageFederate`](@ref)
"""
function helicsCreateMessageFederate(fedName::String, fi::FederateInfo)::MessageFederate
    return @invoke_and_check Lib.helicsCreateMessageFederate(fedName, fi)
end

"""
Create a [`MessageFederate`](@ref) from a JSON file or JSON string or TOML file

[`MessageFederate`](@ref) objects can be used in all functions that take a [`MessageFederate`](@ref) or [`Federate`](@ref) object as an argument

# Arguments

- `configFile`:  a Config(JSON,TOML) file or a JSON string that contains setup and configuration information

# Returns

- [`MessageFederate`](@ref)
"""
function helicsCreateMessageFederateFromConfig(configFile::String)::MessageFederate
    return @invoke_and_check Lib.helicsCreateMessageFederateFromConfig(configFile)
end

"""
Create a [`CombinationFederate`](@ref) from a [`FederateInfo`](@ref) object

[`CombinationFederate`](@ref) are both [`ValueFederate`](@ref) and [`MessageFederate`](@ref), objects can be used in all functions that take a [`Federate`](@ref), [`MessageFederate`](@ref) or [`ValueFederate`](@ref) object as an argument

# Arguments

- `fedName`: a string with the name of the [`Federate`](@ref), can be NULL or an empty string to pull the default name from fi
- `fi`: the [`FederateInfo`](@ref) object that contains details on the [`Federate`](@ref)

# Returns

- [`ValueFederate`](@ref)
"""
function helicsCreateCombinationFederate(fedName::String, fi::FederateInfo)::CombinationFederate
    return @invoke_and_check Lib.helicsCreateCombinationFederate(fedName, fi)
end

"""
Create a [`CombinationFederate`](@ref) from a JSON file or JSON string

[`CombinationFederate`](@ref) are both [`ValueFederate`](@ref) and [`MessageFederate`](@ref), objects can be used in all functions that take a [`Federate`](@ref), [`MessageFederate`](@ref) or [`ValueFederate`](@ref) object as an argument

# Arguments

- `configFile`:  a JSON file or a JSON string or TOML file that contains setup and configuration information

# Returns

- [`CombinationFederate`](@ref)
"""
function helicsCreateCombinationFederateFromConfig(configFile::String)::CombinationFederate
    return @invoke_and_check Lib.helicsCreateCombinationFederateFromConfig(configFile)
end

"""
Create a new reference to an existing federate

this will create a new [`Federate`](@ref) object that references the existing federate it must be freed as well

# Arguments

- `fed`: an existing [`Federate`](@ref)

# Returns

- a new reference to the same federate
"""
function helicsFederateClone(fed::T)::T where T <: Federate
    return @invoke_and_check Lib.helicsFederateClone(fed)
end

"""
Create a [`FederateInfo`](@ref) object for specifying federate information when constructing a [`Federate`](@ref)

# Returns

- a [`FederateInfo`](@ref) object which is a reference to the created object
"""
function helicsCreateFederateInfo()::FederateInfo
    return Lib.helicsCreateFederateInfo()
end

"""
Create a [`FederateInfo`](@ref) object from an existing one and clone the information

# Arguments

- `fi`: a [`FederateInfo`](@ref) object to duplicate

# Returns

- a [`FederateInfo`](@ref) object which is a reference to the created object
"""
function helicsFederateInfoClone(fi::FederateInfo)::FederateInfo
    return @invoke_and_check Lib.helicsFederateInfoClone(fi)
end

"""
Load a [`FederateInfo`](@ref) from command line arguments

# Arguments

- `fi`: a [`FederateInfo`](@ref) object
- `argc`: the number of command line arguments
- `argv`: an array of strings from the command line
"""
function helicsFederateInfoLoadFromArgs(fi::FederateInfo, argv::Vector{<:AbstractString})
    @invoke_and_check Lib.helicsFederateInfoLoadFromArgs(fi, length(argv), argv)
end

"""
Delete the memory associated with a [`FederateInfo`](@ref) object
"""
function helicsFederateInfoFree(fi::FederateInfo)
    Lib.helicsFederateInfoFree(fi)
end

"""
Check if a [`Federate`](@ref)_object is valid

# Returns

- `true` if the [`Federate`](@ref) is a valid active federate, `false` otherwise
"""
function helicsFederateIsValid(fed::Federate)::Bool
    return Lib.helicsFederateIsValid(fed) == 1 ? true : false
end

"""
Set the name of the core to link to for a [`Federate`](@ref)

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `corename`: the identifier for a core to link to
"""
function helicsFederateInfoSetCoreName(fi::FederateInfo, corename::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreName(fi, corename)
end

"""
Set the initialization string for the core usually in the form of command line arguments

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coreInit`: a string with the core initialization strings
"""
function helicsFederateInfoSetCoreInitString(fi::FederateInfo, coreInit::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreInitString(fi, coreInit)
end

"""
Set the core type by integer code

valid values available by definitions in api-data.h

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coretype`: an numerical code for a core type see /ref helics_core_type
"""
function helicsFederateInfoSetCoreType(fi::FederateInfo, coretype::Union{Int, HELICS.HELICS_CORE_TYPE})
    @invoke_and_check Lib.helicsFederateInfoSetCoreType(fi, coretype)
end

"""
Set the core type from a string

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coretype`: a string naming a core type
"""
function helicsFederateInfoSetCoreTypeFromString(fi::FederateInfo, coretype::String)
    @invoke_and_check Lib.helicsFederateInfoSetCoreTypeFromString(fi, coretype)
end

"""
Set the name or connection information for a broker

this is only used if the core is automatically created, the [`Broker`](@ref) information will be transferred to the core for connection

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `broker`: a string which defined the connection information for a broker either a name or an address
"""
function helicsFederateInfoSetBroker(fi::FederateInfo, broker::String)
    @invoke_and_check Lib.helicsFederateInfoSetBroker(fi, broker)
end

"""
Set the port to use for the [`Broker`](@ref)

this is only used if the core is automatically created, the [`Broker`](@ref) information will be transferred to the core for connection this will only be useful for network broker connections

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `brokerPort`: the integer port number to use for connection with a broker
"""
function helicsFederateInfoSetBrokerPort(fi::FederateInfo, brokerPort::Int)
    @invoke_and_check Lib.helicsFederateInfoSetBrokerPort(fi, brokerPort)
end

"""
Set the local port to use

this is only used if the core is automatically created, the port information will be transferred to the core for connection

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `localPort`: a string with the port information to use as the local server port can be a number or "auto" or "os_local"
"""
function helicsFederateInfoSetLocalPort(fi::FederateInfo, localPort::String)
    @invoke_and_check Lib.helicsFederateInfoSetLocalPort(fi, localPort)
end

"""
Get a property index for use in [`helicsFederateInfoSetFlagOption`](@ref), [`helicsFederateInfoSetTimeProperty`](@ref), [`helicsFederateInfoSetIntegerProperty`](@ref)

# Arguments

- `val`: a string with the property name

# Returns

- an int with the property code (-1) if not a valid property
"""
function helicsGetPropertyIndex(val::String)::Int
    return Lib.helicsGetPropertyIndex(val)
end

"""
Get an option index for use in [`helicsPublicationSetOption`](@ref), [`helicsInputSetOption`](@ref), [`helicsEndpointSetOption`](@ref), [`helicsFilterSetOption`](@ref), and the corresponding get functions

# Arguments

- `val`: a string with the option name

# Returns

- an int with the option index (-1) if not a valid property
"""
function helicsGetOptionIndex(val::String)::Int
    return Lib.helicsGetOptionIndex(val)
end

"""
Set a flag in the info structure

valid flags are available [`HELICS_FEDERATE_FLAGS`](@ref)

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `flag`: a numerical index for a flag
- `value`: the desired value of the flag `true` or `false`
"""
function helicsFederateInfoSetFlagOption(fi::FederateInfo, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS}, value::Bool)
    @invoke_and_check Lib.helicsFederateInfoSetFlagOption(fi, flag, value ? 1 : 0)
end

"""
Set the separator character in the info structure

the separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is '/'  then a local endpoint would have a globally reachable name of fedName/localName

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `separator`: the character to use as a separator
"""
function helicsFederateInfoSetSeparator(fi::FederateInfo, separator::Char)
    @invoke_and_check Lib.helicsFederateInfoSetSeparator(fi, separator)
end

"""
"""
function helicsFederateInfoSetTimeProperty(fi::FederateInfo, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyValue::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsFederateInfoSetTimeProperty(fi, timeProperty, propertyValue)
end

"""
"""
function helicsFederateInfoSetIntegerProperty(fi::FederateInfo, intProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyValue::Int)
    @invoke_and_check Lib.helicsFederateInfoSetIntegerProperty(fi, intProperty, propertyValue)
end

"""
Load interfaces from a file

# Arguments

- `fed`: the [`Federate`](@ref) to which to load interfaces
- `file`: the name of a file to load the interfaces from either JSON, or TOML
"""
function helicsFederateRegisterInterfaces(fed::Federate, file::String)
    @invoke_and_check Lib.helicsFederateRegisterInterfaces(fed, file)
end

"""
Finalize the [`Federate`](@ref) this function halts all communication in the [`Federate`](@ref) and disconnects it from the core
"""
function helicsFederateFinalize(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalize(fed)
end

"""
Finalize the [`Federate`](@ref) in an async call
"""
function helicsFederateFinalizeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalizeAsync(fed)
end

"""
Complete the asynchronous finalize call
"""
function helicsFederateFinalizeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateFinalizeComplete(fed)
end

"""
Release the memory associated with a [`Federate`](@ref)
"""
function helicsFederateFree(fed::Federate)
    Lib.helicsFederateFree(fed)
end

"""
Call when done using the helics library,  this function will ensure the threads are closed properly if possible
    this should be the last call before exiting,
"""
function helicsCloseLibrary()
    Lib.helicsCloseLibrary()
end

"""
Enter the initialization state of a [`Federate`](@ref)

the initialization state allows initial values to be set and received if the iteration is requested on entry to the execution state. This is a blocking call and will block until the core allows it to proceed.

# Arguments

- `fed`: the [`Federate`](@ref) to operate on
"""
function helicsFederateEnterInitializingMode(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingMode(fed)
end

"""
Non blocking alternative to [`helicsFederateEnterInitializingMode`](@ref).
The function [`helicsFederateFinalize`](@ref) must be called to finish the operation

# Arguments

- `fed`: the [`Federate`](@ref) to operate on
"""
function helicsFederateEnterInitializingModeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingModeAsync(fed)
end

"""
Check if the current Asynchronous operation has completed

# Arguments

- `fed`: the [`Federate`](@ref) to operate on

# Returns

- `false` if not completed, `true` if completed
"""
function helicsFederateIsAsyncOperationCompleted(fed::Federate)::Bool
    r = @invoke_and_check Lib.helicsFederateIsAsyncOperationCompleted(fed)
    return r == 1 ? true : false
end

"""
Finalize the entry to initialize mode that was initiated with [`helicsFederateEnterInitializingModeAsync`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) desiring to complete the initialization step function
"""
function helicsFederateEnterInitializingModeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterInitializingModeComplete(fed)
end

"""
Request that the [`Federate`](@ref) enter the Execution mode

this call is blocking until granted entry by the core object for an asynchronous alternative call [`helicsFederateEnterExecutingModeAsync`](@ref) on return from this call the [`Federate`](@ref) will be at time 0.

# Arguments

- `fed`: a [`Federate`](@ref) to change modes
"""
function helicsFederateEnterExecutingMode(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingMode(fed)
end

"""
Request that the [`Federate`](@ref) enter the Execution mode

this call is non-blocking and will return immediately.
Call [`helicsFederateEnterExecutingModeComplete`](@ref) to finish the call sequence.

# Arguments

- `fed`: the [`Federate`](@ref) to complete the call
"""
function helicsFederateEnterExecutingModeAsync(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeAsync(fed)
end

"""
Complete the call to [`helicsFederateEnterExecutingModeAsync`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to complete the call
"""
function helicsFederateEnterExecutingModeComplete(fed::Federate)
    @invoke_and_check Lib.helicsFederateEnterExecutingModeComplete(fed)
end

"""
Request an iterative time

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time and iteration request and return a time and iteration status.

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `iterate`: the requested iteration mode

# Returns

- an iteration structure with field containing the time and iteration status
"""
function helicsFederateEnterExecutingModeIterative(fed::Federate, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})::HELICS.HELICS_ITERATION_RESULT
    return @invoke_and_check Lib.helicsFederateEnterExecutingModeIterative(fed, iterate)
end

"""
Request an iterative entry to the execution mode

This call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time and and iteration request and return a time and iteration status

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `iterate`: the requested iteration mode
"""
function helicsFederateEnterExecutingModeIterativeAsync(fed::Federate, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})
    return @invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeAsync(fed, iterate)
end

"""
Complete the asynchronous iterative call into ExecutionModel

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of

# Returns

- an iteration object containing the iteration time and iteration_status
"""
function helicsFederateEnterExecutingModeIterativeComplete(fed::Federate)::HELICS.HELICS_ITERATION_RESULT
    return @invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeComplete(fed)
end

"""
Get the current state of a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- state the resulting state if void return helics_ok
"""
function helicsFederateGetState(fed::Federate)::HELICS.HELICS_FEDERATE_STATE
    return @invoke_and_check Lib.helicsFederateGetState(fed)
end

"""
Get the core object associated with a [`Federate`](@ref)

# Arguments

- `fed`: a [`Federate`](@ref) object

# Returns

- a [`Core`](@ref) object
"""
function helicsFederateGetCoreObject(fed::Federate)::Core
    return @invoke_and_check Lib.helicsFederateGetCoreObject(fed)
end

"""
Request the next time for federate execution

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `requestTime`: the next requested time

# Returns

- the time granted to the [`Federate`](@ref)
    invalid
"""
function helicsFederateRequestTime(fed::Federate, requestTime::HELICS.HELICS_TIME)::Float64
    return @invoke_and_check Lib.helicsFederateRequestTime(fed, requestTime)
end

"""
Request the next time step for federate execution

feds should have setup the period or minDelta for this to work well but it will request the next time step which is the current time plus the minimum time step.

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of

# Returns

- the time granted to the [`Federate`](@ref)
"""
function helicsFederateRequestNextStep(fed::Federate)::Float64
    return @invoke_and_check Lib.helicsFederateRequestNextStep(fed)
end

"""
Request an iterative time

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time and iteration request and return a time and iteration status.

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `requestTime`: the next desired time
- `iterate`: the requested iteration mode

# Returns

- the granted time
- the iteration specification of the result
"""
function helicsFederateRequestTimeIterative(fed::Federate, requestTime::HELICS.HELICS_TIME, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})::Tuple{Float64, HELICS.HELICS_ITERATION_RESULT}
    outIteration = Ref(HELICS.HELICS_ITERATION_RESULT(0))
    t = @invoke_and_check Lib.helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIteration)
    return t, outIteration[]
end

"""
Request the next time for federate execution in an asynchronous call
Call [`helicsFederateRequestTimeComplete`](@ref) to finish the call

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `requestTime`: the next requested time
"""
function helicsFederateRequestTimeAsync(fed::Federate, requestTime::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsFederateRequestTimeAsync(fed, requestTime)
end

"""
Complete an asynchronous requestTime call

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of

# Returns

- the time granted to the [`Federate`](@ref)
"""
function helicsFederateRequestTimeComplete(fed::Federate)::Float64
    return @invoke_and_check Lib.helicsFederateRequestTimeComplete(fed)
end

"""
Request an iterative time through an asynchronous call

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time an iteration request and returns a time and iteration status call [`helicsFederateRequestTimeIterativeComplete`](@ref) to finish the process.

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of
- `requestTime`: the next desired time
- `iterate`: the requested iteration mode

# Returns

- a void object with a return code of the result
"""
function helicsFederateRequestTimeIterativeAsync(fed::Federate, requestTime::HELICS.HELICS_TIME, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})
    @invoke_and_check Lib.helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate)
end

"""
Complete an iterative time request asynchronous call

# Arguments

- `fed`: the [`Federate`](@ref) to make the request of

# Returns

- the granted time
- `outIterate`  the iteration specification of the result
"""
function helicsFederateRequestTimeIterativeComplete(fed::Federate)::Tuple{Float64, HELICS.HELICS_ITERATION_RESULT}
    outIterate = Ref(HELICS.HELICS_ITERATION_RESULT(0))
    t = @invoke_and_check Lib.helicsFederateRequestTimeIterativeComplete(fed, outIterate)
    return t, outIterate[]
end

"""
Get the name of the [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- a string with the name
"""
function helicsFederateGetName(fed::Federate)::String
    return unsafe_string(Lib.helicsFederateGetName(fed))
end

"""
Set a time based property for a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) set the property for
- `timeProperty`: a integer code for a time property
- `time`: the requested value of the property
"""
function helicsFederateSetTimeProperty(fed::Federate, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES}, time::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsFederateSetTimeProperty(fed, timeProperty, time)
end

"""
Set a flag for the [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to alter a flag for
- `flag`: the flag to change
- `flagValue`: the new value of the flag 0 for false !=0 for true
"""
function helicsFederateSetFlagOption(fed::Federate, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS, HELICS.HELICS_HANDLE_OPTIONS}, flagValue::Bool)
    @invoke_and_check Lib.helicsFederateSetFlagOption(fed, flag, flagValue ? 1 : 0)
end

"""
Set the separator character in a [`Federate`](@ref)

The separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is '/'  then a local endpoint would have a globally reachable name of fedName/localName.

# Arguments

- `fed`: the [`Federate`](@ref) object to alter
- `separator`: the character to use as a separator
"""
function helicsFederateSetSeparator(fed::Federate, separator::Char)
    @invoke_and_check Lib.helicsFederateSetSeparator(fed, separator)
end

"""
Set an integer based property of a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to change the property for
- `intProperty`: the property to set
- `propertyVal`: the value of the property
"""
function helicsFederateSetIntegerProperty(fed::Federate, intProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyVal::Int)
    @invoke_and_check Lib.helicsFederateSetIntegerProperty(fed, intProperty, propertyVal)
end

"""
Get the current value of a time based property in a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) query
- `timeProperty`: the property to query
"""
function helicsFederateGetTimeProperty(fed::Federate, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES})::Float64
    return @invoke_and_check Lib.helicsFederateGetTimeProperty(fed, timeProperty)
end

"""
Get a flag value for a [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to get the flag for
- `flag`: the flag to query

# Returns

- the value of the flag
"""
function helicsFederateGetFlagOption(fed::Federate, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS, HELICS.HELICS_HANDLE_OPTIONS})::Bool
    r = @invoke_and_check Lib.helicsFederateGetFlagOption(fed, flag)
    return r == 1 ? true : false
end

"""
Set the logging level for the [`Federate`](@ref)

debug and trace only do anything if they were enabled in the compilation

# Arguments

- `fed`: the [`Federate`](@ref) to get the flag for
- `intProperty`: a code for the property to set [`HELICS_HANDLE_OPTIONS`](@ref)

# Returns

- the value of the property
"""
function helicsFederateGetIntegerProperty(fed::Federate, intProperty::Union{Int, HELICS.HELICS_PROPERTIES, HELICS.HELICS_HANDLE_OPTIONS})::Int
    return @invoke_and_check Lib.helicsFederateGetIntegerProperty(fed, intProperty)
end

"""
Get the current time of the [`Federate`](@ref)

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- the current time of the [`Federate`](@ref)
"""
function helicsFederateGetCurrentTime(fed::Federate)::Float64
    return @invoke_and_check Lib.helicsFederateGetCurrentTime(fed)
end

"""
Set a federation global value through a [`Federate`](@ref)

this overwrites any previous value for this name

# Arguments

- `fed`: the [`Federate`](@ref) to set the global through
- `valueName`: the name of the global to set
- `value`: the value of the global
"""
function helicsFederateSetGlobal(fed::Federate, valueName::String, value::String)
    @invoke_and_check Lib.helicsFederateSetGlobal(fed, valueName, value)
end

"""
Set a global value in a core

this overwrites any previous value for this name

# Arguments

- `core`: the core to set the global through
- `valueName`: the name of the global to set
- `value`: the value of the global
"""
function helicsCoreSetGlobal(core::Core, valueName::String, value::String)
    @invoke_and_check Lib.helicsCoreSetGlobal(core, valueName, value)
end

"""
Set a federation global value

this overwrites any previous value for this name

# Arguments

- `broker`: the [`Broker`](@ref) to set the global through
- `valueName`: the name of the global to set
- `value`: the value of the global
"""
function helicsBrokerSetGlobal(broker::Broker, valueName::String, value::String)
    @invoke_and_check Lib.helicsBrokerSetGlobal(broker, valueName, value)
end

"""
Create a [`Query`](@ref)

a [`Query`](@ref) consists of a target and query string

# Arguments

- `target`: the name of the target to query
- `query`: the query string to make of the target
"""
function helicsCreateQuery(target::String, query::String)::Query
    return Lib.helicsCreateQuery(target, query)
end

"""
Execute a query

the call will block until the [`Query`](@ref) finishes which may require communication or other delays

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `fed`: a [`Federate`](@ref) to send the [`Query`](@ref) through

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if fed or [`Query`](@ref) is an invalid object, the return string will be "#invalid" if the [`Query`](@ref) itself was invalid
"""
function helicsQueryExecute(query::Query, fed::Federate)::String
    r = @invoke_and_check Lib.helicsQueryExecute(query, fed)
    return unsafe_string(r)
end

"""
Execute a [`Query`](@ref) directly on a core

the call will block until the [`Query`](@ref) finishes which may require communication or other delays

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `core`: the core to send the [`Query`](@ref) to

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if fed or [`Query`](@ref) is an invalid object, the return string will be "#invalid" if the [`Query`](@ref) itself was invalid
"""
function helicsQueryCoreExecute(query::Query, core::Core)::String
    r = @invoke_and_check Lib.helicsQueryCoreExecute(query, core)
    return unsafe_string(r)
end

"""
Execute a [`Query`](@ref) directly on a broker

the call will block until the [`Query`](@ref) finishes which may require communication or other delays

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `broker`: the [`Broker`](@ref) to send the [`Query`](@ref) to

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if fed or [`Query`](@ref) is an invalid object, the return string will be "#invalid" if the [`Query`](@ref) itself was invalid
"""
function helicsQueryBrokerExecute(query::Query, broker::Broker)::String
    r = @invoke_and_check Lib.helicsQueryBrokerExecute(query, broker)
    return unsafe_string(r)
end

"""
Execute a [`Query`](@ref) in a non-blocking call

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `fed`: a [`Federate`](@ref) to send the [`Query`](@ref) through
"""
function helicsQueryExecuteAsync(query::Query, fed::Federate)
    @invoke_and_check Lib.helicsQueryExecuteAsync(query, fed)
end

"""
Complete the return from a [`Query`](@ref) called with [`helicsQueryExecuteAsync`](@ref)

the function will block until the [`Query`](@ref) completes [`helicsQueryIsCompleted`](@ref) can be called to determine if a [`Query`](@ref) has completed or not.

# Arguments

- `query`: the [`Query`](@ref) to complete execution of

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if [`Query`](@ref) is an invalid object
"""
function helicsQueryExecuteComplete(query::Query)::String
    r = @invoke_and_check Lib.helicsQueryExecuteComplete(query)
    return unsafe_string(r)
end

"""
Check if an asynchronously executed [`Query`](@ref) has completed

this function should usually be called after a QueryExecuteAsync function has been called.

# Arguments

- `query`: the [`Query`](@ref) to check if completed

# Returns

- will return `true` if an asynchronous [`Query`](@ref) has complete or a regular [`Query`](@ref) call was made with a result and `false` if an asynchronous [`Query`](@ref) has not completed or is invalid
"""
function helicsQueryIsCompleted(query::Query)::Bool
    return Lib.helicsQueryIsCompleted(query) == 1 ? true : false
end

"""
Free the memory associated with a [`Query`](@ref)
"""
function helicsQueryFree(query::Query)
    Lib.helicsQueryFree(query)
end

"""
Function to do some housekeeping work

this runs some cleanup routines and tries to close out any residual thread that haven't been shutdown yet.
"""
function helicsCleanupLibrary()
    Lib.helicsCleanupLibrary()
end

"""
Create a new empty message object

The message is empty and isValid will return false since there is no data associated with the message yet.

# Returns

- a [`Message`](@ref) containing the message data
"""
function helicsFederateCreateMessageObject(fed::Federate)::Message
    @invoke_and_check Lib.helicsFederateCreateMessageObject(fed)
end

"""
Get the source endpoint of a message

     message operation functions

functions for working with helics message envelopes

# Arguments

- `message`: The message object in question

# Returns

- a string with the source endpoint
"""
function helicsMessageGetSource(message::Message)::String
    return unsafe_string(Lib.helicsMessageGetSource(message))
end

"""
Get the destination endpoint of a message

# Arguments

- `message`: The message object in question

# Returns

- a string with the destination endpoint
"""
function helicsMessageGetDestination(message::Message)::String
    return unsafe_string(Lib.helicsMessageGetDestination(message))
end

"""
Get the original source endpoint of a message, the source may have
modified by filters or other actions

# Arguments

- `message`: The message object in question

# Returns

- a string with the source of a message
"""
function helicsMessageGetOriginalSource(message::Message)::String
    return unsafe_string(Lib.helicsMessageGetOriginalSource(message))
end

"""
Get the original destination endpoint of a message, the destination may
have been modified by filters or other actions

# Arguments

- `message`: The message object in question

# Returns

- a string with the original destination of a message
"""
function helicsMessageGetOriginalDestination(message::Message)::String
    return unsafe_string(Lib.helicsMessageGetOriginalDestination(message))
end

"""
Get the helics time associated with a message

# Arguments

- `message`: The message object in question

# Returns

- the time associated with a message
"""
function helicsMessageGetTime(message::Message)::Float64
    return Lib.helicsMessageGetTime(message)
end

"""
Get the payload of a message as a string

# Arguments

- `message`: The message object in question

# Returns

- a string representing the payload of a message
"""
function helicsMessageGetString(message::Message)::String
    return unsafe_string(Lib.helicsMessageGetString(message))
end

"""
Get the messageID of a message

# Arguments

- `message`: The message object in question

# Returns

- the messageID
"""
function helicsMessageGetMessageID(message::Message)::Int
    return Lib.helicsMessageGetMessageID(message)
end

"""
Check if a flag is set on a message

# Arguments

- `message`: The message object in question
- `flag`: The flag to check should be between [0,15]

# Returns

- the flags associated with a message
"""
function helicsMessageCheckFlag(message::Message, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS})::Bool
    return Lib.helicsMessageCheckFlag(message, flag) == 1 ? true : false
end

"""
Get the size of the data payload in bytes

# Arguments

- `message`: The message object in question

# Returns

- the size of the data payload
"""
function helicsMessageGetRawDataSize(message::Message)::Int
    return Lib.helicsMessageGetRawDataSize(message)
end

"""
Get the raw data for a message object

- `message`: A message object to get the data for
- `data`: The memory location of the data
- `maxMessagelen`: The maximum size of information that data can hold
- `actualSize`: The actual length of data copied to data
"""
function helicsMessageGetRawData(message::Message)::String
    maxlen = Cint(helicsMessageGetRawDataSize(message))
    data = Vector{Cchar}(undef, maxlen)
    actualSize = Ref(maxlen)
    @invoke_and_check Lib.helicsMessageGetRawData(message, Ref(data), maxlen, actualSize)
    return String(Vector{UInt8}(data))
end

"""
Get a pointer to the raw data of a message

# Arguments

- `message`: A message object to get the data for

# Returns

- a pointer to the raw data in memory, the
pointer may be NULL if the message is not a valid message
"""
function helicsMessageGetRawDataPointer(message::Message)::Ptr{Cvoid}
    return Lib.helicsMessageGetRawDataPointer(message)
end

"""
A check if the message contains a valid payload

# Arguments

- `message`: The message object in question

# Returns

- true if the message contains a payload
"""
function helicsMessageIsValid(message::Message)::Bool
    return Lib.helicsMessageIsValid(message) == 1 ? true : false
end

"""
Set the source of a message

# Arguments

- `message`: The message object in question
- `src`: A string containing the source
"""
function helicsMessageSetSource(message::Message, src::String)
    @invoke_and_check Lib.helicsMessageSetSource(message, src)
end

"""
Set the destination of a message

# Arguments

- `message`: The message object in question
- `dest`: A string containing the new destination
"""
function helicsMessageSetDestination(message::Message, dest::String)
    @invoke_and_check Lib.helicsMessageSetDestination(message, dest)
end

"""
Set the original source of a message

# Arguments

- `message`: The message object in question
- `src`: A string containing the new original source
"""
function helicsMessageSetOriginalSource(message::Message, src::String)
    @invoke_and_check Lib.helicsMessageSetOriginalSource(message, src)
end

"""
Set the original destination of a message

# Arguments

- `message`: The message object in question
- `dest`: A string containing the new original source
"""
function helicsMessageSetOriginalDestination(message::Message, dest::String)
    @invoke_and_check Lib.helicsMessageSetOriginalDestination(message, dest)
end

"""
Set the delivery time for a message

# Arguments

- `message`: The message object in question
- `time`: The time the message should be delivered
"""
function helicsMessageSetTime(message::Message, time::HELICS.HELICS_TIME)
    @invoke_and_check Lib.helicsMessageSetTime(message, time)
end

"""
Resize the data buffer for a message

the message data buffer will be resized there is no guarantees on what
is in the buffer in newly allocated space if the allocated space is not
sufficient new allocations will occur

# Arguments

- `message`: The message object in question
- `newSize`: The new size in bytes of the buffer
"""
function helicsMessageResize(message::Message, newSize::Int)
    @invoke_and_check Lib.helicsMessageResize(message, newSize)
end

"""
Reserve space in a buffer but don't actually resize

the message data buffer will be reserved but not resized

# Arguments

- `message`: The message object in question
- `reserveSize`: The number of bytes to reserve in the message object
"""
function helicsMessageReserve(message::Message, reserveSize::Int)
    @invoke_and_check Lib.helicsMessageReserve(message, reserverSize)
end

"""
Set the message ID for the message

normally this is not needed and the core of HELICS will adjust as needed

# Arguments

- `message`: The message object in question
- `messageID`: A new message ID
"""
function helicsMessageSetMessageID(message::Message, messageID::Int32)
    @invoke_and_check helicsMessageSetMessageID(message, messageID)
end

"""
Clear the flags of a message

# Arguments

- `message`: The message object in question
"""
function helicsMessageClearFlags(message::Message)
    Lib.helicsMessageClearFlags(message)
end

"""
Set a flag on a message

# Arguments

- `message`: The message object in question
- `flag`: An index of a flag to set on the message
- `flagValue`: The desired value of the flag
"""
function helicsMessageSetFlagOption(message::Message, flag::Union{Int, HELICS_FEDERATE_FLAGS}, flagValue::Bool)
    @invoke_and_check Lib.helicsMessageSetFlagOption(message, flag, flagValue)
end

"""
Set the data payload of a message as a string

# Arguments

- `message`: The message object in question
- `str`: A string containing the message data
"""
function helicsMessageSetString(message::Message, str::String)
    @invoke_and_check Lib.helicsMessageSetString(message, str)
end

"""
Set the data payload of a message as raw data

# Arguments

- `message`: The message object in question
- `data`: A string containing the message data
- `inputDataLength`: The length of the data to input
"""
function helicsMessageSetData(message::Message, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsMessageSetData(message, data, inputDataLength)
end

"""
Append data to the payload

# Arguments

- `message`: The message object in question
- `data`: A string containing the message data to append
- `inputDataLength`: The length of the data to input
"""
function helicsMessageAppendData(message::Message, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    @invoke_and_check Lib.helicsMessageAppendData(message, data, inputDataLength)
end

"""
Get the units of the [`Publication`](@ref) that an [`Input`](@ref) is linked to

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetInjectionUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetInjectionUnits(ipt))
end

"""
Register the [`Publication`](@ref)s via  JSON publication string

This would be the same JSON that would be used to publish data

# Arguments

- `fed`: the [`Federate`](@ref)
- `json`: json string
"""
function helicsFederateRegisterFromPublicationJSON(fed::Federate, json::String)
    @invoke_and_check Lib.helicsFederateRegisterFromPublicationJSON(fed, json)
end

"""
Set a the log file on a core

# Arguments

- `core`: The core to set the global through
- `logFileName`: The name of the file to log to
"""
function helicsCoreSetLogFile(core::Core, logFileName::String)
    @invoke_and_check Lib.helicsCoreSetLogFile(core, logFileName)
end

"""
Set a the log file on a broker

# Arguments

- `broker`: the [`Broker`](@ref) to set the global through
- `logFileName`: The name of the file to log to
"""
function helicsBrokerSetLogFile(broker::Broker, logFileName::String)
    @invoke_and_check Lib.helicsBrokerSetLogFile(broker::Broker, logFileName::String)
end

"""
Clear all stored messages from a [`Federate`](@ref)

this clears messages retrieved through [`helicsFederateGetMessage`](@ref) or
[`helicsFederateGetMessageObject`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to clear the message for
"""
function helicsFederateClearMessages(fed::Federate)
    Lib.helicsFederateClearMessages(fed)
end

"""
Clear all the update flags from a [`Federate`](@ref)s inputs
"""
function helicsFederateClearUpdates(fed::Federate)
    Lib.helicsFederateClearUpdates(fed)
end

"""
Log a message through a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogInfoMessage(fed::Federate, logmessage::String)
    @invoke_and_check Lib.helicsFederateLogInfoMessage(fed, logmessage)
end

"""
Get the units of an [`Input`](@ref)

The same as helicsInputGetUnits

# Arguments

- `ipt`: the [`Input`](@ref) to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetExtractionUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetExtractionUnits(ipt))
end

"""
Set the logging file for a [`Federate`](@ref) (actually on the core associated with a federate)

# Arguments

- `fed`: the [`Federate`](@ref) to set the log file for
- `logFile`: the name of the log file
"""
function helicsFederateSetLogFile(fed::Federate, logFile::String)
    @invoke_and_check Lib.helicsFederateSetLogFile(fed, logFile)
end

"""
Log a message through a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to set the global through
- `loglevel`: The level of the message to log. See [`HELICS_LOG_LEVELS`](@ref)
- `logmessage`: The message to put in the log
"""
function helicsFederateLogLevelMessage(fed::Federate, loglevel::Union{Int, HELICS_LOG_LEVELS}, logmessage::String)
    @invoke_and_check Lib.helicsFederateLogLevelMessage(fed, loglevel, logmessage)
end

"""
Get the network address associated with a core

# Arguments

- `core`: The core to query

# Returns

- a string with the network address of the [`Broker`](@ref)
"""
function helicsCoreGetAddress(core::Core)::String
    return unsafe_string(Lib.helicsCoreGetAddress(core))
end

"""
Clear the updated flag from an [`Input`](@ref)
"""
function helicsInputClearUpdate(ipt::Input)
    Lib.helicsInputClearUpdate(ipt)
end

"""
Set the logging callback for a [`Federate`](@ref)

Add a logging callback function for the C The logging callback will be called when
a message flows into a [`Federate`](@ref) from the core or from a federate

# Arguments

- `fed`: the [`Federate`](@ref) in which to create a [`Subscription`](@ref) must have been create with [`helicsCreateValueFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `logger`: a callback with signature void(int, const char *, const char *, void *); the function arguments are loglevel, an identifier string, and a message string, and a pointer to user data
- `userdata`: a point to user data that is passed to the function when executing
"""
function helicsFederateSetLoggingCallback(fed::Federate, logger::CFunction, userdata)
    @invoke_and_check Lib.helicsFederateSetLoggingCallback(fed, logger, userdata)
end

"""
Log an error message through a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogErrorMessage(fed::Federate, logmessage::String)
    @invoke_and_check Lib.helicsFederateLogErrorMessage(fed, logmessage)
end

"""
Wait for the core to disconnect

# Arguments

- `core`: The core to wait for
- `msToWait`: The time out in millisecond (<0 for infinite timeout)

# Returns

`true` if the disconnect was successful,
`false` if there was a timeout
"""
function helicsCoreWaitForDisconnect(core::Core, msWait::Int)
    @invoke_and_check Lib.helicsCoreWaitForDisconnect(core, msWait)
end

"""
Log a message through a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogDebugMessage(fed::Federate, logmessage::String)
    @invoke_and_check Lib.helicsFederateLogDebugMessage(fed, logmessage)
end

"""
Set the logging callback to a broker

Add a logging callback function for the C The logging callback will be called when
a message flows into a broker from the core or from a broker

# Arguments

- `broker`: the [`Broker`](@ref) object in which to create a [`Subscription`](@ref) must have been create with [`helicsCreateValueFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `logger`: a callback with signature void(int, const char *, const char *, void *); the function arguments are loglevel,  an identifier, and a message string, and a pointer to user data
- `userdata`: a point to user data that is passed to the function when executing
"""
function helicsBrokerSetLoggingCallback(broker::Broker, logger::CFunction, userdata)
    @invoke_and_check Lib.helicsBrokerSetLoggingCallback(broker, logger, userdata)
end

"""
Set the key for a broker connection

this is only used if the core is automatically created, the [`Broker`](@ref)
information will be transferred to the core for connection

# Arguments

- `fi`: The [`Federate`](@ref) info object to alter
- `brokerkey`: A string containing a key for the [`Broker`](@ref) to connect
"""
function helicsFederateInfoSetBrokerKey(fi::FederateInfo, brokerKey::String)
    @invoke_and_check Lib.helicsFederateInfoSetBrokerKey(fi, brokerKey)
end

"""
Log a warning message through a [`Federate`](@ref)

# Arguments

- `fed`: The [`Federate`](@ref) to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogWarningMessage(fed::Federate, logmessage::String)
    @invoke_and_check Lib.helicsFederateLogWarningMessage(fed, logmessage)
end

"""
Publish data contained in a json file or string

# Arguments

- `fed`: The [`Federate`](@ref)
- `json`: json file or string
"""
function helicsFederatePublishJSON(fed::Federate, json::String)
    @invoke_and_check Lib.helicsFederatePublishJSON(fed, json)
end

"""
Request the next time for federate execution

# Arguments

- `fed`: The [`Federate`](@ref) to make the request of
- `timeDelta`: The requested amount of time to advance

# Returns

- the time granted to the [`Federate`](@ref), will return maximum time if the simulation has terminated invalid
"""
function helicsFederateRequestTimeAdvance(fed::Federate, timeDelta::HELICS.HELICS_TIME)::Float64
    return @invoke_and_check Lib.helicsFederateRequestTimeAdvance(fed, timeDelta)
end

"""
Clear all message from an [`Endpoint`](@ref)

# Arguments

- `endpoint`: The [`Endpoint`](@ref) object to operate on
"""
function helicsEndpointClearMessages(endpoint::Endpoint)
    Lib.helicsEndpointClearMessages(endpoint)
end

"""
Set the logging callback for a core

Add a logging callback function for the C The logging callback will be called when
a message flows into a core from the core or from a broker

# Arguments

- `core`: the core object in which to create a [`Subscription`](@ref) must have been create with [`helicsCreateValueFederate`](@ref) or [`helicsCreateCombinationFederate`](@ref)
- `logger`: a callback with signature void(int, const char *, const char *, void *); the function arguments are loglevel,  an identifier, and a message string
- `userdata`: a point to user data that is passed to the function when executing
"""
function helicsCoreSetLoggingCallback(core::Core, logger::CFunction, userdata)
    @invoke_and_check Lib.helicsCoreSetLoggingCallback(broker, logger, userdata)
end

"""
Set the initialization string that a core will pass to a generated
broker usually in the form of command line arguments

# Arguments

- `fi`: The [`Federate`](@ref) info object to alter
- `brokerInit`: A string with command line arguments for a generated broker
"""
function helicsFederateInfoSetBrokerInitString(fi::FederateInfo, brokerInit::String)
    @invoke_and_check Lib.helicsFederateInfoSetBrokerInitString(fi::FederateInfo, brokerInit)
end

"""
Load a file containing connection information

# Arguments

- `broker`: the [`Broker`](@ref) to generate the connections from
- `file`: A JSON or TOML file containing connection information
"""
function helicsBrokerMakeConnections(broker::Broker, file::String)
    @invoke_and_check Lib.helicsBrokerMakeConnections(broker, file)
end

"""
Load a file containing connection information

# Arguments

- `core`: The core to generate the connections from
- `file`: A JSON or TOML file containing connection information
"""
function helicsCoreMakeConnections(core::Core, file::String)
    @invoke_and_check Lib.helicsCoreMakeConnections(core, file)
end

"""
Set the minimum change detection tolerance

# Arguments

- `inp`: the [`Input`](@ref) to modify
- `tolerance`: the tolerance level for registering an update, values changing less than this value will not show as being updated
"""
function helicsInputSetMinimumChange(inp::Input, tolerance::Float64)
    @invoke_and_check Lib.helicsInputSetMinimumChange(inp, tolerance)
end

"""
Set the minimum change detection tolerance

# Arguments

- `pub`: the [`Publication`](@ref) to modify
- `tolerance`: the tolerance level for the [`Publication`](@ref), values changing less than this value will not be published
"""
function helicsPublicationSetMinimumChange(pub::Publication, tolerance::Float64)
    @invoke_and_check Lib.helicsPublicationSetMinimumChange(pub, tolerance)
end

"""
Generate a global Error from a [`Federate`](@ref)

A global error halts the co-simulation completely

# Arguments

- `fed`: the [`Federate`](@ref) to create an error in
- `error_code`: the integer code for the error
- `error_string`: a string describing the error
"""
function helicsFederateGlobalError(fed::Federate, error_code::Integer, error_string::String)
    Lib.helicsFederateGlobalError(fed, code, error_string)
end

"""
Generate a local error in a [`Federate`](@ref)

This will propagate through the co-simulation but not necessarily halt the co-simulation, it has a similar effect to finalize but does allow some interaction with a core for a brief time.

# Arguments

- `fed`: the [`Federate`](@ref) to create an error in
- `error_code`: the integer code for the error
- `error_string`: a string describing the error
"""
function helicsFederateLocalError(fed::Federate, error_code::Integer, error_string::String)
    Lib.helicsFederateLocalError(fed, code, error_string)
end

"""
Add a time dependency for a [`Federate`](@ref).  The [`Federate`](@ref) will depend on the given named federate for time synchronization

# Arguments

- `fed`: the [`Federate`](@ref) to add the dependency for
- `fedName`: the name of the [`Federate`](@ref) to depend on
"""
function helicsFederateAddDependency(fed::Federate, fedName::String)
    @invoke_and_check helicsFederateAddDependency(fed, fedName)
end

"""
Check if an endpoint is valid.

# Arguments

- `endpoint`: The [`Endpoint`](@ref) object to check.

# Returns

`true` if the `Endpoint` object represents a valid endpoint.
"""
function helicsEndpointIsValid(endpoint::Endpoint)::Bool
    Lib.helicsEndpointIsValid(endpoint)
end

"""
Send a [`Message`](@ref) object from a specific endpoint, the message will not be copied and the message object will no longer be valid after the call.

# Arguments

- `endpoint`: The [`Endpoint`](@ref) to send the data from.
- `message`: The actual [`Message`](@ref) to send which will be copied.
"""
function helicsEndpointSendMessageObjectZeroCopy(endpoint::Endpoint, message::Message)
    @invoke_and_check Lib.helicsEndpointSendMessageObjectZeroCopy(endpoint, message)
end

"""
Check if a [`Filter`](@ref) is valid.

# Arguments

- `filt`: The [`Filter`](@ref) object to check.

# Returns

@return `true` if the [`Filter`](@ref) object represents a valid filter.
"""
function helicsFilterIsValid(filt::Filter)::Bool
    Lib.helicsFilterIsValid(filt)
end

"""
Check if a [`Publication`](@ref) is valid.

# Arguments

- `pub`: The [`Publication`](@ref) object to check.

# Returns

@return `true` if the [`Publication`](@ref) object represents a valid publication.
"""
function helicsPublicationIsValid(pub::Publication)::Bool
    Lib.helicsPublicationIsValid(pub)
end

"""
Check if a [`Input`](@ref) is valid.

# Arguments

- `ipt`: The [`Input`](@ref) object to check.

# Returns

@return `true` if the [`Input`](@ref) object represents a valid input.
"""
function helicsInputIsValid(ipt)::Bool
    Lib.helicsInputIsValid(ipt)
end


function helicsEndpointCreateMessageObject(endpoint::Endpoint)
    @invoke_and_check Lib.helicsEndpointCreateMessageObject(endpoint)
end

function helicsMessageClone(message)
    @invoke_and_check Lib.helicsMessageClone(message)
end

function helicsMessageFree(message)
    Lib.helicsMessageFree(message)
end

function helicsGetBuildFlags()
    unsafe_string(Lib.helicsGetBuildFlags())
end

function helicsGetCompilerVersion()
    unsafe_string(Lib.helicsGetCompilerVersion())
end

function helicsGetFlagIndex(val::String)
    Lib.helicsGetFlagIndex(val)
end

function helicsGetOptionValue(val::String)
    Lib.helicsGetOptionValue(val)
end

function helicsQuerySetTarget(query::Query, target::String)
    @invoke_and_check Lib.helicsQuerySetTarget(query, target)
end

function helicsQuerySetQueryString(query::Query, queryString::String)
    @invoke_and_check Lib.helicsQuerySetQueryString(query, queryString)
end
