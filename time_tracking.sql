-- Time metrics tracking
CREATE TABLE IF NOT EXISTS time_metrics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id INTEGER,
    metric_type TEXT NOT NULL,    -- 'review_time', 'ci_time', 'rebase_time', etc.
    duration_seconds INTEGER,
    started_at DATETIME,
    completed_at DATETIME,
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Create index for efficient time metric queries
CREATE INDEX IF NOT EXISTS idx_time_metrics_branch ON time_metrics(branch_id, metric_type);
