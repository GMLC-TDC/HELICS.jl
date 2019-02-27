abstract type CWrapper end

Base.convert(T::Type{<:CWrapper}, p::Ptr{Nothing}) = T(p)
Base.unsafe_convert(T::Type{Ptr{Nothing}}, t::CWrapper) = t.ptr

struct Broker <: CWrapper
    ptr::Ptr{Nothing}
end

struct Core <: CWrapper
    ptr::Ptr{Nothing}
end

struct FederateInfo <: CWrapper
    ptr::Ptr{Nothing}
end

abstract type Federate <: CWrapper end

struct ValueFederate <: Federate
    ptr::Ptr{Nothing}
end

struct MessageFederate <: Federate
    ptr::Ptr{Nothing}
end

struct CombinationFederate <: Federate
    ptr::Ptr{Nothing}
end

struct Publication <: CWrapper
    ptr::Ptr{Nothing}
end

struct Subscription <: CWrapper
    ptr::Ptr{Nothing}
end

const Input = Subscription

struct Endpoint <: CWrapper
    ptr::Ptr{Nothing}
end

struct Filter <: CWrapper
    ptr::Ptr{Nothing}
end

struct Query <: CWrapper
    ptr::Ptr{Nothing}
end

struct Message
    time::Float64
    data::String
    length::Int64
    messageID::Int32
    flags::Int16
    original_source::String
    source::String
    dest::String
    original_dest::String
end

function Message(msg::Lib.helics_message)

    return Message(
                   msg.time,
                   msg.data |> unsafe_string,
                   msg.length,
                   msg.messageID,
                   msg.flags,
                   msg.original_source |> unsafe_string,
                   msg.source |> unsafe_string,
                   msg.dest |> unsafe_string,
                   msg.original_dest |> unsafe_string,
                  )

end

Base.convert(::Type{Message}, msg::Lib.helics_message) = Message(msg)


