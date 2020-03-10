# API

This is the Julia API for the HELICS library.

```@repl
using HELICS; const h = HELICS;
h.helicsGetVersion()
```

## Enum

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) === DataType && t <: HELICS.Lib.CEnum.Cenum
```

## Functions

```@autodocs
Modules = [HELICS]
Order   = [:function]
```

## Types

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) === DataType && !(t <: HELICS.Lib.CEnum.Cenum)
```

### Index

```@index
Pages = ["api.md"]
```
