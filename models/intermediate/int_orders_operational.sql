select 
    s.orders_id,
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    sm.products_id,
    sm.revenue,
    sm.quantity,
    sm.products_id,
    sm.purchase_price,
    sm.margin,
    sm.purchase_cost,
    ROUND((sm.margin + s.shipping_fee - s.logcost - s.ship_cost),2) as operational_margin
from {{ ref('stg_gz_raw_data__ship') }} s
right join {{ ref('int_sales_margin') }} sm
using (orders_id)