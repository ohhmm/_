cmake_minimum_required(VERSION 3.15)

project(boost-lookup VERSION 0.1.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable vcpkg integration
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "Vcpkg toolchain file")
endif()

# Find Boost
find_package(Boost REQUIRED COMPONENTS
    filesystem
    system
    unit_test_framework
    serialization
    iostreams
)

# Add library target
add_library(boost_lookup INTERFACE)
target_include_directories(boost_lookup INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)
target_link_libraries(boost_lookup INTERFACE
    Boost::serialization
    Boost::iostreams
    Boost::filesystem
    Boost::system
)

# Add example executable
add_executable(lookup_example main.cpp)
target_link_libraries(lookup_example PRIVATE boost_lookup)

# Add test executable
add_executable(lookup_test test_main.cpp)
target_link_libraries(lookup_test PRIVATE
    boost_lookup
    Boost::unit_test_framework
)

enable_testing()
add_test(NAME lookup_test COMMAND lookup_test)

# Platform-specific configurations
if(APPLE)
    message(STATUS "Configuring for macOS")
endif()
