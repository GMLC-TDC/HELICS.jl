push!(LOAD_PATH, joinpath(@__DIR__, "../src/"))
using Documenter, HELICS

cp(joinpath(@__DIR__, "../README.md"), joinpath(@__DIR__, "./src/index.md"), force=true, follow_symlinks=true)

makedocs(
         sitename="HELICS Julia documentation",
         pages=[
                "index.md",
                "api.md",
               ]
        )

deploydocs(
    repo = "github.com/GMLC-TDC/HELICS.jl.git",
)
