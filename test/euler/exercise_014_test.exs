defmodule Euler.Exercise_14_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds longest collatz sequence",
      do: assert(Euler.Exercise_014.solution() == 837_799)
  end
end
