defmodule Euler.Exercise_21_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_021.solution() == 31626)
  end
end
