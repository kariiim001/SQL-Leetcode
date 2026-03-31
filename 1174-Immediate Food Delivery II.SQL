WITH
    cte AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY
                    customer_id
                ORDER BY order_date
            ) AS order_num,
            CASE
                WHEN (
                    order_date = customer_pref_delivery_date
                ) THEN 'immediate'
                ELSE 'scheduled'
            END AS delivery_type
        from Delivery
    )

SELECT ROUND(
        SUM(
            CASE
                WHEN delivery_type = 'immediate' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*), 2
    ) AS immediate_percentage
FROM cte
where
    order_num = 1