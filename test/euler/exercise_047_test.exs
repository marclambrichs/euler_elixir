defmodule Euler.Exercise_047_test do
  use ExUnit.Case

  import Euler.Exercise_047

  describe "solution/1" do
    test "returns first four consecutive integers to have four distinct prime factors each" do
      assert [134_046, 134_045, 134_044, 134_043] = solution()
    end
  end
end
