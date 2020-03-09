import .Utils
import DocStringExtensions

DocStringExtensions.@template (FUNCTIONS, METHODS) =
    """
    $(DocStringExtensions.TYPEDSIGNATURES)
    $(DocStringExtensions.DOCSTRING)
    """

# We want these enums to be made available in the HELICS api.
# Manually typing these out is verbose and annoying
# We make the enums uppercase since they are essentially constant integer values
# for e.g. `Lib.helics_iteration_request` -> `HELICS.HELICS_ITERATION_REQUEST`
#          `Lib.helics_iteration_request_no_iteration` -> `HELICS.HELICS_ITERATION_REQUEST_NO_ITERATION`
#          `Lib.helics_iteration_request_force_iteration` -> `HELICS.HELICS_ITERATION_REQUEST_FORCE_ITERATION`
#          `Lib.helics_iteration_request_iterate_if_needed` -> `HELICS.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED`
# and so on ...

for enum_name in [
                 Lib.helics_iteration_request,
                 Lib.helics_iteration_result,
                 Lib.helics_federate_state,
                 Lib.helics_data_type,
                 Lib.helics_core_type,
                 Lib.helics_federate_flags,
                 Lib.helics_log_levels,
                 Lib.helics_error_types,
                 Lib.helics_properties,
                 Lib.helics_handle_options,
                 Lib.helics_filter_type,
                 ]
    # Hacks to not populate namespace
    eval(:(const $(Symbol(uppercase(split(String(Symbol(enum_name)), ".")[end]))) = $enum_name))

    for (_sym, ans) in Lib.CEnum.name_value_pairs(enum_name)
        eval( :(const $(Symbol(uppercase(String(_sym)))) = Lib.$_sym) )
    end

end

# Generate the docstring for these enumerations.
# e.g. the following generates documentation like this:
# HELICS.HELICS_ITERATION_REQUEST — Type.
#
#    HELICS_ITERATION_REQUEST_NO_ITERATION: 0
#    HELICS_ITERATION_REQUEST_FORCE_ITERATION: 1
#    HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED: 2
#
# TODO: this can be further simplified with a macro that loops over the list as done previously

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_ITERATION_REQUEST)), "\n") )
"""
HELICS.HELICS_ITERATION_REQUEST

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_ITERATION_RESULT)), "\n") )
"""
HELICS.HELICS_ITERATION_RESULT

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_FEDERATE_STATE)), "\n") )
"""
HELICS.HELICS_FEDERATE_STATE

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_DATA_TYPE)), "\n") )
"""
HELICS.HELICS_DATA_TYPE

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_CORE_TYPE)), "\n") )
"""
HELICS.HELICS_CORE_TYPE

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_FEDERATE_FLAGS)), "\n") )
"""
HELICS.HELICS_FEDERATE_FLAGS

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_LOG_LEVELS)), "\n") )
"""
HELICS.HELICS_LOG_LEVELS

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_ERROR_TYPES)), "\n") )
"""
HELICS.HELICS_ERROR_TYPES

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_PROPERTIES)), "\n") )
"""
HELICS.HELICS_PROPERTIES

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_HANDLE_OPTIONS)), "\n") )
"""
HELICS.HELICS_HANDLE_OPTIONS

@doc """
$( join(map(x -> "- `" * uppercase(String(x[1])) * "`: " * string(x[2]), Lib.CEnum.name_value_pairs(HELICS.HELICS_FILTER_TYPE)), "\n") )
"""
HELICS.HELICS_FILTER_TYPE

const HELICS_TIME = Union{Int, Float64}
const CFunction = Ptr{Cvoid}

"""
Create an endpoint

The endpoint becomes part of the federate and is destroyed when the federate is freed so there are no separate free functions for endpoints.

# Arguments

- `fed`: the federate object in which to create an endpoint must have been create with helicsCreateMessageFederate or helicsCreateCombinationFederate
- `name`: the identifier for the endpoint,  this will be prepended with the federate name for the global identifier
- `type`: a string describing the expected type of the publication may be NULL

# Returns

- [`Endpoint`](@ref) object containing the endpoint, nullptr on failure
"""
function helicsFederateRegisterEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    return Utils.@invoke_and_check Lib.helicsFederateRegisterEndpoint(fed, name, kind)
end

"""
Create an endpoint

The endpoint becomes part of the federate and is destroyed when the
federate is freed so there are no separate free functions for endpoints

# Arguments

- `fed` the federate object in which to create an endpoint must have been create with helicsCreateMessageFederate or helicsCreateCombinationFederate
- `name` the identifier for the endpoint, the given name is the global identifier
- `type` a string describing the expected type of the publication may be NULL
- `err` a pointer to an error object for catching errors

# Returns

- [`Endpoint`](@ref) object containing the endpoint, nullptr on failure
"""
function helicsFederateRegisterGlobalEndpoint(fed::Federate, name::String, kind::String)::Endpoint
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalEndpoint(fed, name, kind)
end

"""
Get an endpoint object from a name

# Arguments

- `fed`: The message federate object to use to get the endpoint
- `name`: The name of the endpoint
- `err`: The error object to complete if there is an error

# Returns

- a `helics_endpoint` object, the object will not
be valid and err will contain an error code if no endpoint with the
specified name exists
"""
function helicsFederateGetEndpoint(fed::Federate, name::String)::Endpoint
    Utils.@invoke_and_check Lib.helicsFederateGetEndpoint(fed, name)
end

"""
Get an endpoint by its index typically already created via
registerInterfaces file or something of that nature

# Arguments

- `fed`: The federate object in which to create a publication
- `index`: The index of the publication to get

# Returns

- a helics_endpoint, which will be NULL if an invalid index

"""
function helicsFederateGetEndpointByIndex(fed::Federate, index::Int)::Endpoint
    return Utils.@invoke_and_check Lib.helicsFederateGetEndpointByIndex(fed, index)
end

"""
Set the default destination for an endpoint if no other endpoint is
given

# Arguments

- `endpoint`: The endpoint to set the destination for
- `dest`: A string naming the desired default endpoint

"""
function helicsEndpointSetDefaultDestination(endpoint::Endpoint, dest::String)
    Utils.@invoke_and_check Lib.helicsEndpointSetDefaultDestination(endpoint, dest)
end

"""
Get the default destination for an endpoint

# Arguments

- `endpoint`: The endpoint to set the destination for

# Returns

- a string with the default destination
"""
function helicsEndpointGetDefaultDestination(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetDefaultDestination(endpoint))
end

"""
Send a message to the specified destination

# Arguments

- `endpoint`: The endpoint to send the data from
- `dest`: The target destination (nullptr to use the default destination)
- `data`: The data to send
- `inputDataLength`: The length of the data to send
"""
function helicsEndpointSendMessageRaw(endpoint::Endpoint, dest::String, data::String)
    inputDataLength = length(data)
    data = pointer(data)
    Utils.@invoke_and_check Lib.helicsEndpointSendMessageRaw(endpoint, dest, data, inputDataLength)
end

"""
Send a message at a specific time to the specified destination

# Arguments

- `endpoint`: The endpoint to send the data from
- `dest`: The target destination (nullptr to use the default destination)
- `data`: The data to send
- `inputDataLength`: The length of the data to send
- `time`: The time the message should be sent
"""
function helicsEndpointSendEventRaw(endpoint::Endpoint, dest::String, data::String, time::HELICS.HELICS_TIME)
    inputDataLength = length(data)
    data = pointer(data)
    Utils.@invoke_and_check Lib.helicsEndpointSendEventRaw(endpoint, dest, data, inputDataLength, time)
end

"""
Send a message object from a specific endpoint

# Arguments

- `endpoint`: The endpoint to send the data from
- `message`: The actual message to send
"""
function helicsEndpointSendMessage(endpoint::Endpoint, message::Message)
    Utils.@invoke_and_check Lib.helicsEndpointSendMessage(endpoint, message)
end

"""
Send a message object from a specific endpoint

# Arguments

- `endpoint`: The endpoint to send the data from
- `message`: The actual message to send
"""
function helicsEndpointSendMessageObject(endpoint::Endpoint, message::Message)
    Utils.@invoke_and_check Lib.helicsEndpointSendMessageObject(endpoint, message)
end

"""
Subscribe an endpoint to a publication

# Arguments

- `endpoint`: The endpoint to use
- `key`: The name of the publication
"""
function helicsEndpointSubscribe(endpoint::Endpoint, key::String)
    Utils.@invoke_and_check Lib.helicsEndpointSubscribe(endpoint, key)
end

"""
Check if the federate has any outstanding messages

# Arguments

- `fed`: The federate to check if it has

# Returns

- `true` if the federate has a message waiting `false` otherwise
"""
function helicsFederateHasMessage(fed::Federate)::Bool
    return Lib.helicsFederateHasMessage(fed) == 1 ? true : false
end

"""
Check if a given endpoint has any unread messages

# Arguments

- `endpoint`: The endpoint to check

# Returns

- `true` if the endpoint has a message, `false` otherwise
"""
function helicsEndpointHasMessage(endpoint::Endpoint)::Bool
    return Lib.helicsEndpointHasMessage(endpoint) == 1 ? true : false
end

"""
Returns the number of pending receives for the specified destination
endpoint.

# Arguments

- `fed`: The federate to get the number of waiting messages
"""
function helicsFederatePendingMessages(fed::Federate)::Int
    return Lib.helicsFederatePendingMessages(fed)
end

"""
Returns the number of pending receives for all endpoints of particular
federate.

# Arguments

- `endpoint`: The endpoint to query
"""
function helicsEndpointPendingMessages(endpoint::Endpoint)::Int
    return Lib.helicsEndpointPendingMessages(endpoint)
end

"""
Receive a packet from a particular endpoint

# Arguments

- `endpoint`: The identifier for the endpoint

# Returns

- a message object
"""
function helicsEndpointGetMessage(endpoint::Endpoint)::Lib.helics_message
    return Lib.helicsEndpointGetMessage(endpoint)
end

"""
Receive a packet from a particular endpoint

# Arguments

- `endpoint`: The identifier for the endpoint

# Returns

- a message object
"""
function helicsEndpointGetMessageObject(endpoint::Endpoint)::Message
    return Lib.helicsEndpointGetMessageObject(endpoint)
end

"""
Receive a communication message for any endpoint in the federate

the return order will be in order of endpoint creation. So all messages
that are available for the first endpoint, then all for the second, and
so on within a single endpoint the messages are ordered by time, then
`source_id`, then order of arrival

# Returns

- a `unique_ptr` to a [`Lib.helics_message`](@ref) object containing the message data
"""
function helicsFederateGetMessage(fed::Federate)::Lib.helics_message
    return Lib.helicsFederateGetMessage(fed)
end

"""
Receive a communication message for any endpoint in the federate

the return order will be in order of endpoint creation. So all messages
that are available for the first endpoint, then all for the second, and
so on within a single endpoint the messages are ordered by time, then
`source_id`, then order of arrival

Returns

- a [`Message`](@ref) which references the
data in the message
"""
function helicsFederateGetMessageObject(fed::Federate)::Message
    return Lib.helicsFederateGetMessageObject(fed)
end

"""
Get the type specified for an endpoint

# Arguments

- `endpoint`: The endpoint object in question

# Returns

- the defined type of the endpoint
"""
function helicsEndpointGetType(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetType(endpoint))
end

"""
get the name of an endpoint

# Arguments

- `endpoint`: The endpoint object in question

# Returns

- the name of the endpoint
"""
function helicsEndpointGetName(endpoint::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetName(endpoint))
end

"""
Get the number of endpoints in a federate

# Arguments

- `fed`: The message federate to query

# Returns

- (-1) if fed was not a valid federate otherwise returns the number of endpoints
"""
function helicsFederateGetEndpointCount(fed::Federate)::Int
    return Lib.helicsFederateGetEndpointCount(fed)
end

"""
Get the data in the info field of an filter

# Arguments

- `end`: The filter to query

# Returns

- a string with the info field string
"""
function helicsEndpointGetInfo(_end::Endpoint)::String
    return unsafe_string(Lib.helicsEndpointGetInfo(_end))
end

"""
Set the data in the info field for an filter

# Arguments

- `end`: The endpoint to query
- `info`: The string to set
"""
function helicsEndpointSetInfo(_end::Endpoint, info::String)
    Utils.@invoke_and_check Lib.helicsEndpointSetInfo(_end, info)
end

"""
Set a handle option on an endpoint

- `end`: The endpoint to modify
- `option`: Integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
- `value`: The value to set the option

"""
function helicsEndpointSetOption(_end::Endpoint, option::Union{Int, HELICS.HELICS_HANDLE_OPTIONS}, value::Bool)
    Utils.@invoke_and_check Lib.helicsEndpointSetOption(_end, option, value ? 1 : 0)
end

"""
Get a handle option on an endpoint

- `end`: The endpoint to modify
- `option`: Integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
"""
function helicsEndpointGetOption(_end::Endpoint, option::Union{Int, HELICS.HELICS_HANDLE_OPTIONS})::Bool
    return Lib.helicsEndpointGetOption(_end, option)
end

"""
"""
function helicsFederateRegisterFilter(fed::Federate, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateRegisterFilter(fed, kind, name)
end

"""
"""
function helicsFederateRegisterGlobalFilter(fed::Federate, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalFilter(fed, kind, name)
end

"""
"""
function helicsFederateRegisterCloningFilter(fed::Federate, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateRegisterCloningFilter(fed, name)
end

"""
"""
function helicsFederateRegisterGlobalCloningFilter(fed::Federate, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalCloningFilter(fed, name)
end

"""
"""
function helicsCoreRegisterFilter(core::Core, kind::Union{Int, HELICS.HELICS_FILTER_TYPE}, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsCoreRegisterFilter(core, kind, name)
end

"""
"""
function helicsCoreRegisterCloningFilter(core::Core, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsCoreRegisterCloningFilter(core, name)
end

"""
"""
function helicsFederateGetFilterCount(fed::Federate)::Int
    return Lib.helicsFederateGetFilterCount(fed)
end

"""
"""
function helicsFederateGetFilter(fed::Federate, name::String)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateGetFilter(fed, name)
end

"""
"""
function helicsFederateGetFilterByIndex(fed::Federate, index::Int)::Filter
    return Utils.@invoke_and_check Lib.helicsFederateGetFilterByIndex(fed, index)
end

"""
"""
function helicsFilterGetName(filt::Filter)::String
    return unsafe_string(Lib.helicsFilterGetName(filt))
end

"""
"""
function helicsFilterSet(filt::Filter, prop::String, val::Float64)
    Utils.@invoke_and_check Lib.helicsFilterSet(filt, prop, val)
end

"""
"""
function helicsFilterSetString(filt::Filter, prop::String, val::String)
    Utils.@invoke_and_check Lib.helicsFilterSetString(filt, prop, val)
end

"""
"""
function helicsFilterAddDestinationTarget(filt::Filter, dest::String)
    Utils.@invoke_and_check Lib.helicsFilterAddDestinationTarget(filt, dest)
end

"""
"""
function helicsFilterAddSourceTarget(filt::Filter, source::String)
    Utils.@invoke_and_check Lib.helicsFilterAddSourceTarget(filt, source)
end

"""
"""
function helicsFilterAddDeliveryEndpoint(filt::Filter, deliveryEndpoint::String)
    Utils.@invoke_and_check Lib.helicsFilterAddDeliveryEndpoint(filt, deliveryEndpoint)
end

"""
"""
function helicsFilterRemoveTarget(filt::Filter, target::String)
    Utils.@invoke_and_check Lib.helicsFilterRemoveTarget(filt, target)
end

"""
"""
function helicsFilterRemoveDeliveryEndpoint(filt::Filter, deliveryEndpoint::String)
    Utils.@invoke_and_check Lib.helicsFilterRemoveDeliveryEndpoint(filt, deliveryEndpoint)
end

"""
"""
function helicsFilterGetInfo(filt::Filter)::String
    return unsafe_string(Lib.helicsFilterGetInfo(filt))
end

"""
"""
function helicsFilterSetInfo(filt::Filter, info::String)
    Utils.@invoke_and_check Lib.helicsFilterSetInfo(filt, info)
end

"""
"""
function helicsFilterSetOption(filt::Filter, option::Int, value::Bool)
    Utils.@invoke_and_check Lib.helicsFilterSetOption(filt, option, value ? 1 : 0)
end

"""
"""
function helicsFilterGetOption(filt::Filter, option::Int)::Bool
    return Lib.helicsFilterGetOption(filt, option) == 1 ? true : false
end

"""
Create a subscription

The subscription becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a subscription must have been create with helicsCreateValueFederate or
helicsCreateCombinationFederate
- `key`: the identifier matching a publication to get a subscription for
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the subscription
"""
function helicsFederateRegisterSubscription(fed::Federate, key::String, units::String="")::Subscription
    return Utils.@invoke_and_check Lib.helicsFederateRegisterSubscription(fed, key, units)
end

"""
Register a publication with a known type

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication the global publication key will be prepended with the federate name
- `type`: a code identifying the type of the input see /ref helics_data_type for available options
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterPublication(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Publication
    return Utils.@invoke_and_check Lib.helicsFederateRegisterPublication(fed, key, kind, units)
end

"""
Register a publication with a defined type

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication
- `type`: a string labeling the type of the publication
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterTypePublication(fed::Federate, key::String, kind::String, units::String="")::Publication
    return Utils.@invoke_and_check Lib.helicsFederateRegisterTypePublication(fed, key, kind, units)
end

"""
Register a global named publication with an arbitrary type

# Arguments

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication
- `type`: a code identifying the type of the input see /ref helics_data_type for available options
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterGlobalPublication(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Publication
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalPublication(fed, key, kind, units)
end

"""
Register a global publication with a defined type

# Arguments

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication
- `type`: a string describing the expected type of the publication
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterGlobalTypePublication(fed::Federate, key::String, kind::String, units::String="")::Publication
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalTypePublication(fed, key, kind, units)
end

"""
Register a named input

The input becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions, inputs, and publications

# Arguments

- `fed`: the federate object in which to create an input
- `key`: the identifier for the publication the global input key will be prepended with the federate name
- `type`: a code identifying the type of the input see [`HELICS_DATA_TYPE`](@ref) for available options
- `units`: a string listing the units of the input maybe NULL

# Returns

- an object containing the input
"""
function helicsFederateRegisterInput(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Input
    return Utils.@invoke_and_check Lib.helicsFederateRegisterInput(fed, key, kind, units)
end

"""
Register an input with a defined type

The input becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions, inputs and publications

# Arguments

- `fed`: the federate object in which to create an input
- `key`: the identifier for the input
- `type`: a string describing the expected type of the input
- `units`: a string listing the units of the input maybe NULL

# Returns

- object containing the publication
"""
function helicsFederateRegisterTypeInput(fed::Federate, key::String, kind::String, units::String="")::Input
    return Utils.@invoke_and_check Lib.helicsFederateRegisterTypeInput(fed, key, kind, units)
end

"""
Register a global named input

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication
- `type`: a code identifying the type of the input see /ref helics_data_type for available options
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterGlobalInput(fed::Federate, key::String, kind::Union{Int, HELICS.HELICS_DATA_TYPE}, units::String="")::Input
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalInput(fed, key, kind, units)
end

"""
Register a global publication with an arbitrary type

The publication becomes part of the federate and is destroyed when the federate is freed so there are no separate free
functions for subscriptions and publications

# Arguments

- `fed`: the federate object in which to create a publication
- `key`: the identifier for the publication
- `type`: a string defining the type of the input
- `units`: a string listing the units of the subscription maybe NULL

# Returns

- an object containing the publication
"""
function helicsFederateRegisterGlobalTypeInput(fed::Federate, key::String, kind::String, units::String="")::Input
    return Utils.@invoke_and_check Lib.helicsFederateRegisterGlobalTypeInput(fed, key, kind, units)
end

"""
Get a publication object from a key

# Arguments

- `fed` the value federate object to use to get the publication
- `key` the name of the publication

# Returns

- a helics_publication object, the object will not be valid and err will contain an error code if no publication with the
specified key exists
"""
function helicsFederateGetPublication(fed::Federate, key::String)::Publication
    return Utils.@invoke_and_check Lib.helicsFederateGetPublication(fed, key)
end

"""
Get a publication by its index typically already created via registerInterfaces file or something of that nature

# Arguments

- `fed` the federate object in which to create a publication
- `index` the index of the publication to get

# Returns

- a helics_publication
"""
function helicsFederateGetPublicationByIndex(fed::Federate, index::Int)::Publication
    return Utils.@invoke_and_check Lib.helicsFederateGetPublicationByIndex(fed, index)
end

"""
Get an input object from a key

# Arguments

- `fed`: the value federate object to use to get the publication
- `key`: the name of the input

# Returns

- a helics_input object, the object will not be valid and err will contain an error code if no input with the specified key exists
"""
function helicsFederateGetInput(fed::Federate, key::String)::Input
    return Utils.@invoke_and_check Lib.helicsFederateGetInput(fed, key)
end

"""
Get an input by its index typically already created via registerInterfaces file or something of that nature

# Arguments

- `fed`: the federate object in which to create a publication
- `index`: the index of the publication to get

# Returns

- a helics_input, which will be NULL if an invalid index
"""
function helicsFederateGetInputByIndex(fed::Federate, index::Int)::Input
    return Utils.@invoke_and_check Lib.helicsFederateGetInputByIndex(fed, index)
end

"""
Get an input object from a subscription target

# Arguments

- `fed`: the value federate object to use to get the publication
- `key`: the name of the publication that a subscription is targeting

# Returns

- a helics_input object, the object will not be valid and err will contain an error code if no input with the specified
key exists
"""
function helicsFederateGetSubscription(fed::Federate, key::String)::Subscription
    return Utils.@invoke_and_check Lib.helicsFederateGetSubscription(fed, key)
end

"""
Publish raw data from bytes

# Arguments

- `pub`: the publication to publish for
- `data`: the raw data
"""
function helicsPublicationPublishRaw(pub::Publication, data::Cstring)
    inputDataLength = length(data)
    data = pointer(data)
    Utils.@invoke_and_check Lib.helicsPublicationPublishRaw(pub, data, inputDataLength)
end

"""
Publish a string

# Arguments

- `pub`: the publication to publish for
- `str`: String
"""
function helicsPublicationPublishString(pub::Publication, str::String)
    Utils.@invoke_and_check Lib.helicsPublicationPublishString(pub, str)
end

"""
Publish an integer value

# Arguments

- `pub`: the publication to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishInteger(pub::Publication, val::Int)
    Utils.@invoke_and_check Lib.helicsPublicationPublishInteger(pub, val)
end

"""
Publish a Boolean Value

# Arguments

- `pub`: the publication to publish for
- `val`: the boolean value to publish either `true` or `false`
"""
function helicsPublicationPublishBoolean(pub::Publication, val::Bool)
    Utils.@invoke_and_check Lib.helicsPublicationPublishBoolean(pub, val ? 1 : 0)
end

"""
Publish a double floating point value

# Arguments

- `pub` the publication to publish for
- `val` the numerical value to publish
"""
function helicsPublicationPublishDouble(pub::Publication, val::Float64)
    Utils.@invoke_and_check Lib.helicsPublicationPublishDouble(pub, val)
end

"""
Publish a time value

# Arguments

- `pub`: the publication to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishTime(pub::Publication, val::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsPublicationPublishTime(pub, val)
end

"""
Publish a single character

# Arguments

- `pub`: the publication to publish for
- `val`: the numerical value to publish
"""
function helicsPublicationPublishChar(pub::Publication, val::Char)
    Utils.@invoke_and_check Lib.helicsPublicationPublishChar(pub, val)
end

"""
Publish a complex value (or pair of values)

# Arguments

- `pub`: the publication to publish for
- `c`: the complex number to publish
"""
function helicsPublicationPublishComplex(pub::Publication, c::ComplexF64)
    Utils.@invoke_and_check Lib.helicsPublicationPublishComplex(pub, c.re, c.im)
end

"""
publish a vector of doubles

# Arguments

- `pub`: the publication to publish for
- `vectorInput`: Vector of Float64 data
"""
function helicsPublicationPublishVector(pub::Publication, vectorInput::Vector{Float64})
    vectorLength = length(vectorInput)
    Utils.@invoke_and_check Lib.helicsPublicationPublishVector(pub, vectorInput, vectorLength)
end

"""
Publish a named point

# Arguments

- `pub`: the publication to publish for
- `str`: a String
- `val`: a Float64 to publish
"""
function helicsPublicationPublishNamedPoint(pub::Publication, str::String, val::Float64)
    Utils.@invoke_and_check Lib.helicsPublicationPublishNamedPoint(pub, str, val)
end

"""
Add a named input to the list of targets a publication publishes to

# Arguments

- `pub`: the publication to add the target for
- `target`: the name of an input that the data should be sent to
"""
function helicsPublicationAddTarget(pub::Publication, target::String)
    Utils.@invoke_and_check Lib.helicsPublicationAddTarget(pub, target)
end

"""
Add a publication to the list of data that an input subscribes to

# Arguments

- `ipt`: the named input to modify
- `target`: the name of a publication that an input should subscribe to
"""
function helicsInputAddTarget(ipt::Input, target::String)
    Utils.@invoke_and_check Lib.helicsInputAddTarget(ipt, target)
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
Get the raw data for the latest value of a subscription
"""
function helicsInputGetRawValue(ipt::Input, data::T)::T where T<:Any
    error("Not implemented.")
    maxlen = Lib.helicsInputGetRawValueSize(ipt)
    actualSize = Ref(maxlen)
    return Utils.@invoke_and_check Lib.helicsInputGetRawValue(ipt, data, maxlen, actualSize)
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
Get a string value from a subscription

# Arguments

- `ipt`: the input to get the data for
"""
function helicsInputGetString(ipt::Input)::String
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref{Int32}(maxStringLen)
    Utils.@invoke_and_check Lib.helicsInputGetString(ipt, outputString, maxStringLen, actualLength)
    return outputString[1:(actualLength[]-1)]
end

"""
Get an integer value from a subscription

# Arguments

- `ipt`: the input to get the data for

# Returns

- an int64_t value with the current value of the input
"""
function helicsInputGetInteger(ipt::Input)::Int
    return Utils.@invoke_and_check Lib.helicsInputGetInteger(ipt)
end

"""
Get a boolean value from a subscription

# Arguments

- `ipt`: the input to get the data for

# Returns

- a boolean value of current input value
"""
function helicsInputGetBoolean(ipt::Input)::Bool
    r = Utils.@invoke_and_check Lib.helicsInputGetBoolean(ipt)
    return r == 1 ? true : false
end

"""
Get a double value from a subscription

# Arguments

- `ipt`: the input to get the data for

# Returns

- the double value of the input
"""
function helicsInputGetDouble(ipt::Input)::Float64
    return Utils.@invoke_and_check Lib.helicsInputGetDouble(ipt)
end

"""
Get a double value from a subscription

# Arguments

- `ipt`: the input to get the data for

# Returns

- the resulting double value
"""
function helicsInputGetTime(ipt::Input)::Float64
    return Utils.@invoke_and_check Lib.helicsInputGetTime(ipt)
end

"""
Get a single character value from an input

# Arguments

- `ipt`: the input to get the data for

# Returns

- the resulting character value
"""
function helicsInputGetChar(ipt::Input)::Char
    return Utils.@invoke_and_check Lib.helicsInputGetChar(ipt)
end

"""
Get a complex object from an input object

# Arguments

- `ipt`: the input to get the data for

# Returns

- `ComplexF64`
"""
function helicsInputGetComplexObject(ipt::Input)::ComplexF64
    r = Utils.@invoke_and_check Lib.helicsInputGetComplexObject(ipt)
    return r.real + im * r.imag
end

"""
Get a pair of double forming a complex number from a subscriptions

# Arguments

- `ipt`: the input to get the data for

# Returns

- ComplexF64
"""
function helicsInputGetComplex(ipt::Input)::ComplexF64
    real = Ref{Float64}(0)
    imag = Ref{Float64}(0)
    Utils.@invoke_and_check Lib.helicsInputGetComplex(ipt, real, imag)
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
Get a vector from a subscription

# Arguments

- `ipt`: the input to get the result for
"""
function helicsInputGetVector(ipt::Input)::Vector{Float64}
    maxlen = Cint(helicsInputGetVectorSize(ipt))
    data = Vector{Float64}(undef, maxlen)
    actualSize = Ref(maxlen)
    Utils.@invoke_and_check Lib.helicsInputGetVector(ipt, data, maxlen, actualSize)
    return data[1:actualSize[]]
end

"""
Get a named point from a subscription

# Arguments

- `ipt`: the input to get the result for

# Returns

- outputString storage for copying a null terminated string
- val the double value for the named point
"""
function helicsInputGetNamedPoint(ipt::Input)::Tuple{String, Float64}
    maxStringLen = helicsInputGetStringSize(ipt)
    outputString = repeat(" ", maxStringLen + 2)
    actualLength = Ref{Int32}(maxStringLen)
    val = Ref{Float64}(0.0)
    Utils.@invoke_and_check Lib.helicsInputGetNamedPoint(ipt, outputString, maxStringLen, actualLength, val)
    return outputString[1:(actualLength[]-1)], val[]
end

"""
Set the default as a raw data array

# Arguments

- `ipt`: the input to set the default for
- `data`: a pointer to the raw data to use for the default
"""
function helicsInputSetDefaultRaw(ipt::Input, data)
    inputDataLength = length(data)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultRaw(ipt, data, inputDataLength)
end

"""
Set the default as a string

# Arguments

- `ipt`: the input to set the default for
- `str`: a pointer to the default string
"""
function helicsInputSetDefaultString(ipt::Input, str::String)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultString(ipt, str)
end

"""
Set the default as an integer

# Arguments

- `ipt`: the input to set the default for
- `val`: the default integer
"""
function helicsInputSetDefaultInteger(ipt::Input, val::Int)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultInteger(ipt, val)
end

"""
Set the default as a boolean

# Arguments

- `ipt`: the input to set the default for
- `val`: the default boolean value
"""
function helicsInputSetDefaultBoolean(ipt::Input, val::Bool)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultBoolean(ipt, val ? 1 : 0)
end

"""
Set the default as a double

# Arguments

- `ipt`: the input to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultTime(ipt::Input, val::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultTime(ipt, val)
end

"""
Set the default as a double

# Arguments

- `ipt`: the input to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultChar(ipt::Input, val::Char)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultChar(ipt, val)
end

"""
Set the default as a double

# Arguments

- `ipt`: the input to set the default for
- `val`: the default double value
"""
function helicsInputSetDefaultDouble(ipt::Input, val::Float64)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultDouble(ipt, val)
end

"""
Set the default as a complex number

# Arguments

- `ipt`: the input to set the default for
- `c`: the default ComplexF64
"""
function helicsInputSetDefaultComplex(ipt::Input, c::ComplexF64)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultComplex(ipt, c.re, c.im)
end

"""
Set the default as a vector of doubles

# Arguments

- `ipt`: the input to set the default for
- `vectorInput`: an array of double data
"""
function helicsInputSetDefaultVector(ipt::Input, vectorInput::Vector{Float64})
    vectorLength = length(vectorInput)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultVector(ipt, vectorInput, vectorLength)
end

"""
Set the default as a NamedPoint

# Arguments

- `ipt`: the input to set the default for
- `str`: a pointer to a string representing the name
- `val`: a double value for the value of the named point
"""
function helicsInputSetDefaultNamedPoint(ipt::Input, str::String, val::Float64)
    Utils.@invoke_and_check Lib.helicsInputSetDefaultNamedPoint(ipt, str, val)
end

"""
Get the type of an input

# Arguments

- `ipt`: the input to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetType(ipt::Input)::String
    # TODO: check documentation
    return unsafe_string(Lib.helicsInputGetType(ipt))
end

"""
Get the type of the publisher to an input is sending

# Arguments

- `ipt`: the input to query

# Returns

- a const char * with the type name
"""
function helicsInputGetPublicationType(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetPublicationType(ipt))
end

"""
Get the type of a publication

# Arguments

- `pub`: the publication to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsPublicationGetType(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetType(pub))
end

"""
Get the key of an input

# Arguments

- `ipt`: the input to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetKey(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetKey(ipt))
end

"""
Get the key of a subscription

# Returns

a const char with the subscription key
"""
function helicsSubscriptionGetKey(ipt::Input)::String
    return unsafe_string(Lib.helicsSubscriptionGetKey(ipt))
end

"""
Get the key of a publication

this will be the global key used to identify the publication to the federation

# Arguments

- `pub`: the publication to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsPublicationGetKey(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetKey(pub))
end

"""
Get the units of an input

# Arguments

- `ipt`: the input to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsInputGetUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetUnits(ipt))
end

"""
Get the units of the publication that an input is linked to

# Arguments

- `ipt`: the input to query

# Returns

- a void enumeration, helics_ok if everything worked
"""
function helicsPublicationGetUnits(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetUnits(pub))
end

"""
Get the data in the info field of an input

# Arguments

- `inp`: the input to query

# Returns

- a string with the info field string
"""
function helicsInputGetInfo(inp::Input)::String
    return unsafe_string(Lib.helicsInputGetInfo(inp))
end

"""
Set the data in the info field for an input

# Arguments

- `inp`: the input to query
- `info`: the string to set
"""
function helicsInputSetInfo(inp::Input, info::String)
    Utils.@invoke_and_check Lib.helicsInputSetInfo(inp, info)
end

"""
Get the data in the info field of an publication

# Arguments

- `pub`: the publication to query

# Returns

- a string with the info field string
"""
function helicsPublicationGetInfo(pub::Publication)::String
    return unsafe_string(Lib.helicsPublicationGetInfo(pub))
end

"""
Set the data in the info field for an publication

# Arguments

- `pub`: the publication to set the info field for
- `info`: the string to set
"""
function helicsPublicationSetInfo(pub::Publication, info::String)
    Utils.@invoke_and_check Lib.helicsPublicationSetInfo(pub, info)
end

"""
Get the data in the info field of an input

# Arguments

- `inp`: the input to query
- `option`: integer representation of the option in question see [`HELICS_HANDLE_OPTIONS`](@ref)

# Returns

- a string with the info field string
"""
function helicsInputGetOption(inp::Input, option::Int)::Bool
    return Lib.helicsInputGetOption(inp, option::Int) == 1 ? true : false
end

"""
Set the data in the info field for an input

# Arguments

- `inp`: the input to query
- `option`: the option to set for the input [`HELICS_HANDLE_OPTIONS`](@ref)
- `value`: the value to set the option to
"""
function helicsInputSetOption(inp::Input, option::Int, value::Bool)
    Utils.@invoke_and_check Lib.helicsInputSetOption(inp, option, value ? 1 : 0)
end

"""
Get the data in the info field of an publication

# Arguments

- `pub`: the publication to query
- `option`: the value to query see [`HELICS_HANDLE_OPTIONS`](@ref)

# Arguments

- a string with the info field string
"""
function helicsPublicationGetOption(pub::Publication, option::Int)::Bool
    return Lib.helicsPublicationGetOption(pub, option) == 1 ? true : false
end

"""
Set the data in the info field for an publication

# Arguments

- `pub`: the publication to query
- `option`: integer code for the option to set [`HELICS_HANDLE_OPTIONS`](@ref)
- `val`: the value to set the option to
"""
function helicsPublicationSetOption(pub::Publication, option::Int, val::Bool)
    Utils.@invoke_and_check Lib.helicsPublicationSetOption(pub, option, val ? 1 : 0)
end

"""
Check if a particular subscription was updated

# Arguments

- `ipt`: the input to query

# Returns

- true if it has been updated since the last value retrieval
"""
function helicsInputIsUpdated(ipt::Input)::Bool
    return Lib.helicsInputIsUpdated(ipt) == 1 ? true : false
end

"""
Get the last time a subscription was updated

# Arguments

- `ipt`: the input to query

# Returns

- Float64
"""
function helicsInputLastUpdateTime(ipt::Input)::Float64
    return Lib.helicsInputLastUpdateTime(ipt)
end

"""
Get the number of publications in a federate


# Arguments

- `fed`: an existing [`Federate`](@ref)

# Returns

- (-1) if fed was not a valid federate otherwise returns the number of publications
"""
function helicsFederateGetPublicationCount(fed::Federate)::Int
    return Lib.helicsFederateGetPublicationCount(fed)
end

"""
Get the number of subscriptions in a federate

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
function helicsErrorClear(err::Lib.helics_error)
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
- `name`: the name of the core , may be a nullptr or empty string to have a name automatically assigned
- `initString`: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  --broker="XSSAF" or the number of federates or the address

# Returns

- a [`Core`](@ref) object if the core is invalid err will contain some indication

"""
function helicsCreateCore(kind::String, name::String, initString::String)::Core
    return Utils.@invoke_and_check Lib.helicsCreateCore(kind, name, initString)
end

"""
"""
function helicsCreateCoreFromArgs(kind::String, name::String, argc::Int, argv::Vector{<:AbstractString})::Core
    return Utils.@invoke_and_check Lib.helicsCreateCoreFromArgs(kind, name, argc, argv)
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
    return Utils.@invoke_and_check Lib.helicsCoreClone(core)
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

- `type`: the type of the broker to create
- `name`: the name of the broker , may be a nullptr or empty string to have a name automatically assigned
- `initString`: an initialization string to send to the core-the format is similar to command line arguments. Typical options include a broker address  --broker="XSSAF" if this is a subbroker or the number of federates or the address

# Returns

- a [`Broker`](@ref) object, will be NULL if there was an error indicated in the err object

"""
function helicsCreateBroker(kind::String, name::String, initString::String)::Broker
    return Utils.@invoke_and_check Lib.helicsCreateBroker(kind, name, initString)
end

"""
"""
function helicsCreateBrokerFromArgs(kind::String, name::String, argc::Int, argv::Vector{<:AbstractString})::Broker
    return Utils.@invoke_and_check Lib.helicsCreateBrokerFromArgs(kind, name, argc, argv)
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
    return Utils.@invoke_and_check Lib.helicsBrokerClone(broker)
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
- `source`: the name of the publication (cannot be NULL)
- `target`: the name of the target to send the publication data (cannot be NULL)

"""
function helicsBrokerDataLink(broker::Broker, source::String, target::String)
    Utils.@invoke_and_check Lib.helicsBrokerDataLink(broker, source, target)
end

"""
Link a named filter to a source endpoint

# Arguments

- `broker` the broker to generate the connection from
- `filter` the name of the filter (cannot be NULL)
- `endpoint` the name of the endpoint to filter the data from (cannot be NULL)
"""
function helicsBrokerAddSourceFilterToEndpoint(broker::Broker, filter::String, endpoint::String)
    Utils.@invoke_and_check Lib.helicsBrokerAddSourceFilterToEndpoint(broker, filter, endpoint)
end

"""
Link a named filter to a destination endpoint

# Arguments

- `broker` the broker to generate the connection from
- `filter` the name of the filter (cannot be NULL)
- `endpoint` the name of the endpoint to filter the data going to (cannot be NULL)
"""
function helicsBrokerAddDestinationFilterToEndpoint(broker::Broker, filter::String, endpoint::String)
    Utils.@invoke_and_check Lib.helicsBrokerAddDestinationFilterToEndpoint(broker, filter, endpoint)
end

"""
Wait for the broker to disconnect

# Arguments

- `broker`: the broker to wait for
- `msToWait`: the time out in millisecond (<0 for infinite timeout)

# Returns

- `true` if the disconnect was successful, `false` if there was a timeout

"""
function helicsBrokerWaitForDisconnect(broker::Broker, msToWait::Int)::Bool
    r = Utils.@invoke_and_check Lib.helicsBrokerWaitForDisconnect(broker, msToWait)
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
- `source`: the name of the publication (cannot be NULL)
- `target`: the named of the target to send the publication data (cannot be NULL)

"""
function helicsCoreDataLink(core::Core, source::String, target::String)
    Utils.@invoke_and_check Lib.helicsCoreDataLink(core, source, target)
end

"""
Link a named filter to a source endpoint

# Arguments

- `core`: the core to generate the connection from
- `filter`: the name of the filter (cannot be NULL)
- `endpoint`: the name of the endpoint to filter the data from (cannot be NULL)

"""
function helicsCoreAddSourceFilterToEndpoint(core::Core, filter::String, endpoint::String)
    Utils.@invoke_and_check Lib.helicsCoreAddSourceFilterToEndpoint(core, filter, endpoint)
end

"""
"""
function helicsCoreAddDestinationFilterToEndpoint(core::Core, filter::String, endpoint::String)
    Utils.@invoke_and_check Lib.helicsCoreAddDestinationFilterToEndpoint(core, filter, endpoint)
end

"""
Get an identifier for the broker

# Arguments

- `broker`: the broker to query

# Returns

- a string containing the identifier for the broker

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

- `broker`: the broker to query

# Returns

- a string with the network address of the broker

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
    Utils.@invoke_and_check Lib.helicsCoreSetReadyToInit(core)
end

"""
Get an identifier for the core

# Arguments

- `core`: the core to query

# Returns

- a void enumeration indicating any error condition

"""
function helicsCoreDisconnect(core::Core)
    Utils.@invoke_and_check Lib.helicsCoreDisconnect(core)
end

"""
Get an existing [`Federate`](@ref) from a core by name

the federate must have been created by one of the other functions and at least one of the objects referencing the created
    federate must still be active in the process

# Arguments

- `fedName`: the name of the federate to retrieve

# Returns

- NULL if no fed is available by that name otherwise a [`Federate`](@ref) with that name
"""
function helicsGetFederateByName(fedName::String)::CombinationFederate
    return Utils.@invoke_and_check Lib.helicsGetFederateByName(fedName)
end

"""
Disconnect a broker

# Arguments

- `broker`: the broker to disconnect

"""
function helicsBrokerDisconnect(broker::Broker)
    Utils.@invoke_and_check Lib.helicsBrokerDisconnect(broker)
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

- `fedName`: the name of the federate to create, can NULL or an empty string to use the default name from fi or an assigned name
- `fi`: the [`FederateInfo`](@ref) object that contains details on the federate

# Returns

- an opaque value [`Federate`](@ref)

"""
function helicsCreateValueFederate(fedName::String, fi::FederateInfo)::ValueFederate
    return Utils.@invoke_and_check Lib.helicsCreateValueFederate(fedName, fi)
end

"""
Create a value federate from a JSON file, JSON string, or TOML file

[`Federate`](@ref) objects can be used in all functions that take a [`Federate`](@ref) object as an argument

# Arguments

- `configFile`:  a JSON file or a JSON string or TOML file that contains setup and configuration information

# Returns

- an opaque value [`Federate`](@ref)

"""
function helicsCreateValueFederateFromConfig(configFile::String)::ValueFederate
    return Utils.@invoke_and_check Lib.helicsCreateValueFederateFromConfig(configFile)
end

"""
Create a [`MessageFederate`](@ref) from a [`FederateInfo`](@ref) object

[`MessageFederate`](@ref) objects can be used in all functions that take a [`MessageFederate`](@ref) or [`Federate`](@ref) object as an argument

# Arguments

- `fedName`: the name of the federate to create
- `fi`: the [`FederateInfo`](@ref) object that contains details on the federate

# Returns

- an opaque [`MessageFederate`](@ref)

"""
function helicsCreateMessageFederate(fedName::String, fi::FederateInfo)::MessageFederate
    return Utils.@invoke_and_check Lib.helicsCreateMessageFederate(fedName, fi)
end

"""
Create a [`MessageFederate`](@ref) from a JSON file or JSON string or TOML file

[`MessageFederate`](@ref) objects can be used in all functions that take a [`MessageFederate`](@ref) or [`Federate`](@ref) object as an argument

# Arguments

- `configFile`:  a Config(JSON,TOML) file or a JSON string that contains setup and configuration information

# Returns

- an opaque [`MessageFederate`](@ref)

"""
function helicsCreateMessageFederateFromConfig(configFile::String)::MessageFederate
    return Utils.@invoke_and_check Lib.helicsCreateMessageFederateFromConfig(configFile)
end

"""
Create a [`CombinationFederate`](@ref) from a [`FederateInfo`](@ref) object

[`CombinationFederate`](@ref) are both [`ValueFederate`](@ref) and [`MessageFederate`](@ref), objects can be used in all functions that take a [`Federate`](@ref), [`MessageFederate`](@ref) or [`ValueFederate`](@ref) object as an argument

# Arguments

- `fedName`: a string with the name of the federate, can be NULL or an empty string to pull the default name from fi
- `fi`: the [`FederateInfo`](@ref) object that contains details on the federate

# Returns

- an opaque [`ValueFederate`](@ref), nullptr if the object creation failed

"""
function helicsCreateCombinationFederate(fedName::String, fi::FederateInfo)::CombinationFederate
    return Utils.@invoke_and_check Lib.helicsCreateCombinationFederate(fedName, fi)
end

"""
Create a [`CombinationFederate`](@ref) from a JSON file or JSON string

[`CombinationFederate`](@ref) are both [`ValueFederate`](@ref) and [`MessageFederate`](@ref), objects can be used in all functions that take a [`Federate`](@ref), [`MessageFederate`](@ref) or [`ValueFederate`](@ref) object as an argument

# Arguments

- `configFile`:  a JSON file or a JSON string or TOML file that contains setup and configuration information

# Returns

- an opaque [`CombinationFederate`](@ref)

"""
function helicsCreateCombinationFederateFromConfig(configFile::String)::CombinationFederate
    return Utils.@invoke_and_check Lib.helicsCreateCombinationFederateFromConfig(configFile)
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
    return Utils.@invoke_and_check Lib.helicsFederateClone(fed)
end

"""
Create a [`FederateInfo`](@ref) object for specifying federate information when constructing a federate

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

- a helics_federate_info object which is a reference to the created object

"""
function helicsFederateInfoClone(fi::FederateInfo)::FederateInfo
    return Utils.@invoke_and_check Lib.helicsFederateInfoClone(fi)
end

"""
Load a [`FederateInfo`](@ref) from command line arguments

# Arguments

- `fi`: a [`FederateInfo`](@ref) object
- `argc`: the number of command line arguments
- `argv`: an array of strings from the command line

"""
function helicsFederateInfoLoadFromArgs(fi::FederateInfo, argc::Int, argv::Vector{<:AbstractString})
    Utils.@invoke_and_check Lib.helicsFederateInfoLoadFromArgs(fi, argc, argv)
end

"""
Delete the memory associated with a [`FederateInfo`](@ref) object
"""
function helicsFederateInfoFree(fi::FederateInfo)
    Lib.helicsFederateInfoFree(fi)
end

"""
Check if a federate_object is valid

# Returns

- `true` if the federate is a valid active federate, `false` otherwise
"""
function helicsFederateIsValid(fed::Federate)::Bool
    return Lib.helicsFederateIsValid(fed) == 1 ? true : false
end

"""
Set the name of the core to link to for a federate

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `corename`: the identifier for a core to link to

"""
function helicsFederateInfoSetCoreName(fi::FederateInfo, corename::String)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetCoreName(fi, corename)
end

"""
Set the initialization string for the core usually in the form of command line arguments

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coreInit`: a string with the core initialization strings

"""
function helicsFederateInfoSetCoreInitString(fi::FederateInfo, coreInit::String)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetCoreInitString(fi, coreInit)
end

"""
Set the core type by integer code

valid values available by definitions in api-data.h

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coretype`: an numerical code for a core type see /ref helics_core_type

"""
function helicsFederateInfoSetCoreType(fi::FederateInfo, coretype::Union{Int, HELICS.HELICS_CORE_TYPE})
    Utils.@invoke_and_check Lib.helicsFederateInfoSetCoreType(fi, coretype)
end

"""
Set the core type from a string

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `coretype`: a string naming a core type

"""
function helicsFederateInfoSetCoreTypeFromString(fi::FederateInfo, coretype::String)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetCoreTypeFromString(fi, coretype)
end

"""
Set the name or connection information for a broker

this is only used if the core is automatically created, the broker information will be transferred to the core for connection

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `broker`: a string which defined the connection information for a broker either a name or an address

"""
function helicsFederateInfoSetBroker(fi::FederateInfo, broker::Broker)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetBroker(fi, broker)
end

"""
Set the port to use for the broker

this is only used if the core is automatically created, the broker information will be transferred to the core for connection this will only be useful for network broker connections

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `brokerPort`: the integer port number to use for connection with a broker

"""
function helicsFederateInfoSetBrokerPort(fi::FederateInfo, brokerPort::Int)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetBrokerPort(fi, brokerPort)
end

"""
Set the local port to use

this is only used if the core is automatically created, the port information will be transferred to the core for connection

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `localPort`: a string with the port information to use as the local server port can be a number or "auto" or "os_local"

"""
function helicsFederateInfoSetLocalPort(fi::FederateInfo, localPort::Int)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetLocalPort(fi, localPort)
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
    Utils.@invoke_and_check Lib.helicsFederateInfoSetFlagOption(fi, flag, value ? 1 : 0)
end

"""
Set the separator character in the info structure

the separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is '/'  then a local endpoint would have a globally reachable name of fedName/localName

# Arguments

- `fi`: the [`FederateInfo`](@ref) object to alter
- `separator`: the character to use as a separator

"""
function helicsFederateInfoSetSeparator(fi::FederateInfo, separator::Char)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetSeparator(fi, separator)
end

"""
"""
function helicsFederateInfoSetTimeProperty(fi::FederateInfo, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyValue::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetTimeProperty(fi, timeProperty, propertyValue)
end

"""
"""
function helicsFederateInfoSetIntegerProperty(fi::FederateInfo, intProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyValue::Int)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetIntegerProperty(fi, intProperty, propertyValue)
end

"""
Load interfaces from a file

# Arguments

- `fed`: the federate to which to load interfaces
- `file`: the name of a file to load the interfaces from either JSON, or TOML

"""
function helicsFederateRegisterInterfaces(fed::Federate, file::String)
    Utils.@invoke_and_check Lib.helicsFederateRegisterInterfaces(fed, file)
end

"""
Finalize the federate this function halts all communication in the federate and disconnects it from the core
"""
function helicsFederateFinalize(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateFinalize(fed)
end

"""
Finalize the federate in an async call
"""
function helicsFederateFinalizeAsync(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateFinalizeAsync(fed)
end

"""
Complete the asynchronous finalize call
"""
function helicsFederateFinalizeComplete(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateFinalizeComplete(fed)
end

"""
Release the memory associated withe a federate
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
Enter the initialization state of a federate

the initialization state allows initial values to be set and received if the iteration is requested on entry to the execution state. This is a blocking call and will block until the core allows it to proceed.

# Arguments

- `fed`: the federate to operate on

"""
function helicsFederateEnterInitializingMode(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterInitializingMode(fed)
end

"""
Non blocking alternative to [`helicsFederateEnterInitializingMode`](@ref).
The function [`helicsFederateFinalize`](@ref) must be called to finish the operation

# Arguments

- `fed`: the federate to operate on

"""
function helicsFederateEnterInitializingModeAsync(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterInitializingModeAsync(fed)
end

"""
Check if the current Asynchronous operation has completed

# Arguments

- `fed`: the federate to operate on

# Returns

- `false` if not completed, `true` if completed
"""
function helicsFederateIsAsyncOperationCompleted(fed::Federate)::Bool
    r = Utils.@invoke_and_check Lib.helicsFederateIsAsyncOperationCompleted(fed)
    return r == 1 ? true : false
end

"""
Finalize the entry to initialize mode that was initiated with [`helicsFederateEnterInitializingModeAsync`](@ref)

# Arguments

- `fed`: the federate desiring to complete the initialization step function
"""
function helicsFederateEnterInitializingModeComplete(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterInitializingModeComplete(fed)
end

"""
Request that the federate enter the Execution mode

this call is blocking until granted entry by the core object for an asynchronous alternative call [`helicsFederateEnterExecutingModeAsync`](@ref) on return from this call the federate will be at time 0.

# Arguments

- `fed`: a federate to change modes

"""
function helicsFederateEnterExecutingMode(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterExecutingMode(fed)
end

"""
Request that the federate enter the Execution mode

this call is non-blocking and will return immediately.
Call [`helicsFederateEnterExecutingModeComplete`](@ref) to finish the call sequence.

# Arguments

- `fed`: the federate object to complete the call

"""
function helicsFederateEnterExecutingModeAsync(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterExecutingModeAsync(fed)
end

"""
Complete the call to [`helicsFederateEnterExecutingModeAsync`](@ref)

# Arguments

- `fed`: the federate object to complete the call

"""
function helicsFederateEnterExecutingModeComplete(fed::Federate)
    Utils.@invoke_and_check Lib.helicsFederateEnterExecutingModeComplete(fed)
end

"""
Request an iterative time

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time and iteration request and return a time and iteration status.

# Arguments

- `fed`: the federate to make the request of
- `iterate`: the requested iteration mode

# Returns

- an iteration structure with field containing the time and iteration status

"""
function helicsFederateEnterExecutingModeIterative(fed::Federate, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})::HELICS.HELICS_ITERATION_RESULT
    return Utils.@invoke_and_check Lib.helicsFederateEnterExecutingModeIterative(fed, iterate)
end

"""
"""
function helicsFederateEnterExecutingModeIterativeAsync(fed::Federate, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})::HELICS.HELICS_ITERATION_RESULT
    return Utils.@invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeAsync(fed, iterate)
end

"""
Complete the asynchronous iterative call into ExecutionModel

# Arguments

- `fed`: the federate to make the request of

# Returns

- an iteration object containing the iteration time and iteration_status

"""
function helicsFederateEnterExecutingModeIterativeComplete(fed::Federate)::HELICS.HELICS_ITERATION_RESULT
    return Utils.@invoke_and_check Lib.helicsFederateEnterExecutingModeIterativeComplete(fed)
end

"""
Get the current state of a federate

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- state the resulting state if void return helics_ok
"""
function helicsFederateGetState(fed::Federate)::HELICS.HELICS_FEDERATE_STATE
    return Utils.@invoke_and_check Lib.helicsFederateGetState(fed)
end

"""
Get the core object associated with a federate

# Arguments

- `fed`: a federate object

# Returns

- a core object, nullptr if invalid

"""
function helicsFederateGetCoreObject(fed::Federate)::Core
    return Utils.@invoke_and_check Lib.helicsFederateGetCoreObject(fed)
end

"""
Request the next time for federate execution

# Arguments

- `fed`: the federate to make the request of
- `requestTime`: the next requested time

# Returns

- the time granted to the federate
    invalid
"""
function helicsFederateRequestTime(fed::Federate, requestTime::HELICS.HELICS_TIME)::Float64
    return Utils.@invoke_and_check Lib.helicsFederateRequestTime(fed, requestTime)
end

"""
Request the next time step for federate execution

feds should have setup the period or minDelta for this to work well but it will request the next time step which is the current time plus the minimum time step.

# Arguments

- `fed`: the federate to make the request of

# Returns

- the time granted to the federate
"""
function helicsFederateRequestNextStep(fed::Federate)::Float64
    return Utils.@invoke_and_check Lib.helicsFederateRequestNextStep(fed)
end

"""
Request an iterative time

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time and iteration request and return a time and iteration status.

# Arguments

- `fed`: the federate to make the request of
- `requestTime`: the next desired time
- `iterate`: the requested iteration mode

# Returns

- the granted time
- the iteration specification of the result

"""
function helicsFederateRequestTimeIterative(fed::Federate, requestTime::HELICS.HELICS_TIME, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})::Tuple{Float64, HELICS.HELICS_ITERATION_RESULT}
    outIteration = Ref{HELICS.HELICS_ITERATION_RESULT}(0)
    t = Utils.@invoke_and_check Lib.helicsFederateRequestTimeIterative(fed, requestTime, iterate, outIteration)
    return t, outIteration
end

"""
Request the next time for federate execution in an asynchronous call
Call [`helicsFederateRequestTimeComplete`](@ref) to finish the call

# Arguments

- `fed`: the federate to make the request of
- `requestTime`: the next requested time

"""
function helicsFederateRequestTimeAsync(fed::Federate, requestTime::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsFederateRequestTimeAsync(fed, requestTime)
end

"""
Complete an asynchronous requestTime call

# Arguments

- `fed`: the federate to make the request of

# Returns

- the time granted to the federate
"""
function helicsFederateRequestTimeComplete(fed::Federate)::Float64
    return Utils.@invoke_and_check Lib.helicsFederateRequestTimeComplete(fed)
end

"""
Request an iterative time through an asynchronous call

this call allows for finer grain control of the iterative process then [`helicsFederateRequestTime`](@ref) it takes a time an iteration request and returns a time and iteration status call [`helicsFederateRequestTimeIterativeComplete`](@ref) to finish the process.

# Arguments

- `fed`: the federate to make the request of
- `requestTime`: the next desired time
- `iterate`: the requested iteration mode

# Returns

- a void object with a return code of the result

"""
function helicsFederateRequestTimeIterativeAsync(fed::Federate, requestTime::HELICS.HELICS_TIME, iterate::Union{Int, HELICS.HELICS_ITERATION_REQUEST})
    Utils.@invoke_and_check Lib.helicsFederateRequestTimeIterativeAsync(fed, requestTime, iterate)
end

"""
Complete an iterative time request asynchronous call

# Arguments

- `fed`: the federate to make the request of

# Returns

- the granted time
- `outIterate`  the iteration specification of the result

"""
function helicsFederateRequestTimeIterativeComplete(fed::Federate)::Tuple{Float64, HELICS.HELICS_ITERATION_RESULT}
    return outIterate = Ref{HELICS.HELICS_ITERATION_RESULT}(0)
    t = Utils.@invoke_and_check Lib.helicsFederateRequestTimeIterativeComplete(fed, outIterate)
    return t, outIterate[]
end

"""
Get the name of the federate

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- a string with the name

"""
function helicsFederateGetName(fed::Federate)::String
    return unsafe_string(Lib.helicsFederateGetName(fed))
end

"""
Set a time based property for a federate

# Arguments

- `fed`: the [`Federate`](@ref) set the property for
- `timeProperty`: a integer code for a time property
- `time`: the requested value of the property

"""
function helicsFederateSetTimeProperty(fed::Federate, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES}, time::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsFederateSetTimeProperty(fed, timeProperty, time)
end

"""
Set a flag for the federate

# Arguments

- `fed`: the federate to alter a flag for
- `flag`: the flag to change
- `flagValue`: the new value of the flag 0 for false !=0 for true

"""
function helicsFederateSetFlagOption(fed::Federate, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS}, flagValue::Bool)
    Utils.@invoke_and_check Lib.helicsFederateSetFlagOption(fed, flag, flagValue ? 1 : 0)
end

"""
Set the separator character in a federate

the separator character is the separation character for local publications/endpoints in creating their global name. for example if the separator character is '/'  then a local endpoint would have a globally reachable name of fedName/localName.

# Arguments

- `fed`: the [`FederateInfo`](@ref) object to alter
- `separator`: the character to use as a separator

"""
function helicsFederateSetSeparator(fed::Federate, separator::Char)
    Utils.@invoke_and_check Lib.helicsFederateSetSeparator(fed, separator)
end

"""
Set an integer based property of a federate

# Arguments

- `fed`: the federate to change the property for
- `intProperty`: the property to set
- `propertyVal`: the value of the property

"""
function helicsFederateSetIntegerProperty(fed::Federate, intProperty::Union{Int, HELICS.HELICS_PROPERTIES}, propertyVal::Int)
    Utils.@invoke_and_check Lib.helicsFederateSetIntegerProperty(fed, intProperty, propertyVal)
end

"""
Get the current value of a time based property in a federate

# Arguments

- `fed`: the federate query
- `timeProperty`: the property to query

"""
function helicsFederateGetTimeProperty(fed::Federate, timeProperty::Union{Int, HELICS.HELICS_PROPERTIES})::Float64
    return Utils.@invoke_and_check Lib.helicsFederateGetTimeProperty(fed, timeProperty)
end

"""
Get a flag value for a federate

# Arguments

- `fed`: the federate to get the flag for
- `flag`: the flag to query

# Returns

- the value of the flag

"""
function helicsFederateGetFlagOption(fed::Federate, flag::Union{Int, HELICS.HELICS_FEDERATE_FLAGS})::Bool
    return Utils.@invoke_and_check Lib.helicsFederateGetFlagOption(fed, flag)
end

"""
Set the logging level for the federate

debug and trace only do anything if they were enabled in the compilation

# Arguments

- `fed`: the federate to get the flag for
- `intProperty`: a code for the property to set [`HELICS_HANDLE_OPTIONS`](@ref)

# Returns

- the value of the property

"""
function helicsFederateGetIntegerProperty(fed::Federate, intProperty::Union{Int, HELICS.HELICS_HANDLE_OPTIONS})::Int
    return Utils.@invoke_and_check Lib.helicsFederateGetIntegerProperty(fed, intProperty)
end

"""
Get the current time of the federate

# Arguments

- `fed`: the [`Federate`](@ref) to query

# Returns

- the current time of the federate

"""
function helicsFederateGetCurrentTime(fed::Federate)::Float64
    return Utils.@invoke_and_check Lib.helicsFederateGetCurrentTime(fed)
end

"""
Set a federation global value through a federate

this overwrites any previous value for this name

# Arguments

- `fed`: the federate to set the global through
- `valueName`: the name of the global to set
- `value`: the value of the global

"""
function helicsFederateSetGlobal(fed::Federate, valueName::String, value::String)
    Utils.@invoke_and_check Lib.helicsFederateSetGlobal(fed, valueName, value)
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
    Utils.@invoke_and_check Lib.helicsCoreSetGlobal(core, valueName, value)
end

"""
Set a federation global value

this overwrites any previous value for this name

# Arguments

- `broker`: the broker to set the global through
- `valueName`: the name of the global to set
- `value`: the value of the global

"""
function helicsBrokerSetGlobal(broker::Broker, valueName::String, value::String)
    Utils.@invoke_and_check Lib.helicsBrokerSetGlobal(broker, valueName, value)
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
- `fed`: a federate to send the [`Query`](@ref) through

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if fed or [`Query`](@ref) is an invalid object, the return string will be "#invalid" if the [`Query`](@ref) itself was invalid

"""
function helicsQueryExecute(query::Query, fed::Federate)::String
    r = Utils.@invoke_and_check Lib.helicsQueryExecute(query, fed)
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
    r = Utils.@invoke_and_check Lib.helicsQueryCoreExecute(query, core)
    return unsafe_string(r)
end

"""
Execute a [`Query`](@ref) directly on a broker

the call will block until the [`Query`](@ref) finishes which may require communication or other delays

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `broker`: the broker to send the [`Query`](@ref) to

# Returns

- a string. String will remain valid until the [`Query`](@ref) is freed or executed again
the return will be nullptr if fed or [`Query`](@ref) is an invalid object, the return string will be "#invalid" if the [`Query`](@ref) itself was invalid

"""
function helicsQueryBrokerExecute(query::Query, broker::Broker)::String
    r = Utils.@invoke_and_check Lib.helicsQueryBrokerExecute(query, broker)
    return unsafe_string(r)
end

"""
Execute a [`Query`](@ref) in a non-blocking call

# Arguments

- `query`: the [`Query`](@ref) to use in the query
- `fed`: a federate to send the [`Query`](@ref) through

"""
function helicsQueryExecuteAsync(query::Query, fed::Federate)
    Utils.@invoke_and_check Lib.helicsQueryExecuteAsync(query, fed)
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
    r = Utils.@invoke_and_check Lib.helicsQueryExecuteComplete(query)
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

function helicsBrokerAddLoggingCallback(broker::Broker, logger)
    Utils.@invoke_and_check Lib.helicsBrokerAddLoggingCallback(broker, logger)
end

function helicsCoreAddLoggingCallback(core::Core, logger)
    Utils.@invoke_and_check Lib.helicsCoreAddLoggingCallback(core, logger)
end

function helicsFederateAddLoggingCallback(fed::Federate, logger)
    Utils.@invoke_and_check Lib.helicsFederateAddLoggingCallback(fed, logger)
end

function helicsFederateCreateMessageObject(fed::Federate)::Message
    Utils.@invoke_and_check Lib.helicsFederateCreateMessageObject(fed)
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
    Utils.@invoke_and_check Lib.helicsMessageGetRawData(message, Ref(data), maxlen, actualSize)
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
    Utils.@invoke_and_check Lib.helicsMessageSetSource(message, src)
end

"""
Set the destination of a message

# Arguments

- `message`: The message object in question
- `dest`: A string containing the new destination
"""
function helicsMessageSetDestination(message::Message, dest::String)
    Utils.@invoke_and_check Lib.helicsMessageSetDestination(message, dest)
end

"""
Set the original source of a message

# Arguments

- `message`: The message object in question
- `src`: A string containing the new original source
"""
function helicsMessageSetOriginalSource(message::Message, src::String)
    Utils.@invoke_and_check Lib.helicsMessageSetOriginalSource(message, src)
end

"""
Set the original destination of a message

# Arguments

- `message`: The message object in question
- `dest`: A string containing the new original source
"""
function helicsMessageSetOriginalDestination(message::Message, dest::String)
    Utils.@invoke_and_check Lib.helicsMessageSetOriginalDestination(message, dest)
end

"""
Set the delivery time for a message

# Arguments

- `message`: The message object in question
- `time`: The time the message should be delivered
"""
function helicsMessageSetTime(message::Message, time::HELICS.HELICS_TIME)
    Utils.@invoke_and_check Lib.helicsMessageSetTime(message, time)
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
    Utils.@invoke_and_check Lib.helicsMessageResize(message, newSize)
end

"""
Reserve space in a buffer but don't actually resize

the message data buffer will be reserved but not resized

# Arguments

- `message`: The message object in question
- `reserveSize`: The number of bytes to reserve in the message object
"""
function helicsMessageReserve(message::Message, reserveSize::Int)
    Utils.@invoke_and_check Lib.helicsMessageReserve(message, reserverSize)
end

"""
Set the message ID for the message

normally this is not needed and the core of HELICS will adjust as needed

# Arguments

- `message`: The message object in question
- `messageID`: A new message ID
"""
function helicsMessageSetMessageID(message::Message, messageID::Int32)
    Utils.@invoke_and_check helicsMessageSetMessageID(message, messageID)
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
    Utils.@invoke_and_check Lib.helicsMessageSetFlagOption(message, flag, flagValue)
end

"""
Set the data payload of a message as a string

# Arguments

- `message`: The message object in question
- `str`: A string containing the message data
"""
function helicsMessageSetString(message::Message, str::String)
    Utils.@invoke_and_check Lib.helicsMessageSetString(message, str)
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
    Utils.@invoke_and_check Lib.helicsMessageSetData(message, data, inputDataLength)
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
    Utils.@invoke_and_check Lib.helicsMessageAppendData(message, data, inputDataLength)
end

"""
"""
function helicsInputGetInjectionUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetInjectionUnits(ipt))
end

"""
"""
function helicsFederateRegisterFromPublicationJSON(fed::Federate, json::String)
    Utils.@invoke_and_check Lib.helicsFederateRegisterFromPublicationJSON(fed, json)
end

"""
Set a the log file on a core

# Arguments

- `core`: The core to set the global through
- `logFileName`: The name of the file to log to
"""
function helicsCoreSetLogFile(core::Core, logFileName::String)
    Utils.@invoke_and_check Lib.helicsCoreSetLogFile(core, logFileName)
end

"""
Set a the log file on a broker

# Arguments

- `broker`: The broker to set the global through
- `logFileName`: The name of the file to log to
"""
function helicsBrokerSetLogFile(broker::Broker, logFileName::String)
    Utils.@invoke_and_check Lib.helicsBrokerSetLogFile(broker::Broker, logFileName::String)
end

"""
Clear all stored messages from a federate

this clears messages retrieved through helicsFederateGetMessage or
helicsFederateGetMessageObject

# Arguments

- `fed`: The federate to clear the message for
"""
function helicsFederateClearMessages(fed::Federate)
    Lib.helicsFederateClearMessages(fed)
end

"""
"""
function helicsFederateClearUpdates(fed::Federate)
    Lib.helicsFederateClearUpdates(fed)
end

"""
Log a message through a federate

# Arguments

- `fed`: The federate to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogInfoMessage(fed::Federate, logmessage::String)
    Utils.@invoke_and_check Lib.helicsFederateLogInfoMessage(fed, logmessage)
end

"""
"""
function helicsInputGetExtractionUnits(ipt::Input)::String
    return unsafe_string(Lib.helicsInputGetExtractionUnits(ipt))
end

"""
"""
function helicsFederateSetLogFile(fed::Federate, logFile::String)
    Utils.@invoke_and_check Lib.helicsFederateSetLogFile(fed, logFile)
end

"""
Log a message through a federate

# Arguments

- `fed`: The federate to set the global through
- `loglevel`: The level of the message to log. See [`HELICS_LOG_LEVELS`](@ref)
- `logmessage`: The message to put in the log
"""
function helicsFederateLogLevelMessage(fed::Federate, loglevel::Union{Int, HELICS_LOG_LEVELS}, logmessage::String)
    Utils.@invoke_and_check Lib.helicsFederateLogLevelMessage(fed, loglevel, logmessage)
end

"""
Get the network address associated with a core

# Arguments

- `core`: The core to query

# Returns

- a string with the network address of the broker
"""
function helicsCoreGetAddress(core::Core)::String
    return unsafe_string(Lib.helicsCoreGetAddress(core))
end

"""
"""
function helicsInputClearUpdate(ipt::Input)
    Lib.helicsInputClearUpdate(ipt)
end

"""
"""
function helicsFederateSetLoggingCallback(fed::Federate, logger::CFunction, userdata)
    Utils.@invoke_and_check Lib.helicsFederateSetLoggingCallback(fed, logger, userdata)
end

"""
Log an error message through a federate

# Arguments

- `fed`: The federate to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogErrorMessage(fed::Federate, logmessage::String)
    Utils.@invoke_and_check Lib.helicsFederateLogErrorMessage(fed, logmessage)
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
    Utils.@invoke_and_check Lib.helicsCoreWaitForDisconnect(core, msWait)
end

"""
Log a message through a federate

# Arguments

- `fed`: The federate to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogDebugMessage(fed::Federate, logmessage::String)
    Utils.@invoke_and_check Lib.helicsFederateLogDebugMessage(fed, logmessage)
end

"""
"""
function helicsBrokerSetLoggingCallback(broker::Broker, logger::CFunction, userdata)
    Utils.@invoke_and_check Lib.helicsBrokerSetLoggingCallback(broker, logger, userdata)
end

"""
Set the key for a broker connection

this is only used if the core is automatically created, the broker
information will be transferred to the core for connection

# Arguments

- `fi`: The federate info object to alter
- `brokerkey`: A string containing a key for the broker to connect
"""
function helicsFederateInfoSetBrokerKey(fi::FederateInfo, brokerKey::String)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetBrokerKey(fi, brokerKey)
end

"""
Log a warning message through a federate

# Arguments

- `fed`: The federate to set the global through
- `logmessage`: The message to put in the log
"""
function helicsFederateLogWarningMessage(fed::Federate, logmessage::String)
    Utils.@invoke_and_check Lib.helicsFederateLogWarningMessage(fed, logmessage)
end

"""
"""
function helicsFederatePublishJSON(fed::Federate, json::String)
    Utils.@invoke_and_check Lib.helicsFederatePublishJSON(fed, json)
end

"""
request the next time for federate execution

# Arguments

- `fed`: The federate to make the request of
- `timeDelta`: The requested amount of time to advance

Returns

- the time granted to the federate, will return
[`HELICS_TIME_MAXTIME`](@ref) if the simulation has terminated invalid
"""
function helicsFederateRequestTimeAdvance(fed::Federate, timeDelta::HELICS.HELICS_TIME)::Float64
    return Utils.@invoke_and_check Lib.helicsFederateRequestTimeAdvance(fed, timeDelta)
end

"""
Clear all message from an endpoint

# Arguments

- `endpoint`: The endpoint object to operate on
"""
function helicsEndpointClearMessages(endpoint::Endpoint)
    Lib.helicsEndpointClearMessages(endpoint)
end

"""
"""
function helicsCoreSetLoggingCallback(core::Core, logger::CFunction, userdata)
    Utils.@invoke_and_check Lib.helicsCoreSetLoggingCallback(broker, logger, userdata)
end

"""
Set the initialization string that a core will pass to a generated
broker usually in the form of command line arguments

# Arguments

- `fi`: The federate info object to alter
- `brokerInit`: A string with command line arguments for a generated broker
"""
function helicsFederateInfoSetBrokerInitString(fi::FederateInfo, brokerInit::String)
    Utils.@invoke_and_check Lib.helicsFederateInfoSetBrokerInitString(fi::FederateInfo, brokerInit)
end

"""
Load a file containing connection information

# Arguments

- `broker`: The broker to generate the connections from
- `file`: A JSON or TOML file containing connection information
"""
function helicsBrokerMakeConnections(broker::Broker, file::String)
    Utils.@invoke_and_check Lib.helicsBrokerMakeConnections(broker, file)
end

"""
Load a file containing connection information

# Arguments

- `core`: The core to generate the connections from
- `file`: A JSON or TOML file containing connection information
"""
function helicsCoreMakeConnections(core::Core, file::String)
    Utils.@invoke_and_check Lib.helicsCoreMakeConnections(core, file)
end

"""
"""
function helicsInputSetMinimumChange(inp::Input, tolerance::Float64)
    Utils.@invoke_and_check Lib.helicsInputSetMinimumChange(inp, tolerance)
end

"""
"""
function helicsFederateGlobalError(fed::Federate, error_code::Integer, error_string::String)
    helicsFederateGlobalError(fed, code, error_string)
end

"""
"""
function helicsFederateLocalError(fed::Federate, error_code::Integer, error_string::String)
    helicsFederateLocalError(fed, code, error_string)
end

"""
"""
function helicsFederateAddDependency(fed::Federate, fedName::String)
    Utils.@invoke_and_check helicsFederateAddDependency(fed, fedName)
end
