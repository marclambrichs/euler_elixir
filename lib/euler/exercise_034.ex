defmodule Euler.Exercise_034 do
  @moduledoc """
  145 is a curious number, as 1! + 4! + 5! = 145.
  Find the sum of all numbers which are equal to the sum of the factorial of their digits.
  """

  def solution() do
    3..9_999_999 |> Enum.filter(fn x -> is_curious?(x) end) |> Enum.sum()
  end

  def is_curious?(n) do
    n == Integer.digits(n) |> Enum.reduce(0, fn x, acc -> acc + Euler.Globals.factorial(x) end)
  end
end
