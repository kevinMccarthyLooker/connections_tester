# view: order_items {
view: order_items_base_view {
  #added here because reference is needed for join in base explore
  dimension: order_id {}
}
include:"/order_items_global_refinements"
