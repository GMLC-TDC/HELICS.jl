push!(LOAD_PATH, joinpath(@__DIR__, "../src/"))
using Documenter, HELICS

makedocs(sitename="HELICS Julia documentation")

deploydocs(
    repo = "github.com/GMLC-TDC/HELICS.jl.git",
)
