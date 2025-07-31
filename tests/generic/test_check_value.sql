{%test check_value(model, column_name)%}

select * from {{model}}
    where {{column_name}} < 10000

{%endtest%}