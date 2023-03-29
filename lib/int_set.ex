# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSet do
  @moduledoc """
  Efficiently store and index a set of non-negative integers.

  A set can be constructed using `IntSet.new/0`:

      iex> IntSet.new()
      IntSet.new([])

  An `IntSet` obeys the same set semantics as `MapSet`, and provides
  constant-time operations for insertion, deletion, and membership checking.
  Use `Enum.member?/2` to check for membership.

      iex> IntSet.new(3) |> Enum.member?(3)
      true

  Sets also implement `Collectable`, so it can collect values in any context
  that a list can:

      iex> Enum.into([1, 2, 3], IntSet.new())
      IntSet.new([1, 2, 3])

  Working with applications that use bitstrings becomes way easier,
  because `IntSet.new/1` accepts a bitstring,
  and `IntSet.bitstring/2` can return one.

      iex> IntSet.new(5) |> IntSet.bitstring()
      <<0::1, 0::1, 0::1, 0::1, 0::1, 1::1, 0::1, 0::1>>

      iex> IntSet.new(<<0::1, 0::1, 0::1, 0::1, 0::1, 1::1>>)
      IntSet.new([5])

  ## Performance

  An `IntSet` is significantly faster than Elixir's `MapSet` at set operations (union, intersection, difference, equality),
  but slower at everything else.
  The case for memory usage is similar:
  better than `MapSet` for set operations,
  worse for everything else.

  | Op           | MapSet | IntSet  | Comparison    |
  |--------------|--------|---------|---------------|
  | new          | 4.8K   | 2.46K   | 1.95x slower  |
  | member?      | 6.78M  | 2.93M   | 2.31x slower  |
  | put          | 4.19M  | 1.15M   | 3.66x slower  |
  | union        | 156.4K | 944.31K | 6.04x faster  |
  | difference   | 48.09  | 891.27K | 18.53x faster |
  | intersection | 14.03K | 905.70K | 64.54x faster |
  | equal?       | 0.26M  | 2.41M   | 9.25x faster  |

  There is a benchmark checked into the project repo
  at `perf/performance_test.exs`.
  You can run it with `mix run` to see some results for yourself.

  ## Serialization

  With the use of `IntSet.bitstring/2`, and `IntSet.new/1`,
  you can serialize this collection very efficiently.

      iex> IntSet.new([4, 8, 15, 16, 23, 42]) |> IntSet.bitstring() |> Base.encode16()
      "088181000020"
      iex> Base.decode16!("088181000020") |> IntSet.new()
      IntSet.new([4, 8, 15, 16, 23, 42])

  """
  @moduledoc since: "1.0.0"

  defstruct s: <<>>

  @opaque t :: %__MODULE__{s: binary()}

  defguardp is_index(i)
            when is_integer(i) and i >= 0

  defguardp can_contain(s, i)
            when is_index(i) and is_bitstring(s) and bit_size(s) > i

  @doc """
  Create an empty int set.

  ## Examples

      iex> IntSet.new
      IntSet.new([])

  """
  @doc since: "1.0.0"
  @spec new :: t
  def new do
    %IntSet{}
  end

  @doc """
  Create an int set with some starting value.

  ## Examples

  You can create a set with a single starting value.

      iex> IntSet.new(0)
      IntSet.new([0])

  You can also provide an enumerable of integers to start with.

      iex> IntSet.new([1, 2, 3])
      IntSet.new([1, 2, 3])

  Lastly, you can initialize the set with a bit string.
  Binary strings are interpreted as little-endian, with the very first bit
  of the string representing the number zero.

      iex> IntSet.new(<<1 :: 1>>)
      IntSet.new([0])

      iex> IntSet.new(<<0b1000_1000>>)
      IntSet.new([0, 4])

      iex> IntSet.new(<<0 :: 1>>)
      IntSet.new([])

  """
  @doc since: "1.0.0"
  @spec new(non_neg_integer | Enum.t() | bitstring) :: t
  def new(members)

  def new(bitstring) when is_bitstring(bitstring) do
    set =
      :binary.bin_to_list(byte_align(bitstring))
      |> Enum.map(&reverse_bits/1)
      |> :binary.list_to_bin()
      |> trim_trailing_zeroes()

    %IntSet{s: set}
  end

  def new(int) when is_index(int) do
    new([int])
  end

  def new(enum) do
    set_as_integer =
      Enum.reduce(enum, 0, fn x, int ->
        Bitwise.bsl(1, x)
        |> Bitwise.bor(int)
      end)

    %IntSet{s: :binary.encode_unsigned(set_as_integer, :little)}
    |> normalize()
  end

  @doc """
  Returns a set of size n with all members not in the given IntSet.

  You can visualize this operation as calling `IntSet.difference/2`
  with the first argument being a full IntSet of size n.

  ## Examples

      iex> IntSet.new(0) |> IntSet.inverse(1)
      IntSet.new([])

      iex> IntSet.new(0) |> IntSet.inverse(8)
      IntSet.new([1, 2, 3, 4, 5, 6, 7])

      iex> IntSet.new() |> IntSet.inverse(3)
      IntSet.new([0, 1, 2])

      iex> IntSet.new() |> IntSet.inverse(9)
      IntSet.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
  """
  @doc since: "1.4.0"
  @spec inverse(t, non_neg_integer) :: t
  def inverse(%IntSet{s: a}, n) do
    target_byte_count = div(n, 8)

    target_byte_count =
      if rem(n, 8) > 0 do
        target_byte_count + 1
      else
        target_byte_count
      end

    pad_bytes = target_byte_count - byte_size(a)

    padded_set =
      if pad_bytes > 0 do
        pad_bits = pad_bytes * 8
        a <> <<0::size(pad_bits)>>
      else
        a
      end

    inverted_padded_set =
      padded_set
      |> :binary.bin_to_list()
      |> Enum.map(fn bin -> Bitwise.bxor(bin, 255) end)

    set = %IntSet{s: :binary.list_to_bin(inverted_padded_set)}

    current_capacity = bit_size(set.s) - 1

    if current_capacity > n do
      values_to_remove = current_capacity..n

      Enum.reduce(values_to_remove, set, fn val, set ->
        IntSet.delete(set, val)
      end)
    else
      set
    end
  end

  @doc """
  Create a new set that contains all of the elements of both x and y.

  ## Examples

      iex> a = IntSet.new(7)
      iex> b = IntSet.new(4)
      iex> IntSet.union(a, b)
      IntSet.new([4, 7])

  """
  @doc since: "1.0.0"
  @spec union(t, t) :: t
  def union(x, y)

  def union(%IntSet{s: a}, %IntSet{s: b}) do
    new_set =
      :binary.decode_unsigned(a, :little)
      |> Bitwise.bor(:binary.decode_unsigned(b, :little))
      |> :binary.encode_unsigned(:little)

    %IntSet{s: new_set}
  end

  @doc """
  Returns a set that is `int_set1` without the members of `int_set2`.

  ## Examples

      iex> IntSet.difference(IntSet.new([1, 2]), IntSet.new([2, 3, 4]))
      IntSet.new([1])

  """
  @doc since: "1.2.0"
  @spec difference(t, t) :: t
  def difference(int_set1, int_set2)

  def difference(%IntSet{s: a}, %IntSet{s: b}) do
    new_set =
      :binary.decode_unsigned(a, :little)
      |> Bitwise.band(Bitwise.bnot(:binary.decode_unsigned(b, :little)))
      |> :binary.encode_unsigned(:little)

    %IntSet{s: new_set}
  end

  @doc """
  Find all elements that are in both `int_set1` and `int_set2`.

  ## Examples

      iex> IntSet.intersection(IntSet.new([1, 2]), IntSet.new([2, 3, 4]))
      IntSet.new([2])

      iex> IntSet.intersection(IntSet.new([1, 2]), IntSet.new([3, 4]))
      IntSet.new([])
  """
  @doc since: "1.3.0"
  @spec intersection(t, t) :: t
  def intersection(int_set1, int_set2)

  def intersection(%IntSet{s: <<>>}, %IntSet{s: _}), do: IntSet.new()
  def intersection(%IntSet{s: _}, %IntSet{s: <<>>}), do: IntSet.new()

  def intersection(%IntSet{s: a}, %IntSet{s: b}) do
    new_set =
      :binary.decode_unsigned(a, :little)
      |> Bitwise.band(:binary.decode_unsigned(b, :little))
      |> :binary.encode_unsigned(:little)

    %IntSet{s: new_set}
    |> normalize()
  end

  @doc """
  Checks if `int_set` and `int_set2` have no members in common.

  ## Examples

      iex> IntSet.disjoint?(IntSet.new([1, 2]), IntSet.new([3, 4]))
      true

      iex> IntSet.disjoint?(IntSet.new([1, 2]), IntSet.new([2, 3]))
      false
  """
  @doc since: "1.2.0"
  @spec disjoint?(t, t) :: boolean
  def disjoint?(int_set1, int_set2)

  def disjoint?(%IntSet{s: <<>>}, %IntSet{s: _}), do: true
  def disjoint?(%IntSet{s: _}, %IntSet{s: <<>>}), do: true

  def disjoint?(%IntSet{s: a}, %IntSet{s: b}) do
    aint = :binary.decode_unsigned(a, :little)
    bint = :binary.decode_unsigned(b, :little)
    Bitwise.band(aint, bint) == 0
  end

  @doc """
  Add a value to the int set.

  ## Examples

      iex> set = IntSet.new()
      IntSet.new([])
      iex> IntSet.put(set, 0)
      IntSet.new([0])

  """
  @doc since: "1.0.0"
  @spec put(t, non_neg_integer) :: t
  def put(%IntSet{s: s}, x) when is_index(x) and is_bitstring(s) do
    set =
      :binary.decode_unsigned(s, :little)
      |> Bitwise.bor(Bitwise.bsl(1, x))
      |> :binary.encode_unsigned(:little)

    %IntSet{s: set}
  end

  @doc """
  Remove a number from the int set.

  ## Examples

      iex> set = IntSet.new(5)
      IntSet.new([5])
      iex> IntSet.delete(set, 5)
      IntSet.new([])

  """
  @doc since: "1.0.0"
  @spec delete(t, non_neg_integer) :: t
  def delete(%IntSet{s: s} = set, x) when not can_contain(s, x) do
    set
  end

  def delete(%IntSet{s: s}, x) when can_contain(s, x) do
    new_set =
      Bitwise.bsl(1, x)
      |> Bitwise.bnot()
      |> Bitwise.band(:binary.decode_unsigned(s, :little))
      |> :binary.encode_unsigned(:little)
      |> trim_trailing_zeroes()

    %IntSet{s: new_set}
  end

  @doc """
  Checks if two sets are equal

  ## Examples

      iex> IntSet.equal?(IntSet.new([1, 2]), IntSet.new([2, 1, 1]))
      true
      iex> IntSet.equal?(IntSet.new([1, 2]), IntSet.new([3, 4]))
      false
  """
  @doc since: "1.3.0"
  @spec equal?(t, t) :: boolean
  def equal?(int_set1, int_set2)

  def equal?(%IntSet{s: a}, %IntSet{s: b}) do
    a == b
  end

  @doc """
  Get a bitstring representing the members of a set.

  ## Examples

      iex> IntSet.new(0) |> IntSet.bitstring()
      <<128>>

      iex> IntSet.new(5) |> IntSet.bitstring()
      <<0::1, 0::1, 0::1, 0::1, 0::1, 1::1, 0::1, 0::1>>

      iex> IntSet.new() |> IntSet.bitstring()
      <<>>
  """
  @doc since: "1.1.0"
  @spec bitstring(t) :: bitstring
  def bitstring(%IntSet{s: s}) do
    :binary.bin_to_list(s)
    |> Enum.map(&reverse_bits/1)
    |> :binary.list_to_bin()
    |> trim_trailing_zeroes()
  end

  defp reverse_bits(byte) do
    <<a::1, b::1, c::1, d::1, e::1, f::1, g::1, h::1>> = <<byte>>
    <<h::1, g::1, f::1, e::1, d::1, c::1, b::1, a::1>>
  end

  defp normalize(%IntSet{s: s}) do
    s =
      byte_align(s)
      |> trim_trailing_zeroes()

    %IntSet{s: s}
  end

  defp trim_trailing_zeroes(<<>>), do: <<>>

  defp trim_trailing_zeroes(bin) when is_binary(bin) do
    size = byte_size(bin)

    if binary_part(bin, size - 1, 1) == <<0>> do
      trim_trailing_zeroes(binary_part(bin, 0, size - 1))
    else
      bin
    end
  end

  defp byte_align(<<>>), do: <<>>

  defp byte_align(bin) when is_binary(bin), do: bin

  defp byte_align(bin) when is_bitstring(bin) do
    bits_to_add = 8 - Integer.mod(bit_size(bin), 8)
    <<bin::bitstring, 0::size(bits_to_add)>>
  end

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(s, opts) do
      int_list = Enum.into(s, []) |> Enum.reverse()
      concat(["IntSet.new(", to_doc(int_list, %{opts | charlists: :as_lists}), ")"])
    end
  end

  defimpl Collectable do
    def into(original) do
      collector_fun = fn
        list, {:cont, elem} -> [elem | list]
        list, :done -> IntSet.new(list) |> IntSet.union(original)
        _, :halt -> :ok
      end

      {[], collector_fun}
    end
  end

  defimpl Enumerable do
    def count(_) do
      {:error, __MODULE__}
    end

    defguard is_index(i)
             when is_integer(i) and i >= 0

    def member?(%IntSet{}, x) when is_integer(x) and x < 0, do: {:ok, false}
    def member?(%IntSet{s: s}, x) when is_index(x) and bit_size(s) <= x, do: {:ok, false}

    def member?(%IntSet{s: s}, x)
        when is_index(x) and bit_size(s) > x do
      {:ok, Bitwise.band(:binary.decode_unsigned(s, :little), Bitwise.bsl(1, x)) > 0}
    end

    def member?(%IntSet{}, _), do: {:error, __MODULE__}

    def slice(_) do
      {:error, __MODULE__}
    end

    def reduce(%IntSet{s: s}, acc, fun) do
      reduce(to_list(s), acc, fun)
    end

    def reduce(_list, {:halt, acc}, _fun), do: {:halted, acc}
    def reduce(list, {:suspend, acc}, fun), do: {:suspended, acc, &reduce(list, &1, fun)}
    def reduce([], {:cont, acc}, _fun), do: {:done, acc}
    def reduce([head | tail], {:cont, acc}, fun), do: reduce(tail, fun.(head, acc), fun)

    require Logger

    defp to_list(bin) do
      :binary.bin_to_list(bin)
      |> Enum.with_index()
      |> Enum.flat_map(fn {byte, i} ->
        byte_to_list(byte, i * 8)
      end)
    end

    defp byte_to_list(0, _) do
      []
    end

    defp byte_to_list(byte, offset) do
      Enum.reduce(0..7, [], fn shift, acc ->
        selector = Bitwise.bsl(1, shift)

        if Bitwise.band(byte, selector) > 0 do
          [offset + shift | acc]
        else
          acc
        end
      end)
    end
  end
end
