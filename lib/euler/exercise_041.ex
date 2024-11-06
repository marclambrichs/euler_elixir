defmodule Euler.Exercise_041 do
  @moduledoc """
  Pandigital prime

  What's the largest n-digit pandigital prime?
  """

  import Euler.Globals

  def solution() do
    9..1//-1
    |> Stream.map(&max_pandigital/1)
    |> Enum.max()
  end

  def max_pandigital(n) do
    permutations(n)
    |> Stream.map(&Enum.join(&1))
    |> Stream.map(&String.to_integer(&1))
    |> Stream.filter(&is_prime?(&1))
    |> Enum.reduce(0, fn x, acc -> if x > acc, do: x, else: acc end)
  end
end
