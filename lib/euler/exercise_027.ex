defmodule Euler.Exercise_027 do
  @moduledoc """
  Euler discovered the remarkable quadratic formula: n ** 2 + n + 41

  It turns out that the formula will produce 40 primes for the consecutive integer values 0 <= n <= 39.
  However, when n = 40, 40 ** 2 + 40 + 41 is divisible by 41, and certainly when
  n = 41, 41 ** 2 + 41 + 41 is clearly divisible by 41.

  The incredible formula n ** 2 - 79n + 1601 was discovered. which produces 80 primes for the consecutive
  values 0 <= n <= 79.
  The products of the coefficients, -79 and 1601, is -126479.

  Considering quadratics of the form: n ** 2 + a * n + b, where |a| < 1000 and |b| <= 1000

  Find the product of the coefficients, a and b for the quadratic expression that produces the maximum
  number of primes for consecutive values of n, starting with n = 0.
  """
  import Euler.Globals

  @spec solution(non_neg_integer()) :: non_neg_integer()
  def solution(limit \\ 1000) do
    for a <- (-limit + 1)..(limit - 1), b <- -1000..1000 do
      {a, b, quadratic(a, b) |> length()}
    end
    |> Enum.max_by(&abs(elem(&1, 2)))
    |> then(&(elem(&1, 0) * elem(&1, 1)))
  end

  def quadratic(a, b) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(&(&1 ** 2 + a * &1 + b))
    |> Enum.take_while(&is_prime?(&1))
  end
end
