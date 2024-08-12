defmodule Euler.Exercise_12_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds first triangle to have over 5 divisors",
      do: assert(Euler.Exercise_012.brute_force(5) == [{28, 6}])

    # @tag timeout: :infinity
    @tag :skip
    test "finds first triangle to have over 500 divisors",
      do: assert(Euler.Exercise_012.brute_force() == [{76_576_500, 576}])
  end
end
