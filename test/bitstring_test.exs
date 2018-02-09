defmodule IntSetBitstringTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.bitstring/1" do
    property "returns an equal bitstring to that which created it" do
      check all int <- positive_integer() do
        bitstr = IntSet.new(int) |> IntSet.bitstring()
        assert bit_size(bitstr) >= int + 1
      end
    end

    property "returns a bitstring big enough to contain all its members" do
      check all bitstr <- bitstring() do
        assert IntSet.new(bitstr) |> IntSet.bitstring() == bitstr
      end
    end

    property "returns a bitstring that can re-create the set" do
      check all list <- list_of(positive_integer()) do
        set = IntSet.new(list)
        reset = set |> IntSet.bitstring() |> IntSet.new()

        assert set == reset
      end
    end
  end
end
