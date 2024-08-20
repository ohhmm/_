#include <iostream>
#include <boost/filesystem.hpp>
#include <boost/multiprecision/cpp_int.hpp>

namespace fs = boost::filesystem;

bool create_and_remove_directory(const fs::path& dir_path) {
    try {
        // Create a directory
        if (fs::create_directory(dir_path)) {
            std::cout << "Directory created: " << dir_path << std::endl;
        } else {
            std::cout << "Failed to create directory: " << dir_path << std::endl;
            return false;
        }

        // Check if the directory exists
        if (fs::exists(dir_path) && fs::is_directory(dir_path)) {
            std::cout << "Directory exists: " << dir_path << std::endl;
        } else {
            std::cout << "Directory does not exist: " << dir_path << std::endl;
            return false;
        }

        // Remove the directory
        if (fs::remove(dir_path)) {
            std::cout << "Directory removed: " << dir_path << std::endl;
        } else {
            std::cout << "Failed to remove directory: " << dir_path << std::endl;
            return false;
        }

        return true;
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem error: " << e.what() << std::endl;
        return false;
    }
}

int main() {
    std::cout << "Minimal Vcpkg Example with Boost" << std::endl;

    fs::path currentPath = fs::current_path();
    std::cout << "Current path: " << currentPath << std::endl;

    boost::multiprecision::cpp_int integer("1611325717485760473619572118452005010644023874549669517476371250496071834282353275703306475315385411110721798095697231109437131380755198764527042761567968838933044413349");
    std::cout << "boost::cpp_int integer = " << integer << std::endl;

    fs::path testDir = currentPath / "test_directory";
    bool success = create_and_remove_directory(testDir);

    if (success) {
        std::cout << "Directory operations successful" << std::endl;
    } else {
        std::cout << "Directory operations failed" << std::endl;
    }

    return 0;
}
