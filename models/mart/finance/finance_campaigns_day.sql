select 
    fd.date_date,
    round(fd.operational_margin - cd.ads_cost_day,2) as ads_margin,
    fd.average_basket,
    fd.operational_margin,
    cd.ads_cost_day,
    cd.imp_day,
    cd.click_day,
    fd.total_quantity,
    fd.total_revenue,
    fd.total_purchase_cost,
    round(fd.total_revenue - fd.total_purchase_cost,2) as margin,
    fd.total_shipping_fee,
    fd.total_logcost,
    fd.total_ship_cost
from {{ ref('finance_days') }} fd
left join {{ ref('int_campaigns_day') }} cd
using(date_date)
order by date_date desc
