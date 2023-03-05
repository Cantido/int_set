<!--
SPDX-FileCopyrightText: 2021 Rosa Richter

SPDX-License-Identifier: MIT
-->

# IntSet

[![Hex.pm](https://img.shields.io/hexpm/v/int_set)](https://hex.pm/packages/int_set)
![Elixir CI](https://github.com/Cantido/int_set/workflows/Elixir%20CI/badge.svg)
[![liberapay goals](https://img.shields.io/liberapay/goal/rosa.svg?logo=liberapay)](https://liberapay.com/rosa)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code_of_conduct.md)

A time- and memory-efficient data structure for positive integers.

Faster than Elixir's MapSet at set operations (union, intersection, difference, equality),
and slower at everything else.
Also can be serlialized wicked small.

## Install

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

## Performance

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
See the [`benchmarks/results`] directory for all the benchmarks.
You can run the benchmarks for yourself with `mix run benchmarks/benchmark.exs`.

## Maintainer

This project was developed by [Rosa Richter](https://github.com/Cantido).
You can get in touch with her on [Keybase.io](https://keybase.io/cantido).

## Contributing

Questions and pull requests are more than welcome.
I follow Elixir's tenet of bad documentation being a bug,
so if anything is unclear, please [file an issue](https://github.com/Cantido/int_set/issues/new)!
Ideally, my answer to your question will be in an update to the docs.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for all the details you could ever want about helping me with this project.

Note that this project is released with a Contributor [Code of Conduct].
By participating in this project you agree to abide by its terms.

## License

MIT License

Copyright 2022 Rosa Richter

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[Code of Conduct]: code_of_conduct.md
