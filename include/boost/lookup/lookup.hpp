#ifndef BOOST_LOOKUP_HPP
#define BOOST_LOOKUP_HPP

/*!
 * @file lookup.hpp
 * @brief Main header for the Boost.Lookup library
 *
 * This header provides the core functionality for creating and managing
 * immutable lookup tables with O(1) access time and type-safe integer
 * conversions using type chains.
 */

#include <boost/config.hpp>
#include <boost/serialization/access.hpp>
#include <boost/serialization/vector.hpp>
#include <boost/serialization/split_member.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <ranges>
#include <memory>
#include <type_traits>
#include <concepts>

namespace boost {
namespace lookup {

/// Concept for types that support Boost serialization
template<typename T>
concept Serializable = requires(T t, boost::archive::text_oarchive& oa) {
    { t.serialize(oa, 0) } -> std::same_as<void>;
};

/// Type chain for building hierarchical integer type relationships
template<typename... Types>
struct type_chain;

/// Base case for type chain with single type
template<typename T>
struct type_chain<T> {
    using type = T;
    using next_type = void;
    static constexpr bool has_next = false;
};

/// Recursive case for type chain with multiple types
template<typename T, typename... Rest>
struct type_chain<T, Rest...> {
    using type = T;
    using next_type = type_chain<Rest...>;
    static constexpr bool has_next = true;
};

/// @brief Immutable lookup table with O(1) access time and type-safe conversions
/// @tparam TypeChain Chain of integer types for hierarchical type relationships
/// @tparam GrowthCallback Callback function type for computing new values
template<
    typename TypeChain,
    typename GrowthCallback = std::function<typename TypeChain::type(std::size_t)>
>
class basic_lookup {
    static_assert(std::is_integral_v<typename TypeChain::type> || Serializable<typename TypeChain::type>,
                "Type must be either integral or implement Boost serialization");
    
    friend class boost::serialization::access;

public:
    using value_type = typename TypeChain::type;
    using size_type = typename std::make_unsigned<std::ptrdiff_t>::type;
    using growth_callback_type = GrowthCallback;

    /// @brief Constructs a lookup table with the specified growth callback
    /// @param callback Function that computes values for new indices
    explicit basic_lookup(growth_callback_type callback) 
        : grow_callback_(std::move(callback)), data_() {}

    /// @brief Access a value in the lookup table, computing it if necessary
    /// @param index Index to access
    /// @return Reference to the value at the given index
    const value_type& operator[](size_type index) const {
        if (index >= size()) {
            grow_to(index + 1);
        }
        return data_[index];
    }

    size_type size() const noexcept {
        return data_.size();
    }

    /// @brief Serializes the lookup table using Boost serialization
    /// @tparam Archive Type of archive (text or binary)
    /// @param ar Archive to serialize to/from
    /// @param version Version number for serialization
    template<typename Archive>
    void serialize(Archive& ar, const unsigned int version) {
        ar & data_;
    }

    /// @brief Attaches persistent storage to the lookup table
    /// @tparam Storage Type of storage (must be compatible with TypeChain)
    /// @param storage Storage to attach
    template<typename Storage>
    void attach_storage(Storage& storage) {
        auto old_size = size();
        if (storage.size() < old_size) {
            storage.grow(old_size);
            for (size_type i = 0; i < old_size; ++i) {
                auto value = (*this)[i];
                storage.set_value(i, value);
            }
        }
        
        // Verify values after setting them
        for (size_type i = 0; i < old_size; ++i) {
            auto stored = storage[i];
            auto current = (*this)[i];
            if (stored != current) {
                throw std::runtime_error("Storage contains different values");
            }
        }
    }

    template<typename NextType = typename TypeChain::next_type>
    auto as_next() const -> std::enable_if_t<TypeChain::has_next, basic_lookup<NextType>> {
        using next_value_type = typename NextType::type;
        return basic_lookup<NextType>([this](size_type i) -> next_value_type {
            auto current = (*this)[i];
            return static_cast<next_value_type>(current);
        });
    }

    template<typename PrevType>
    static value_type convert_from(const typename PrevType::type& value) {
        return static_cast<value_type>(value);
    }

private:
    void grow_to(size_type new_size) const {
        const auto old_size = size();
        const_cast<basic_lookup*>(this)->data_.resize(new_size);
        for (size_type i = old_size; i < new_size; ++i) {
            const_cast<basic_lookup*>(this)->data_[i] = grow_callback_(i);
        }
    }

    mutable std::vector<value_type> data_;
    growth_callback_type grow_callback_;
};

} // namespace lookup
} // namespace boost

#endif // BOOST_LOOKUP_HPP
