select 
    date_date,
    count(orders_id) as total_number_of_transactions,
    round(sum(revenue),2) as total_revenue,
    round(safe_divide(sum(revenue), count(distinct orders_id)),2) as average_basket,
    round(safe_divide(sum(revenue), count(orders_id)),2) as operational_margin,
    round(sum(purchase_cost),2) as total_purchase_cost,
    round(sum(shipping_fee),2) as total_shipping_fee,
    round(sum(logcost),2) as total_logcost,
    sum(quantity) as total_quantity 
from {{ ref('int_orders_operational') }}
group by 
    date_date
