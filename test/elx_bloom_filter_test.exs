defmodule ElxBloomFilterTest do
  use ExUnit.Case
  doctest ElxBloomFilter

  test "create a new Bloom Filter" do
    assert ElxBloomFilter.new(10) != nil
  end

  test "adding element to Bloom Filter" do
    bloom_filter = ElxBloomFilter.new(10)
    assert ElxBloomFilter.has?(bloom_filter, 5) == false

    bloom_filter = ElxBloomFilter.add(bloom_filter, 5)
    assert ElxBloomFilter.has?(bloom_filter, 5) == true

    assert ElxBloomFilter.has?(bloom_filter, "missing") == false
  end

  test "adding many items and checking all should return true" do
    capacity = 100
    items = 1..capacity |> Enum.map(fn _ -> :rand.uniform(1_000) end)

    bloom_filter =
      items
      |> Enum.reduce(ElxBloomFilter.new(capacity), &ElxBloomFilter.add(&2, &1))

    has_all_items =
      items
      |> Enum.all?(&ElxBloomFilter.has?(bloom_filter, &1))

    assert has_all_items == true
  end

  test "adding many items, change one item value and checking all should return false" do
    capacity = 100
    items = 1..capacity |> Enum.map(fn _ -> :rand.uniform(1_000) end)

    bloom_filter =
      items
      |> Enum.reduce(ElxBloomFilter.new(capacity), &ElxBloomFilter.add(&2, &1))

    items = [1001 | items]

    has_all_items =
      items
      |> Enum.all?(&ElxBloomFilter.has?(bloom_filter, &1))

    assert has_all_items == false
  end
end
