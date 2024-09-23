#include <iostream>
#include <boost/filesystem.hpp>

namespace fs = boost::filesystem;

int main() {
    std::cout << "Minimal Vcpkg Example with Boost" << std::endl;

    fs::path currentPath = fs::current_path();
    std::cout << "Current path: " << currentPath << std::endl;

    return 0;
}
