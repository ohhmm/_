#define BOOST_TEST_MODULE MinimalVcpkgExampleTest
#include <boost/test/unit_test.hpp>
#include <boost/filesystem.hpp>

namespace fs = boost::filesystem;

BOOST_AUTO_TEST_CASE(test_filesystem)
{
    fs::path testPath = fs::current_path() / "test_directory";

    // Create a test directory
    BOOST_CHECK(fs::create_directory(testPath));

    // Check if the directory exists
    BOOST_CHECK(fs::exists(testPath));

    // Check if it's a directory
    BOOST_CHECK(fs::is_directory(testPath));

    // Remove the test directory
    BOOST_CHECK(fs::remove(testPath));

    // Check if the directory no longer exists
    BOOST_CHECK(!fs::exists(testPath));
}
