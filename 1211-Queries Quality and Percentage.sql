SELECT query_name,
    round(AVG (rating::numeric/position),2) AS quality,
    round(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100,2
        ) AS poor_query_percentage
from Queries
group by query_name