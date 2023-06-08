SELECT
    t.table_name
    , t.table_schema
    , MAX(q.start_time) AS last_queried
    , COUNT(*) AS query_count
FROM
    INFORMATION_SCHEMA.tables   
LEFT JOIN
    ACCOUNT_USAGE.query_history
ON CONTAINS (q.query_text, q.table_name)
GROUP BY 
    table_name 
    , table_schema
ORDER BY 
    q.start_time ASC