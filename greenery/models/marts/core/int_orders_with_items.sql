select 
  orders.order_id, 
  user_id,
  promo_id,
  address_id,
  created_at, 
  shipping_cost,
  order_cost,
  order_total,
  tracking_id,
  shipping_service,
  estimated_delivery_at,
  delivered_at,
  status,
  product_id,
  quantity
from 
    {{ref('stg_orders')}} orders left join 
    {{ref('stg_order_items')}} order_items on orders.order_id = order_items.order_id