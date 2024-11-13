defmodule Euler.Exercise_052_test do
  use ExUnit.Case

  import Euler.Exercise_052

  describe "solution/1" do
    test "returns smallest integer x, products containing the same numbers" do
      assert 142_857 = solution()
    end
  end
end
