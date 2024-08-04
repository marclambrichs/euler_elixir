defmodule Euler.Exercise_005 do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10
  without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


  """
  import Euler.Globals

  def solution(max \\ 20) do
    # Rationale: for all primefactors <= max, calculate the max power
    # smaller than or equal to max. Calculate product.
    # [8, 9, 5, 7] |> List.foldl(1, &(&1 * &2))

    2..max
    |> Enum.flat_map(&primefactors(&1))
    |> Enum.uniq()
    |> Enum.map(&power(max, &1))
    |> List.foldl(1, &(&1 * &2))
  end

  def power(max, n), do: power(max, 1, n)
  defp power(max, power, n) when power <= max, do: power(max, power * n, n)
  defp power(_max, power, n), do: div(power, n)
end
