defmodule Euler.Exercise_053 do
  @moduledoc """
  Combinatoric Selections
  """
  alias Euler.Globals

  def solution() do
    for n <- 1..100, r <- 1..100 do
      if Globals.over(n, r) > 1_000_000, do: 1, else: 0
    end
    |> Enum.sum()
  end
end
