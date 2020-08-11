include: "/_base_views_and_explores/order_items.view"
# view: +order_items {
view: db2_order_items {
  extends: [order_items]
  derived_table: {
    sql: select order_items.*,
          orders.created_at,
          orders.status,
          orders.user_id
          from order_items
          left join orders on order_items.order_id=orders.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}."SKU_NUM" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
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
