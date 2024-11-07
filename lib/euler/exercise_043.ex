defmodule Euler.Exercise_043 do
  @moduledoc """
  Sub-string Divisibility
  """

  import Euler.Globals

  def solution() do
    permutations([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    |> Enum.map(&{value(&1), partitions(tl(&1))})
    |> Enum.map(fn {x, list} -> {x, Enum.map(list, &value/1)} end)
    |> Enum.map(fn {x, list} -> {x, Enum.zip(list, n_primes(10))} end)
    |> Enum.filter(fn {_x, list} -> Enum.all?(list, fn {a, b} -> rem(a, b) == 0 end) end)
    |> Enum.reduce(0, fn {x, _list}, acc -> acc + x end)
  end

  def partitions([_h1 | [_h2 | []]]), do: []
  def partitions([_h | t] = list), do: [Enum.slice(list, 0, 3)] ++ partitions(t)

  def value(list), do: Enum.reduce(list, 0, fn nr, acc -> nr + 10 * acc end)
end
