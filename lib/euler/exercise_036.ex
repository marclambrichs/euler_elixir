defmodule Euler.Exercise_036 do
  @moduledoc """
  The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

  Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
  """
  def solution(n \\ 1_000_000) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.take_while(&(&1 < n))
    |> Stream.filter(fn x ->
      is_palindrome?(x) and is_palindrome?(:erlang.integer_to_binary(x, 2))
    end)
    |> Enum.sum()
  end

  def is_palindrome?(nr) when is_integer(nr), do: is_palindrome?(Integer.to_charlist(nr))

  def is_palindrome?(nr) when is_list(nr) do
    nr == Enum.reverse(nr)
  end

  def is_palindrome?(nr) when is_binary(nr) do
    nr == String.reverse(nr)
  end
end
