select
    orders.order_id, 
    user_id,
    orders.promo_id,
    address_id,
    created_at as order_created_at, 
    shipping_cost,
    order_cost,
    order_total,
    tracking_id,
    shipping_service,
    estimated_delivery_at,
    delivered_at,
    orders.status as order_status,
    discount as promo_discount,
    products.product_id, 
    quantity as product_quantity,
    name as product_name,
    price as product_price
from 
    {{ref('stg_orders')}} orders left join 
    {{ref('stg_promos')}} promos on orders.promo_id = promos.promo_id left join  
    {{ref('stg_order_items')}} order_items on orders.order_id = order_items.order_id left join 
    {{ref('stg_products')}} products on order_items.product_id = products.product_id
    
    
