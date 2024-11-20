defmodule Euler.Exercise_059 do
  @moduledoc """
  XOR Decryption
  """
  import Bitwise

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    from_file("priv/files/0059_cipher.txt")
    |> Stream.zip(Stream.cycle([?e, ?x, ?p]))
    |> Stream.map(fn {x, y} -> bxor(x, y) end)
    |> Enum.to_list()
    |> Enum.sum()
  end

  def try() do
    file = from_file("priv/files/0059_cipher.txt")

    for x <- ?a..?z, y <- ?a..?z, z <- ?a..?z do
      Stream.zip(file, Stream.cycle([x, y, z]))
      |> Stream.map(fn {x, y} -> bxor(x, y) end)
      |> Enum.to_list()
      |> then(fn str -> {List.to_string([x, y, z]), List.to_string(str) |> String.split()} end)
    end
    |> Enum.filter(fn {_pwd, words} -> length(words) > 200 end)
  end

  def from_file(file) do
    file
    |> File.stream!()
    #    |> Stream.map(&String.trim/1)
    |> Stream.flat_map(&String.split(&1, ","))
    |> Stream.map(&String.to_integer/1)
  end

  def char_xor("", "", acc), do: acc

  def char_xor(<<a, as::binary>>, <<b, bs::binary>>, acc) do
    char_xor(as, bs, <<acc::binary, bxor(a, b)>>)
  end
end
