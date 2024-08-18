defmodule Euler.Exercise_15_test do
  use ExUnit.Case

  describe "solution/1" do
    test "equals solution_2/1",
      do: assert(Euler.Exercise_015.solution() == Euler.Exercise_015.solution_2())

    test "finds correct solution",
      do: assert(Euler.Exercise_015.solution() == 137_846_528_820)
  end
end
