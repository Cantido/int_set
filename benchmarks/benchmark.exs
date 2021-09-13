# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

intlist = fn(size) ->
  Stream.repeatedly(fn -> :rand.uniform(size) end)
  |> Stream.take(size)
  |> Enum.to_list()
end

set_sizes = %{
  "Small (1 Thousand)"    => 1_000,
  "Middle (100 Thousand)" => 100_000
  # "Big (1 Million)"      => 1_000_000
}

Benchee.run(%{
    "IntSet.new" => fn(ints) -> IntSet.new(ints) end,
    "MapSet.new" => fn(ints) -> MapSet.new(ints) end
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    intlist.(input)
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "benchmarks/results/new.md"}
  ]
)

Benchee.run(%{
    "Enum.member? IntSet with existing member" => {fn({set, i}) ->    Enum.member?(set, i) end, before_scenario: fn {ints, i} -> {IntSet.put(IntSet.new(ints), i), i} end},
    "Enum.member? MapSet with existing member" => {fn({set, i}) ->    Enum.member?(set, i) end, before_scenario: fn {ints, i} -> {MapSet.put(MapSet.new(ints), i), i} end},
    "Enum.member? IntSet with nonexisting member" => {fn({set, i}) -> Enum.member?(set, i) end, before_scenario: fn {ints, i} -> {IntSet.new(ints), i} end},
    "Enum.member? MapSet with nonexisting member" => {fn({set, i}) -> Enum.member?(set, i) end, before_scenario: fn {ints, i} -> {MapSet.new(ints), i} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), :rand.uniform(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "benchmarks/results/member.md"}
  ]
)

Benchee.run(%{
    "IntSet.put with existing member" => {fn({set, i}) ->    IntSet.put(set, i) end, before_scenario: fn {ints, i} -> {IntSet.new(ints) |> IntSet.put(i), i} end},
    "MapSet.put with existing member" => {fn({set, i}) ->    MapSet.put(set, i) end, before_scenario: fn {ints, i} -> {MapSet.new(ints) |> MapSet.put(i), i} end},
    "IntSet.put with nonexisting member" => {fn({set, i}) -> IntSet.put(set, i) end, before_scenario: fn {ints, i} -> {IntSet.new(ints), i} end},
    "MapSet.put with nonexisting member" => {fn({set, i}) -> MapSet.put(set, i) end, before_scenario: fn {ints, i} -> {MapSet.new(ints), i} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), :rand.uniform(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "benchmarks/results/put.md"}
  ]
)

Benchee.run(%{
    "IntSet.union" => {fn({a, b}) -> IntSet.union(a, b) end, before_scenario: fn {a, b} -> {IntSet.new(a), IntSet.new(b)} end},
    "MapSet.union" => {fn({a, b}) -> MapSet.union(a, b) end, before_scenario: fn {a, b} -> {MapSet.new(a), MapSet.new(b)} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), intlist.(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false]
)

Benchee.run(%{
    "IntSet.difference" => {fn({a, b}) -> IntSet.difference(a, b) end, before_scenario: fn {a, b} -> {IntSet.new(a), IntSet.new(b)} end},
    "MapSet.difference" => {fn({a, b}) -> MapSet.difference(a, b) end, before_scenario: fn {a, b} -> {MapSet.new(a), MapSet.new(b)} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), intlist.(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "benchmarks/results/difference.md"}
  ]
)

Benchee.run(%{
    "IntSet.intersection" => {fn({a, b}) -> IntSet.intersection(a, b) end, before_scenario: fn {a, b} -> {IntSet.new(a), IntSet.new(b)} end},
    "MapSet.intersection" => {fn({a, b}) -> MapSet.intersection(a, b) end, before_scenario: fn {a, b} -> {MapSet.new(a), MapSet.new(b)} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), intlist.(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false]
)

Benchee.run(%{
    "IntSet.equal? when the sets are equal" =>     {fn(a) ->      IntSet.equal?(a, a) end, before_scenario: fn {a, _b} -> IntSet.new(a) end},
    "MapSet.equal? when the sets are equal" =>     {fn(a) ->      MapSet.equal?(a, a) end, before_scenario: fn {a, _b} -> MapSet.new(a) end},
    "IntSet.equal? when the sets are not equal" => {fn({a, b}) -> IntSet.equal?(a, b) end, before_scenario: fn {a, b} -> {IntSet.new(a), IntSet.new(b)} end},
    "MapSet.equal? when the sets are not equal" => {fn({a, b}) -> MapSet.equal?(a, b) end, before_scenario: fn {a, b} -> {MapSet.new(a), MapSet.new(b)} end}
  },
  inputs: set_sizes,
  before_scenario: fn input ->
    {intlist.(input), intlist.(input)}
  end,
  parallel: 4,
  memory_time: 2,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "benchmarks/results/equal.md"}
  ]
)
