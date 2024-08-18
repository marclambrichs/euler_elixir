defmodule Euler.Exercise_021 do
  @moduledoc """
  Amicable Numbers

  Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n)
  If d(a) = b and d(b) = a, where a /= b, then a and b are an amicable pair and each of a and b are called
  amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
  The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

  Evaluate the sum of all th amicable numbers under 10000.
  """

  import Euler.Globals

  def solution(n \\ 10_000) do
    dsums =
      1..n
      |> Enum.map(&d/1)

    dsums
    |> Enum.with_index(&{&2 + 1, &1})
    |> Enum.filter(fn {idx, sum} ->
      sum < n and Enum.fetch!(dsums, sum - 1) != sum and Enum.fetch!(dsums, sum - 1) == idx
    end)
    |> Enum.map(&Tuple.to_list/1)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sum()
  end

  def d(n) do
    factors(n)
    |> Enum.drop(1)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
end
