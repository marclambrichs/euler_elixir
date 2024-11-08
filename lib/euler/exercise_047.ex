defmodule Euler.Exercise_047 do
  @moduledoc """
  Distinct Prime Factors
  """
  import Euler.Globals

  def solution(n \\ 4) do
    Stream.iterate(2, &(&1 + 1))
    |> Enum.reduce_while([], fn x, acc ->
      if length(primefactors(x)) == n do
        cond do
          length(acc) + 1 == n -> {:halt, [x | acc]}
          true -> {:cont, [x | acc]}
        end
      else
        {:cont, []}
      end
    end)
  end
end
