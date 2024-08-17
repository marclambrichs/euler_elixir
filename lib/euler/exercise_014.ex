defmodule Euler.Exercise_014 do
  @moduledoc """
  The following iterative sequence is defined for the set of positive integers:
  n -> n / 2  (n is even)
  n -> 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:
  13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
  Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?
  """
  require Integer

  def solution(start \\ 999_999) do
    2..start
    |> Enum.map(&collatz(&1))
    |> Enum.map(&List.flatten/1)
    |> Enum.max_by(&length/1)
    |> List.first()
  end

  def collatz(1), do: 1
  def collatz(n) when Integer.is_even(n), do: [n, collatz(div(n, 2))]
  def collatz(n), do: [n, collatz(3 * n + 1)]
end
