defmodule Euler.Exercise_043_test do
  use ExUnit.Case

  import Euler.Exercise_043

  describe "solution/1" do
    test "returns pandigital numbers with substring divisibility by prime" do
      assert 16_695_334_890 = solution()
    end
  end
end
