-- Build Configuration Tracking
CREATE TABLE IF NOT EXISTS build_configurations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    platform TEXT NOT NULL,      -- 'ubuntu', 'macos', 'windows'
    cmake_flags TEXT,
    vcpkg_packages TEXT,
    compiler_version TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Test Results History
CREATE TABLE IF NOT EXISTS test_results (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    commit_hash TEXT NOT NULL,
    test_name TEXT NOT NULL,
    status TEXT NOT NULL,        -- 'pass', 'fail', 'skip'
    duration_ms INTEGER,
    error_message TEXT,
    platform TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Create indices for efficient querying
CREATE INDEX IF NOT EXISTS idx_build_config_branch ON build_configurations(branch_id, platform);
CREATE INDEX IF NOT EXISTS idx_test_results_branch ON test_results(branch_id, test_name);
CREATE INDEX IF NOT EXISTS idx_test_results_status ON test_results(status, platform);
