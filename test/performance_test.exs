defmodule IntSetPerformanceTest do
  use ExUnit.Case, async: true

  describe "Performance" do
    test "time performance against MapSet" do
      # any integer values much bigger than this inconsitently fail. Not sure why, yet.
      results1 = perftest(10_000_000, 1000)
      results2 = perftest(10_000_000, 10000)

      print_results(results1)
      print_results(results2)
    end
  end

  defp perftest(int_max, capacity) do
    ints =
      Stream.repeatedly(fn -> :rand.uniform(int_max) end)
      |> Stream.take(capacity)
      |> Enum.to_list()

    ints2 =
      Stream.repeatedly(fn -> :rand.uniform(int_max) end)
      |> Stream.take(1000)
      |> Enum.to_list()

    ints_size = Enum.count(ints)
    ints2_size = Enum.count(ints2)

    is = IntSet.new(ints2)
    ms = MapSet.new(ints2)

    {intset_time, intset} = :timer.tc(fn -> IntSet.new(ints) end)
    {mapset_time, mapset} = :timer.tc(fn -> MapSet.new(ints) end)

    {intset_collect, _} = :timer.tc(fn -> Enum.into(ints, IntSet.new()) end)
    {mapset_collect, _} = :timer.tc(fn -> Enum.into(ints, MapSet.new()) end)

    {intset_lookups, _} = :timer.tc(fn -> Enum.map(ints2, &Enum.member?(intset, &1)) end)
    {mapset_lookups, _} = :timer.tc(fn -> Enum.map(ints2, &Enum.member?(mapset, &1)) end)

    {intset_insert, _} = :timer.tc(fn -> Enum.map(ints2, &IntSet.put(intset, &1)) end)
    {mapset_insert, _} = :timer.tc(fn -> Enum.map(ints2, &MapSet.put(mapset, &1)) end)

    {intset_union, _} = :timer.tc(fn -> IntSet.union(intset, is) end)
    {mapset_union, _} = :timer.tc(fn -> MapSet.union(mapset, ms) end)

    {intset_diff, _} = :timer.tc(fn -> IntSet.difference(intset, is) end)
    {mapset_diff, _} = :timer.tc(fn -> MapSet.difference(mapset, ms) end)

    {
      {ints_size, ints2_size},
      {intset_time, mapset_time},
      {intset_collect, mapset_collect},
      {intset_lookups, mapset_lookups},
      {intset_insert, mapset_insert},
      {intset_union, mapset_union},
      {intset_diff, mapset_diff}
    }
  end

  defp print_results(results) do
    {
      {ints_size, ints2_size},
      {intset_time, mapset_time},
      {intset_collect, mapset_collect},
      {intset_lookups, mapset_lookups},
      {intset_insert, mapset_insert},
      {intset_union, mapset_union},
      {intset_diff, mapset_diff}
    } = results

    IO.puts("")
    IO.puts("Performance tests (μsec):")

    IO.puts(
      "Sets of #{ints_size} size, operations performed using another set of #{ints2_size} items."
    )

    IO.puts("Op \t\tIntSet \t\tMapSet")

    IO.puts("Filling \t#{intset_time} \t\t#{mapset_time}")

    IO.puts("Collection \t#{intset_collect} \t\t#{mapset_collect}")
    IO.puts("Lookup \t\t#{intset_lookups / ints2_size} \t\t#{mapset_lookups / ints2_size}")
    IO.puts("Insertion \t#{intset_insert / ints2_size} \t#{mapset_insert / ints2_size}")

    IO.puts("Union \t\t#{intset_union} \t\t#{mapset_union}")

    IO.puts("Difference \t#{intset_diff} \t\t#{mapset_diff}")
  end
end
