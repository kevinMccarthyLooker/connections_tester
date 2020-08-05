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
