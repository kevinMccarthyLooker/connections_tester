include: "order_items.view"
view: +order_items {
  derived_table: {
    sql:
    select order_items.*,
    orders.created_at
    from dialecttest.order_items
    left join orders on order_items.order_id=orders.id
        ;;
  }
  dimension: added_field {sql:'added in clustrix refinement';;}
  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
  }
#    final: yes
}
