defmodule Euler.Exercise_045_test do
  use ExUnit.Case

  import Euler.Exercise_045

  describe "solution/1" do
    test "returns first 3 numbers that are both triangular, pentagonal and hexagonal" do
      assert [1, 40755, 1_533_776_805] = solution()
    end
  end
end
