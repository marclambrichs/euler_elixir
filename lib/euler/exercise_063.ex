defmodule Euler.Exercise_063 do
  @moduledoc """
  Powerful Digit Counts

  The 5-digit number, 16807 = 7 ** 5, is also a fifth power. Similarly, the 9-digit number, 134217728 = 8 ** 9, is a ninth power.

  How many n-digit positive integers exist which are also an nth power?
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    1..30
    |> Stream.map(&generate(&1))
    |> Stream.take_while(&(&1 != []))
    |> Enum.to_list()
    |> Enum.map(&Enum.count(&1))
    |> Enum.sum()
  end

  def generate(n) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(&{n, &1 ** n})
    |> Stream.take_while(fn {_x, y} -> Integer.digits(y) |> length() <= n end)
    |> Enum.filter(fn {x, y} -> Integer.digits(y) |> length() == x end)
  end
end
