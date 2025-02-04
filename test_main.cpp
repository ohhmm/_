#define BOOST_TEST_MODULE lookup_test
#include <boost/test/included/unit_test.hpp>
#include <boost/lookup/lookup.hpp>
#include <boost/lookup/range_adapter.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/lookup/persistence.hpp>
#include <sstream>
#include <filesystem>

BOOST_AUTO_TEST_CASE(basic_lookup_test) {
    using chain = boost::lookup::type_chain<int>;
    boost::lookup::basic_lookup<chain> table([](std::size_t i) { return i * 2; });
    
    BOOST_CHECK_EQUAL(table[0], 0);
    BOOST_CHECK_EQUAL(table[1], 2);
    BOOST_CHECK_EQUAL(table[5], 10);
}

BOOST_AUTO_TEST_CASE(type_chain_test) {
    using chain = boost::lookup::type_chain<std::uint8_t, std::uint16_t, std::uint32_t>;
    boost::lookup::basic_lookup<chain> table([](std::size_t i) { return i & 0xFF; });
    
    auto table16 = table.as_next();
    auto table32 = table16.as_next();
    
    BOOST_CHECK_EQUAL(table[5], 5);
    BOOST_CHECK_EQUAL(table16[5], 5);
    BOOST_CHECK_EQUAL(table32[5], 5);
}

BOOST_AUTO_TEST_CASE(serialization_test) {
    using chain = boost::lookup::type_chain<int>;
    boost::lookup::basic_lookup<chain> table([](std::size_t i) { return i * 2; });
    
    // Fill some data
    table[5];
    
    // Serialize
    std::stringstream ss;
    {
        boost::archive::text_oarchive oa(ss);
        oa << table;
    }
    
    // Deserialize
    boost::lookup::basic_lookup<chain> loaded([](std::size_t i) { return 0; });
    {
        boost::archive::text_iarchive ia(ss);
        ia >> loaded;
    }
    
    BOOST_CHECK_EQUAL(loaded[5], 10);
}

BOOST_AUTO_TEST_CASE(type_chain_persistence_test) {
    using chain = boost::lookup::type_chain<std::uint8_t, std::uint16_t, std::uint32_t>;
    const auto test_file = std::filesystem::temp_directory_path() / "test_lookup.dat";
    
    {
        // Create and populate the lookup table with uint8_t values
        boost::lookup::basic_lookup<chain> table([](std::size_t i) { 
            return static_cast<std::uint8_t>(i & 0xFF); 
        });
        
        // Create storage and fill it
        boost::lookup::persistent_storage<chain> storage(test_file, 10);
        for (std::size_t i = 0; i < 10; ++i) {
            storage.set_value(i, static_cast<std::uint8_t>(i & 0xFF));
        }
        
        // Attach storage and verify values
        table.attach_storage(storage);
        table.attach_storage(storage);
        
        // Get next type in chain
        auto table16 = table.as_next();
        BOOST_CHECK_EQUAL(table16[5], 5);
        
        // Get final type in chain
        auto table32 = table16.as_next();
        BOOST_CHECK_EQUAL(table32[5], 5);
        
        // Verify persistence
        storage.sync();
    }
    
    {
        // Reload from storage
        boost::lookup::persistent_storage<chain> storage(test_file);
        BOOST_CHECK_EQUAL(storage[5], 5);
        
        // Create new table and attach to existing storage
        boost::lookup::basic_lookup<chain> new_table([](std::size_t i) { return static_cast<std::uint8_t>(i & 0xFF); });
        BOOST_CHECK_NO_THROW(new_table.attach_storage(storage));
    }
    
    std::filesystem::remove(test_file);
}
