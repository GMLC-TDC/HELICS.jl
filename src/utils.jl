module Utils

import ..Lib
export invoke_and_check
export @invoke_and_check

const MAPPING = Lib.CEnum.namemap(Lib.HelicsErrorTypes)

function snakecase_to_camelcase(s::String)
    s = replace(s, r"['`]"=>"")
    s = split(s, r"[a-z]\K(?=[A-Z][a-z])|\W|_")
    s = join(map(uppercasefirst, s))
end

function snakecase_to_camelcase(s::Symbol)
    s = String(s)
#    s = replace(s, "Helics" => "HELICS")
    s = Symbol(s)
end

abstract type HELICSException <: Exception end

for (sym, ans) in Lib.CEnum.name_value_pairs(Lib.HelicsErrorTypes)
    sym = snakecase_to_camelcase(sym)
    eval(:(struct $sym <: HELICSException
               msg::String
           end))
    eval(:(export $sym))
end

function invoke_and_check(f::Function, args...)
    err = Lib.helicsErrorInitialize()
    ref_err = Ref(err)
    r = f(args..., ref_err)
    err = ref_err[]
    if err.error_code == 0
        return r
    elseif err.error_code == -8
        func = String(nameof(f))
        c = Lib.HelicsErrorTypes(err.error_code)
        @warn "`$func` returned warning `$(unsafe_string(err.message))`"
        return r
    else
        func = String(nameof(f))
        s = snakecase_to_camelcase(MAPPING[err.error_code])
        S = getfield(Utils, Symbol(s))
        throw(S("`$func` errored with message `$(unsafe_string(err.message))`"))
    end
end

macro invoke_and_check(expr)
    pushfirst!(expr.args, :(invoke_and_check))
    return esc(expr)
end

end
