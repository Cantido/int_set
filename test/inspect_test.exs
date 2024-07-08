# SPDX-FileCopyrightText: 2024 Rosa Richter
#
# SPDX-License-Identifier: AGPL-3.0-or-later

defmodule IntSetInspectTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "Inspect" do
    test "inspectable" do
      set = IntSet.new([1, 2, 3])

      assert inspect(set) == "IntSet.new([1, 2, 3])"
    end

    test "inspection renders all ints as integers and not characters" do
      set = IntSet.new(7)

      assert inspect(set) == "IntSet.new([7])"
    end
  end
end
