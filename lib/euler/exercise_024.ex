defmodule Euler.Exercise_024 do
  @moduledoc """
  Lexicographic Permutations

  What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
  """

  import Euler.Globals

  def solution(list \\ [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) do
    list
    |> permutations()
    |> Enum.fetch!(999_999)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.join()
    |> String.to_integer()
  end
end
