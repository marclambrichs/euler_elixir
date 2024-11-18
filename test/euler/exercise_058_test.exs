defmodule Euler.Exercise_058_test do
  use ExUnit.Case

  import Euler.Exercise_058

  describe "solution/1" do
    test "returns side length of spiral" do
      assert [26241] = solution()
    end
  end
end
