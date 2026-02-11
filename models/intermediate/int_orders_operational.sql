select 
    s.orders_id,
    sm.date_date,
    ROUND((sm.margin + s.shipping_fee - s.logcost - s.ship_cost),2) as operational_margin,
    sm.quantity
from {{ ref('stg_gz_raw_data__ship') }} s
right join {{ ref('int_sales_margin') }} sm
using (orders_id)