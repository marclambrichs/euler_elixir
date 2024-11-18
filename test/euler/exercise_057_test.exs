defmodule Euler.Exercise_057_test do
  use ExUnit.Case

  import Euler.Exercise_057

  describe "solution/1" do
    test "returns square root convergence" do
      assert 153 = solution()
    end
  end
end
