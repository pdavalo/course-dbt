select 
    user_id,
    sum(case when status = 'delivered' then 1 else 0 end) as nb_delivered_orders,
    sum(case when promo_id is not null and status = 'delivered' then 1 else 0 end) nb_promos_delivered,
    sum(order_cost) as sum_order_cost,
    sum(shipping_cost) as sum_shipping_cost,
    sum(order_total) as sum_order_total,
    avg(order_cost) as avg_order_cost,
    avg(shipping_cost) as avg_shipping_cost,
    avg(order_total) as avg_order_total,
    avg(quantity) as avg_product_quantity
from 
    {{ref('int_orders_with_items')}} int_orders_with_items
group by 
    user_id

