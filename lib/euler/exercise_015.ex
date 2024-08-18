defmodule Euler.Exercise_015 do
  @moduledoc """
  Starting in the top left corner of a 2 x 2 grid, and ony being able to move to the right
  and down, there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20 x 20 grid?
  """
  import Euler.Globals

  def solution(n \\ 20) do
    # Use combinatorial: count ways of picking n down movements out of 2n.
    div(prod((n + 1)..(2 * n)), prod(1..n))
  end

  def solution_2(n \\ 20), do: over(2 * n, n)

  # or:
  defp prod(range), do: range |> Enum.reduce(1, fn i, acc -> acc * i end)
end
