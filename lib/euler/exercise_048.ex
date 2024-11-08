defmodule Euler.Exercise_048 do
  @moduledoc """
  Self Powers

  Find the last 10 digits of the series 1 ** 1 + 2 ** 2 + 3 ** 3 + ... + 1000 ** 1000
  """

  def solution(n \\ 1000) do
    Stream.iterate(1, &(&1 + 1))
    |> Enum.reduce_while(0, fn x, acc ->
      if x < n do
        {:cont, acc + x ** x}
      else
        {:halt, acc}
      end
    end)
    |> Integer.to_charlist()
    |> Enum.take(-10)
  end
end
