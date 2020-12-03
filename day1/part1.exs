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

    def check_2020_helper(_, []) do
        false
    end
    def check_2020_helper(a, [h|t]) do
        if a + h == 2020 do
            a * h
        else
            check_2020_helper(a, t)
        end
    end

    def check_2020([]) do
        false
    end
    def check_2020([h|t]) do
        res = check_2020_helper(h,t)
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
