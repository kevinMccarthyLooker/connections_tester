# view: order_items {
include: "/_base_views_and_explores/order_items.view"
view: +order_items {
#   sql_table_name: looker_tpc_h.order_items ;;
#   drill_fields: [id]
#
#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: amount {
#     type: number
#     sql: ${TABLE}.amount ;;
#   }
#
#   dimension: order_id {
#     type: number
#     sql: ${TABLE}.order_id ;;
#   }
#
#   dimension: sku_num {
#     type: number
#     sql: ${TABLE}.sku_num ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [id]
#   }
# }

  derived_table: {
    sql: SELECT
      order_items.id
      ,order_items.sku_num
      ,order_items.amount
      ,order_items.order_id
      ,the_orders.created_at
      -- ,cast(the_orders.status as varchar) as the_status
      ,'unknown' as status
      ,the_orders.user_id
      FROM looker_tpc_h.order_items as order_items left join
      looker_tpc_h.orders as the_orders on the_orders.id=order_items.order_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}.sku_num ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      id,
      sku_num,
      amount,
      order_id,
      created_at_time,
      status,
      user_id
    ]
  }
}
