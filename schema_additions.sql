-- CI Status History
CREATE TABLE IF NOT EXISTS ci_status_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    commit_hash TEXT NOT NULL,
    platform TEXT NOT NULL,  -- 'ubuntu', 'macos', 'windows'
    status TEXT NOT NULL,    -- 'success', 'failure', 'pending'
    build_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Commit Message Analysis
CREATE TABLE IF NOT EXISTS commit_patterns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    commit_hash TEXT NOT NULL,
    type TEXT,              -- 'fix', 'feat', 'refactor', etc.
    scope TEXT,             -- component affected
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Branch Dependencies
CREATE TABLE IF NOT EXISTS branch_dependencies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dependent_branch_id INTEGER,
    dependency_branch_id INTEGER,
    dependency_type TEXT,   -- 'requires', 'conflicts', 'related'
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dependent_branch_id) REFERENCES branches(id),
    FOREIGN KEY (dependency_branch_id) REFERENCES branches(id)
);

-- Create indices for better query performance
CREATE INDEX IF NOT EXISTS idx_ci_status_branch ON ci_status_history(branch_id, created_at);
CREATE INDEX IF NOT EXISTS idx_commit_patterns_branch ON commit_patterns(branch_id, type);
CREATE INDEX IF NOT EXISTS idx_branch_dependencies ON branch_dependencies(dependent_branch_id, dependency_branch_id);
