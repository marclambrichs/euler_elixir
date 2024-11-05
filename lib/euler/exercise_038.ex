defmodule Euler.Exercise_038 do
  @moduledoc """
  What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with
  (1, 2, ...., n) where n > 1?
  """

  def solution() do
    Stream.map(9..9999, &generate_number(&1))
    |> Stream.filter(&(elem(&1, 1) != nil and pandigital?(elem(&1, 1))))
    |> Enum.max_by(&List.to_integer(elem(&1, 1)))
  end

  def generate_number(start), do: generate_number(start, ~c"", 1)
  def generate_number(start, acc, _times) when length(acc) == 9, do: {start, acc}
  def generate_number(start, acc, _times) when length(acc) >= 10, do: {start, nil}

  def generate_number(start, acc, times) do
    generate_number(start, acc ++ Integer.to_charlist(start * times), times + 1)
  end

  def pandigital?(list) when is_list(list) do
    List.to_integer(list) |> pandigital?()
  end

  def pandigital?(n) when is_integer(n) do
    Integer.digits(n)
    |> then(fn x -> Enum.sort(x) == 1..Enum.max(x) |> Enum.to_list() end)
  end
end
