# Automatically generated using Clang.jl


const helics_input = Ptr{Cvoid}
const helics_publication = Ptr{Cvoid}
const helics_endpoint = Ptr{Cvoid}
const helics_filter = Ptr{Cvoid}
const helics_core = Ptr{Cvoid}
const helics_broker = Ptr{Cvoid}
const helics_federate = Ptr{Cvoid}
const helics_federate_info = Ptr{Cvoid}
const helics_query = Ptr{Cvoid}
const helics_message_object = Ptr{Cvoid}
const helics_time = Cdouble
const helics_bool = Cint

@cenum helics_iteration_request::UInt32 begin
    helics_iteration_request_no_iteration = 0
    helics_iteration_request_force_iteration = 1
    helics_iteration_request_iterate_if_needed = 2
end

@cenum helics_iteration_result::UInt32 begin
    helics_iteration_result_next_step = 0
    helics_iteration_result_error = 1
    helics_iteration_result_halted = 2
    helics_iteration_result_iterating = 3
end

@cenum helics_federate_state::UInt32 begin
    helics_state_startup = 0
    helics_state_initialization = 1
    helics_state_execution = 2
    helics_state_finalize = 3
    helics_state_error = 4
    helics_state_pending_init = 5
    helics_state_pending_exec = 6
    helics_state_pending_time = 7
    helics_state_pending_iterative_time = 8
    helics_state_pending_finalize = 9
end


struct helics_complex
    real::Cdouble
    imag::Cdouble
end

mutable struct helics_message
    time::helics_time
    data::Cstring
    length::Int64
    messageID::Int32
    flags::Int16
    original_source::Cstring
    source::Cstring
    dest::Cstring
    original_dest::Cstring
end

mutable struct helics_error
    error_code::Int32
    message::Cstring
end

# Skipping MacroDefinition: HELICS_EXPORT __attribute__ ( ( visibility ( "default" ) ) )
# Skipping MacroDefinition: HELICS_NO_EXPORT __attribute__ ( ( visibility ( "hidden" ) ) )
# Skipping MacroDefinition: HELICS_DEPRECATED __attribute__ ( ( __deprecated__ ) )

const HELICS_DEPRECATED_EXPORT = HELICS_EXPORT
const HELICS_DEPRECATED_NO_EXPORT = HELICS_NO_EXPORT
