module BigMacro

using MacroTools: prewalk

export @bigfloat, @bigint

macro bigfloat(ex)
    prewalk(ex) do x
        try
            BigFloat(x)
        catch
            x
        end
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
        try
            BigInt(x)
        catch
            x
        end
    end
end

end
