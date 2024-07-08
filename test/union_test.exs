# SPDX-FileCopyrightText: 2024 Rosa Richter
#
# SPDX-License-Identifier: AGPL-3.0-or-later

defmodule IntSetUnionTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.union/2" do
    property "All members from both arguments are in the resulting set" do
      check all list1 <- list_of(positive_integer(), max_tries: 100),
                list2 <- list_of(positive_integer(), max_tries: 100),
                arg1 = IntSet.new(list1),
                arg2 = IntSet.new(list2) do
        union1 = IntSet.union(arg1, arg2)
        union2 = IntSet.union(arg2, arg1)

        Enum.each(arg1, fn i ->
          assert Enum.member?(union1, i)
          assert Enum.member?(union2, i)
        end)

        Enum.each(arg2, fn i ->
          assert Enum.member?(union1, i)
          assert Enum.member?(union2, i)
        end)
      end
    end
  end
end
