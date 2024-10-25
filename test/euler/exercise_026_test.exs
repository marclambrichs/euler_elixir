defmodule Euler.Exercise_026_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds tuple {length, divisor} for longest length of tail for divisor",
      do: assert(Euler.Exercise_026.solution() == {884, 983})
  end

  describe "long_division/2" do
    test "returns tuples {quotient, remainder} for divisor 3",
      do: assert(Euler.Exercise_026.long_division(1, 3) == [{3, 1}])

    test "returns tuples {quotient, remainder} for divisor 7",
      do:
        assert(
          Euler.Exercise_026.long_division(1, 7) == [
            {1, 3},
            {4, 2},
            {2, 6},
            {8, 4},
            {5, 5},
            {7, 1}
          ]
        )
  end
end
