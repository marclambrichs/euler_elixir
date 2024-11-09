defmodule Euler.Exercise_049_test do
  use ExUnit.Case

  import Euler.Exercise_049

  describe "solution/1" do
    test "returns 4-digit primes, increasing with 3330" do
      assert [296_962_999_629, 148_748_178_147] = solution()
    end
  end
end
