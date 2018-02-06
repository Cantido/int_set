defmodule IntSet do
  use Bitwise
  @moduledoc """
  Efficiently store and index a set of non-negative integers.

  A set can be constructed using `IntSet.new/0`:

      iex> IntSet.new
      #IntSet<[]>

  An `IntSet` obeys the same set semantics as `MapSet`, and provides
  constant-time operations for insertion, deletion, and membership checking.
  Use `Enum.member?/2` to check for membership.

      iex> IntSet.new(3) |> Enum.member?(3)
      true

  Sets also implement `Collectable`, so it can collect values in any context
  that a list can:

      iex> Enum.into([1, 2, 3], IntSet.new())
      #IntSet<[1, 2, 3]>

  The `inspect/1` implementation for `IntSet` sorts the members, which makes
  it way easier to write doctests:

      iex> IntSet.new([3, 1, 2])
      #IntSet<[1, 2, 3]>
  """

  defstruct s: <<>>

  @opaque t :: %__MODULE__{s: bitstring}

  defguardp is_index(i)
    when is_integer(i)
     and i >= 0

  defguardp can_contain(s, i)
    when is_index(i)
     and is_bitstring(s)
     and bit_size(s) > i

  @doc """
  Create an empty int set.

  ## Examples

      iex> IntSet.new
      #IntSet<[]>

  """
  @spec new :: t
  def new do
    %IntSet{}
  end

  @doc """
  Create an int set with some starting value.



  ## Examples

  You can create a set with a single starting value.

      iex> IntSet.new(0)
      #IntSet<[0]>

  You can also provide an enumerable of integers to start with.

      iex> IntSet.new([1, 2, 3])
      #IntSet<[1, 2, 3]>

  Lastly, you can initialize the set with a bit string.
  Binary strings are interpreted as little-endian, with the very first bit
  of the string representing the number zero.

      iex> IntSet.new(<<1 :: 1>>)
      #IntSet<[0]>

      iex> IntSet.new(<<0b1000_1000>>)
      #IntSet<[0, 4]>

      iex> IntSet.new(<<0 :: 1>>)
      #IntSet<[]>

  """
  @spec new(non_neg_integer | Enum.t() | bitstring) :: t
  def new(members)

  def new(bitstring) when is_bitstring(bitstring) do
    %IntSet{s: bitstring}
  end

  def new(int) when is_index(int) do
    new([int])
  end

  def new(enum) do
    list = enum |> Enum.sort() |> Enum.uniq()
    %IntSet{s: seqput(<<>>, list)}
  end

  defp seqput(bits, []) when is_bitstring(bits) do
    bits
  end

  defp seqput(bits, [next | rest]) when is_bitstring(bits) and is_integer(next) and bit_size(bits) <= next do
    pad_bits = next - bit_size(bits)
    new_bits = <<bits::bitstring, 0::size(pad_bits), 1::1>>
    seqput(new_bits, rest)
  end

  @doc """
  Create a new set that contains all of the elements of both x and y.

  ## Examples

      iex> a = IntSet.new(7)
      iex> b = IntSet.new(4)
      iex> IntSet.union(a, b)
      #IntSet<[4, 7]>

  """
  @spec union(t, t) :: t
  def union(x, y)

  def union(
    %IntSet{s: <<a :: 1, arest :: bitstring>>},
    %IntSet{s: <<b :: 1, brest :: bitstring>>}
  ) do
    %IntSet{s: tail_bin} = union new(arest), new(brest)
    %IntSet{s: <<(a ||| b) :: 1, tail_bin :: bitstring>>}
  end

  def union(%IntSet{} = a, %IntSet{s: <<>>}), do: a
  def union(%IntSet{s: <<>>}, %IntSet{} = b), do: b
  def union(%IntSet{s: <<>>}, %IntSet{s: <<>>}), do: %IntSet{}


  @doc """
  Returns a set that is `int_set1` without the members of `int_set2`.

  ## Examples

      iex> IntSet.difference(IntSet.new([1, 2]), IntSet.new([2, 3, 4]))
      #IntSet<[1]>

  """
  @spec difference(t, t) :: t
  def difference(int_set1, int_set2)

  def difference(%IntSet{s: a}, %IntSet{s: b}) do
    %IntSet{s: bitwise_bits(&bdiff/2, a, b)}
  end

  defp bdiff(a, b) when is_number(a) and is_number(b) do
    band(a, bnot(b))
  end

  defp bitwise_bits(fun, <<>>, <<>>) do
    <<fun.(0, 0)::8>>
  end

  defp bitwise_bits(fun, a, b) do
    # IO.puts "bitwise op on byte-lengths of #{byte_size(a)} and #{byte_size(b)}"
    max_bytes = max(byte_size(a), byte_size(b))
    max_bits =  max_bytes * 8

    <<abin::big-integer-size(max_bits)>> = right_pad(a, max_bytes)
    <<bbin::big-integer-size(max_bits)>> = right_pad(b, max_bytes)
    <<fun.(abin, bbin)::size(max_bits)>>
  end

  defp right_pad(bin, size_bytes) when is_bitstring(bin) and is_integer(size_bytes) and size_bytes > 0 do
    target_bit_size = size_bytes * 8
    pad_size = target_bit_size - bit_size(bin)
    if pad_size > 0 do
      <<bin::bitstring, 0::size(pad_size)>>
    else
      bin
    end
  end

  def disjoint?(%IntSet{s: <<>>}, %IntSet{s: _}), do: true
  def disjoint?(%IntSet{s: _}, %IntSet{s: <<>>}), do: true

  def disjoint?(%IntSet{s: a}, %IntSet{s: b}) do
    bitwise = bitwise_bits(&band/2, a, b)
    len = bit_size(bitwise)

    bitwise == <<0::size(len)>>
  end

  @doc """
  Add a value to the int set.

  ## Examples

      iex> set = IntSet.new()
      #IntSet<[]>
      iex> IntSet.put(set, 0)
      #IntSet<[0]>

  """
  @spec put(t, non_neg_integer) :: t
  def put(s, x)

  def put(%IntSet{s: s} = set, x) when is_index(x) and is_bitstring(s) do
    set_bit(set, x, 1)
  end

  @doc """
  Remove a number from the int set.

  ## Examples

      iex> set = IntSet.new(5)
      #IntSet<[5]>
      iex> IntSet.delete(set, 5)
      #IntSet<[]>

  """
  @spec delete(t, non_neg_integer) :: t
  def delete(set, x)

  def delete(%IntSet{s: s} = set, x) when is_index(x) and is_bitstring(s) and not can_contain(s, x) do
    set
  end

  def delete(%IntSet{s: s} = set, x) when can_contain(s, x) do
    set_bit(set, x, 0)
  end

  @spec set_bit(t, non_neg_integer, 0 | 1) :: t
  defp set_bit(%IntSet{} = set, i, x) when x in 0..1 do
    %IntSet{s: s} = ensure_capacity_for(set, i)
    <<pre :: size(i), _ :: 1, post :: bitstring>> = s
    %IntSet{s: <<pre :: size(i), x :: 1, post :: bitstring>>}
  end


  @spec ensure_capacity_for(t, non_neg_integer) :: t
  defp ensure_capacity_for(s, x)

  defp ensure_capacity_for(%IntSet{s: s} = set, x) when can_contain(s, x) do
    set
  end

  defp ensure_capacity_for(%IntSet{s: s}, x) when is_index(x) and bit_size(s) <= x do
    total_bits_needed = x + 1
    bits_to_add = total_bits_needed - bit_size(s)
    %IntSet{s: <<s :: bitstring, 0 :: size(bits_to_add)>>}
  end

  @doc """
  Get a bitstring representing the members of a set.

  ## Examples

      iex> IntSet.new(0) |> IntSet.bitstring()
      <<1::1>>

      iex> IntSet.new(5) |> IntSet.bitstring()
      <<0::1, 0::1, 0::1, 0::1, 0::1, 1::1>>

      iex> IntSet.new() |> IntSet.bitstring()
      <<>>

  """
  @spec bitstring(t) :: bitstring
  def bitstring(%IntSet{s: s}) do
    s
  end

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(s, opts) do
      int_list = Enum.into(s, []) |> Enum.sort()
      concat(["#IntSet<", to_doc(int_list, opts), ">"])
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
      when is_integer(i)
       and i >= 0

    def member?(%IntSet{}, x) when is_integer(x) and x < 0, do: {:ok, false}
    def member?(%IntSet{s: s}, x) when is_index(x) and bit_size(s) <= x, do: {:ok, false}
    def member?(%IntSet{s: <<0 :: 1, _rst :: bitstring>>}, 0), do: {:ok, false}
    def member?(%IntSet{s: <<1 :: 1, _rst :: bitstring>>}, 0), do: {:ok, true}

    def member?(%IntSet{s: s}, x)
    when is_index(x)
     and bit_size(s) > x
    do
      <<_ :: size(x), i :: 1, _ :: bitstring>> = s
      {:ok, i == 1}
    end

    def member?(%IntSet{}, _), do: {:error, __MODULE__}

    def slice(_) do
      {:error, __MODULE__}
    end

    def reduce(_, {:halt, acc}, _fun) do
      {:halted, acc}
    end

    def reduce(set, {:suspend, acc}, fun) do
      {:suspended, acc, &reduce(set, &1, fun)}
    end

    def reduce(%IntSet{s: <<>>}, {:cont, acc}, _fun) do
      {:done, acc}
    end

    def reduce(%IntSet{s: s}, {:cont, acc}, fun) do
      last_i = bit_size(s) - 1
      before_last_size = last_i
      <<h :: bitstring-size(before_last_size), last_flag :: 1>> = s

      rest = IntSet.new(h)

      if last_flag == 1 do
        reduce(rest, fun.(last_i, acc), fun)
      else
        reduce(rest, {:cont, acc}, fun)
      end
    end
  end
end
