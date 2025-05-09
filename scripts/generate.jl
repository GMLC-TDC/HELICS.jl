using Clang.Generators

using HELICS
const HELICS_jll = HELICS.Lib.HELICS_jll

cd(@__DIR__)

include_dir = normpath(HELICS_jll.artifact_dir, "include", "helics")

clang_dir = joinpath(include_dir, "clang-c")

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")

headers = [normpath(HELICS_jll.artifact_dir, "include", "helics", "helics.h")]

# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(clang_dir, args)

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)

#=
output_file=joinpath(@__DIR__, "..", "src", "lib.jl"),
common_file=joinpath(@__DIR__, "..", "src", "common.jl"),
header_wrapped=(root, current) -> root == current,
header_library=x -> "libhelics",
clang_diagnostics=true,
=#
