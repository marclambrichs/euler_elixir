defmodule Euler.Exercise_059_test do
  use ExUnit.Case

  import Euler.Exercise_059

  describe "solution/1" do
    test "returns sum of ascii values in original text" do
      assert 129_448 = solution()
    end
  end
end
