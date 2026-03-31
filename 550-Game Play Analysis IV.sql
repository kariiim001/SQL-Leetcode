SELECT ROUND(
        COUNT(DISTINCT a.player_id) * 1.0 / (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ), 2
    ) AS fraction
FROM (
        SELECT player_id, MIN(event_date) AS first_log
        FROM Activity
        GROUP BY
            player_id
    ) a
    JOIN Activity b ON a.player_id = b.player_id
    AND b.event_date = a.first_log + INTERVAL '1 day';