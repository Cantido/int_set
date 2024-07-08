# SPDX-FileCopyrightText: 2024 Rosa Richter
#
# SPDX-License-Identifier: AGPL-3.0-or-later

defmodule IntSetDisjointTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "IntSet.disjoint?/2" do
    property "a set is never disjoint from itself" do
      check all ints <- nonempty(list_of(positive_integer(), max_tries: 100)),
                set = IntSet.new(ints) do
        refute IntSet.disjoint?(set, set)
      end
    end

    property "adjacent integers are disjoint" do
      check all a <- positive_integer(), b = a + 1 do
        as = IntSet.new(a)
        bs = IntSet.new(b)
        assert IntSet.disjoint?(as, bs)
        assert IntSet.disjoint?(bs, as)
      end
    end

    property "an empty set is disjoint from any other set" do
      check all ints <- list_of(positive_integer(), max_tries: 100), set = IntSet.new(ints) do
        empty = IntSet.new()
        assert IntSet.disjoint?(set, empty)
        assert IntSet.disjoint?(empty, set)
      end
    end

    property "only ever returns true or false for any combination" do
      check all list1 <- list_of(positive_integer(), max_tries: 100),
                list2 <- list_of(positive_integer(), max_tries: 100),
                set1 = IntSet.new(list1),
                set2 = IntSet.new(list2),
                max_runs: 1000 do
        assert IntSet.disjoint?(set1, set2) in [true, false]
        assert IntSet.disjoint?(set2, set1) in [true, false]
      end
    end

    property "sets that share a member are never disjoint" do
      check all shared <- positive_integer(),
                list1 <- list_of(positive_integer(), max_tries: 100),
                list2 <- list_of(positive_integer(), max_tries: 100),
                set1 = IntSet.new(list1) |> IntSet.put(shared),
                set2 = IntSet.new(list2) |> IntSet.put(shared),
                max_runs: 1000 do
        refute IntSet.disjoint?(set1, set2)
        refute IntSet.disjoint?(set2, set1)
      end
    end
  end
end
