# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSetDifferenceTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.difference/2" do
    property "All members from subtrahend are removed from minuend" do
      check all list1 <- list_of(positive_integer(), max_tries: 100),
                list2 <- list_of(positive_integer(), max_tries: 100),
                minuend = IntSet.new(list1),
                subtrahend = IntSet.new(list2),
                max_runs: 1000 do
        difference = IntSet.difference(minuend, subtrahend)

        Enum.each(subtrahend, fn i ->
          refute Enum.member?(difference, i)
        end)
      end
    end

    test "removes a member from the list" do
      subtrahend = IntSet.new(4)
      refute IntSet.new(4) |> IntSet.difference(subtrahend) |> Enum.member?(4)
    end

    test "Removing from an empty set is fine" do
      subtrahend = IntSet.new(8)
      refute IntSet.new() |> IntSet.difference(subtrahend) |> Enum.member?(8)
    end
  end
end
