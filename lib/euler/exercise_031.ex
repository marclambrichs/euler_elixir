defmodule Euler.Exercise_031 do
  @moduledoc """
  In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
  1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), £2 (200p).

  It is possible to make £2 in the following way:
  1 * £1 + 1 * 50p + 2 * 20p + 1 * 5p + 1 * 2p + 3 * 1p

  How many different ways can £2 be made using any number of coins?
  """

  @coins [1, 2, 5, 10, 20, 50, 100, 200]

  def solution(sum \\ 200) do
    :timer.tc(__MODULE__, :count, [sum, sum])
  end

  def count(left, _start) when left < 0, do: 0
  def count(left, _start) when left == 0, do: 1

  def count(left, start) do
    List.foldl(Enum.filter(@coins, &(&1 <= start)), 0, fn x, acc ->
      acc + count(left - x, x)
    end)
  end
end
