defmodule Euler.Exercise_040_test do
  use ExUnit.Case

  import Euler.Exercise_040

  describe "solution/1" do
    test "returns champernowne's constant" do
      assert 210 = solution()
    end
  end
end
