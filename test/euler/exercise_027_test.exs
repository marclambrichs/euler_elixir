defmodule Euler.Exercise_027_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds max product of coefficients a and b",
      do: assert(Euler.Exercise_027.solution() == -59231)
  end

  describe "quadratic/2" do
    test "returns list of primes for coefficients -3 and 7",
      do: assert(Euler.Exercise_027.quadratic(-3, 7) == [7, 5, 5, 7, 11, 17])
  end
end
