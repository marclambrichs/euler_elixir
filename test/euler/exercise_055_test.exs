defmodule Euler.Exercise_055_test do
  use ExUnit.Case

  import Euler.Exercise_055

  describe "solution/1" do
    test "returns nr of lychrel numbers below 10_000" do
      assert 249 = solution()
    end
  end
end
