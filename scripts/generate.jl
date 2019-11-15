using Clang

# LIBCLANG_HEADERS are those headers to be wrapped.
const LIBHELICS_INCLUDE = [
                           joinpath(@__DIR__, "../deps/usr/include/helics/shared_api_library") |> normpath,
                           joinpath(@__DIR__, "../deps/usr/include/helics") |> normpath
                          ]

const LIBHELICS_HEADERS = String[]

for folder in LIBHELICS_INCLUDE
    for header in readdir(folder)
        if endswith(header, ".h")
            push!(LIBHELICS_HEADERS, joinpath(folder, header))
        end
    end
end

LIBHELICS_ARGS = String[]
for path in LIBHELICS_INCLUDE
    push!(LIBHELICS_ARGS, "-I")
    push!(LIBHELICS_ARGS, path)
end


wc = init(; headers = LIBHELICS_HEADERS,
            output_file = joinpath(@__DIR__, "../src/lib.jl"),
            common_file = joinpath(@__DIR__, "../src/common.jl"),
            clang_includes = vcat(LIBHELICS_INCLUDE..., CLANG_INCLUDE),
            clang_args = LIBHELICS_ARGS,
            header_wrapped = (root, current)->root == current,
            header_library = x->"libhelicsSharedLib",
            clang_diagnostics = true,
            )

run(wc)
