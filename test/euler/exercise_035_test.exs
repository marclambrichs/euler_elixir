defmodule Euler.Exercise_035_test do
  use ExUnit.Case

  alias Euler.Exercise_035

  describe "solution/1" do
    test "count circular primes" do
      assert 13 = Exercise_035.solution(100)
    end
  end
end
