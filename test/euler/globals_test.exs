defmodule Euler.GlobalsTest do
  use ExUnit.Case

  describe "factioral" do
    test "fac/1 gets the save value as factorial/1",
      do: assert(Euler.Globals.fac(20) == Euler.Globals.factorial(20))
  end
end
