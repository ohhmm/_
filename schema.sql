-- Branch information table
CREATE TABLE IF NOT EXISTS branches (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    latest_commit TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Rebase status tracking
CREATE TABLE IF NOT EXISTS rebase_status (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    main_commit TEXT NOT NULL,
    rebased_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Pull request information
CREATE TABLE IF NOT EXISTS pull_requests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    pr_number INTEGER NOT NULL,
    status TEXT NOT NULL,
    checks_status TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Branch relationships
CREATE TABLE IF NOT EXISTS branch_relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_branch_id INTEGER,
    target_branch_id INTEGER,
    relationship_type TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (source_branch_id) REFERENCES branches(id),
    FOREIGN KEY (target_branch_id) REFERENCES branches(id)
);
