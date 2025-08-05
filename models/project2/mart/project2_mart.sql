{{
    config
    (
        materialized = 'table'
    )
}}


select * from {{ ref('project2_raw') }} where top_countries in ('INDIA','RUSSIA','JAPAN')