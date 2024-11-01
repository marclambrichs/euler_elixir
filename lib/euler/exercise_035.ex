defmodule Euler.Exercise_035 do
  @moduledoc """
  The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
  There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
  How many circular primes are there below one million?
  """
  import Euler.Globals

  def solution(n \\ 999_999) do
    primes =
      primes_below(n)
      |> Enum.to_list()
      |> MapSet.new()

    circular_primes(primes)
    |> Enum.count()

    #    :timer.tc(__MODULE__, :circular_primes, [primes])
  end

  def circular_primes(primes, acc \\ []) do
    if MapSet.size(primes) != 0 do
      h = Enum.fetch!(primes, 0)
      circulations = circulations(h)

      if Enum.all?(circulations, fn y -> MapSet.member?(primes, y) end) do
        circular_primes(MapSet.difference(primes, MapSet.new(circulations)), circulations ++ acc)
      else
        circular_primes(MapSet.delete(primes, h), acc)
      end
    else
      acc
    end
  end

  def circulations(n) when is_integer(n) do
    length = Integer.to_string(n) |> String.length()
    circulations(length - 1, length - 1, [n])
  end

  def circulations(0, _power, list), do: list |> Enum.uniq()

  def circulations(times, power, [h | _t] = list) do
    circulations(times - 1, power, [rem(h, 10 ** power) * 10 + div(h, 10 ** power)] ++ list)
  end

  @doc """
  Other option for creating circulations
  """
  def circulations2(n) do
    digits = Integer.digits(n)
    all_shifts(digits, length(digits))
  end

  def all_shifts(_list, 0), do: []
  def all_shifts(list, n), do: [list] ++ all_shifts(shift_list(list), n - 1)
  def shift_list([h | t]), do: t ++ [h]
end
