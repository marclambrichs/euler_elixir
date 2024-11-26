defmodule Euler.Exercise_062 do
  @moduledoc """
  Cubic Permutations
  Find the smallest cube for which exactly five permutations of its digits are cube.
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    Stream.map(1..10_000, &cube/1)
    |> Stream.map(&{Integer.digits(&1) |> Enum.sort(:desc) |> Enum.join(""), &1})
    |> Enum.flat_map_reduce(%{}, fn {key, value} = x, acc ->
      case Map.get(acc, key) do
        nil -> {[x], Map.put(acc, key, {1, value})}
        {4, first} -> {:halt, first}
        {x, first} -> {[x], Map.put(acc, key, {x + 1, first})}
      end
    end)
    |> then(&elem(&1, 1))
  end

  def cube(n), do: n * n * n
end
