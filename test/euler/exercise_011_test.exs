defmodule Euler.Exercise_011_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds greatest product",
      do: assert(Euler.Exercise_011.solution() == 70_600_674)
  end
end
