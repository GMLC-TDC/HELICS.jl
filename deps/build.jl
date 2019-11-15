# Build the dependencies
Mod = @eval module Anon end
Mod.include("build_ZMQ.v4.3.1.jl")
Mod.include("build_libhelicsSharedLib.v2.3.0.jl")

