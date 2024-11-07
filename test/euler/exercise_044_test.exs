defmodule Euler.Exercise_044_test do
  use ExUnit.Case

  import Euler.Exercise_044

  describe "solution/1" do
    test "returns tuple with {pentagonal_1, pentagonal_2, min(pentagonal_2 - pentagonal_1)}" do
      assert {1_560_090, 7_042_750, 5_482_660} = solution()
    end
  end
end
