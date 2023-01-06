using Clang

#using HELICS
#const HELICS_jll = HELICS.Lib.HELICS_jll

# LIBCLANG_HEADERS are those headers to be wrapped.
#const LIBHELICS_INCLUDE = [
#                           normpath(joinpath(HELICS_jll.artifact_dir, "include", "helics", "shared_api_library")),
#                           normpath(joinpath(HELICS_jll.artifact_dir, "include", "helics")),
#                          ]
const LIBHELICS_INCLUDE = [normpath(joinpath(HELICS_jll.artifact_dir, "include", "helics"))]

const LIBHELICS_HEADERS = String["helics.h"]

#for folder in LIBHELICS_INCLUDE
#    for header in readdir(folder)
#        if endswith(header, ".h")
#            push!(LIBHELICS_HEADERS, joinpath(folder, header))
#        end
#    end
#end

LIBHELICS_ARGS = String[]
for path in LIBHELICS_INCLUDE
    push!(LIBHELICS_ARGS, "-I")
    push!(LIBHELICS_ARGS, path)
end


wc = init(; headers = LIBHELICS_HEADERS,
            output_file = joinpath(@__DIR__, "..", "src", "lib.jl"),
            common_file = joinpath(@__DIR__, "..", "src", "common.jl"),
            clang_includes = vcat(LIBHELICS_INCLUDE..., CLANG_INCLUDE),
            clang_args = LIBHELICS_ARGS,
            header_wrapped = (root, current)->root == current,
            header_library = x->"libhelics",
            clang_diagnostics = true,
            )

run(wc)
