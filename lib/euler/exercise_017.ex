defmodule Euler.Exercise_017 do
  @moduledoc """
  Number letter counts

  If the numbers 1 to 5 are written out in words; one, two, three, four, five, then there
  are 19 letters used in total.

  If all the numbers from 1 to 1000 inclusive were written out in words, how many letters would
  be used?
  """
  @singles [
    {1, "one"},
    {2, "two"},
    {3, "three"},
    {4, "four"},
    {5, "five"},
    {6, "six"},
    {7, "seven"},
    {8, "eight"},
    {9, "nine"},
    {10, "ten"},
    {11, "eleven"},
    {12, "twelve"},
    {13, "thirteen"},
    {14, "fourteen"},
    {15, "fifteen"},
    {16, "sixteen"},
    {17, "seventeen"},
    {18, "eighteen"},
    {19, "nineteen"}
  ]
  @tens [
    {20, "twenty"},
    {30, "thirty"},
    {40, "fourty"},
    {50, "fifty"},
    {60, "sixty"},
    {70, "seventy"},
    {80, "eighty"},
    {90, "ninety"}
  ]
  @hundreds [{100, "hundred"}]
  @thousands [{1000, "thousand"}]

  def solution() do
    1..1000
    |> Enum.map(&translate/1)
    |> Enum.reduce(0, fn x, acc -> acc + String.length(x) end)
  end

  def find(list, n), do: list |> Enum.find_value(fn {nr, word} -> if n == nr, do: word end)

  def translate(n) when n == 1000, do: find(@singles, div(n, 1000)) <> find(@thousands, n)

  def translate(n) when n >= 100 do
    str = translate(div(n, 100)) <> find(@hundreds, 100)
    if rem(n, 100) > 0, do: str <> "and" <> translate(rem(n, 100)), else: str
  end

  def translate(n) when n >= 20, do: find(@tens, n - rem(n, 10)) <> translate(rem(n, 10))

  def translate(n) when n > 0, do: find(@singles, n)
  def translate(_), do: ""
end
