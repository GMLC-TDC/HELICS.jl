push!(LOAD_PATH, joinpath(@__DIR__, "../src/"))
using Documenter, HELICS, DocumenterMarkdown

cp(joinpath(@__DIR__, "../README.md"), joinpath(@__DIR__, "./src/index.md"), force=true, follow_symlinks=true)

makedocs(
    modules = [HELICS],
    format = Documenter.HTML(
        canonical = "https://gmlc-tdc.github.io/HELICS.jl/stable/",
    ),
    sitename = "HELICS.jl",
    pages = [
        "index.md",
        "terminology.md",
        "api.md",
    ],
)

deploydocs(
    repo = "github.com/GMLC-TDC/HELICS.jl.git",
    push_preview = true
)
