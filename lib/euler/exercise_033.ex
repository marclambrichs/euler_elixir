defmodule Euler.Exercise_033 do
  @moduledoc """
  The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that
  49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

  We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

  There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the
  numerator and denominator.

  If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
  """
  def solution() do
    Stream.flat_map(11..99, fn i -> Stream.flat_map(11..99, fn j -> [{i, j}] end) end)
    |> Stream.filter(&(curious?(&1) == true))
    |> Enum.reduce(1, fn {x, y}, acc -> acc * x / y end)
  end

  defp curious?({a, b}) when a == b, do: false
  defp curious?({a, b}) when a > b, do: false
  defp curious?({_a, b}) when rem(b, 10) == 0, do: false

  defp curious?({a, b}) do
    a / b == simplify(Integer.digits(a), Integer.digits(b)) |> then(fn [x, y] -> x / y end)
  end

  defp simplify([h1 | t1], [h2 | t2]) when h1 == h2, do: t1 ++ t2
  defp simplify([h1 | t1], [h2 | t2]) when [h1] == t2, do: t1 ++ [h2]
  defp simplify([h1 | t1], [h2 | t2]) when t1 == [h2], do: [h1] ++ t2
  defp simplify([h1 | t1], [h2 | t2]) when t1 == t2, do: [h1, h2]
  defp simplify(_, _), do: [0, 1]
end
