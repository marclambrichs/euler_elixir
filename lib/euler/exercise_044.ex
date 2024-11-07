defmodule Euler.Exercise_044 do
  @moduledoc """
  Pentagon Numbers

  Look at https://en.wikipedia.org/wiki/Pentagonal_number
  """

  def solution(max \\ 3000) do
    pentagonals = pentagonals(max)

    for j <- pentagonals,
        k <- pentagonals,
        j < k,
        is_pentagonal?(j + k),
        is_pentagonal?(k - j) do
      {j, k, k - j}
    end
    |> Enum.min_by(fn {x, y, _} -> x - y end, :asc)
  end

  def pentagonals(max),
    do: Stream.unfold({1, 5}, fn {a, b} -> {a, {b, 2 * b - a + 3}} end) |> Enum.take(max)

  def is_pentagonal?(n) do
    root = (:math.sqrt(24 * n + 1) + 1) / 6
    root == trunc(root)
  end
end
