-- Delete existing knowledge base entries to avoid duplication
DELETE FROM session_knowledge WHERE knowledge_type = 'consolidated_knowledge';
DELETE FROM session_knowledge WHERE knowledge_type = 'contradictions';

-- Insert the consolidated knowledge base with high priority
INSERT INTO session_knowledge (
    session_id,
    knowledge_type,
    knowledge_key,
    knowledge_value,
    priority,
    created_at
) VALUES (
    'devin-session-e110e42208f64ec986ec4c9e05597cb2',
    'consolidated_knowledge',
    'openmind_knowledge_base',
    readfile('consolidated_knowledge_export.md'),
    10,
    datetime('now')
);

-- Insert the contradictions document with high priority
INSERT INTO session_knowledge (
    session_id,
    knowledge_type,
    knowledge_key,
    knowledge_value,
    priority,
    created_at
) VALUES (
    'devin-session-e110e42208f64ec986ec4c9e05597cb2',
    'contradictions',
    'openmind_contradictions',
    readfile('contradictions_export.md'),
    9,
    datetime('now')
);
