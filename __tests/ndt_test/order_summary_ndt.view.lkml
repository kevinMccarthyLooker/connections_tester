include: "/_base_views_and_explores/order_items.view"
include: "/_base_views_and_explores/order_items_base_explore"
include: "*"
include: "/amazon_athena/order_items.view"


view: +order_items {dimension: order_id {}}#required for the join being referenced here

view: order_summary_ndt {
  derived_table: {
    explore_source: order_items {
      column: order_id {}
      column: count {}
    }
  }
  dimension: order_id {
    primary_key: yes
  }
  dimension: order_items_in_order {
    type: number
    sql: ${TABLE}.count ;;
  }
  dimension: order_items_in_order_tier {
    type: tier
    tiers: [1,2,5]
    style: integer
    sql: ${order_items_in_order} ;;
  }
}


# include: "/_base_views_and_explores/order_items.view"
# include: "order_summary_ndt.view"
explore: +order_items {
  from: order_items
  view_name: order_items
  hidden: yes
  group_label: "connection_test"
  join: order_summary_ndt {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id}=${order_summary_ndt.order_id} ;;
  }
}
test: ndt_test {
  explore_source: order_items {
    column: order_items_in_order {field:order_summary_ndt.order_items_in_order}
    column: count {}
  }
  assert: test {
    expression: ${order_items.count}>0;;
  }
}
