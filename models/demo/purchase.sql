{{
    config
    (
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = 'PURCHASE_ID',
        merge_exclude_columns = ['INSERT_DTS']

    )
}}


with purchase_src as 
(
    Select 
    PURCHASE_ID,
    PURCHASE_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    QUANTITY,
    UNIT_PRICE,
    TOTAL_AMOUNT,
    PAYMENT_METHOD,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS,
    CURRENT_TIMESTAMP AS UPDATE_DTS
    from {{source('purchase','PURCHASE_SRC')}}

    {%if is_incremental()%}
    
    where CREATED_AT > (select max(INSERT_DTS) from {{this}})

    {%endif%}
)

select * from purchase_src