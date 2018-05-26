# IntSet

An ordered data structure for positive integers.
Faster than Elixir's MapSet at set operations (union, intersection, difference, equality),
and slower at everything else.

### Iterations per second

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

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `int_set` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:int_set, "~> 1.3"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/int_set](https://hexdocs.pm/int_set).
