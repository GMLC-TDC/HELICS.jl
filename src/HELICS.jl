module HELICS

__precompile__(true)

import Libdl

if Sys.iswindows()
    const LIBRARY = joinpath(@__DIR__, "../deps/windows/libhelicsSharedLib.dll") |> abspath
elseif Sys.islinux()
    const LIBRARY = joinpath(@__DIR__, "../deps/linux/libhelicsSharedLib.so") |> abspath
elseif Sys.isapple()
    const LIBRARY = joinpath(@__DIR__, "../deps/mac/libhelicsSharedLib.dylib") |> abspath
else
    error("Unknown operating system. Cannot use HELICS.jl")
end

function __init__()

    if Libdl.dlopen(LIBRARY) == C_NULL
        error("$LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    end

end

HELICS_EXPORT = nothing
HELICS_NO_EXPORT = nothing
include("CEnum.jl")
using .CEnum

include("ctypes.jl")

include("common.jl")
include("lib.jl")

end # module
