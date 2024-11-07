defmodule Euler.Exercise_046 do
  @moduledoc """
  Goldbach's Other Conjecture

  What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
  """
  import Euler.Globals

  def solution() do
    composites()
    |> Stream.filter(&(rem(&1, 2) == 1))
    |> Stream.filter(&(not is_goldbach?(&1)))
    |> Enum.take(1)
  end

  def is_goldbach?(n) do
    primes_below(n)
    |> Enum.any?(fn prime -> div(n - prime, 2) |> is_quadratic?() end)
  end

  def is_quadratic?(n) do
    root = :math.sqrt(n)
    root == trunc(root)
  end
end
