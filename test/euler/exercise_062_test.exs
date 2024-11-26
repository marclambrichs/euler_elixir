defmodule Euler.Exercise_062_test do
  use ExUnit.Case

  import Euler.Exercise_062

  describe "solutions/1" do
    test "returns smallest cube for which 5 permutations are also cube" do
      assert 127_035_954_683 = solution()
    end
  end
end
