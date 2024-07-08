# SPDX-FileCopyrightText: 2024 Rosa Richter
#
# SPDX-License-Identifier: AGPL-3.0-or-later

defmodule IntSetBitstringTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.bitstring/1" do
    property "returns an byte-aligned bitstring" do
      check all int <- positive_integer() do
        bitstr = IntSet.new(int) |> IntSet.bitstring()
        assert bit_size(bitstr) >= div(int, 8) + 1
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
