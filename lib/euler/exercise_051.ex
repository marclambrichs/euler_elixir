defmodule Euler.Exercise_051 do
  @moduledoc """
  Prime Digit Replacements

  """
  alias Euler.Globals

  def solution() do
    for x <- Globals.primes(50000, 500_000), candidates <- candidates(Integer.digits(x)) do
      Enum.flat_map(candidates, &replace(&1, Integer.digits(x)))
      |> Enum.filter(&Globals.is_prime?/1)
    end
    |> Enum.filter(&length(&1) >= 8)
    |> Enum.sort()
  end

  def candidates(list) do
    Enum.group_by(list, & &1)
    |> Enum.filter(&(length(elem(&1, 1)) > 1))
    |> Enum.map(&[elem(&1, 0)])
  end

  def replace(to_replace, list), do: Enum.map(0..9, &replace_with(&1, list, to_replace))

  def replace_with(new, list, to_replace) do
    Enum.map(list, &if(&1 == to_replace, do: new, else: &1))
    |> then(&Integer.undigits(&1))
  end
end
