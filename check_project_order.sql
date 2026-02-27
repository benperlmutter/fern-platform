SELECT 
    p.name,
    COUNT(tr.id) as test_run_count,
    MAX(tr.start_time) as last_run_time,
    COUNT(CASE WHEN tr.start_time >= NOW() - INTERVAL '6 months' THEN 1 END) as runs_last_6_months
FROM project_details p
LEFT JOIN test_runs tr ON p.project_id = tr.project_id
GROUP BY p.name, p.project_id
ORDER BY MAX(tr.start_time) DESC NULLS LAST
LIMIT 10;
