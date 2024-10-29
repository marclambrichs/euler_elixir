defmodule Euler.Exercise_031_test do
  use ExUnit.Case

  alias Euler.Exercise_031

  describe "solution/1" do
    test "count number of different ways to split up £2" do
      {time, result} = Exercise_031.solution()
      IO.inspect(time)
      assert result == 73682
    end
  end
end
