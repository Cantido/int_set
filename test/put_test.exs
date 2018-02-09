defmodule IntSetPutTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.put/2" do
    property "ensures a member is in the list" do
      check all list <- list_of(positive_integer(), max_tries: 1000),
                int <- positive_integer() do
        assert IntSet.new(list) |> IntSet.put(int) |> Enum.member?(int)
      end
    end

    test "put can insert values smaller than the max" do
      set =
        IntSet.new(<<0b0000_0001>>)
        |> IntSet.put(4)

      assert Enum.member?(set, 4)
    end

    test "put can insert a value one larger than the max" do
      set =
        IntSet.new(<<0::1>>)
        |> IntSet.put(1)

      assert Enum.member?(set, 1)
    end

    test "put can expand the bitstring" do
      set =
        IntSet.new()
        |> IntSet.put(7)

      assert Enum.member?(set, 7)
    end
  end
end
