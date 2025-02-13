INSERT INTO build_configurations (branch_id, platform, cmake_flags, vcpkg_packages)
SELECT id, 'ubuntu', '-DCMAKE_BUILD_TYPE=Debug -DOPENMIND_BUILD_TESTS=ON', 'boost-compute boost-filesystem boost-serialization leveldb foundationdb'
FROM branches WHERE name LIKE 'devin/%';

INSERT INTO build_configurations (branch_id, platform, cmake_flags, vcpkg_packages)
SELECT id, 'windows', '-DCMAKE_BUILD_TYPE=Debug -DOPENMIND_BUILD_TESTS=ON -DBOOST_ROOT=%BOOST_ROOT%', 'boost-compute boost-filesystem boost-serialization leveldb'
FROM branches WHERE name LIKE 'devin/%';

INSERT INTO build_configurations (branch_id, platform, cmake_flags, vcpkg_packages)
SELECT id, 'macos', '-DCMAKE_BUILD_TYPE=Debug -DOPENMIND_BUILD_TESTS=ON', 'boost-compute boost-filesystem boost-serialization leveldb'
FROM branches WHERE name LIKE 'devin/%';
