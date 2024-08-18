defmodule Euler.Exercise_17_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_017.solution() == 21224)
  end
end
