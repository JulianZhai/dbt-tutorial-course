{{ config(severity = 'warn') }}

with order_details as (

    select
      
      count(order_item_id) as item_count,
      order_id

    from {{ ref("stg_order_items") }}
    group by order_id

)

select o.order_id, num_items_ordered = od.item_count as test from {{ ref("stg_orders") }} o
left join order_details od on od.order_id = o.order_id
where not(num_items_ordered = od.item_count)