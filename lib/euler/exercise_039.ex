defmodule Euler.Exercise_039 do
  @moduledoc """
  If p is the perimeter of a right angle triangle, {a, b, c}, with integral length sides,
  there are exactly three solutions for p = 120.

  {20, 48, 52}, {24.45,51}, {30, 40, 50}

  For which value of p <= 1000, is the number of solutions maximised?
  """

  def solution(p \\ 1000) do
    Enum.max_by(3..p, fn x -> triangles(x) |> Enum.to_list() |> length() end)
  end

  def triangles(n) do
    Stream.flat_map(3..n, fn a ->
      Stream.flat_map(3..n, fn b ->
        case a < b and pythagorean?(a, b, n - a - b) do
          true -> [{a, b, n - a - b}]
          false -> []
        end
      end)
    end)
  end

  def pythagorean?(a, b, c), do: a ** 2 + b ** 2 == c ** 2
end
