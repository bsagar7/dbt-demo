{{
    config
    (
        materialized = 'table'
    )
}}

with concat_name as 
(
    select 
    emp_id,
    emp_firstname
    emp_lastname
    from {{ ref('employee') }}
)

select 
    emp_id,
{{ concat_macro ('emp_firstname','emp_lastname') }}  as emp_name 
from concat_name


