with
    cte as (
        select requester_id as id, accepter_id
        from RequestAccepted
        union
        select
            accepter_id as id,
            requester_id as accepter_id
        from RequestAccepted
    )

select id, count(distinct accepter_id) as num
from cte
group by
    id
order by num desc
limit 1