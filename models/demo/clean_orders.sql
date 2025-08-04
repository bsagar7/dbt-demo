{{
    config
    (
        materialized = 'ephemeral'
    )
}}


with orders_raw as 
(

    select 
    CASE WHEN ORDER_ID IS NULL THEN '0000' ELSE ORDER_ID END AS ORDER_ID,
    ORDER_DATE, 
    CUSTOMER_ID, 
    UPPER(CUSTOMER_NAME) AS CUSTOMER_NAME, 
    ORDER_STATUS, 
    PAYMENT_METHOD, 
    TOTAL_AMOUNT,
    CREATED_AT,
    CURRENT_TIMESTAMP as INSERT_DTS
    FROM {{source('clean_orders','ORDERS_RAW')}}

)

select * from orders_raw