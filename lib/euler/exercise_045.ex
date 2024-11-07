defmodule Euler.Exercise_045 do
  @moduledoc """
  Triangular, Pentagonal and Hexagonal Numbers

  https://en.wikipedia.org/wiki/Triangular_number
  https://en.wikipedia.org/wiki/Pentagonal_number
  https://en.wikipedia.org/wiki/Hexagonal_number
  """

  def solution() do
    pentagonals()
    |> Stream.filter(&is_triangular?/1)
    |> Stream.filter(&is_hexagonal?/1)
    |> Enum.take(3)
  end

  def pentagonals(),
    do: Stream.unfold({1, 5}, fn {a, b} -> {a, {b, 2 * b - a + 3}} end)

  def is_triangular?(n) do
    root = (:math.sqrt(8 * n + 1) - 1) / 2
    root == trunc(root)
  end

  def is_pentagonal?(n) do
    root = (:math.sqrt(24 * n + 1) + 1) / 6
    root == trunc(root)
  end

  def is_hexagonal?(n) do
    root = (:math.sqrt(8 * n + 1) + 1) / 4
    root == trunc(root)
  end
end
