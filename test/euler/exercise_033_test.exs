defmodule Euler.Exercise_033_test do
  use ExUnit.Case

  alias Euler.Exercise_033

  describe "solution/1" do
    test "returns product of curious fractions" do
      assert 0.01 = Exercise_033.solution()
    end
  end
end
