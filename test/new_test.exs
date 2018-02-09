defmodule IntSetNewTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.new/1" do
    property "can accept arbitrary positive integers" do
      check all int <- positive_integer() do
        set = IntSet.new(int)
        assert Enum.member?(set, int)
      end
    end

    property "can accept arbitrary bitstrings" do
      check all str <- bitstring() do
        IntSet.new(str)
      end
    end

    property "can accept arbitrary lists of positive integers" do
      check all list <- list_of(positive_integer()) do
        set = IntSet.new(list)

        Enum.each(list, fn x ->
          assert Enum.member?(set, x)
        end)
      end
    end
  end
end
