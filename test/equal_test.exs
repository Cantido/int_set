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

      test "sets that used to contain large numbers behave as expected" do
        a = IntSet.new(1000) |> IntSet.delete(1000)
        b = IntSet.new

        assert IntSet.equal?(a, b)
      end
    end
  end
