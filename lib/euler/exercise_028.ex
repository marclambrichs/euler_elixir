defmodule Euler.Exercise_028 do
  @moduledoc """
  Starting with the number 1 and moving to the right in a clockwise direction a
  5 by 5 spiral is formed as follows:
  43 44 45 46 47 48 49
  42 21 22 23 24 25 26
  41 20  7  8  9 10 27
  40 19  6  1  2 11 28
  39 18  5  4  3 12 29
  38 17 16 15 14 13 30
  37 36 35 34 33 32 31
  It can be verified that the sum of the numbers on the diagonals is 101.

  What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

  Solution:
  Generate a list with only values of diagonals.
  3 by 3 -> 2, take 4 values
  5 by 5 -> 4, take 8 values
  7 by 7 -> 6, take 12 values
  1001 by 1001 -> 1000, take div(1001, 2) * 4 values
  """

  def solution(size \\ 1000) do
    additions(size)
    |> Enum.reduce([1], fn x, acc -> [hd(acc) + x | acc] end)
    |> Enum.sum()
  end

  defp additions(size) when rem(size, 2) == 0, do: raise("error")

  defp additions(size) do
    Stream.iterate(2, &(&1 + 2))
    |> Stream.flat_map(&replicate(&1, 4))
    |> Stream.take(div(size, 2) * 4)
  end

  defp replicate(x, n) do
    for _ <- 1..n, do: x
  end
end
