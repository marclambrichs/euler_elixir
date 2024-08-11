defmodule Euler.Exercise_009_test do
  use ExUnit.Case

  describe "solution/1" do
    test "returns product of pythagorean triplet for which sum = 1000",
      do: assert(Euler.Exercise_009.solution(1000) == 31_875_000)
  end

  describe "find_pair/1" do
    test "finds pythagorean triplet for which sum = 1000",
      do: assert(Euler.Exercise_009.find_pair(1000) == [{200, 375, 425}])
  end
end
