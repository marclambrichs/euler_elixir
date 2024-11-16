defmodule Euler.Exercise_054_test do
  use ExUnit.Case

  import Euler.Exercise_054

  describe "solution/1" do
    test "returns number of times player 1 wins" do
      assert 376 = solution()
    end
  end

  describe "compare_hands/1" do
    test "test 1" do
      assert 2 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["5H", "5C", "6S", "7S", "KD"]),
                 Euler.Poker.read_hand(["2C", "3S", "8S", "8D", "TD"])
               )
    end

    test "test 2" do
      assert 1 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["5D", "8C", "9S", "JS", "AC"]),
                 Euler.Poker.read_hand(["2C", "5C", "7D", "8S", "QH"])
               )
    end

    test "test 3" do
      assert 2 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["2D", "9C", "AS", "AH", "AC"]),
                 Euler.Poker.read_hand(["3D", "6D", "7D", "TD", "QD"])
               )
    end

    test "test 4" do
      assert 1 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["4D", "6S", "9H", "QH", "QC"]),
                 Euler.Poker.read_hand(["3D", "6D", "7H", "QD", "QS"])
               )
    end

    test "test 5" do
      assert 1 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["2H", "2D", "4C", "4D", "4S"]),
                 Euler.Poker.read_hand(["3C", "3D", "3S", "9S", "9D"])
               )
    end

    test "test 6" do
      assert 0 ==
               Euler.Poker.compare_hands(
                 Euler.Poker.read_hand(["AH", "KH", "QH", "JH", "TH"]),
                 Euler.Poker.read_hand(["AC", "KC", "QC", "JC", "TC"])
               )
    end
  end

  describe "pairs/1" do
    test "returns 1 if hand has a pair" do
      assert {1,
              %{
                "T" => [
                  %{"suit" => "D", "value" => "T"},
                  %{"suit" => "H", "value" => "T"}
                ],
                "J" => [%{"suit" => "H", "value" => "J"}],
                "9" => [%{"suit" => "S", "value" => "9"}],
                "8" => [%{"suit" => "S", "value" => "8"}]
              }} ==
               ["TD", "TH", "JH", "9S", "8S"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.pairs()
    end

    test "returns 2 if hand is a two pairs" do
      assert {2,
              %{
                "T" => [
                  %{"suit" => "D", "value" => "T"},
                  %{"suit" => "H", "value" => "T"}
                ],
                "J" => [%{"suit" => "H", "value" => "J"}, %{"suit" => "S", "value" => "J"}],
                "9" => [%{"suit" => "S", "value" => "9"}]
              }} ==
               ["TD", "TH", "JH", "JS", "9S"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.pairs()
    end

    test "returns 3 if hand is a three of a kind" do
      assert {3,
              %{
                "T" => [
                  %{"suit" => "D", "value" => "T"},
                  %{"suit" => "H", "value" => "T"},
                  %{"suit" => "C", "value" => "T"}
                ],
                "J" => [%{"suit" => "S", "value" => "J"}],
                "9" => [%{"suit" => "S", "value" => "9"}]
              }} ==
               ["TD", "TH", "TC", "JS", "9S"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.pairs()
    end

    test "returns 5 if hand is a four of a kind" do
      assert {5,
              %{
                "T" => [
                  %{"suit" => "D", "value" => "T"},
                  %{"suit" => "H", "value" => "T"},
                  %{"suit" => "C", "value" => "T"},
                  %{"suit" => "S", "value" => "T"}
                ],
                "J" => [%{"suit" => "S", "value" => "J"}]
              }} ==
               ["TD", "TH", "TC", "TS", "JS"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.pairs()
    end
  end

  describe "straight/1" do
    test "returns 4 if hand is straight" do
      assert {1, _} =
               ["2H", "3S", "4C", "5D", "6H"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.straight()

      assert {1, _} =
               ["TH", "JS", "QC", "KD", "AH"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.straight()

      assert {1, _} =
               ["JH", "TS", "QC", "KD", "AH"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.straight()
    end

    test "returns 0 if hand is not a straight" do
      assert {0, _} =
               ["2H", "3S", "4C", "5D", "7H"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.straight()
    end
  end

  describe "flush/1" do
    test "returns 5 if hand is a flush" do
      assert {1, _} =
               ["TH", "3H", "8H", "5H", "JH"] |> Euler.Poker.read_hand() |> Euler.Poker.flush()
    end

    test "returns 0 if hand is not a flush" do
      assert {0, _} =
               ["TH", "3H", "8H", "5H", "JS"] |> Euler.Poker.read_hand() |> Euler.Poker.flush()
    end
  end

  describe "high_cards/1" do
    test "returns cards ordered from a map" do
      assert [11, 14] ==
               ["AH", "JH", "AH", "JC", "JS"]
               |> Euler.Poker.read_hand()
               |> Euler.Poker.pairs()
               |> then(&Euler.Poker.high_cards(elem(&1, 1)))
    end
  end
end
