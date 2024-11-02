defmodule Euler.Exercise_037_test do
  use ExUnit.Case

  alias Euler.Exercise_037

  describe "solution/1" do
    test "return sum of 11 trunctable primes" do
      assert 8_920 = Exercise_037.solution(14)
    end
  end
end
