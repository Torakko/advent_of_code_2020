#! /usr/bin/elixir

defmodule A do
    def to_int([], out) do
        out
    end
    def to_int([h|t], out) do
        cond do
            String.length(h) > 0 -> to_int(t, [String.to_integer(h)|out])
            true -> to_int(t, out)
        end
    end
        
    def get_input() do
        {:ok, file} = File.read("input")
        to_int(String.split(file, "\n"), [])
    end    

    def check_2020_inner(_, _, []) do
        false
    end
    def check_2020_inner(a, b, [h|t]) do
        if a + b + h == 2020 do
            a * b * h
        else
            check_2020_inner(a, b, t)
        end
    end

    def check_2020_middle(_, []) do
        false
    end
    def check_2020_middle(a, [h|t]) do
        res = check_2020_inner(a, h, t)
        case res do
            false -> check_2020_middle(a, t)
            _ -> res
        end
    end

    def check_2020([]) do
        false
    end
    def check_2020([h|t]) do
        res = check_2020_middle(h,t)
        case res do
            false -> check_2020(t)
            _ -> res
        end
    end
end

#res = A.check_2020([2018, 2])
input = A.get_input()
res = A.check_2020(input)
IO.puts res
