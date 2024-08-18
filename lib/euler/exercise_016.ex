defmodule Euler.Exercise_016 do
  @moduledoc """
   2 ** 15 is 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
   What is the sum of the digits of the number 2 ** 1000?
  """

  def solution(power \\ 1000) do
    (2 ** power)
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
