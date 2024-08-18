defmodule Euler.Exercise_20_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_020.solution() == 648)
  end
end
