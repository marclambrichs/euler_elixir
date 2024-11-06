defmodule Euler.Exercise_040 do
  @moduledoc """
  Champernowne's constant

  An irrational decimal fraction is created by concatenating the positive integers:
  0.123456789101112131415161718192021...
  It can be seen that the 12th digit of the fractional part is 1.

  If d_n represents the nth digit of the fractional part, find the value of the following expression.
  d_1 * d_10 * d_100 * d1_000 * d_10_000 * d_100_000 * d_1_000_000
  """

  def solution() do
    Stream.flat_map(Stream.iterate(1, &(&1 + 1)), fn x -> Integer.to_charlist(x) end)
    |> Stream.with_index(1)
    |> Stream.filter(fn {_x, index} -> index in [1, 10, 100, 1000, 10000, 100_000, 1_000_000] end)
    |> Enum.take(7)
    |> Enum.map(&String.to_integer(<<elem(&1, 0)>>))
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end
end
