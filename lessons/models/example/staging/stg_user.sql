{{ config(materialized = "view") }}

with users as (
    select
      *
    from {{ source("thelook_ecommerce", "users") }}
)

select
  *
from users