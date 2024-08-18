defmodule Euler.Exercise_16_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_016.solution() == 1366)
  end
end
