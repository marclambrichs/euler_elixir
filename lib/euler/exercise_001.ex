defmodule Euler.Exercise_001 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum
  of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.
  """
  @spec solution(integer()) :: integer()
  def solution(n) do
    Enum.filter(1..(n - 1), fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end
end
