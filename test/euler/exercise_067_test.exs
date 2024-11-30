defmodule Euler.Exercise_067_test do
  use ExUnit.Case

  import Euler.Exercise_067

  describe "solutions/1" do
    test "returns maximum total" do
      assert 7273 = solution()
    end
  end
end
