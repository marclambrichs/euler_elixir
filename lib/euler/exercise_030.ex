defmodule Euler.Exercise_030 do
  @moduledoc """
  Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

  1634 = 1 ** 4 + 6 ** 4 + 3 ** 4 + 4 ** 4
  8208 = 8 ** 4 + 2 ** 4 + 0 ** 4 + 8 ** 4
  9474 = 9 ** 4 + 4 ** 4 + 7 ** 4 + 4 ** 4

  The sum of these numbers is 1634 + 8208 + 9474 = 19316.

  Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
  """

  def solution(power \\ 5) do
    powers = 0..9 |> Map.new(&{&1, &1 ** power})

    10..(4 * Map.get(powers, 9))
    |> Enum.filter(&(&1 == sum(&1, power, powers)))
    |> Enum.sum()
  end

  defp sum(n, _power, powers) when n < 10, do: Map.get(powers, n)
  defp sum(n, power, powers), do: rem(n, 10) ** power + sum(div(n, 10), power, powers)
end
