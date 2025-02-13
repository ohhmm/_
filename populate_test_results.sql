INSERT INTO test_results (branch_id, commit_hash, test_name, status, platform) 
SELECT b.id, b.latest_commit, 'ci_build', 'fail', 'macos'
FROM branches b WHERE b.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO test_results (branch_id, commit_hash, test_name, status, platform) 
SELECT b.id, b.latest_commit, 'ci_build', 'fail', 'windows'
FROM branches b WHERE b.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO test_results (branch_id, commit_hash, test_name, status, platform) 
SELECT b.id, b.latest_commit, 'ci_build', 'pass', 'ubuntu'
FROM branches b WHERE b.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO test_results (branch_id, commit_hash, test_name, status, platform) 
SELECT b.id, b.latest_commit, 'ci_build', 'fail', 'macos'
FROM branches b WHERE b.name = 'devin/pr-278';
INSERT INTO test_results (branch_id, commit_hash, test_name, status, platform) 
SELECT b.id, b.latest_commit, 'ci_build', 'fail', 'windows'
FROM branches b WHERE b.name = 'devin/pr-278';
