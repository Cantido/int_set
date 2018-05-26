  # any integer values much bigger than this inconsitently fail. Not sure why, yet.
# results1 = perftest(10_000_000, 1000)
# results2 = perftest(10_000_000, 10000)

intstream = Stream.repeatedly(fn -> :rand.uniform(1_000) end)

intlist = fn(size) ->
  intstream
  |> Stream.take(size)
  |> Enum.to_list()
end

inputs = %{
  "Small (1 Thousand)"    => intlist.(1_000),
  "Middle (100 Thousand)" => intlist.(100_000),
  # "Big (10 Million)"      => intlist.(10_000_000)
}

input_indices = %{
  one: 1,
  thousand: 1_000,
  million: 1_000_000
}

ints = intlist.(1_000)
ints2 = intlist.(1_000)
small_is = IntSet.new(ints)
small_is2 = IntSet.new(ints)
small_ms = MapSet.new(ints)
small_ms2 = MapSet.new(ints)

Benchee.run %{
    "IntSet.new" => fn(ints) -> IntSet.new(ints) end,
    "MapSet.new" => fn(ints) -> MapSet.new(ints) end
}, inputs: inputs, parallel: 4, memory_time: 2

Benchee.run %{
    "Enum.member? IntSet" => fn(i) -> Enum.member?(small_is, i) end,
    "Enum.member? MapSet" => fn(i) -> Enum.member?(small_ms, i) end
}, inputs: input_indices, parallel: 4, memory_time: 2, print: [fast_warning: false]

Benchee.run %{
    "IntSet.put" => fn(i) -> IntSet.put(small_is, i) end,
    "MapSet.put" => fn(i) -> MapSet.put(small_ms, i) end
}, inputs: input_indices, parallel: 4, memory_time: 2, print: [fast_warning: false]

Benchee.run %{
    "IntSet.union" => fn() -> IntSet.union(small_is, small_is2) end,
    "MapSet.union" => fn() -> MapSet.union(small_ms, small_ms2) end
}, parallel: 4, memory_time: 2, print: [fast_warning: false]

Benchee.run %{
    "IntSet.difference" => fn() -> IntSet.difference(small_is, small_is2) end,
    "MapSet.difference" => fn() -> MapSet.difference(small_ms, small_ms2) end
}, parallel: 4, memory_time: 2, print: [fast_warning: false]

Benchee.run %{
    "IntSet.intersection" => fn() -> IntSet.intersection(small_is, small_is2) end,
    "MapSet.intersection" => fn() -> MapSet.intersection(small_ms, small_ms2) end
}, parallel: 4, memory_time: 2, print: [fast_warning: false]

Benchee.run %{
    "IntSet.equal?" => fn() -> IntSet.equal?(small_is, small_is2) end,
    "MapSet.equal?" => fn() -> MapSet.equal?(small_ms, small_ms2) end
}, parallel: 4, memory_time: 2, print: [fast_warning: false]
