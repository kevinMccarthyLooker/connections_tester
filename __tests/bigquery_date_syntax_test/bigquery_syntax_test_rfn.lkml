include: "/_base_views_and_explores/order_items.view"
view: +order_items {
  dimension: bigquery_date_add_syntax_test {
    sql: DATE_ADD(DATE '2020-01-01', INTERVAL 1 DAY) ;;
  }
}

test: bigquery_date_add_syntax_test {
  explore_source: order_items {
    column: bigquery_date_add_syntax_test {field:order_items.bigquery_date_add_syntax_test}
    column: count {}
  }
  assert: field_has_value {
    expression: NOT is_null(${order_items.bigquery_date_add_syntax_test});;
  }
}
