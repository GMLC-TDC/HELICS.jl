# We want these enums to be made available in the HELICS api.
# Manually typing these out is verbose and annoying
# We make the enums uppercase since they are essentially constant integer values
# for e.g. `Lib.helics_iteration_request` -> `HELICS.HELICS_ITERATION_REQUEST`
#          `Lib.helics_iteration_request_no_iteration` -> `HELICS.HELICS_ITERATION_REQUEST_NO_ITERATION`
#          `Lib.helics_iteration_request_force_iteration` -> `HELICS.HELICS_ITERATION_REQUEST_FORCE_ITERATION`
#          `Lib.helics_iteration_request_iterate_if_needed` -> `HELICS.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED`
# and so on ...
CEnum = Lib.CEnum

for enum_name in [
    Lib.HelicsIterationRequest,
    Lib.HelicsIterationResult,
    Lib.HelicsFederateState,
    Lib.HelicsDataTypes,
    Lib.HelicsCoreTypes,
    Lib.HelicsFederateFlags,
    Lib.HelicsLogLevels,
    Lib.HelicsErrorTypes,
    Lib.HelicsProperties,
    Lib.HelicsHandleOptions,
    Lib.HelicsFilterTypes,
	Lib.HelicsCoreFlags,
	Lib.HelicsFlags,
	Lib.HelicsMultiInputModes,
	Lib.HelicsTranslatorTypes,
	Lib.HelicsSequencingModes
]
    # Hacks to not populate namespace
    eval(
        :(
            const $(Symbol(split(String(Symbol(enum_name)), ".")[end])) =
                $enum_name
        ),
    )

    for (_sym, ans) in Lib.CEnum.name_value_pairs(enum_name)
        eval(:(const $(Symbol(String(_sym))) = Lib.$_sym))
    end

end

# Generate the docstring for these enumerations.
# e.g. the following generates documentation like this:
# **Enumeration of the different iteration results**
#
#   •    HELICS_ITERATION_REQUEST_NO_ITERATION: No iteration is requested (0)
#
#   •    HELICS_ITERATION_REQUEST_FORCE_ITERATION: Force iteration return when able (1)
#
#   •    HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED: Only return an iteration if
#       necessary (2)

function _enum_doc_string(enum_type)
    final = String[]

    for (name, value) in CEnum.name_value_pairs(enum_type)

        n = String(name)
        d = strip(string(Docs.doc(Base.Docs.Binding(HELICS, Symbol(n)))))
        v = string(value)

        push!(final, "- `$n`: $d ($v)")

    end
    join(final, "\n")
end


"""No iteration is requested"""
HELICS_ITERATION_REQUEST_NO_ITERATION
"""Force iteration return when able"""
HELICS_ITERATION_REQUEST_FORCE_ITERATION
"""Only return an iteration if necessary"""
HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED
"""Halt the federate"""
HELICS_ITERATION_REQUEST_HALT_OPERATIONS
"""Indicate there was an error"""
HELICS_ITERATION_REQUEST_ERROR
"""
**Enumeration of the different iteration results**
$(_enum_doc_string(HELICS.HelicsIterationRequest))
"""
HELICS.HelicsIterationRequest


"""the iterations have progressed to the next time"""
HELICS_ITERATION_RESULT_NEXT_STEP
"""there was an error"""
HELICS_ITERATION_RESULT_ERROR
"""the federation has halted"""
HELICS_ITERATION_RESULT_HALTED
"""the federate is iterating at current time"""
HELICS_ITERATION_RESULT_ITERATING
"""
**Enumeration of possible return values from an iterative time request**
$(_enum_doc_string(HELICS.HelicsIterationResult))
"""
HELICS.HelicsIterationResult

"""used when no information is available about the federate state"""
HELICS_STATE_UNKNOWN
"""when created the federate is in startup state"""
HELICS_STATE_STARTUP
"""entered after the enterInitializingMode call has returned"""
HELICS_STATE_INITIALIZATION
"""entered after the enterExectuationState call has returned"""
HELICS_STATE_EXECUTION
"""the federate has finished executing normally final values may be retrieved"""
HELICS_STATE_FINALIZE
"""error state no core communication is possible but values can be retrieved the following states are for asynchronous operations"""
HELICS_STATE_ERROR
"""indicator that the federate is pending entry to initialization state"""
HELICS_STATE_PENDING_INIT
"""state pending EnterExecution State"""
HELICS_STATE_PENDING_EXEC
"""state that the federate is pending a timeRequest"""
HELICS_STATE_PENDING_TIME
"""state that the federate is pending an iterative time request"""
HELICS_STATE_PENDING_ITERATIVE_TIME
"""state that the federate is pending a finalize request"""
HELICS_STATE_PENDING_FINALIZE
"""state that the federate is finished simulating but still connected"""
HELICS_STATE_FINISHED
"""
**Enumeration of possible federate states**
$(_enum_doc_string(HELICS.HelicsFederateState))
"""
HELICS.HelicsFederateState


"""unknown type"""
HELICS_DATA_TYPE_UNKNOWN
"""a sequence of characters"""
HELICS_DATA_TYPE_STRING
"""a double precision floating point number"""
HELICS_DATA_TYPE_DOUBLE
"""a 64 bit integer"""
HELICS_DATA_TYPE_INT
"""a pair of doubles representing a complex number"""
HELICS_DATA_TYPE_COMPLEX
"""an array of doubles"""
HELICS_DATA_TYPE_VECTOR
"""a complex vector object"""
HELICS_DATA_TYPE_COMPLEX_VECTOR
"""a named point consisting of a string and a double"""
HELICS_DATA_TYPE_NAMED_POINT
"""a boolean data type"""
HELICS_DATA_TYPE_BOOLEAN
"""time data type"""
HELICS_DATA_TYPE_TIME
"""data type for a single character"""
HELICS_DATA_TYPE_CHAR
"""raw data type"""
HELICS_DATA_TYPE_RAW
"""type converts to a valid json string"""
HELICS_DATA_TYPE_JSON
"""the data type can change"""
HELICS_DATA_TYPE_MULTI
"""open type that can be anything"""
HELICS_DATA_TYPE_ANY
"""
**Enumeration of allowable data types for publications and inputs**
$(_enum_doc_string(HELICS.HelicsDataTypes))
"""
HELICS.HelicsDataTypes

"""a default core type that will default to something available"""
HELICS_CORE_TYPE_DEFAULT
"""use the Zero MQ networking protocol"""
HELICS_CORE_TYPE_ZMQ
"""use MPI for operation on a parallel cluster"""
HELICS_CORE_TYPE_MPI
"""use the Test core if all federates are in the same process"""
HELICS_CORE_TYPE_TEST
"""interprocess uses memory mapped files to transfer data (for use when all federates are on the same machine"""
HELICS_CORE_TYPE_INTERPROCESS
"""interprocess uses memory mapped files to transfer data (for use when all federates are on the same machine ipc is the same as [`HELICS_CORE_TYPE_INTERPROCESS`](@ref)"""
HELICS_CORE_TYPE_IPC
"""use a generic TCP protocol message stream to send messages"""
HELICS_CORE_TYPE_TCP
"""use UDP packets to send the data"""
HELICS_CORE_TYPE_UDP
"""single socket version of ZMQ core usually for high fed count on the same system"""
HELICS_CORE_TYPE_ZMQ_SS
"""for using the nanomsg communications"""
HELICS_CORE_TYPE_NNG
"""a single socket version of the TCP core for more easily handling firewalls"""
HELICS_CORE_TYPE_TCP_SS
"""a core type using http for communication"""
HELICS_CORE_TYPE_HTTP
"""a core using websockets for communication"""
HELICS_CORE_TYPE_WEBSOCKET
"""an in process core type for handling communications in shared memory it is pretty similar to the test core but stripped from the "test" components"""
HELICS_CORE_TYPE_INPROC
"""an explicit core type that is recognized but explicitly doesn't exist, for testing and a few other assorted reasons"""
HELICS_CORE_TYPE_NULL
"""an explicit core type exists but does nothing but return empty values or sink calls"""
HELICS_CORE_TYPE_EMPTY
"""
**Pick a core type depending on compile configuration**
$(_enum_doc_string(HELICS.HelicsCoreTypes))
"""
HELICS.HelicsCoreTypes

"""flag indicating that a federate is observe only"""
HELICS_FLAG_OBSERVER
"""flag indicating that a federate can only return requested times"""
HELICS_FLAG_UNINTERRUPTIBLE
"""flag indicating that a federate can be interrupted"""
HELICS_FLAG_INTERRUPTIBLE
"""flag indicating that a federate/interface is a signal generator only"""
HELICS_FLAG_SOURCE_ONLY
"""flag indicating a federate/interface should only transmit values if they have changed(binary equivalence)"""
HELICS_FLAG_ONLY_TRANSMIT_ON_CHANGE
"""flag indicating a federate/interface should only trigger an update if a value has changed (binary equivalence)"""
HELICS_FLAG_ONLY_UPDATE_ON_CHANGE
"""flag indicating a federate should only grant time if all other federates have already passed the requested time"""
HELICS_FLAG_WAIT_FOR_CURRENT_TIME_UPDATE
"""flag indicating a federate should operate on a restrictive time policy, which disallows some 2nd order time evaluation and can be useful for certain types of dependency cycles and update patterns, but generally shouldn't be used as it can lead to some very slow update conditions"""
HELICS_FLAG_RESTRICTIVE_TIME_POLICY
"""flag indicating that a federate has rollback capability"""
HELICS_FLAG_ROLLBACK
"""flag indicating that a federate performs forward computation and does internal rollback"""
HELICS_FLAG_FORWARD_COMPUTE
"""flag indicating that a federate needs to run in real time"""
HELICS_FLAG_REALTIME
"""flag indicating that the federate will only interact on a single thread"""
HELICS_FLAG_SINGLE_THREAD_FEDERATE
"""flag indicating use of a thread safe core"""
HELICS_FLAG_MULTI_THREAD_CORE
"""flag indicating use of a single threaded core"""
HELICS_FLAG_SINGLE_THREAD_CORE
"""used to not display warnings on mismatched requested times"""
HELICS_FLAG_IGNORE_TIME_MISMATCH_WARNINGS
"""specify that checking on configuration files should be strict and throw and error on any invalid values"""
HELICS_FLAG_STRICT_CONFIG_CHECKING
"""specify that the federate should use json serialization for all data types"""
HELICS_FLAG_USE_JSON_SERIALIZATION
"""specify that the federate is event triggered-meaning (all/most) events are triggered by incoming events"""
HELICS_FLAG_EVENT_TRIGGERED
"""specify that federate should capture the profiling data to the local federate logging system"""
HELICS_FLAG_LOCAL_PROFILING_CAPTURE
"""specify that the federate is a callback based federate using callbacks for execution"""
HELICS_FLAG_CALLBACK_FEDERATE
"""specify that a federate should automatically call timeRequest on completion of current request"""
HELICS_FLAG_AUTOMATED_TIME_REQUEST
"""
**Enumeration of possible federate flags**
$(_enum_doc_string(HELICS.HelicsFederateFlags))
"""
HELICS.HelicsFederateFlags

"""log level for dumping log messages"""
HELICS_LOG_LEVEL_DUMPLOG
"""don't print anything except a few catastrophic errors"""
HELICS_LOG_LEVEL_NO_PRINT
"""only print error level indicators"""
HELICS_LOG_LEVEL_ERROR
"""profiling log level"""
HELICS_LOG_LEVEL_PROFILING
"""only print warnings and errors"""
HELICS_LOG_LEVEL_WARNING
"""warning errors and summary level information"""
HELICS_LOG_LEVEL_SUMMARY
"""summary+ notices about federate and broker connections +messages about network connections"""
HELICS_LOG_LEVEL_CONNECTIONS
"""connections+ interface definitions"""
HELICS_LOG_LEVEL_INTERFACES
"""interfaces + timing message"""
HELICS_LOG_LEVEL_TIMING
"""timing+ data transfer notices"""
HELICS_LOG_LEVEL_DATA
"""data+ additional debug message"""
HELICS_LOG_LEVEL_DEBUG
"""all internal messages"""
HELICS_LOG_LEVEL_TRACE
@doc """
**Log level definitions**
$(_enum_doc_string(HELICS.HelicsLogLevels))
"""
HELICS.HelicsLogLevels

"""global fatal error for federation """
HELICS_ERROR_FATAL
"""an unknown non-helics error was produced"""
HELICS_ERROR_EXTERNAL_TYPE
"""the function produced a helics error of some other type """
HELICS_ERROR_OTHER
"""user code generated exception"""
HELICS_USER_EXCEPTION
"""insufficient space is available to store requested data"""
HELICS_ERROR_INSUFFICIENT_SPACE
"""the function execution has failed"""
HELICS_ERROR_EXECUTION_FAILURE
"""the call made was invalid in the present state of the calling object"""
HELICS_ERROR_INVALID_FUNCTION_CALL
"""error issued when an invalid state transition occurred """
HELICS_ERROR_INVALID_STATE_TRANSITION
"""the function issued a warning of some kind """
HELICS_WARNING
"""the federate has terminated unexpectedly and the call cannot be completed"""
HELICS_ERROR_SYSTEM_FAILURE
"""the input was discarded and not used for some reason """
HELICS_ERROR_DISCARD
"""the parameter passed was invalid and unable to be used"""
HELICS_ERROR_INVALID_ARGUMENT
"""indicator that the object used was not a valid object """
HELICS_ERROR_INVALID_OBJECT
"""the operation to connect has failed"""
HELICS_ERROR_CONNECTION_FAILURE
"""registration has failed"""
HELICS_ERROR_REGISTRATION_FAILURE
"""the function executed successfully """
HELICS_OK
"""user system abort to match typical SIGINT value"""
HELICS_ERROR_USER_ABORT
"""force termination to match typical SIGKILL value"""
HELICS_ERROR_TERMINATED
@doc """
**Enumeration of return values from the C interface functions**
$(_enum_doc_string(HELICS.HelicsErrorTypes))
"""
HELICS.HelicsErrorTypes

"""the property controlling the minimum time delta for a federate"""
HELICS_PROPERTY_TIME_DELTA
"""the property controlling the period for a federate"""
HELICS_PROPERTY_TIME_PERIOD
"""the property controlling time offset for the period of federate"""
HELICS_PROPERTY_TIME_OFFSET
"""the property controlling real time lag for a federate the max time a federate can lag real time"""
HELICS_PROPERTY_TIME_RT_LAG
"""the property controlling real time lead for a federate the max time a federate can be ahead of real time"""
HELICS_PROPERTY_TIME_RT_LEAD
"""the property controlling real time tolerance for a federate sets both [`HELICS_PROPERTY_RT_LAG`](@ref) and [`HELICS_PROPERTY_RT_LEAD`](@ref)"""
HELICS_PROPERTY_TIME_RT_TOLERANCE
"""the property controlling input delay for a federate"""
HELICS_PROPERTY_TIME_INPUT_DELAY
"""the property controlling output delay for a federate"""
HELICS_PROPERTY_TIME_OUTPUT_DELAY
"""specify the maximum time of a federate"""
HELICS_PROPERTY_TIME_STOPTIME
"""the property specifying a timeout to trigger actions if the time for granting exceeds a certain threshold"""
HELICS_PROPERTY_TIME_GRANT_TIMEOUT
"""read only property getting the current iteration count"""
HELICS_PROPERTY_INT_CURRENT_ITERATION
"""integer property controlling the maximum number of iterations in a federate"""
HELICS_PROPERTY_INT_MAX_ITERATIONS
"""integer property controlling the log level in a federate see [`HELICS_LOG_LEVELS`](@ref)"""
HELICS_PROPERTY_INT_LOG_LEVEL
"""integer property controlling the log level for file logging in a federate see [`HELICS_LOG_LEVELS`](@ref)"""
HELICS_PROPERTY_INT_FILE_LOG_LEVEL
"""integer property controlling the log level for file logging in a federate see [`HELICS_LOG_LEVELS`](@ref)"""
HELICS_PROPERTY_INT_CONSOLE_LOG_LEVEL
"""integer property controlling the size of the log buffer"""
HELICS_PROPERTY_INT_LOG_BUFFER
"""integer property specifying an index group"""
HELICS_PROPERTY_INT_INDEX_GROUP
@doc """
**Enumeration of properties that apply to federates**
$(_enum_doc_string(HELICS.HelicsProperties))
"""
HELICS.HelicsProperties

"""specify that a connection is required for an interface and will generate an error if not available"""
HELICS_HANDLE_OPTION_CONNECTION_REQUIRED
"""specify that a connection is NOT required for an interface and will only be made if available no warning will be issues if not available"""
HELICS_HANDLE_OPTION_CONNECTION_OPTIONAL
"""specify that only a single connection is allowed for an interface"""
HELICS_HANDLE_OPTION_SINGLE_CONNECTION_ONLY
"""specify that multiple connections are allowed for an interface"""
HELICS_HANDLE_OPTION_MULTIPLE_CONNECTIONS_ALLOWED
"""specify that the last data should be buffered and send on subscriptions after init"""
HELICS_HANDLE_OPTION_BUFFER_DATA
"""specify that the types should be checked strictly for pub/sub and filters"""
HELICS_HANDLE_OPTION_STRICT_TYPE_CHECKING
"""specify that the mismatching units should be ignored"""
HELICS_HANDLE_OPTION_IGNORE_UNIT_MISMATCH
"""specify that an interface will only transmit on change (only applicable to publications)"""
HELICS_HANDLE_OPTION_ONLY_TRANSMIT_ON_CHANGE
"""specify that an interface will only update if the value has actually changed"""
HELICS_HANDLE_OPTION_ONLY_UPDATE_ON_CHANGE
"""specify that an interface does not participate in determining time interrupts"""
HELICS_HANDLE_OPTION_IGNORE_INTERRUPTS
"""specify the multi-input processing method for inputs"""
HELICS_HANDLE_OPTION_MULTI_INPUT_HANDLING_METHOD
"""specify the source index with the highest priority"""
HELICS_HANDLE_OPTION_INPUT_PRIORITY_LOCATION
"""specify that the priority list should be cleared or question if it is cleared"""
HELICS_HANDLE_OPTION_CLEAR_PRIORITY_LIST
"""specify the required number of connections or get the actual number of connections"""
HELICS_HANDLE_OPTION_CONNECTIONS
"""specify that the interface only sends or receives data at specified intervals"""
HELICS_HANDLE_OPTION_TIME_RESTRICTED
@doc """
**Enumeration of options that apply to handles**
$(_enum_doc_string(HELICS.HelicsHandleOptions))
"""
HELICS.HelicsHandleOptions

"""a custom filter type that executes a user defined callback"""
HELICS_FILTER_TYPE_CUSTOM
"""a filter type that executes a fixed delay on a message"""
HELICS_FILTER_TYPE_DELAY
"""a filter type that executes a random delay on the messages"""
HELICS_FILTER_TYPE_RANDOM_DELAY
"""a filter type that randomly drops messages"""
HELICS_FILTER_TYPE_RANDOM_DROP
"""a filter type that reroutes a message to a different destination than originally specified"""
HELICS_FILTER_TYPE_REROUTE
"""a filter type that duplicates a message and sends the copy to a different destination"""
HELICS_FILTER_TYPE_CLONE
"""a customizable filter type that can perform different actions on a message based on firewall like rules"""
HELICS_FILTER_TYPE_FIREWALL
@doc """
**Enumeration of the predefined filter types**
$(_enum_doc_string(HELICS.HelicsFilterTypes))
"""
HELICS.HelicsFilterTypes

"""used to delay a core from entering initialization mode even if it would otherwise be ready"""
HELICS_FLAG_DELAY_INIT_ENTRY
"""used to clear the HELICS_DELAY_INIT_ENTRY flag in cores"""
HELICS_FLAG_ENABLE_INIT_ENTRY
"""ignored flag used to test some code paths"""
HELICS_FLAG_IGNORE
@doc """
**Enumeration of additional core flags**
$(_enum_doc_string(HELICS.HelicsCoreFlags))
"""
HELICS.HelicsCoreFlags

"""flag specifying that a federate, core, or broker may be slow to respond to pings. If the federate goes offline there is no good way to detect it so use with caution"""
HELICS_FLAG_SLOW_RESPONDING
"""flag specifying the federate/core/broker is operating in a user debug mode so deadlock timers and timeout are disabled this flag is a combination of slow_responding and disabling of some timeouts"""
HELICS_FLAG_DEBUGGING
"""specify that a federate error should terminate the federation"""
HELICS_FLAG_TERMINATE_ON_ERROR
"""specify that the log files should be flushed on every log message"""
HELICS_FLAG_FORCE_LOGGING_FLUSH
"""specify that a full log should be dumped into a file*"""
HELICS_FLAG_DUMPLOG
"""specify that helics should capture profiling data"""
HELICS_FLAG_PROFILING
"""flag trigger for generating a profiling marker"""
HELICS_FLAG_PROFILING_MARKER
"""specify that the federate/core/broker should allow some remote control operations such as finalize"""
HELICS_FLAG_ALLOW_REMOTE_CONTROL
"""specify that the federate/core/broker should *NOT* allow some remote control operations such as finalize"""
HELICS_FLAG_DISABLE_REMOTE_CONTROL
@doc """
**enumeration of general flags that can be used in federates/cores/brokers**
$(_enum_doc_string(HELICS.HelicsFlags))
"""
HELICS.HelicsFlags

"""time and priority order the inputs from the core library"""
HELICS_MULTI_INPUT_NO_OP
"""vectorize the inputs either double vector or string vector"""
HELICS_MULTI_INPUT_VECTORIZE_OPERATION
"""all inputs are assumed to be boolean and all must be true to return true"""
HELICS_MULTI_INPUT_AND_OPERATION
"""all inputs are assumed to be boolean and at least one must be true to return true"""
HELICS_MULTI_INPUT_OR_OPERATION
"""sum all the inputs"""
HELICS_MULTI_INPUT_SUM_OPERATION 
"""do a difference operation on the inputs, first-sum(rest) for double input, vector diff for vector input"""
HELICS_MULTI_INPUT_DIFF_OPERATION
"""find the max of the inputs"""
HELICS_MULTI_INPUT_MAX_OPERATION
"""find the min of the inputs"""
HELICS_MULTI_INPUT_MIN_OPERATION
"""take the average of the inputs"""
HELICS_MULTI_INPUT_AVERAGE_OPERATION
@doc """
**enumeration of the multi_input operations**
$(_enum_doc_string(HELICS.HelicsMultiInputModes))
"""
HELICS.HelicsMultiInputModes

"""a custom filter type that executes a user defined callback"""
HELICS_TRANSLATOR_TYPE_CUSTOM
"""a translator type that converts to and from JSON"""
HELICS_TRANSLATOR_TYPE_JSON
"""a translator type that just encodes the message again in binary"""
HELICS_TRANSLATOR_TYPE_BINARY
@doc """
**enumeration of the predefined translator types**
$(_enum_doc_string(HELICS.HelicsTranslatorTypes))
"""
HELICS.HelicsTranslatorTypes

"""sequencing mode to operate on priority channels"""
HELICS_SEQUENCING_MODE_FAST
"""sequencing mode to operate on the normal channels"""
HELICS_SEQUENCING_MODE_ORDERED
"""select the default channel"""
HELICS_SEQUENCING_MODE_DEFAULT
@doc """
**enumeration of sequencing modes for queries and commands fast is the default, meaning the query travels along priority channels and takes precedence of over existing messages; ordered means it follows normal priority patterns and will be ordered along with existing messages**
$(_enum_doc_string(HELICS.HelicsSequencingModes))
"""
HELICS.HelicsSequencingModes