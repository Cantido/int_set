# IntSet

![Hex.pm](https://img.shields.io/hexpm/v/int_set)
![Travis (.org)](https://img.shields.io/travis/Cantido/int_set)

An ordered data structure for positive integers.
Faster than Elixir's MapSet at set operations (union, intersection, difference, equality),
and slower at everything else.

### Performance

Check out the iterations-per-second for some operations of `MapSet` compared to `IntSet`.

| Op           | MapSet | IntSet  | Comparison    |
|--------------|--------|---------|---------------|
| new          | 4.8K   | 2.46K   | 1.95x slower  |
| member?      | 6.78M  | 2.93M   | 2.31x slower  |
| put          | 4.19M  | 1.15M   | 3.66x slower  |
| union        | 156.4K | 944.31K | 6.04x faster  |
| difference   | 48.09  | 891.27K | 18.53x faster |
| intersection | 14.03K | 905.70K | 64.54x faster |
| equal?       | 0.26M  | 2.41M   | 9.25x faster  |

Memory usage is also better for union, difference, intersection, and equality.
See [benchmark.txt](benchmark.txt) for the full benchmark.

## Installation

This package can be installed by adding `int_set` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:int_set, "~> 1.5"}
  ]
end
```

The docs can be found at [https://hexdocs.pm/int_set](https://hexdocs.pm/int_set).

## Usage

Usage is pretty much the same as with `MapSet`,
but you're only allowed to put positive integers (including zero) into the set.

A set can be constructed using `IntSet.new/0`:

```elixir
iex> IntSet.new
#IntSet<[]>
```

An `IntSet` obeys the same set semantics as `MapSet`, and provides
constant-time operations for insertion, deletion, and membership checking.
Use `Enum.member?/2` to check for membership.

```elixir
iex> IntSet.new(3) |> Enum.member?(3)
true
```

Sets also implement `Collectable`, so it can collect values in any context
that a list can:

```elixir
iex> Enum.into([1, 2, 3], IntSet.new())
#IntSet<[1, 2, 3]>
```

The `inspect/1` implementation for `IntSet` sorts the members, which makes
it way easier to write doctests:

```elixir
iex> IntSet.new([3, 1, 2])
#IntSet<[1, 2, 3]>
```

Working with applications that use bitstrings becomes way easier,
because `IntSet.new/1` accepts a bitstring,
and `IntSet.bitstring/2` can return one.

```elixir
iex> IntSet.new(5) |> IntSet.bitstring()
<<0::1, 0::1, 0::1, 0::1, 0::1, 1::1>>

iex> IntSet.new(<<0::1, 0::1, 0::1, 0::1, 0::1, 1::1>>)
#IntSet<[5]>
```

This also means that an `IntSet` can be really efficiently serialized with the use of `IntSet.bitstring/2`, and `IntSet.new/1`.
Remember to pass the `byte_align: true` option into `IntSet.bitstring/2` when you do this;
most encoding schemes like byte-aligned data.

```elixir
iex> IntSet.new([4, 8, 15, 16, 23, 42]) |> IntSet.bitstring(byte_align: true) |> Base.encode16()
"088181000020"
iex> Base.decode16!("088181000020") |> IntSet.new()
#IntSet<[4, 8, 15, 16, 23, 42]>
```
