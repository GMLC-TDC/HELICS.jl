module Utils

    import ..Lib

    const MAPPING = Lib.CEnum.namemap(Lib.helics_error_types)

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

    for (sym, ans) in Lib.CEnum.name_value_pairs(Lib.helics_error_types)
        sym = snakecase_to_camelcase(sym)
        eval(:(struct $sym <: Exception
                   msg::String
               end))
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
            s = snakecase_to_camelcase(MAPPING[err.error_code])
            S = getfield(Utils, Symbol(s))
            throw(S("`$func` errored with message `$(unsafe_string(err.message))`"))
        end
    end

    macro invoke_and_check(expr)
        pushfirst!(expr.args, :(Utils.invoke_and_check))
        return esc(expr)
    end

end

