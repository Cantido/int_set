defmodule IntSetTest do
  use ExUnit.Case
  use ExUnitProperties
  alias IntSet
  doctest IntSet

  test "is collectable" do
    collected = Enum.into([1, 2, 3], IntSet.new())

    assert Enum.member?(collected, 1)
    assert Enum.member?(collected, 2)
    assert Enum.member?(collected, 3)
  end

  test "is countable as enumerable" do
    assert 0 = IntSet.new() |> Enum.count()
    assert 1 = IntSet.new([1]) |> Enum.count()
  end

  test "can check members enumerable" do
    assert IntSet.new([1]) |> Enum.member?(1)
    refute IntSet.new() |> Enum.member?(1)
  end

  test "can map a function as an enumerable" do
    incremented = IntSet.new([1, 2, 3]) |> Enum.map(&(&1 + 1))
    assert 2 in incremented
    assert 3 in incremented
    assert 4 in incremented
  end

  test "member? returns false if IntSet is too small to contain x" do
    set = IntSet.new(<<0b0000_0000>>)

    refute Enum.member?(set, 8)
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

  test "can delete members not in a set" do
    set = IntSet.new() |> IntSet.delete(0)

    refute Enum.member?(set, 0)
  end

  test "can delete members in a set" do
    set = IntSet.new([4]) |> IntSet.delete(4)

    refute Enum.member?(set, 4)
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

  test "inspectable" do
    set = IntSet.new([1, 2, 3])

    assert inspect(set) == "#IntSet<[1, 2, 3]>"
  end

  property "can accept arbitrary bitstrings" do
    check all str <- bitstring() do
      IntSet.new(str)
    end
  end

  property "can accept arbitrary lists of positive integers" do
    check all list <- list_of(positive_integer()) do
      IntSet.new(list)
    end
  end

  test "time performance" do
    # any integer values much bigger than this inconsitently fail. Not sure why, yet.
    int_max = 10000000
    capacity = 1000

    ints = Stream.repeatedly(fn -> :rand.uniform(int_max) end)
        |> Stream.take(capacity)
        |> Enum.to_list()

    IO.puts ""
    IO.puts "Performance tests:"

    {intset_time, intset} = :timer.tc(fn -> IntSet.new(ints) end)
    {mapset_time, mapset} = :timer.tc(fn -> MapSet.new(ints) end)
    IO.puts "~~Filling~~"
    IO.puts "IntSet took #{intset_time} usec to fill"
    IO.puts "MapSet took #{mapset_time} usec to fill"

    {intset_lookups, _} = :timer.tc(fn -> Enum.member?(intset, 10000) end)
    {mapset_lookups, _} = :timer.tc(fn -> Enum.member?(mapset, 10000) end)
    IO.puts "~~Lookup~~"
    IO.puts "IntSet took #{intset_lookups} usec to look up a number"
    IO.puts "MapSet took #{mapset_lookups} usec to look up a number"


    {intset_insert, _} = :timer.tc(fn -> IntSet.put(intset, 10000) end)
    {mapset_insert, _} = :timer.tc(fn -> MapSet.put(mapset, 10000) end)
    IO.puts "~~Insertion~~"
    IO.puts "IntSet took #{intset_insert} usec to insert a number"
    IO.puts "MapSet took #{mapset_insert} usec to insert a number"

  end
end
