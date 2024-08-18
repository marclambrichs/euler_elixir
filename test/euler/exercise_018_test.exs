defmodule Euler.Exercise_18_test do
  use ExUnit.Case

  alias Euler.Exercise_018

  describe "solution/1" do
    test "finds correct solution for test",
      do: assert(Exercise_018.solution(Exercise_018.test()) == 23)

    test "finds correct solution for grid",
      do: assert(Exercise_018.solution() == 1074)
  end
end
