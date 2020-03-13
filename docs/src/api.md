# API

This is the Julia API for the HELICS library.

```@repl
using HELICS; const h = HELICS;
h.helicsGetVersion()
```

```@contents
Pages = ["api.md"]
Depth = 3
```

## Enum

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) === DataType && t <: HELICS.Lib.CEnum.Cenum
```

## Functions

1. `Broker`
1. `Core`
1. `Endpoint`
1. `FederateInfo`
1. `Federate`
1. `Filter`
1. `Input`
1. `Message`
1. `Publication`
1. `Query`

### Broker

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsBroker")
```

### Core

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsCore")
```

### Endpoint

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsEndpoint")
```

### Federate

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsFederate") && !startswith(string(t), "helicsFederateInfo")
```

### FederateInfo

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsFederateInfo")
```

### Filter

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsFilter")
```

### Input

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsInput")
```

### Message

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsMessage")
```

### Publication

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsPublication")
```

### Query

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && startswith(string(t), "helicsQuery")
```

### Others


```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) <: Function && !any(startswith.(string(t), ["helicsBroker", "helicsCore", "helicsEndpoint", "helicsFederate", "helicsFederateInfo", "helicsFilter", "helicsInput", "helicsMessage", "helicsPublication", "helicsQuery"]))
```

## Types

```@autodocs
Modules = [HELICS]
Filter = t -> typeof(t) === DataType && !(t <: HELICS.Lib.CEnum.Cenum)
```

## Index

```@index
Pages = ["api.md"]
```
