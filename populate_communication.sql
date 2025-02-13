INSERT INTO active_work (session_id, task_description, status) VALUES ('bcc45d2b8f73434abb28e1d87d979fa2', 'Setting up branch tracking and cross-session communication database', 'active');
INSERT INTO session_knowledge (session_id, knowledge_type, knowledge_key, knowledge_value, priority) VALUES 
('bcc45d2b8f73434abb28e1d87d979fa2', 'branch_status', 'devin/1739307546-fix-quadratic-system-test', 'CI failing on macOS and Windows', 2),
('bcc45d2b8f73434abb28e1d87d979fa2', 'branch_status', 'devin/pr-278', 'CI failing on macOS and Windows', 2),
('bcc45d2b8f73434abb28e1d87d979fa2', 'build_config', 'ubuntu-latest', 'Using Boost 1.83 with specific dependencies', 1);
INSERT INTO session_notes (session_id, note_type, content, context) VALUES 
('bcc45d2b8f73434abb28e1d87d979fa2', 'observation', 'Multiple branches showing similar CI failures on macOS/Windows', 'CI/CD'),
('bcc45d2b8f73434abb28e1d87d979fa2', 'decision', 'Created structured database for tracking branch status and relationships', 'Infrastructure');
