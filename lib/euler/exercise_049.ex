defmodule Euler.Exercise_049 do
  @moduledoc """
  Prime Permutations
  """
  import Euler.Globals

  def solution() do
    for a <- primes(9999),
        permutations <- [Integer.digits(a) |> permutations() |> Enum.map(&to_number/1)],
        b <- permutations,
        c <- permutations,
        b - a == 3330,
        c - b == 3330 do
      [a, b, c]
    end
    |> Enum.uniq()
    |> Enum.filter(&Enum.all?(&1, fn x -> is_prime?(x) end))
    |> Enum.map(&Enum.reduce(&1, "", fn x, acc -> acc <> Integer.to_string(x) end))
    |> Enum.map(&String.to_integer/1)
  end
end
