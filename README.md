# ElxBloomFilter

## Description
Simple implementation of a Bloom Filter. The code is based on the article [Implementing a bloom filter in elixir](https://arpanghoshal3.medium.com/implementing-a-bloom-filter-in-elixir-bc30cdcb10e2) from [Arpan Ghoshal](https://arpanghoshal3.medium.com/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elx_bloom_filter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elx_bloom_filter, "~> 0.1.0"}
  ]
end
```

## Usage
```
capacity = 10
bloom_filter = ElxBloomFilter.new(capacity)

item_to_add = 5
bloom_filter = ElxBloomFilter.add(bloom_filter, item_to_add)

ElxBloomFilter.has?(bloom_filter, item_to_add)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elx_bloom_filter>.

