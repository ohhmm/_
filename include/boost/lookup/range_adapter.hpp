#ifndef BOOST_LOOKUP_RANGE_ADAPTER_HPP
#define BOOST_LOOKUP_RANGE_ADAPTER_HPP

/*!
 * @file range_adapter.hpp
 * @brief STL range adapters for integer type conversions
 *
 * This header provides range-based adapters for converting between different
 * integer sizes, enabling type-safe conversions and efficient handling of
 * composite integer types.
 */

#include <boost/config.hpp>
#include <ranges>
#include <type_traits>

namespace boost {
namespace lookup {

/// @brief Adapter for converting between different integer sizes using STL ranges
/// @tparam SmallType Smaller integer type (e.g., uint8_t)
/// @tparam LargeType Larger integer type (e.g., uint32_t)
template<typename SmallType, typename LargeType>
class integer_range_adapter {
    static_assert(std::is_integral_v<SmallType>, "SmallType must be integral");
    static_assert(std::is_integral_v<LargeType>, "LargeType must be integral");
    static_assert(sizeof(SmallType) < sizeof(LargeType), "SmallType must be smaller than LargeType");

public:
    using small_type = SmallType;
    using large_type = LargeType;
    static constexpr std::size_t elements_per_large = sizeof(LargeType) / sizeof(SmallType);

    /// @brief Splits a large integer into a range of smaller integers
    /// @param value Large integer to split
    /// @return Range of smaller integers
    static auto split_large(const large_type& value) {
        return std::views::iota(std::size_t{0}, elements_per_large)
            | std::views::transform([value](std::size_t i) {
                return static_cast<small_type>((value >> (i * (sizeof(small_type) * 8))) & small_type_mask);
            });
    }

    /// @brief Combines a range of small integers into a single large integer
    /// @tparam R Range type containing small integers
    /// @param small_values Range of small integers to combine
    /// @return Combined large integer
    template<std::ranges::input_range R>
    static large_type combine_small(R&& small_values) {
        large_type result = 0;
        std::size_t i = 0;
        for (const auto& value : small_values) {
            if (i >= elements_per_large) break;
            result |= static_cast<large_type>(value) << (i * (sizeof(small_type) * 8));
            ++i;
        }
        return result;
    }

private:
    static constexpr large_type small_type_mask = 
        (static_cast<large_type>(1) << (sizeof(small_type) * 8)) - 1;
};

} // namespace lookup
} // namespace boost

#endif // BOOST_LOOKUP_RANGE_ADAPTER_HPP
