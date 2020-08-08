include: "/_base_views_and_explores/order_items.view"
view: +order_items {
  dimension_group:: created {type: time}

  dimension: date_add_using_expression_test {
    type: date_raw
    # expression: add_days(1,date(2020,1,1));;
    expression: add_days(1,${order_items.created_raw});;
  }
  dimension: date_add_using_expression_as_a_date_test {
    type: date
    # expression: add_days(1,date(2020,1,1));;
    expression: add_days(1,${order_items.created_raw});;
  }

  dimension: expression_generated_date_add_sql {
    description: "NOTE: quotes stripped"
    sql: {% assign sql = "${date_add_using_expression_test}" | replace:"'","" %}'{{sql}}' ;;
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
