defmodule Euler.Exercise_055 do
  @moduledoc """
  Lychrel Numbers
  """

  def solution() do
    1..10000
    |> Enum.filter(fn x -> is_lychrel_number?(x) != false end)
    |> Enum.count()
  end

  def is_lychrel_number?(n) when is_integer(n) do
    Enum.reduce_while(1..49, n + reverse(n), fn _x, acc ->
      if is_palindrome?(acc) do
        {:halt, false}
      else
        {:cont, acc + reverse(acc)}
      end
    end)
  end

  def is_palindrome?(nr) when is_integer(nr), do: is_palindrome?(Integer.to_charlist(nr))

  def is_palindrome?(nr) when is_list(nr) do
    nr == Enum.reverse(nr)
  end

  def reverse(nr) when is_integer(nr),
    do: Integer.digits(nr) |> Enum.reverse() |> Enum.join() |> String.to_integer()
end
