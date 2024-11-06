defmodule Euler.Exercise_042_test do
  use ExUnit.Case

  import Euler.Exercise_042

  describe "solution/1" do
    test "returns sum of words which word value is triangle" do
      assert 162 = solution()
    end
  end

  describe "triangle_nrs/0" do
    test "returns indefinite list of triangle nrs" do
      assert [1, 3, 6, 10, 15, 21, 28, 36, 45, 55] = triangle_nrs() |> Enum.take(10)
    end
  end
end
