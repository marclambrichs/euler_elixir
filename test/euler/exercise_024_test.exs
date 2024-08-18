defmodule Euler.Exercise_24_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_024.solution() == 2_783_915_460)
  end
end
