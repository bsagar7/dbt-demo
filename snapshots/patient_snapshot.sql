{% snapshot patient_snapshot%}

{{
    config
    (
        strategy = 'check',
        unique_key = 'PATIENT_ID',
        check_cols = ['FULL_NAME', 'DATE_OF_BIRTH','GENDER', 'PHONE', 'EMAIL','ADDRESS', 'STATUS', 'PRIMARY_DIAGNOSIS']
    )
}}

select * from {{source('patient','PATIENT_SRC')}}

{% endsnapshot %}