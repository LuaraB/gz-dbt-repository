with sales as (
    select
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity
    from {{ ref('stg_gz_raw_data__sales') }}
),

product as (
    select
        products_id,
        purchase_price
    from {{ ref('stg_gz_raw_data__product') }}
)

select
    s.*,
    p.purchase_price,
    s.revenue - (s.quantity * p.purchase_price) as margin,
    s.quantity * p.purchase_price as purchase_cost
from sales s
left join product p 
using(products_id)

