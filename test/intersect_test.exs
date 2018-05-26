defmodule IntSetIntersectTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

    describe "IntSet.difference/2" do
      property "All members from result are in both arguments" do
        check all list1 <- list_of(positive_integer(), max_tries: 100),
                  list2 <- list_of(positive_integer(), max_tries: 100),
                  a = IntSet.new(list1),
                  b = IntSet.new(list2),
                  max_runs: 1000 do
          intersect = IntSet.intersection(a, b)

          Enum.each(intersect, fn i ->
            assert Enum.member?(a, i)
            assert Enum.member?(b, i)
          end)
        end
      end

      test "an intersection with an empty set is empty" do
        a = IntSet.new([1, 2])
        b = IntSet.new([])

        assert IntSet.intersection(a, b) |> Enum.empty?()
      end
    end
  end
