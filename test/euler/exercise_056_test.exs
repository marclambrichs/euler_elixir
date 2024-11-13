defmodule Euler.Exercise_056_test do
  use ExUnit.Case

  import Euler.Exercise_056

  describe "solution/1" do
    test "returns maximal digit sum" do
      assert 972 = solution()
    end
  end
end
