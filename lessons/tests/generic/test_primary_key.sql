
{% test primary_key(model, column_name) %}

with validation as (

    select 
       
       {{ column_name }} as primary_key,
       count(1) as occurrence

    from 
    {{ model }}
    group by 1

)

select * from validation where occurrence > 1 or primary_key is null


{% endtest %}