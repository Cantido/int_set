defmodule IntSetEnumerableTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "Enum.into/2" do
    property "is collectable" do
      check all list <- list_of(positive_integer()) do
        set = Enum.into(list, IntSet.new())

        Enum.each(list, fn x ->
          assert Enum.member?(set, x)
        end)
      end
    end

    test "doesn't clobber existing values" do
      initial = IntSet.new(0)
      actual = Enum.into([1, 2, 3], initial)

      assert Enum.member?(actual, 0)
      assert Enum.member?(actual, 1)
      assert Enum.member?(actual, 2)
      assert Enum.member?(actual, 3)
    end
  end

  describe "Enum.count/1" do
    property "is countable" do
      # uniq_list_of has issues with positive_integer, so we need to crank up max_tries
      check all list <- uniq_list_of(positive_integer(), max_tries: 1000) do
        assert Enum.count(list) == Enum.count(IntSet.new(list))
      end
    end
  end

  describe "Enum.map/2" do
    test "can map a function as an enumerable" do
      incremented = IntSet.new([1, 2, 3]) |> Enum.map(&(&1 + 1))
      assert 2 in incremented
      assert 3 in incremented
      assert 4 in incremented
    end
  end

  describe "Enum.member?/2" do
    property "can check membership" do
      check all int <- positive_integer() do
        assert IntSet.new(int) |> Enum.member?(int)
        refute IntSet.new() |> Enum.member?(int)
      end
    end

    test "member? returns false if IntSet is too small to contain x" do
      set = IntSet.new(<<0b0000_0000>>)

      refute Enum.member?(set, 8)
    end
  end
end
