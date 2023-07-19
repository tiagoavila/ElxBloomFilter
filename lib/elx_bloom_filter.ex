defmodule ElxBloomFilter do
  @moduledoc """
  Documentation for `ElxBloomFilter`.
  """

  @multiplier 10

  # Seed values for hash functions
  @seed {9_881_409, 7_740_287, 1_822_091, 6_436_985, 6_108_165, 9_294_15, 1_815_555, 1_670_246, 7_190_510, 1_923_245}

  # The number of hash functions to use
  @hashfunctions_count 6

  defmodule Bloom do
    defstruct bit_array: <<>>, capacity: 0, bit_array_length: 0
  end

  @spec new(pos_integer) :: any
  def new(capacity) when is_integer(capacity) and capacity > 0 do
    bit_array_length = capacity * @multiplier

    %Bloom{bit_array: <<0::size(bit_array_length)>>, capacity: capacity, bit_array_length: bit_array_length}
  end

  def add(bloom_filter, value) do
    updated_bit_array = 1..@hashfunctions_count
    |> Enum.reduce(bloom_filter.bit_array, fn i, bit_array ->
      index =
        value
        |> Murmur.hash_x86_32(elem(@seed, i))
        |> rem(bloom_filter.bit_array_length)

      set_bit_in_array(bit_array, index)
    end)

    %{bloom_filter | bit_array: updated_bit_array} |> IO.inspect()
  end

  def has?(bloom_filter, value) do

  end

  defp set_bit_in_array(bit_array, index) do
    <<prefix::size(index), val::size(1), rest::bits>> = bit_array
    # set the bit only if its not set
    if val != 1 do
      <<prefix::size(index), 1::size(1), rest::bits>>
    else
      bit_array
    end
  end
end
