# OpenMind Project Knowledge Base

## Active Work Tracking
The `context` branch in `ohhmm/_` repository contains a SQLite database (`branch_tracking.db`) for tracking:
- Branch status and relationships
- CI/CD status history
- Build configurations
- Test results
- Cross-session communication
- Build performance metrics
- Dependency resolution patterns

### Database Tables
1. Core Tables:
   - branches
   - rebase_status
   - pull_requests
   - branch_relationships
   - build_configurations
   - test_results
   - ci_status_history
   - commit_patterns

2. Communication Tables:
   - active_work
   - session_knowledge
   - session_notes

3. Performance Tables:
   - build_performance (tracks build metrics across platforms)
   - dependency_patterns (tracks package resolution patterns)

### Usage
To access session information:
```sql
-- Get active work
SELECT * FROM active_work WHERE status = 'active';

-- Get latest session knowledge
SELECT * FROM session_knowledge ORDER BY priority DESC, created_at DESC;

-- Get recent session notes
SELECT * FROM session_notes ORDER BY created_at DESC;
```

### Current Status (as of Feb 13, 2025)
- Tracking 65 branches
- 21 branches contain latest main commit (476faef)
- 2 active PRs (#758, #365) with CI issues on macOS/Windows
- 216 identified branch relationships
