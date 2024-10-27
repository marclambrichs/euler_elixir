defmodule Euler.Exercise_029_test do
  use ExUnit.Case

  describe "solution/1" do
    test "counts unique values for a ** b for upper limit 5",
      do: assert(Euler.Exercise_029.solution(5) == 15)
  end
end
