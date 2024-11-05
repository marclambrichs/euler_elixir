defmodule Euler.Exercise_038_test do
  use ExUnit.Case

  alias Euler.Exercise_038

  describe "solution/1" do
    test "returns largest pandigital number of 9 digits" do
      assert {9327, ~c"932718654"} = Exercise_038.solution()
    end
  end
end
