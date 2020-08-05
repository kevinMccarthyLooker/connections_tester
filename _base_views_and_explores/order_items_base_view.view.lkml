view: order_items_base_view {
  #added here because reference is needed for join in base explore
  label: "Order Items ({{_dialect._name}})"

  dimension: order_id {} #requierd here for generic join and ndt reference
  dimension_group: created {type:time}

#custom fields we want to add in every model
  dimension: dialect {
    view_label: "INFO"
    label: "_dialect"
    sql: '{{_dialect._name}}' ;;
  }

  dimension: bigquery_date_add_syntax_test {
    sql: DATE_ADD(DATE "2020-01-01", INTERVAL 1 DAY) ;;
  }

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
