import Base: @__doc__

"""
# Summary

abstract type HELICS.CWrapper
"""
abstract type CWrapper end

Base.convert(T::Type{<:CWrapper}, p::Ptr{Nothing}) = T(p)
Base.unsafe_convert(T::Type{Ptr{Nothing}}, t::CWrapper) = t.ptr

"""
# Summary

abstract type HELICS.Federate <: HELICS.CWrapper

# Subtypes

- [`HELICS.CombinationFederate`](@ref)
- [`HELICS.MessageFederate`](@ref)
- [`HELICS.ValueFederate`](@ref)

# Supertype Hierarchy

HELICS.Federate <: HELICS.CWrapper <: Any

"""
abstract type Federate <: CWrapper end

macro define(subtype, supertype)
    docstring = """
# Summary

struct [`HELICS.$subtype`](@ref) <: [`HELICS.$supertype`](@ref)
"""
    esc(quote
        struct $subtype <: $supertype
            ptr::Ptr{Nothing}
            function $subtype(ptr::Ptr{Nothing})
                ptr == C_NULL && error("Failed to create $($subtype). Received null pointer from HELICS C interface.")
                new(ptr)
            end
        end
        @doc $docstring $subtype
    end)
end

@define Broker CWrapper
@define Core CWrapper
@define FederateInfo CWrapper
@define ValueFederate Federate
@define MessageFederate Federate
@define CombinationFederate Federate
@define Publication CWrapper
@define Subscription CWrapper
@define Endpoint CWrapper
@define Filter CWrapper
@define Query CWrapper

@define Message CWrapper

const Input = Subscription

