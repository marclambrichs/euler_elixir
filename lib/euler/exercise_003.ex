defmodule Euler.Exercise_003 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475153?
  """

  import Euler.Globals

  @spec solution(integer()) :: list()
  def solution(n \\ 600_851_475_143) do
    primefactors(n) |> Enum.max()
  end

  # Alternative
  def calculate_factors(_n, divisor, factors, limit) when divisor > limit, do: factors

  def calculate_factors(n, 2, factors, limit) when rem(n, 2) == 0,
    do: calculate_factors(div(n, 2), 2, [2 | factors], limit)

  def calculate_factors(n, divisor, factors, limit) when rem(n, divisor) == 0 do
    calculate_factors(div(n, divisor), divisor, [divisor | factors], limit)
  end

  def calculate_factors(n, divisor, factors, limit) when rem(n, divisor) != 0 do
    calculate_factors(n, divisor + 1, factors, limit)
  end
end
