cmake_minimum_required(VERSION 3.15)

project(MinimalVcpkgExample)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable vcpkg integration
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "Vcpkg toolchain file")
endif()

# Find Boost
find_package(Boost REQUIRED COMPONENTS filesystem system)

# Find Boost Test separately
find_package(Boost REQUIRED COMPONENTS unit_test_framework)

# Add executable
add_executable(minimal_example main.cpp)

# Link Boost libraries
target_link_libraries(minimal_example Boost::filesystem Boost::system)

# Add test executable
add_executable(test_example test_main.cpp)

# Link Boost Test and Filesystem libraries
target_link_libraries(test_example Boost::unit_test_framework Boost::filesystem Boost::system)

# Platform-specific configurations
if(APPLE)
  # macOS specific configurations
  message(STATUS "Configuring for macOS")
  # Add any macOS specific flags or settings here
endif()
