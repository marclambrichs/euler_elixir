defmodule Euler.Exercise_056 do
  @moduledoc """
  Powerful Digit Sum
  """

  def solution() do
    for a <- 99..2//-1 do
      Enum.reduce(99..2//-1, 0, fn b, acc ->
        ds = digital_sum(a ** b)
        if ds > acc, do: ds, else: acc
      end)
    end
    |> Enum.max()
  end

  def digital_sum(n) when is_integer(n) do
    n |> Integer.digits() |> Enum.sum()
  end
end
