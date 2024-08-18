defmodule Euler.Exercise_19_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_019.solution() == 171)
  end
end
