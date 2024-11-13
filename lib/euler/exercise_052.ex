defmodule Euler.Exercise_052 do
  @moduledoc """
  Permuted Multiples
  """
  alias Euler.Globals

  def solution() do
    Enum.find(
      Stream.iterate(10, &(&1 + 1)),
      fn x ->
        with digits <- digits(x),
             perms <-
               Globals.permutations(digits)
               |> Enum.map(&Enum.join(&1))
               |> Enum.map(&String.to_integer(&1)),
             products <- Enum.map(2..6, &(&1 * x)) do
          Enum.all?(products, fn x -> Enum.member?(perms, x) end)
        end
      end
    )
  end

  def digits(n) when is_number(n) do
    Integer.digits(n) |> Enum.sort() |> Enum.uniq()
  end
end
