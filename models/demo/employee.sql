
{{config(materialized = 'table')}}

with employee_raw as
(
    select 
    EMP_ID as emp_id,
    split_part(EMP_NAME,' ',1) as emp_firstname,
    split_part(EMP_NAME,' ',2) as emp_lastname,
    EMP_DEPT as employee_dept,
    SALARY as salary,
    HIRE_DATE as hire_date,
    trim(split_part(ADDRESS,',',1)) as emp_street,
    trim(split_part(ADDRESS,',',2)) as emp_apt,
    trim(split_part(ADDRESS,',',3)) as emp_city,
    trim(split_part(ADDRESS,',',4)) as emp_pincode,
    upper(trim(split_part(ADDRESS,',',5))) as emp_state
    from {{source('employee','EMPLOYEE_RAW')}}      --DBT_DB.PUBLIC.EMPLOYEE_RAW
    
)
select * from employee_raw