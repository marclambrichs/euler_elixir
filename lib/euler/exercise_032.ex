defmodule Euler.Exercise_032 do
  @moduledoc """
  We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the
  5-digit number, 15234, is 1 through 5 pandigital.

  The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9
  pandigital.

  Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
  """
  import Euler.Globals

  def solution(max \\ 9) do
    permutations(max)
    |> Stream.flat_map(fn permutation ->
      Stream.map(partitions(max), fn partition -> tuples(permutation, partition) end)
    end)
    |> Stream.filter(fn {a, b, c} -> a * b == c end)
    |> Stream.map(&elem(&1, 2))
    |> Enum.uniq()
    |> Enum.sum()
  end

  defp partitions(max) do
    for(a <- 1..max, b <- 1..max, c <- 1..max, a <= b, b <= c, a + b + c == max) do
      {a, b, c}
    end
  end

  defp tuples(permutation, {a, b, _c}) do
    {first, rest} = Enum.split(permutation, a)
    {second, third} = Enum.split(rest, b)
    {to_number(first), to_number(second), to_number(third)}
  end
end
