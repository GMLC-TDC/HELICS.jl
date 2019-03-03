push!(LOAD_PATH, joinpath(@__DIR__, "../src/"))
using Documenter, HELICS

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
