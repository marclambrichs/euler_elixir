defmodule Euler.Exercise_063_test do
  use ExUnit.Case

  import Euler.Exercise_063

  describe "solutions/1" do
    test "returns n-digit positive integers which are also an n-th power" do
      assert 49 = solution()
    end
  end
end
