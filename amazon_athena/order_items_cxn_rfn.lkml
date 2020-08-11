include: "order_items.view"
view: +order_items {
#   derived_table: {
#     sql:
#     select order_items.*,
#     orders.created_at
#     from order_items
#     left join orders on order_items.order_id=orders.id
#         ;;
#   }
  suggestions: yes #?

  dimension: added_field {sql:'added in athena refinement';;}
  dimension_group: created {
    type: time
    datatype: timestamp
    sql: ${TABLE}.created_at ;;
  }
  dimension: another_validator_test_change {}
##   final: yes
}
