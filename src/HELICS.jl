module HELICS

__precompile__(true)

import Libdl

# Module initialization function
function __init__()
    atexit(helicsCloseLibrary)
end

module Lib

    using CEnum
    using HELICS_jll

    const HELICS_EXPORT = nothing
    const HELICS_NO_EXPORT = nothing

    include("ctypes.jl")

    include("common.jl")

    include("lib.jl")

end

include("wrapper.jl")

include("utils.jl")

include("enums.jl")
include("api.jl")

const HELICS_LIBRARY_VERSION = VersionNumber(split(helicsGetVersion())[1])
const HELICS_PACKAGE_VERSION = VersionNumber(match(r"version\s*=\s*\"(.+)\"", read(joinpath(@__DIR__, "..", "Project.toml"), String)).captures[1])

end # module
