-- Active Work Tracking
CREATE TABLE IF NOT EXISTS active_work (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT NOT NULL,        -- Unique session identifier
    branch_name TEXT,                -- Branch being worked on
    pr_number INTEGER,               -- Associated PR number
    task_description TEXT NOT NULL,  -- Current task description
    status TEXT NOT NULL,            -- 'active', 'paused', 'completed'
    started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    completed_at DATETIME,
    FOREIGN KEY (branch_name) REFERENCES branches(name)
);

-- Session Knowledge
CREATE TABLE IF NOT EXISTS session_knowledge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT NOT NULL,
    knowledge_type TEXT NOT NULL,    -- 'branch_status', 'build_config', 'test_status', etc.
    knowledge_key TEXT NOT NULL,     -- Specific identifier within the type
    knowledge_value TEXT NOT NULL,   -- The actual information
    priority INTEGER DEFAULT 0,      -- Higher number = more important
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME             -- When this knowledge becomes outdated
);

-- Session Notes
CREATE TABLE IF NOT EXISTS session_notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT NOT NULL,
    note_type TEXT NOT NULL,         -- 'observation', 'decision', 'warning', etc.
    content TEXT NOT NULL,
    context TEXT,                    -- Related branch/PR/component
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create indices for efficient querying
CREATE INDEX IF NOT EXISTS idx_active_work_session ON active_work(session_id, status);
CREATE INDEX IF NOT EXISTS idx_active_work_branch ON active_work(branch_name, status);
CREATE INDEX IF NOT EXISTS idx_session_knowledge ON session_knowledge(knowledge_type, knowledge_key);
CREATE INDEX IF NOT EXISTS idx_session_notes ON session_notes(session_id, note_type);
