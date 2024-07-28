defmodule Euler.Globals do
  @moduledoc """
  Global functions.
  """

  @doc """
  Primes
  """
  def primes(), do: Stream.iterate(2, &(&1 + 1)) |> Stream.filter(&is_prime?(&1))

  @doc """
  Get all primes below or equal to a certain number
  """
  def primes(max),
    do:
      1..max
      |> Enum.reduce([], fn x, acc -> if is_prime?(acc, x), do: [x | acc], else: acc end)

  def n_primes(n), do: primes() |> Enum.take(n)

  def is_prime?(_primes, 1), do: false
  def is_prime?(primes, n), do: !Enum.any?(primes, &(rem(n, &1) == 0))

  def is_prime?(0), do: false
  def is_prime?(1), do: false
  def is_prime?(2), do: true
  def is_prime?(n), do: !Enum.any?(2..(n - 1), &(rem(n, &1) == 0))

  @doc """
  Primefactors
  """
  def primefactors(n), do: primefactors(n, 2, []) |> Enum.uniq()

  def primefactors(n, n, factors), do: [n | factors]
  def primefactors(_n, divisor, factors) when divisor == 1, do: factors

  def primefactors(n, divisor, factors) when rem(n, divisor) == 0,
    do: primefactors(div(n, divisor), divisor, [divisor | factors])

  def primefactors(n, divisor, factors), do: primefactors(n, divisor + 1, factors)

  @doc """
  Fibonacci
  """
  def fibonacci(), do: Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
end
