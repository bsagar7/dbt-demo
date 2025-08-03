{{
    config
    (
        materialized = 'table'
    )
}}



with performance_review_src as 
(
    select 
    REVIEW_ID as review_id,
    EMP_ID as emp_id,
    REVIEW_DATE as review_date,
    REVIEWER_NAME as reviewer_name,
    REVIEW_CYCLE as review_cycle,              
    RATING as rating,               
    FEEDBACK as feedback,
    PROMOTION_RECOMMENDED as promotion_recommended,
    TRAINING_RECOMMENDED as training_recommended,
    GOALS_MET_PERCENT as goals_met_percent,            
    CREATED_AT as created_at,
    current_timestamp as INSERT_DTS
    from {{source('performance','PERFORMANCE_REVIEW_SRC')}}
)

select * from performance_review_src
