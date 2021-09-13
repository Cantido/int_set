# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSetEqualTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.equal/2" do
    property "A set is always equal to itself" do
      check all list <- list_of(positive_integer(), max_tries: 100),
                set = IntSet.new(list),
                max_runs: 1000 do
        assert IntSet.equal?(set, set)
      end
    end
  end

  test "deleting contents does not affect future equality" do
    # This is a concern because when we delete a member, we just clear the bit.
    # If we are naively comparing bytes, two empty lists could be not equal,
    # since 0x00 != 0x0000
    assert IntSet.equal?(IntSet.new(), IntSet.new([9]) |> IntSet.delete(9))
  end

  test "empty sets are equal" do
    assert IntSet.equal?(IntSet.new([]), IntSet.new([]))
  end

  test "new sets with the same starting values are equal" do
    assert IntSet.equal?(IntSet.new([0]), IntSet.new([0]))
    assert IntSet.equal?(IntSet.new([2]), IntSet.new([2]))
  end

  test "an empty set is not equal to a set with contents" do
    refute IntSet.equal?(IntSet.new([]), IntSet.new([0]))
  end

  test "sets with mismatched contents larger than one byte are not equal" do
    refute IntSet.equal?(IntSet.new([1]), IntSet.new([9]))
  end
end
