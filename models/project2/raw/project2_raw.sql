{{
    config
    (
        materialized = 'table'
    )
}}


select 'INDIA' as Top_countries
    union
select 'USA' as Top_countries 
    union
select 'CHINA' as Top_countries 
    union
select 'RUSSIA' as Top_countries 
    union
select 'JAPAN' as Top_countries 