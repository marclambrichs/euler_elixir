defmodule Euler.Exercise_060_test do
  use ExUnit.Case

  import Euler.Exercise_060

  describe "solutions/1" do
    @tag :skip
    test "returns lowest set of 5 primes" do
      assert [13, 5197, 5701, 6733, 8389] = solution(5)
    end
  end
end
