# Boost.Lookup

A high-performance, persistent immutable lookup table library for C++20.

## Overview

Boost.Lookup provides a template-based implementation of immutable lookup tables with the following features:
- O(1) lookup access time
- Memory-mapped file persistence
- Dynamic growth via callback
- Type-safe integer conversions using STL ranges
- Dense storage (no sparse tables)
- Variadic template support for type chains

## Requirements

- C++20 compiler
- Boost libraries:
  - Serialization
  - IOStreams
  - Filesystem
  - Test (for testing)

## Installation

Using vcpkg:
```bash
vcpkg install boost-lookup
```

## Basic Usage

```cpp
#include <boost/lookup/lookup.hpp>
#include <cstdint>

// Create a lookup table for Fibonacci numbers
boost::lookup::basic_lookup<boost::lookup::type_chain<int>> fibonacci(
    [](std::size_t n) -> int {
        if (n <= 1) return n;
        return fibonacci[n-1] + fibonacci[n-2];
    }
);

// Access values
int fib_10 = fibonacci[10]; // Computed and cached automatically

// Using type chains for integer conversions
using chain = boost::lookup::type_chain<std::uint8_t, std::uint16_t, std::uint32_t>;
boost::lookup::basic_lookup<chain> table([](std::size_t i) { 
    return static_cast<std::uint8_t>(i & 0xFF); 
});

// Access through type chain
auto table16 = table.as_next();    // uint16_t view
auto table32 = table16.as_next();  // uint32_t view
```

## Features

### Type Chains

Type chains allow you to create hierarchical relationships between integer types:
```cpp
using chain = boost::lookup::type_chain<std::uint8_t, std::uint16_t, std::uint32_t>;
```

### Persistence

Memory-mapped file persistence with atomic updates:
```cpp
#include <boost/lookup/persistence.hpp>

boost::lookup::persistent_storage<chain> storage("lookup.dat", 1024);
table.attach_storage(storage);
```

### Range Adapters

STL range support for type conversions:
```cpp
#include <boost/lookup/range_adapter.hpp>

using adapter = boost::lookup::integer_range_adapter<std::uint8_t, std::uint32_t>;
auto bytes = adapter::split_large(value);
auto combined = adapter::combine_small(bytes);
```

## Building

```bash
cmake -B build -S .
cmake --build build
```

## Testing

```bash
cmake -B build -S . -DBUILD_TESTING=ON
cmake --build build
ctest --test-dir build
```

## License

Distributed under the Boost Software License, Version 1.0.
