# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSetInspectTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "Inspect" do
    test "inspectable" do
      set = IntSet.new([1, 2, 3])

      assert inspect(set) == "#IntSet<[1, 2, 3]>"
    end

    test "inspection renders all ints as integers and not characters" do
      set = IntSet.new(7)

      assert inspect(set) == "#IntSet<[7]>"
    end
  end
end
