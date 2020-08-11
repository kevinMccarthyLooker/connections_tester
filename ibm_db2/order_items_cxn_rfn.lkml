include: "order_items.view"
# view: +order_items {
view: +db2_order_items {
  dimension: added_field {sql:'added in ibm_db2 refinement';;}
  dimension_group: created {
    type: time
    sql: ${created_at_raw} ;;
  }
  dimension_group: created_at {hidden: yes}
}

include:"@{base_explore_include_variable}"

explore: +order_items {
  from:db2_order_items
}
