module HELICS

__precompile__(true)

import Libdl

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")

if !isfile(depsjl_path)
    error("libhelicsSharedLib cannot be loaded. Please run Pkg.build(\"HELICS\").")
end

include(depsjl_path)

# Module initialization function
function __init__()
    check_deps()
    atexit(helicsCloseLibrary)
end

module Lib

    using CEnum

    import ..HELICS
    const libhelicsSharedLib = HELICS.libhelicsSharedLib

    const HELICS_EXPORT = nothing
    const HELICS_NO_EXPORT = nothing

    include("ctypes.jl")

    include("common.jl")

    include("lib.jl")

end

include("wrapper.jl")

include("utils.jl")

include("api.jl")

const HELICS_LIBRARY_VERSION = VersionNumber(split(helicsGetVersion())[1])
const HELICS_PACKAGE_VERSION = VersionNumber(match(r"version\s*=\s*\"(.+)\"", read(joinpath(@__DIR__, "..", "Project.toml"), String)).captures[1])

end # module
