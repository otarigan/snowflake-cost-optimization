WITH longQueries AS(
  SELECT
    role_name
    , total_elapsed_time
    , RANK() OVER (PARTITION BY role_name ORDER BY total_elapsed_time) AS elapsed_ranking
  FROM
    SNOWFLAKE.INFORMATION_SCHEMA.QUERY_HISTORY
  GROUP BY 
    role_name
)

SELECT
  role_name
  , total_elapsed_time
FROM
  longQueries
WHERE elapsed_ranking <= 50
GROUP BY role_name
