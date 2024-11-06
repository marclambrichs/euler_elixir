defmodule Euler.Exercise_042 do
  @moduledoc """
  Coded Triangle Numbers

  """

  def solution() do
    alphabet = alphabet()

    File.read!("priv/files/0042_words.txt")
    |> String.split(["\"", "\",\""])
    |> Enum.filter(fn x -> word_value(alphabet, x) |> is_triangle?() end)
    |> Enum.count()
  end

  def alphabet() do
    for n <- ?A..?Z do
      <<n::utf8>>
    end
    |> Enum.with_index(1)
    |> Enum.into(%{})
  end

  def word_value(alphabet, word),
    do:
      String.codepoints(word)
      |> Enum.reduce(0, fn char, acc -> acc + Map.fetch!(alphabet, char) end)

  def triangle_nrs(), do: Stream.iterate(1, &(&1 + 1)) |> Stream.map(&div(&1 * (&1 + 1), 2))

  def is_triangle?(nr), do: triangle_nrs() |> Enum.take_while(&(&1 <= nr)) |> List.last() == nr
end
