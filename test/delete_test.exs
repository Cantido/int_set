# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSetDeleteTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.delete/2" do
    property "delete removes a member from the list" do
      check all list <- list_of(positive_integer(), max_tries: 100),
                int <- positive_integer() do
        refute IntSet.new(list) |> IntSet.delete(int) |> Enum.member?(int)
      end
    end

    test "retains other members after deleting, one bit inside max" do
      set = IntSet.new([4, 5]) |> IntSet.delete(4)

      refute Enum.member?(set, 4)
      assert Enum.member?(set, 5)
    end

    test "retains other members after deleting, delete max" do
      set = IntSet.new([4, 5]) |> IntSet.delete(5)

      assert Enum.member?(set, 4)
      refute Enum.member?(set, 5)
    end
  end
end
