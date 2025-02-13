-- Build Performance Metrics
CREATE TABLE IF NOT EXISTS build_performance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    platform TEXT NOT NULL,
    build_phase TEXT NOT NULL,    -- 'configure', 'compile', 'link', 'test'
    duration_seconds INTEGER,
    memory_usage_mb INTEGER,
    cpu_usage_percent INTEGER,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Dependency Resolution Patterns
CREATE TABLE IF NOT EXISTS dependency_patterns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    platform TEXT NOT NULL,
    package_name TEXT NOT NULL,
    resolution_status TEXT NOT NULL,  -- 'success', 'conflict', 'missing'
    resolution_time_seconds INTEGER,
    error_message TEXT,
    fix_suggestion TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create indices for efficient querying
CREATE INDEX IF NOT EXISTS idx_build_perf_branch ON build_performance(branch_id, platform);
CREATE INDEX IF NOT EXISTS idx_build_perf_phase ON build_performance(build_phase, duration_seconds);
CREATE INDEX IF NOT EXISTS idx_dep_patterns ON dependency_patterns(platform, package_name);
