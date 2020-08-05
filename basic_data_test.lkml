### Most basic test, now covered by more specific tests below {
test: order_items_has_records {
  explore_source: order_items {column: count {}}
  assert: test {expression: ${order_items.count}>0;;}
  assert: field_has_value {
    expression: NOT is_null(${order_items.count});;
  }
}
### } End Most Basic Test

### Run NDT Tests alone - some ndts seem to time out while waiting for other tests to complete.
# test: ndt_test {
#   explore_source: order_items {
#     column: order_items_in_order {field:order_summary_ndt.order_items_in_order}
#     column: count {}
#   }
#   assert: test {
#     expression: ${order_items.count}>0;;
#   }
# }

test: bigquery_date_add_syntax_test {
  explore_source: order_items {
    column: bigquery_date_add_syntax_test {field:order_items.bigquery_date_add_syntax_test}
    column: count {}
  }
  assert: field_has_value {
    expression: NOT is_null(${order_items.bigquery_date_add_syntax_test});;
  }
}

test: date_add_with_expression_test {
  explore_source: order_items {
    column: bigquery_date_add_syntax_test {field:order_items.date_add_using_expression_test}
    column: count {}
  }
  assert: field_has_value {
    expression: NOT is_null(${order_items.date_add_using_expression_test});;
  }
}
