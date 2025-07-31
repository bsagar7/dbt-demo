
-- Use the `ref` function to select from other models

{{ config(materialized='table', alias = 'target_data') }}


select *
from {{ ref('my_first_dbt_model') }}
where id = 1
