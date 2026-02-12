with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        --shipping_fee_1, deleted because its the same of shipping_fee
        logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost 
    from source
    --WHERE shipping_fee <> shipping_fee_1
)

select * from renamed