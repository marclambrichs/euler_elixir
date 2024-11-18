defmodule Euler.Exercise_058 do
  @moduledoc """
  Spiral Primes

  Look at exercise 28
  """
  alias Euler.Globals

  def solution() do
    Stream.iterate(2, &(&1 + 2))
    |> Stream.flat_map(&replicate(&1, 4))
    |> Stream.scan(1, &(&1 + &2))
    |> Stream.with_index(1)
    |> Stream.transform(0, fn {nr, index}, acc ->
      if acc > 0 and acc / index < 0.1,
        do: {:halt, acc},
        else: {[div(index, 4) * 2 + 1], if(Globals.is_prime?(nr), do: acc + 1, else: acc)}
    end)
    |> Enum.take(-1)
  end

  def replicate(x, n), do: for(_ <- 1..n, do: x)
end
