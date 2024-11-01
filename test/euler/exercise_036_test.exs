defmodule Euler.Exercise_036_test do
  use ExUnit.Case

  alias Euler.Exercise_036

  describe "solution/1" do
    test "return sum of palindromic numbers in base 10 and 2" do
      assert 872_187 = Exercise_036.solution()
    end
  end
end
