abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

abstract type Windows <: AbstractOS end
abstract type MacOS <: BSD end
abstract type Linux <: BSD end

const HELICS_VERSION = "2.0.0rc1"

function download(::Type{MacOS})

    url = "https://anaconda.org/gmlc-tdc/helics/$(HELICS_VERSION)/download/osx-64/helics-$(HELICS_VERSION)-py37h0a44026_0.tar.bz2"
    @show url
    filename = joinpath(@__DIR__, "helics.tar.gz") |> abspath
    Base.download(url, filename)

    directory = joinpath(@__DIR__, "build") |> abspath
    mkpath(joinpath(@__DIR__, "build"))
    run(`tar -xvf $filename -C $directory`)
    rm(joinpath(@__DIR__, "helics.tar.gz"), force=true)

    mkpath(joinpath(@__DIR__, "apple"))
    cp(joinpath(@__DIR__, "build/lib/libhelicsSharedLib.dylib") |> normpath, joinpath(@__DIR__, "apple", "libhelicsSharedLib.dylib") |> normpath, force=true)
    rm(joinpath(@__DIR__, "build"), force=true, recursive=true)
    println("Success")

end

function download(::Type{Linux})

    error("Not implemented. Please contact the developer.")

end

function download(::Type{Windows})

    if typeof(1) === Int64
        BIT = "x64"
    else
        BIT = "x86"
    end

    error("Not implemented. Please contact the developer.")

end


if Sys.iswindows()
    os = Windows
elseif Sys.isapple()
    os = MacOS
else
    os = Linux
end

download(os)
