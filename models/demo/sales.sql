{{
    config
    (
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
    
}}



with sales_src as
(
    select 
    SALE_ID,
    SALE_DATE,
    CUSTOMER_NAME,
    PRODUCT_NAME,
    QUANTITY,
    UNIT_PRICE,
    TOTAL_AMOUNT,
    CREATED_AT,
    CURRENT_TIMESTAMP as insert_dts
    from {{source('sales','SALES_SRC')}}


{% if is_incremental() %}

where CREATED_AT > (Select max(insert_dts) from {{this}})

{% endif %}


)



select * from sales_src