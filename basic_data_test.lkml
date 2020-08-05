test: order_items_test {
  explore_source: order_items {
    column: id {}
    column: count {}
  }
  assert: test {
    expression: ${order_items.count}>0;;
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
