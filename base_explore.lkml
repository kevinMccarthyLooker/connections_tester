include: "/order_items_base_view.view"
include: "/order_summary_ndt.view"
# explore: order_items {
explore: order_items_base_explore {
  extension: required
  from: order_items_base_view
  view_name: order_items
  hidden: yes
  group_label: "connection_test"
  join: order_summary_ndt {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id}=${order_summary_ndt.order_id} ;;
  }
}
include: "/basic_data_test"
