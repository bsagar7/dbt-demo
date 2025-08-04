{{
    config
    (
        materialized = 'table'
    )
}}

with covid_stats_src as 
(
    select 
    a.COUNTRY_NAME as COUNTRY_NAME, 
    b.country_code as COUNTRY_CODE,
    TOTAL_CONFIRMED, 
    TOTAL_DEATHS, 
    LAST_UPDATE,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
    from {{source('covid','COVID_STATS_SRC')}} a
    left join {{ref('iso_country_code')}} b
    on a.COUNTRY_NAME = b.COUNTRY_NAME
)

select * from covid_stats_src