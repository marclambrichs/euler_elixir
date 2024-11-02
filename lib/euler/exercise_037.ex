defmodule Euler.Exercise_037 do
  @moduledoc """
  Trunctable primes

  The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right,
  and remain prime at each stage: 3797, 797, 97 and 7. Similarly we can work from right to left: 3797, 379, 37 and 3.

  Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
  NOTE:
  2, 3, 5, and 7 are not considered to be truncatable primes.
  """

  import Euler.Globals

  def solution(nr \\ 15) do
    primes()
    |> Stream.filter(fn x ->
      (truncate(x, :left) ++ truncate(x, :right)) |> Enum.all?(&is_prime?(&1))
    end)
    |> Enum.take(nr)
    |> Enum.sum()
    |> Kernel.-(17)
  end

  def truncate(n, :left) when n < 10, do: [n]
  def truncate(n, :left) when n >= 10, do: [n] ++ truncate(div(n, 10), :left)
  def truncate(n, :right), do: truncate(n, 10, :right)
  def truncate(n, power, :right) when power >= n, do: []
  def truncate(n, power, :right), do: [rem(n, power)] ++ truncate(n, power * 10, :right)
end
