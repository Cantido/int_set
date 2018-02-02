defmodule IntSet do
  use Bitwise
  @moduledoc """
  Efficiently store and index a set of non-negative integers.
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
    Enum.into(enum, IntSet.new())
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
        set, {:cont, elem} -> IntSet.put(set, elem)
        set, :done -> set
        _set, :halt -> :ok
      end

      {original, collector_fun}
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
