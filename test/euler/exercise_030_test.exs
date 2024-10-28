defmodule Euler.Exercise_030_test do
  use ExUnit.Case

  describe "solution/1" do
    test "returns numbers with equal sum of fourth powers",
      do: assert(Euler.Exercise_030.solution(4) == 19316)
  end
end
