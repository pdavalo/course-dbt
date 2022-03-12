* How many users do we have?

select 
  count(distinct(user_id)) 
from 
  dbt_pablo_d.stg_users

> 130


* On average, how many orders do we receive per hour?

select 
  avg(cnt)
from
  (select 
    date_trunc('hour', created_at) "hour", 
    count(*) as cnt
  from 
    dbt_pablo_d.stg_orders
  group by 
    hour) "count_per_hour"

> 7.52


* On average, how long does an order take from being placed to being delivered?

select 
  avg(deliv_times.deliv_time) 
from
  (select 
    (delivered_at - created_at) as deliv_time
  from 
    dbt_pablo_d.stg_orders
  where 
    status = 'delivered') "deliv_times"

> 3 days 21:24:11.803279


* How many users have made only 1 purchase? Two purchases? 3+ purchases? 

select 
  nb_purchases_v2,
  count(*) as nb_users
  from
    (select 
      user_id,
      case 
        when nb_purchases = 1 then '1'
        when nb_purchases = 2 then '2'
        when nb_purchases >= 3 then '3+'
      end as "nb_purchases_v2"
    from 
      (select 
        user_id, 
        count(*) as "nb_purchases"
      from 
        dbt_pablo_d.stg_orders
      group by 
        user_id) as "count_purchases") as "count_purchases_v2"
  group by 
    nb_purchases_v2

1 --> 25
2 --> 28
3+ --> 71


* On average, how many unique sessions do we have per hour?

select 
  avg(nb_unique_sessions)
from
  (select 
    date_trunc('hour', created_at) as "created_at_hour",
    count(distinct(session_id)) as nb_unique_sessions
  from 
    dbt_pablo_d.stg_events
  group by 
    created_at_hour) as "unique_sessions_per_hour"

> 16.3275862068965517
