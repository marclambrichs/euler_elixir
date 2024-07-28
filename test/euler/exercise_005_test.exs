defmodule Euler.Exercise_005_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds 2520 is smallest number divisible by 1..10" do
      assert(Euler.Exercise_005.solution(10) == 2520)

      answers =
        1..10
        |> Enum.map(&rem(2520, &1))
        |> Enum.uniq()

      assert answers |> length() == 1
      assert answers |> Enum.fetch!(0) == 0
    end

    test "finds 232792560 is smallest number divisible by 1..20",
      do: assert(Euler.Exercise_005.solution() == 232_792_560)
  end

  describe "power/2" do
    test "finds max power of 2 <= 10 is 8" do
      assert Euler.Exercise_005.power(10, 2) == 8
    end
  end
end
