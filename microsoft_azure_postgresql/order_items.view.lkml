# view: order_items {
include: "/_base_views_and_explores/order_items.view"
view: +order_items {
  sql_table_name: public.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}."sku_num" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
