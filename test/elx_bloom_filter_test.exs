defmodule ElxBloomFilterTest do
  use ExUnit.Case
  doctest ElxBloomFilter

  test "create a new Bloom Filter" do
    assert ElxBloomFilter.new(10) != nil
  end

  test "adding element to Bloom Filter" do
    bloom_filter = ElxBloomFilter.new(10)
    bloom_filter = ElxBloomFilter.add(bloom_filter, 5)
    assert bloom_filter != nil
  end
end
