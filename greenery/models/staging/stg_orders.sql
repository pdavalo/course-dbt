SELECT
  order_id, 
  delivered_at, 
  created_at
from {{source('postgres', 'orders')}}