defmodule Euler.Exercise_22_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_022.solution() == 871_198_282)
  end
end
