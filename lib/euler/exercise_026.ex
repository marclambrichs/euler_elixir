defmodule Euler.Exercise_026 do
  @moduledoc """
  A unit fraction contains 1 in the numerator.
  Where 0.1(6) means 0.166666... and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit
  recurring cycle (1/7 = 0.(142857)).
  Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
  """

  # @spec solution(non_neg_integer()) :: non_neg_integer()
  def solution(limit \\ 1_000) do
    2..(limit - 1)
    |> Enum.map(&(long_division(1, &1) |> length()))
    |> Enum.with_index(2)
    |> Enum.max_by(&elem(&1, 0))
  end

  def long_division(dividend, divisor) when divisor > dividend,
    do: long_division(10 * dividend, divisor)

  def long_division(dividend, divisor), do: long_division(dividend, divisor, [])

  defp long_division(dividend, divisor, fraction) when divisor > dividend,
    do: long_division(dividend * 10, divisor, fraction)

  defp long_division(dividend, divisor, fraction) do
    with quotient <- div(dividend, divisor),
         remainder <- rem(dividend, divisor),
         false <- Enum.member?(fraction, {quotient, remainder}) do
      if remainder == 0 do
        fraction ++ [{quotient, remainder}]
      else
        long_division(remainder, divisor, fraction ++ [{quotient, remainder}])
      end
    else
      true -> fraction
    end
  end
end
