defmodule Euler.Exercise_010 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """
  import Euler.Globals

  def solution(n \\ 2_000_000) do
    primes(n)
    |> Enum.reduce(0, &(&1 + &2))
  end
end
