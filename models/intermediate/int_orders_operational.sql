select 
    om.*,
    s.* EXCEPT(orders_id),
    ROUND((om.margin + s.shipping_fee - s.logcost - s.ship_cost),2) as operational_margin
from {{ ref('int_orders_margin') }} om
left join {{ ref('stg_gz_raw_data__ship') }} s
using (orders_id)