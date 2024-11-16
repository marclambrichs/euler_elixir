defmodule Euler.Exercise_054 do
  @moduledoc """
  Poker Hands
  """
  alias Euler.Poker

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    from_file("priv/files/0054_poker.txt")
    |> Stream.map(fn {hand1, hand2} -> {Poker.read_hand(hand1), Poker.read_hand(hand2)} end)
    |> Stream.map(fn {hand1, hand2} -> Poker.compare_hands(hand1, hand2) end)
    |> Stream.filter(&(&1 == 1))
    |> Enum.sum()
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(&Enum.split(&1, 5))
  end
end

defmodule Euler.Poker do
  @type card() :: %{value: 2..14, suit: String.t()}

  @split_pot 0
  @player_1_wins 1
  @player_2_wins 2

  @scores %{
    four_of_a_kind: 5,
    full_house: 4,
    three_of_a_kind: 3,
    two_pairs: 2,
    one_pair: 1
  }

  @values for x <- 0..12, into: %{}, do: {String.at("23456789TJQKA", x), x + 2}

  @doc """
  Read cards in hand
  """
  @spec read_hand([String.t()]) :: [card()]
  def read_hand(cards) do
    Enum.map(cards, &read_card/1) |> Enum.sort_by(&Map.get(@values, &1["value"]), :desc)
  end

  defp read_card(card) when is_binary(card),
    do: Regex.named_captures(~r/(?<value>[2-9]|T|J|Q|K|A)(?<suit>[CDHS])/, card)

  @doc """
  Compare hands with functions - in order - flush, straight, pairs and high_cards.
  Determines winner or split_pot.
  """
  @spec compare_hands([card()], [card()]) :: 0..2
  def compare_hands(hand1, hand2) do
    funcs = [:flush, :straight, :pairs, :high_cards]

    Enum.reduce_while(funcs, [hand1, hand2], fn func, [h1, h2] ->
      case [apply(__MODULE__, func, [h1]), apply(__MODULE__, func, [h2])] do
        [{a, _}, {b, _}] when a < b -> {:halt, @player_2_wins}
        [{a, _}, {b, _}] when a > b -> {:halt, @player_1_wins}
        [{a, res1}, {b, res2}] when a == b -> {:cont, [res1, res2]}
        [a, b] when a < b -> {:halt, @player_2_wins}
        [a, b] when a > b -> {:halt, @player_1_wins}
        [a, b] when a == b -> {:halt, @split_pot}
      end
    end)
  end

  @doc """
  Compare card suits
  """
  @spec flush([card()]) :: {0 | 5, [card()]}
  def flush(hand) do
    group_by_suits(hand)
    |> Enum.map(&length(elem(&1, 1)))
    |> Enum.sort(:desc)
    |> case do
      [5] -> {1, hand}
      _ -> {0, hand}
    end
  end

  defp group_by_suits(hand), do: hand |> Enum.group_by(&Map.get(&1, "suit"))

  @doc """
  Compare card values
  """
  @spec straight([card()]) :: {0 | 4, [card()]}
  def straight(hand) do
    Enum.reduce_while(hand, true, fn x, acc ->
      if acc == true or Map.get(@values, x["value"]) == acc - 1 do
        {:cont, Map.get(@values, x["value"])}
      else
        {:halt, false}
      end
    end)
    |> case do
      false -> {0, hand}
      _ -> {1, hand}
    end
  end

  defp group_by_pairs(hand), do: hand |> Enum.group_by(&Map.get(&1, "value"))

  @doc """
  Returns tuples like {score, %{value => [card]}}

  ## Example
    iex(511)> ["3H", "3S", "3D", "JD", "JH"] |> Euler.Poker.read_hand |> Euler.Poker.pairs
    {6,
      %{
        "3" => [
          %{"suit" => "H", "value" => "3"},
          %{"suit" => "S", "value" => "3"},
          %{"suit" => "D", "value" => "3"}
        ],
        "J" => [%{"suit" => "D", "value" => "J"}, %{"suit" => "H", "value" => "J"}]
    }}
  """
  @spec pairs([card()]) :: {0..5, map()}
  def pairs(hand) do
    pairs = group_by_pairs(hand)

    Enum.map(pairs, &length(elem(&1, 1)))
    |> Enum.sort(:desc)
    |> case do
      [2, 1, 1, 1] -> {@scores[:one_pair], pairs}
      [2, 2, 1] -> {@scores[:two_pairs], pairs}
      [3, 2] -> {@scores[:full_house], pairs}
      [3, 1, 1] -> {@scores[:three_of_a_kind], pairs}
      [4, 1] -> {@scores[:four_of_a_kind], pairs}
      [1, 1, 1, 1, 1] -> {0, pairs}
    end
  end

  @doc """
  Returns list of values based on output of pairs/1

  ## Example
    iex(516)> ["3H", "3S", "3D", "JD", "JH"] |> Euler.Poker.read_hand |> Euler.Poker.pairs |> then(&Euler.Poker.high_cards(elem(&1, 1)))
    [3, 11]
  """
  @spec high_cards(map()) :: [integer()]
  def high_cards(cards) when is_map(cards),
    do:
      Enum.to_list(cards)
      |> Enum.sort_by(&{length(elem(&1, 1)), Map.get(@values, elem(&1, 0))}, :desc)
      |> Enum.map(&Map.get(@values, elem(&1, 0)))
end
