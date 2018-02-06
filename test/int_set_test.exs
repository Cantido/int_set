defmodule IntSetTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest IntSet

  describe "IntSet.new/1" do
    property "can accept arbitrary positive integers" do
      check all int <- positive_integer() do
        set = IntSet.new(int)
        assert Enum.member?(set, int)
      end
    end

    property "can accept arbitrary bitstrings" do
      check all str <- bitstring() do
        IntSet.new(str)
      end
    end

    property "can accept arbitrary lists of positive integers" do
      check all list <- list_of(positive_integer()) do
        set = IntSet.new(list)
        Enum.each(list, fn x ->
          assert Enum.member?(set, x)
        end)
      end
    end
  end

  describe "IntSet.put/2" do
    property "ensures a member is in the list" do
      check all list <- list_of(positive_integer(), max_tries: 1000),
                int <- positive_integer() do
        assert IntSet.new(list) |> IntSet.put(int) |> Enum.member?(int)
      end
    end

    test "put can insert values smaller than the max" do
      set = IntSet.new(<<0b0000_0001>>)
         |> IntSet.put(4)

      assert Enum.member?(set, 4)
    end

    test "put can insert a value one larger than the max" do
      set = IntSet.new(<<0 :: 1>>)
         |> IntSet.put(1)

      assert Enum.member?(set, 1)
    end

    test "put can expand the bitstring" do
      set = IntSet.new()
         |> IntSet.put(7)

      assert Enum.member?(set, 7)
    end
  end

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

  describe "IntSet.difference/2" do
    property "removes a member from the list" do
      check all minuend <- list_of(positive_integer(), max_tries: 100),
                int <- positive_integer(),
                max_runs: 1000 do
        subtrahend = IntSet.new(int)
        refute IntSet.new(minuend) |> IntSet.difference(subtrahend) |> Enum.member?(int)
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

  describe "IntSet.bitstring/1" do
    property "returns an equal bitstring to that which created it" do
      check all int <- positive_integer() do
        bitstr = IntSet.new(int) |> IntSet.bitstring()
        assert bit_size(bitstr) >= int + 1
      end
    end

    property "returns a bitstring big enough to contain all its members" do
      check all bitstr <- bitstring() do
        assert IntSet.new(bitstr) |> IntSet.bitstring() == bitstr
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

  describe "Inspect" do
    test "inspectable" do
      set = IntSet.new([1, 2, 3])

      assert inspect(set) == "#IntSet<[1, 2, 3]>"
    end

    # TODO: uncomment this and get it passing.
    # test "inspection renders all ints as integers and not characters" do
    #   set = IntSet.new(7)
    #
    #   assert inspect(set) == "#IntSet<[7]>"
    # end
  end

  describe "Performance" do
    # @tag :skip
    test "time performance against MapSet" do
      # any integer values much bigger than this inconsitently fail. Not sure why, yet.
      int_max = 10000000
      capacity = 1000

      ints = Stream.repeatedly(fn -> :rand.uniform(int_max) end)
          |> Stream.take(capacity)
          |> Enum.to_list()

      IO.puts ""
      IO.puts "Performance tests (μsec):"

      IO.puts "Op \t\tIntSet \tMapSet"

      {intset_time, intset} = :timer.tc(fn -> IntSet.new(ints) end)
      {mapset_time, mapset} = :timer.tc(fn -> MapSet.new(ints) end)
      IO.puts "Filling \t#{intset_time} \t#{mapset_time}"

      {intset_collect, _} = :timer.tc(fn -> Enum.into(ints, IntSet.new()) end)
      {mapset_collect, _} = :timer.tc(fn -> Enum.into(ints, MapSet.new()) end)
      IO.puts "Collection \t#{intset_collect} \t#{mapset_collect}"

      {intset_lookups, _} = :timer.tc(fn -> Enum.member?(intset, 1) end)
      {mapset_lookups, _} = :timer.tc(fn -> Enum.member?(mapset, 1) end)
      IO.puts "Lookup \t\t#{intset_lookups} \t#{mapset_lookups}"

      {intset_insert, _} = :timer.tc(fn -> IntSet.put(intset, 10000) end)
      {mapset_insert, _} = :timer.tc(fn -> MapSet.put(mapset, 10000) end)
      IO.puts "Insertion \t#{intset_insert} \t#{mapset_insert}"

      is = IntSet.new([1])
      ms = MapSet.new([1])
      {intset_diff, _} = :timer.tc(fn -> IntSet.difference(intset, is) end)
      {mapset_diff, _} = :timer.tc(fn -> MapSet.difference(mapset, ms) end)
      IO.puts "Difference \t#{intset_diff} \t#{mapset_diff}"
    end
  end
end
