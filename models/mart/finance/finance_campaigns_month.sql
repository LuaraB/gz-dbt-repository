with subquery as (
select * EXCEPT(date_date),
EXTRACT(MONTH FROM date_date) as datemonth
from {{ ref('finance_campaigns_day') }}
)

select datemonth,
    ROUND(sum(ads_margin),2) as ads_margin,
    ROUND(sum(average_basket),2) as average_basket,
    round(sum(operational_margin),2) as operational_margin,
    round(sum(ads_cost_day),2) as ads_cost,
    round(sum(imp_day),2) as imp_day,
    round(sum(click_day),2) as click_day,
    round(sum(total_quantity),2) as total_quantity,
    round(sum(total_revenue),2) as total_revenue,
    round(sum(total_purchase_cost),2) as total_purchase_cost,
    round(sum(margin),2) as margin,
    round(sum(total_shipping_fee),2) as total_shipping_fee,
    round(sum(total_logcost),2) as total_logcost,
    round(sum(total_ship_cost),2) as total_ship_cost
from subquery
group by datemonth