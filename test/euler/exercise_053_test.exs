defmodule Euler.Exercise_053_test do
  use ExUnit.Case

  import Euler.Exercise_053

  describe "solution/1" do
    test "returns sum of combinatoris greater than 1_000_000" do
      assert 4075 = solution()
    end
  end
end
