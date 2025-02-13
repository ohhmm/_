INSERT INTO branches (name, latest_commit) VALUES ('devin/pr-278', 'c3055d8097c0adf60bd2d607f855c2b6b96805a5');
INSERT INTO pull_requests (branch_id, pr_number, status) SELECT id, 365, 'open' FROM branches WHERE name = 'devin/pr-278';
