module TypedDocStringExtensions

using DocStringExtensions
const DSE = DocStringExtensions

struct FullMethodSignatures <: DSE.Abbreviation end

const FULLSIGNATURES = FullMethodSignatures()

function DSE.format(::FullMethodSignatures, buf, doc)
    local binding = doc.data[:binding]
    local typesig = doc.data[:typesig]
    local modname = doc.data[:module]
    local func = Docs.resolve(binding)
    local groups = DSE.methodgroups(func, typesig, modname)
    if !isempty(groups)
        println(buf)
        println(buf, "```julia")
        for group in groups
            if length(group) == 1
                for method in group
                    printmethod(buf, binding, func, method, typesig)
                    println(buf)
                end
            else
                # If function has default arguments, revert to default printmethod
                for (i, method) in enumerate(group)
                    if i == length(group)
                        t = typesig
                    else
                        t = typesig.a
                        typesig = typesig.b
                    end
                    printmethod(buf, binding, func, method, t)
                    println(buf)
                end
            end
        end
        println(buf, "\n```")
    end
end

function printmethod(buffer::IOBuffer, binding::Docs.Binding, func, method::Method, typesig)
    # TODO: print qualified?
    print(buffer, binding.var)
    print(buffer, "(")
    local args = DSE.arguments(method)
    for (i, sym) in enumerate(args)
        if typesig isa UnionAll
            t = typesig.body.a.types[1]
        else
            t = typesig.types[i]
        end
        print(buffer, "$sym::$t")
        if i != length(args)
            print(buffer, ", ")
        end
    end
    local kws = DSE.keywords(func, method)
    if !isempty(kws)
        print(buffer, "; ")
        join(buffer, kws, ", ")
    end
    print(buffer, ")")
    if typesig isa UnionAll
        t = typesig.body.a
    else
        t = typesig
    end
    rt = Base.return_types(func, t)
    if length(rt) >= 1 && rt[1] !== Nothing && rt[1] !== Union{}
        print(buffer, " -> $(rt[1])")
    end
    return buffer
end

end

