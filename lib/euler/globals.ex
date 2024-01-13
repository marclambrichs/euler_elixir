defmodule Euler.Globals do
  @moduledoc """
  Global functions.
  """

  @doc """
  Primes
  """
  def primes(), do: Stream.iterate(2, &(&1 + 1)) |> Stream.filter(&is_prime?(&1))

  @doc """
  Test to use an acc for reduction instead of a filter.
  """
  def primes_test(),
    do:
      Stream.iterate(2, &(&1 + 1))
      |> Enum.reduce([], fn x, acc -> if is_prime?(acc, x), do: [x | acc], else: acc end)

  def primes(n), do: primes() |> Enum.take(n)

  def is_prime?(_primes, 1), do: false
  def is_prime?(primes, n), do: !Enum.any?(primes, &(rem(n, &1) == 0))

  def is_prime?(0), do: false
  def is_prime?(1), do: false
  def is_prime?(2), do: true
  def is_prime?(n), do: !Enum.any?(2..n - 1, &(rem(n, &1) == 0))

  @doc """
  Fibonacci
  """
  def fibonacci(), do: Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
end
