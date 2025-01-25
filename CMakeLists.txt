cmake_minimum_required(VERSION 3.15)

project(MinimalVcpkgExample)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable verbose output
set(CMAKE_VERBOSE_MAKEFILE ON)

# Enable testing
enable_testing()

# Enable vcpkg integration
option(VCPKG_TOOLCHAIN_PATH "Path to vcpkg toolchain file" "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "${VCPKG_TOOLCHAIN_PATH}"
      CACHE STRING "Vcpkg toolchain file")
endif()

# Optional RDMA support
option(ENABLE_RDMA "Enable RDMA support" OFF)

# Find required packages with error handling
find_package(Boost REQUIRED COMPONENTS
        filesystem
        multiprecision
        system
        unit_test_framework
)

# Find SPDK with explicit error handling and verbose output
find_package(cpprestsdk CONFIG)
find_package(spdk CONFIG)

# Print SPDK information
message(STATUS "SPDK_INCLUDE_DIRS: ${SPDK_INCLUDE_DIRS}")
message(STATUS "SPDK_LIBRARIES: ${SPDK_LIBRARIES}")

# Add executable
add_executable(minimal_example main.cpp)

# Include SPDK directories
target_include_directories(minimal_example PRIVATE ${SPDK_INCLUDE_DIRS})

# Link Boost and SPDK libraries
target_link_libraries(minimal_example
        Boost::filesystem
        Boost::multiprecision
        Boost::system
        #spdk::spdk
)

# Add test executable
add_executable(test_example test_main.cpp)

# Include SPDK directories for test executable
target_include_directories(test_example PRIVATE ${SPDK_INCLUDE_DIRS})

# Link Boost Test and SPDK libraries
target_link_libraries(test_example
        Boost::unit_test_framework
        Boost::filesystem
        Boost::system
        #spdk::spdk
)

# Add test to CTest
add_test(NAME FilesystemTest COMMAND test_example)

# Platform-specific configurations
if(APPLE)
  # macOS specific configurations
  message(STATUS "Configuring for macOS")
  # Add any macOS specific flags or settings here
endif()
