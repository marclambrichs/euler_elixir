defmodule Euler.Exercise_032_test do
  use ExUnit.Case

  alias Euler.Exercise_032

  describe "solution/1" do
    test "sum pandigital products" do
      assert 45228 = Exercise_032.solution()
    end
  end
end
