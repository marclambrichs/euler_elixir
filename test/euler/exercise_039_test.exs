defmodule Euler.Exercise_039_test do
  use ExUnit.Case

  import Euler.Exercise_039

  describe "solution/1" do
    test "returns max number of pythagorean triplets" do
      assert 120 = solution(150)
    end
  end

  describe "triangles/1" do
    test "returns right number of pythagorean triplets" do
      assert [{20, 48, 52}, {24, 45, 51}, {30, 40, 50}] = triangles(120) |> Enum.to_list()
    end
  end
end
