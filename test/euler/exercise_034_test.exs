defmodule Euler.Exercise_034_test do
  use ExUnit.Case

  alias Euler.Exercise_034

  describe "solution/1" do
    test "returns sum of curious numbers" do
      assert 40730 = Exercise_034.solution()
    end
  end

  describe "is_curious?/1" do
    test "145 is a curious number" do
      assert Exercise_034.is_curious?(145) == true
    end

    test "40585 is a curious number" do
      assert Exercise_034.is_curious?(40585) == true
    end
  end
end
