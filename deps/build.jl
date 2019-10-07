# Build the dependencies
Mod = @eval module Anon end
Mod.include("build_ZMQ.v4.2.5+6.jl")
Mod.include("build_libhelicsSharedLib.v2.2.1.jl")

