
{{
    config
    (
        materialized = 'table'
    )
}}

with clean_orders as 
(
    select 
    ORDER_ID, 
    ORDER_DATE, 
    CUSTOMER_ID, 
    CUSTOMER_NAME, 
    ORDER_STATUS, 
    PAYMENT_METHOD, 
    TOTAL_AMOUNT,
    CREATED_AT,
    INSERT_DTS
    from {{ ref('clean_orders') }}
)

select * from clean_orders