const HELICS_HAVE_MPI = 0
const HELICS_HAVE_ZEROMQ = 1
const BOOST_VERSION_LEVEL = 67
const HELICS_VERSION_MAJOR = 2
const HELICS_VERSION_MINOR = 2
const HELICS_VERSION_PATCH = 2
const HELICS_VERSION = "2.2.2"
const HELICS_VERSION_BUILD = ""
const HELICS_VERSION_STRING = "2.2.2 (10-27-19)"
const HELICS_DATE = "10-27-19"

@cenum helics_data_type::UInt32 begin
    helics_data_type_string = 0
    helics_data_type_double = 1
    helics_data_type_int = 2
    helics_data_type_complex = 3
    helics_data_type_vector = 4
    helics_data_type_complex_vector = 5
    helics_data_type_named_point = 6
    helics_data_type_boolean = 7
    helics_data_type_time = 8
    helics_data_type_raw = 25
    helics_data_type_any = 25262
end

const helics_data_type_char = helics_data_type_string

@cenum helics_core_type::UInt32 begin
    helics_core_type_default = 0
    helics_core_type_zmq = 1
    helics_core_type_mpi = 2
    helics_core_type_test = 3
    helics_core_type_interprocess = 4
    helics_core_type_ipc = 5
    helics_core_type_tcp = 6
    helics_core_type_udp = 7
    helics_core_type_zmq_test = 10
    helics_core_type_nng = 9
    helics_core_type_tcp_ss = 11
    helics_core_type_http = 12
end

@cenum helics_federate_flags::UInt32 begin
    helics_flag_observer = 0
    helics_flag_uninterruptible = 1
    helics_flag_interruptible = 2
    helics_flag_source_only = 4
    helics_flag_only_transmit_on_change = 6
    helics_flag_only_update_on_change = 8
    helics_flag_wait_for_current_time_update = 10
    helics_flag_rollback = 12
    helics_flag_forward_compute = 14
    helics_flag_realtime = 16
    helics_flag_single_thread_federate = 27
    helics_flag_delay_init_entry = 45
    helics_flag_enable_init_entry = 47
    helics_flag_ignore_time_mismatch_warnings = 67
end

@cenum helics_log_levels::Int32 begin
    helics_log_level_no_print = -1
    helics_log_level_error = 0
    helics_log_level_warning = 1
    helics_log_level_summary = 2
    helics_log_level_connections = 3
    helics_log_level_interfaces = 4
    helics_log_level_timing = 5
    helics_log_level_data = 6
    helics_log_level_trace = 7
end

@cenum helics_error_types::Int32 begin
    helics_ok = 0
    helics_error_registration_failure = -1
    helics_error_connection_failure = -2
    helics_error_invalid_object = -3
    helics_error_invalid_argument = -4
    helics_error_discard = -5
    helics_error_system_failure = -6
    helics_warning = -8
    helics_error_invalid_state_transition = -9
    helics_error_invalid_function_call = -10
    helics_error_execution_failure = -14
    helics_error_other = -101
    other_error_type = -203
end

@cenum helics_properties::Int32 begin
    helics_property_time_delta = 137
    helics_property_time_period = 140
    helics_property_time_offset = 141
    helics_property_time_rt_lag = 143
    helics_property_time_rt_lead = 144
    helics_property_time_rt_tolerance = 145
    helics_property_time_input_delay = 148
    helics_property_time_output_delay = 150
    helics_property_int_max_iterations = 259
    helics_property_int_log_level = 271
end

@cenum helics_handle_options::UInt32 begin
    helics_handle_option_connection_required = 397
    helics_handle_option_connection_optional = 402
    helics_handle_option_single_connection_only = 407
    helics_handle_option_multiple_connections_allowed = 409
    helics_handle_option_buffer_data = 411
    helics_handle_option_strict_type_checking = 414
    helics_handle_option_only_transmit_on_change = 6
    helics_handle_option_only_update_on_change = 8
    helics_handle_option_ignore_interrupts = 475
end

@cenum helics_filter_type::UInt32 begin
    helics_filter_type_custom = 0
    helics_filter_type_delay = 1
    helics_filter_type_random_delay = 2
    helics_filter_type_random_drop = 3
    helics_filter_type_reroute = 4
    helics_filter_type_clone = 5
    helics_filter_type_firewall = 6
end
