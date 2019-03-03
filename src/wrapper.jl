abstract type CWrapper end

Base.convert(T::Type{<:CWrapper}, p::Ptr{Nothing}) = T(p)
Base.unsafe_convert(T::Type{Ptr{Nothing}}, t::CWrapper) = t.ptr

abstract type Federate <: CWrapper end

for (subtype, supertype) in (
            (:Broker, :CWrapper),
            (:Core, :CWrapper),
            (:FederateInfo, :CWrapper),
            (:ValueFederate, :Federate),
            (:MessageFederate, :Federate),
            (:CombinationFederate, :Federate),
            (:Publication, :CWrapper),
            (:Subscription, :CWrapper),
            (:Endpoint, :CWrapper),
            (:Filter, :CWrapper),
            (:Query, :CWrapper),
           )

    eval(:(
          struct $subtype <: $supertype
              ptr::Ptr{Nothing}
              function $subtype(ptr::Ptr{Nothing})
                  ptr == C_NULL && error("Failed to create $subtype. Received null pointer from HELICS C interface.")
                  new(ptr)
              end
          end
          ))
end

const Input = Subscription

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
function unsafe_wrap(msg::Message)::Lib.helics_message
    Lib.helics_message(
                       msg.time,
                       msg.data |> pointer,
                       msg.length,
                       msg.messageID,
                       msg.flags,
                       msg.original_source |> pointer,
                       msg.source |> pointer,
                       msg.dest |> pointer,
                       msg.original_dest |> pointer,
                      )
end


