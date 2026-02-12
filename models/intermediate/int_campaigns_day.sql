select 
    date_date,
    ROUND(SUM(ads_cost),2) as ads_cost_day,
    ROUND(SUM(impression)) as imp_day,
    ROUND(SUM(click)) as click_day
from {{ ref('int_campaigns') }}
group by date_date
order by date_date desc