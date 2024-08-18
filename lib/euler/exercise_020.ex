defmodule Euler.Exercise_020 do
  @moduledoc """
  Factorial digit sum

  Find the sum of digits in the number 100!
  """

  import Euler.Globals

  def solution() do
    factorial(100)
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
