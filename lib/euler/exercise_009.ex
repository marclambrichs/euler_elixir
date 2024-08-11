defmodule Euler.Exercise_009 do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c,
  for which, a ** 2 + b ** 2 = c ** 2.
  For example, 3 ** 2 + 4 ** 2 = 9 + 16 = 25 = 5 ** 2

  There exists exactly one Pythagorean triplet for which a + b + c = 1000
  Find the product a * b * c
  """

  def solution(n \\ 1_000) do
    find_pair(n)
    |> Enum.map(&(elem(&1, 0) * elem(&1, 1) * elem(&1, 2)))
    |> hd()
  end

  defp generate_list(n) do
    for a <- 1..div(n - 3, 3), b <- (a + 1)..div(n - 1 - a, 2) do
      {a, b, n - a - b}
    end
  end

  def find_pair(n),
    do: generate_list(n) |> Enum.filter(fn {x, y, z} -> x ** 2 + y ** 2 == z ** 2 end)
end
