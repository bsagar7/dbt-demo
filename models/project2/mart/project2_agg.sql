{{
    config
    (
        materialized = 'table',
        schema = 'AGG'
    )
}}


select * from {{ ref('project2_mart') }} where top_countries in ('INDIA','RUSSIA')