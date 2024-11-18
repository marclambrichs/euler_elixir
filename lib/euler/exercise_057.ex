defmodule Euler.Exercise_057 do
  @moduledoc """
  Square Root Convergents
  """

  def solution(n \\ 1000) do
    square_root_2()
    |> Stream.take(n)
    |> Stream.filter(fn {a, b} -> nr_of_digits(a) > nr_of_digits(b) end)
    |> Enum.to_list()
    |> length()
  end

  def square_root_2(), do: Stream.iterate({3, 2}, fn {a, b} -> {a + 2 * b, a + b} end)

  def nr_of_digits(x) when is_integer(x), do: Integer.digits(x) |> length()
end
