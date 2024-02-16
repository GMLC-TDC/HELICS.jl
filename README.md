# HELICS.jl

[![CI](https://github.com/GMLC-TDC/HELICS.jl/workflows/CI/badge.svg)](https://github.com/GMLC-TDC/HELICS.jl/actions?query=workflow%3ACI) [![Docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://gmlc-tdc.github.io/HELICS.jl/latest) [![Codecov](https://img.shields.io/codecov/c/github/gmlc-tdc/HELICS.jl.svg)](https://codecov.io/gh/GMLC-TDC/HELICS.jl) [![Coverage Status](https://coveralls.io/repos/github/GMLC-TDC/HELICS.jl/badge.svg?branch=HEAD)](https://coveralls.io/github/GMLC-TDC/HELICS.jl?branch=HEAD) [![Gitter](https://img.shields.io/gitter/room/GMLC-TDC/HELICS.svg)](https://gitter.im/GMLC-TDC/HELICS) [![Releases](https://img.shields.io/github/tag-date/GMLC-TDC/HELICS.jl.svg)](https://github.com/GMLC-TDC/HELICS.jl/releases)

[HELICS.jl](https://github.com/GMLC-TDC/HELICS.jl) is a cross-platform Julia wrapper around the [HELICS](https://github.com/GMLC-TDC/HELICS) library.

**This package is now available for Windows, Mac, and Linux.**

## Documentation

The documentation for the development latest of this package is [here](https://gmlc-tdc.github.io/HELICS.jl/latest/).

## Installation

Use the Julia package manager to install HELICS.jl

```julia
julia> ]
(v1.1)> add HELICS
```

Open the package manager REPL (using `]`)

To install the latest development version, use the following from within Julia:

```julia
(v1.1) pkg> add HELICS#master
```

This package includes HELICS as a library. You do not have to install HELICS
separately.

Note that this should work on 64-bit Windows, Mac and Linux systems.

If you wish to develop `HELICS.jl` you may want to use the following:

```julia
(v1.1) pkg> dev HELICS
```

You can also get a specific version,

```julia
(v1.1) pkg> add HELICS#33c98625
```

or specific branch,


```julia
(v1.1) pkg> add HELICS#kd/some-new-feature
```

if these features haven't been merged to `master` yet.

## Troubleshooting

This package interfaces with HELICS, so a good understanding of HELICS will help troubleshooting.
There are plenty of useful resources located [here](https://helics.readthedocs.io/en/latest/).

If you are having issues using this Julia interface, feel free to open an issue on GitHub [here](https://github.com/GMLC-TDC/HELICS.jl/issues/new).

## Citation
General citation for HELICS:
T. Hardy, B. Palmintier, P. Top, D. Krishnamurthy and J. Fuller, "HELICS: A Co-Simulation Framework for Scalable Multi-Domain Modeling and Analysis," in IEEE Access, doi: 10.1109/ACCESS.2024.3363615, available at [https://ieeexplore.ieee.org/document/10424422](https://ieeexplore.ieee.org/document/10424422/)

## Acknowledgements

This work was initially developed as an extension to work done as part of the Scalable Integrated Infrastructure Planning (SIIP) initiative at the U.S. Department of Energy's National Renewable Energy Laboratory ([NREL](https://www.nrel.gov/)).

## Release

HELICS.jl is distributed under the terms of the BSD-3 clause license.
All new contributions must be made under this license. [LICENSE](LICENSE)

SPDX-License-Identifier: BSD-3-Clause
