defmodule Euler.Exercise_067 do
  @moduledoc """
  Maximum Path Sum 1

  By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total
  from top to bottom is 3 + 7 + 4 + 9 = 23.
      3
     7 4
    2 4 6
   8 5 9 3

  Find the maximum total from top to bottom of the triangle given.
  """
  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
    |> Enum.reverse()
  end

  def solution() do
    triangle = from_file("priv/files/0067_triangle.txt")
    calculate(triangle, [])
  end

  def calculate(tree, []) do
    calculate(Enum.drop(tree, 1), max_values(Enum.at(tree, 0)))
  end

  def calculate([], [a]), do: a

  def calculate(tree, acc) do
    calculate(
      Enum.drop(tree, 1),
      max_values(Enum.zip_with(Enum.at(tree, 0), acc, &(&1 + &2)))
    )
  end

  def max_values([a]), do: [a]

  def max_values(row) do
    for i <- 0..(length(row) - 2) do
      max(Enum.at(row, i), Enum.at(row, i + 1))
    end
  end
end
