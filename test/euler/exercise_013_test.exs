defmodule Euler.Exercise_13_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds first 10 numbers of sum",
      do: assert(Euler.Exercise_013.solution() == 5_537_376_230)
  end
end
