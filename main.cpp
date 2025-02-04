#include <boost/lookup/lookup.hpp>
#include <boost/lookup/range_adapter.hpp>
#include <cstdint>
#include <iostream>
#include <array>
#include <ranges>

int main() {
    // Example 1: Basic lookup table with integer types
    auto fibonacci = [](std::size_t n) -> int {
        static boost::lookup::basic_lookup<boost::lookup::type_chain<int>> fib([](std::size_t n) -> int {
            if (n <= 1) return static_cast<int>(n);
            return fib[n-1] + fib[n-2];
        });
        return fib[n];
    };
    
    std::cout << "Fibonacci(10): " << fibonacci(10) << "\n";

    // Example 2: Using range adapter to work with composite types
    using adapter = boost::lookup::integer_range_adapter<std::uint8_t, std::uint32_t>;
    
    // Create a lookup table that stores 4 bytes as a single uint32
    boost::lookup::basic_lookup<boost::lookup::type_chain<std::uint32_t>> composite_table(
        [](std::size_t n) -> std::uint32_t {
            // Generate 4 bytes based on the index
            std::array<std::uint8_t, 4> bytes{{
                static_cast<std::uint8_t>(n & 0xFF),
                static_cast<std::uint8_t>((n >> 8) & 0xFF),
                static_cast<std::uint8_t>((n >> 16) & 0xFF),
                static_cast<std::uint8_t>((n >> 24) & 0xFF)
            }};
            return adapter::combine_small(std::ranges::ref_view(bytes));
        }
    );
    
    // Access individual bytes from the composite value
    std::uint32_t value = composite_table[0x12345678];
    for (auto byte : adapter::split_large(value)) {
        std::cout << std::hex << static_cast<int>(byte) << " ";
    }
    std::cout << "\n";
    
    return 0;
}
