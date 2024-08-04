defmodule Euler.Exercise_002 do
  @moduledoc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with
  1 and 2, the first 10 terms will be
    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, .....
  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """

  import Euler.Globals

  @spec solution(integer()) :: integer()
  def solution(limit \\ 4_000_000) do
    # nicer - and faster: use the globals fibonacci
    fibonacci()
    |> Enum.take_while(&(&1 <= limit))
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.reduce(&(&1 + &2))
  end

  @spec solution_old(integer()) :: integer()
  def solution_old(limit \\ 4_000_000) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(&fib(&1))
    |> Enum.take_while(&(&1 <= limit))
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.reduce(&(&1 + &2))
  end

  defp fib(0), do: 0
  defp fib(1), do: 1
  defp fib(n), do: fib(n - 2) + fib(n - 1)
end
