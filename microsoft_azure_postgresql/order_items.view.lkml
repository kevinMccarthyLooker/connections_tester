# view: order_items {
include: "/_base_views_and_explores/order_items.view"
view: +order_items {
  derived_table: {
    sql: @{common_dt_sqlfor_combining_info_from_orders_to_order_items} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}."sku_num" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."created_at" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  set: detail {
    fields: [
      id,
      order_id,
      amount,
      sku_num,
      created_at_time,
      status,
      user_id
    ]
  }
}
