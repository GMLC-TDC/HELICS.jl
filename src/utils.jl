function snakecase_to_camelcase(s::String)
    s = replace(s, r"['`]"=>"")
    s = split(s, r"[a-z]\K(?=[A-Z][a-z])|\W|_")
    s = join(map(uppercasefirst, s))
end

function snakecase_to_camelcase(s::Symbol)
    s = String(s)
    s = snakecase_to_camelcase(s)
    s = Symbol(s)
end

ERRORCODES = Dict{Symbol, DataType}()

for sym in HELICS.Lib.CEnum.enum_names(HELICS.Lib.helics_error_types)
    sym = snakecase_to_camelcase(sym)
    eval(:(struct $sym <: Exception
               msg::String
           end))
    eval(
         :(
           k = Symbol($sym);
           ERRORCODES[k] = $sym;
          )
    )
end

function invoke_and_check(f::Function, args...)
    err = Lib.helicsErrorInitialize()
    r = f(args..., Ref(err))
    if err.error_code == 0
        return r
    elseif err.error_code == -8
        func = String(nameof(f))
        c = Lib.helics_error_types(err.error_code)
        @warn "`$func` returned warning `$(unsafe_string(err.message))`"
        return r
    else
        func = String(nameof(f))
        c = Lib.helics_error_types(err.error_code)
        s = snakecase_to_camelcase(Lib.CEnum.enum_name(c))
        s = Symbol(:(HELICS.$s))
        S = ERRORCODES[s]
        throw(S("`$func` errored with message `$(unsafe_string(err.message))`"))
    end
end

macro invoke_and_check(expr)
    pushfirst!(expr.args, :invoke_and_check)
    return esc(expr)
end

