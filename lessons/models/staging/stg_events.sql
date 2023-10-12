{{ config(materialized = "incremental",
          unique_key = 'event_id') }}

with source as (

    select

      *
    
    from {{ source('thelook_ecommerce', 'events')}}
)

select
 
  *

from source

{% if is_incremental() %}

where created_at >= (select max(created_at) from {{ this}})

{% endif %}