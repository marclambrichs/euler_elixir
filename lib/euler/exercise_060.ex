defmodule Euler.Exercise_060 do
  @moduledoc """
  Prime Pair Sets
  """

  alias Euler.Globals

  def timer(), do: :timer.tc(__MODULE__, :solution, [4])

  def solution(n \\ 5) do
    solve(n)
    |> Enum.min_by(&Enum.sum/1)
  end

  def solve(0), do: [[]]

  def solve(n) do
    for solutions <- solve(n - 1),
        next <- primes(if(n == 1, do: 2, else: Enum.max(solutions)), 10_000),
        combinations_are_prime?(solutions ++ [next]) do
      solutions ++ [next]
    end
  end

  def primes(from, to),
    do:
      Stream.iterate(from + 1, &(&1 + 1))
      |> Stream.filter(&Euler.Globals.is_prime?(&1))
      |> Stream.take_while(&(&1 <= to))

  def combinations_are_prime?(list) do
    Globals.combinations(2, list) |> Enum.all?(&concatenations_is_prime?/1)
  end

  def concatenations_is_prime?([a, b]),
    do: concatenations_is_prime?(a, b) and concatenations_is_prime?(b, a)

  def concatenations_is_prime?(a, b),
    do:
      (Integer.to_string(a) <> Integer.to_string(b)) |> String.to_integer() |> Globals.is_prime?()
end
