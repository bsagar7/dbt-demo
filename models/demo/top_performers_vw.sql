{{
    config
    (
        materialized = 'view'
    )
}}


select * from {{ ref('performance_review') }} 
    where PROMOTION_RECOMMENDED = True