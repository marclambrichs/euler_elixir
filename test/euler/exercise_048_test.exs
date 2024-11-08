defmodule Euler.Exercise_048_test do
  use ExUnit.Case

  import Euler.Exercise_048

  describe "solution/1" do
    test "returns last 10 digits of self powered sum" do
      assert ~c"9110846700" = solution()
    end
  end
end
