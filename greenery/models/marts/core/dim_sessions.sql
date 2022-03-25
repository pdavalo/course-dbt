with sessions_before_purchase as (
select 
  session_id, 
  product_id, 
  case when event_type = 'page_view' then 1 else 0 end product_viewed
from
  {{ref('stg_events')}}
where
  event_type in ('page_view')
),

sessions_with_purchase as (
select 
  session_id,
  1 as purchased
from
  {{ref('stg_events')}}
where
  event_type = 'checkout'
)

select 
  sessions_before_purchase.session_id,
  product_id,
  product_viewed,
  case when purchased = 1 then 1 else 0 end as purchased
from 
  sessions_before_purchase left join 
  sessions_with_purchase on sessions_before_purchase.session_id = sessions_with_purchase.session_id
