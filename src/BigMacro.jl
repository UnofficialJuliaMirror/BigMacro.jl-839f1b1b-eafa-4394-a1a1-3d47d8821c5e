module BigMacro

using MacroTools: prewalk

export @bigfloat, @bigint

macro bigfloat(ex)
    prewalk(ex) do x
        applicable(BigFloat, x) ? BigFloat(x) : x
    end
end

macro bigfloat(precision :: Int, ex)
    quote
        setprecision($precision) do
            @bigfloat $ex
        end
    end
end

macro bigint(ex)
    prewalk(ex) do x
        applicable(BigInt, x) ? BigInt(x) : x
    end
end

end
