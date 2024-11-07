defmodule Euler.Exercise_046_test do
  use ExUnit.Case

  import Euler.Exercise_046

  describe "solution/1" do
    test "returns smallest odd composite that cannot be written as sum of prime and twice a square" do
      assert [5777] = solution()
    end
  end
end
