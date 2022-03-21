select 
    event_id,
    session_id,
    events.user_id,
    page_url,
    events.created_at as event_created_at,
    event_type,
    events.order_id,
    events.product_id,
    name as product_name,
    price as product_price,
    inventory as product_inventory_at_pageview,
    case when events.order_id is not null then 1 else 0 end as was_an_order_generated
from 
    {{ref('stg_events')}} events left join 
    {{ref('stg_products')}} products on events.product_id = products.product_id left join 
    {{ref('stg_orders')}} orders on events.order_id = orders.order_id

