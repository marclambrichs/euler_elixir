defmodule Euler.Exercise_028_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds sum of diagonals of matrix size 3",
      do: assert(Euler.Exercise_028.solution(3) == 25)

    test "finds sum of diagonals of matrix size 5",
      do: assert(Euler.Exercise_028.solution(5) == 101)
  end
end
