#ifndef BOOST_LOOKUP_PERSISTENCE_HPP
#define BOOST_LOOKUP_PERSISTENCE_HPP

/*!
 * @file persistence.hpp
 * @brief Memory-mapped file persistence for Boost.Lookup
 *
 * This header provides memory-mapped file persistence support for lookup tables,
 * enabling efficient storage and retrieval of large datasets with minimal
 * memory overhead.
 */

#include <boost/iostreams/device/mapped_file.hpp>
#include <boost/serialization/vector.hpp>
#include <filesystem>
#include <memory>
#include <fstream>
#include <cstring>

namespace boost {
namespace lookup {

/// @brief Memory-mapped file storage for lookup tables
/// @tparam TypeChain Chain of integer types for hierarchical type relationships
template<typename TypeChain>
class persistent_storage {
    static_assert(std::is_integral_v<typename TypeChain::type> || Serializable<typename TypeChain::type>,
                "Type must be either integral or implement Boost serialization");

public:
    using value_type = typename TypeChain::type;
    using next_type = typename TypeChain::next_type;
    using size_type = std::size_t;
    static constexpr bool has_next = TypeChain::has_next;
    
    /// @brief Creates or opens a memory-mapped file for persistent storage
    /// @param path Path to the storage file
    /// @param initial_size Initial size of the storage in elements
    explicit persistent_storage(const std::filesystem::path& path, size_type initial_size = 1024)
        : file_path_(path) {
        const auto file_size = sizeof(value_type) * initial_size;
        
        if (!std::filesystem::exists(path)) {
            std::ofstream file(path, std::ios::binary);
            std::vector<std::byte> init_data(file_size);
            std::memset(init_data.data(), 0, file_size);
            file.write(reinterpret_cast<const char*>(init_data.data()), file_size);
            file.close();
        }
        
        boost::iostreams::mapped_file_params params;
        params.path = path.string();
        params.flags = boost::iostreams::mapped_file::readwrite;
        params.length = std::filesystem::file_size(path);
        
        mapped_file_.open(params);
        if (!mapped_file_.is_open()) {
            throw std::runtime_error("Failed to open memory mapped file");
        }
        
        data_ = reinterpret_cast<value_type*>(mapped_file_.data());
        size_ = mapped_file_.size() / sizeof(value_type);
    }
    
    /// @brief Synchronizes memory-mapped file with disk
    void sync() {
        // No explicit sync needed for mapped_file
        // The OS will handle dirty page writeback
    }
    
    ~persistent_storage() {
        if (mapped_file_.is_open()) {
            sync();
            mapped_file_.close();
        }
    }
    
    /// @brief Access a value in the persistent storage
    /// @param index Index to access
    /// @return Value at the given index
    value_type operator[](size_type index) const {
        if (index >= size_) {
            throw std::out_of_range("Index out of bounds");
        }
        return data_[index];
    }
    
    /// @brief Sets a value in the persistent storage
    /// @param index Index to set
    /// @param value Value to store
    void set_value(size_type index, const value_type& value) {
        if (index >= size_) {
            throw std::out_of_range("Index out of bounds");
        }
        data_[index] = value & ((1ULL << (sizeof(value_type) * 8)) - 1);
    }
    
    size_type size() const noexcept {
        return size_;
    }
    
    void grow(size_type new_size) {
        if (new_size <= size_) return;
        
        const auto new_file_size = sizeof(value_type) * new_size;
        mapped_file_.close();
        
        // Extend the file with zero-initialized data
        std::ofstream file(file_path_, std::ios::binary | std::ios::app);
        std::vector<std::byte> init_data((new_size - size_) * sizeof(value_type));
        std::memset(init_data.data(), 0, init_data.size());
        file.write(reinterpret_cast<const char*>(init_data.data()), init_data.size());
        file.close();
        
        boost::iostreams::mapped_file_params params;
        params.path = file_path_.string();
        params.flags = boost::iostreams::mapped_file::readwrite;
        params.length = new_file_size;
        
        mapped_file_.open(params);
        if (!mapped_file_.is_open()) {
            throw std::runtime_error("Failed to open memory mapped file after resize");
        }
        
        data_ = reinterpret_cast<value_type*>(mapped_file_.data());
        size_ = new_size;
    }
    
    template<typename Archive>
    void serialize(Archive& ar, const unsigned int version) {
        ar & size_;
        if (Archive::is_loading::value) {
            grow(size_);
            for (size_type i = 0; i < size_; ++i) {
                ar & data_[i];
            }
        } else {
            for (size_type i = 0; i < size_; ++i) {
                ar & data_[i];
            }
        }
    }

private:
    std::filesystem::path file_path_;
    boost::iostreams::mapped_file mapped_file_;
    value_type* data_;
    size_type size_;
};

} // namespace lookup
} // namespace boost

#endif // BOOST_LOOKUP_PERSISTENCE_HPP
