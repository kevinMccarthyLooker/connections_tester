
view: order_items_base_view {
  label: "Order Items ({{_dialect._name}})"

### Custom fields we want to add in every model
  dimension: dialect {
    view_label: "INFO"
    label: "_dialect"
    sql: '{{_dialect._name}}' ;;
  }

### Required here for generic join and ndt reference
  dimension: order_id {}
  dimension_group: created {type:time}

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

  #moved these to be configured in a refinement.  choose the test/finding and then view the corresponding test dashboard
  # dimension: special_test {hidden: yes sql:'test not configured';;}
  # dimension: special_test_description {hidden: yes sql:'test not configured';;}

}

# view: +order_items_base_view {
#   dimension: special_test {
#     sql: '1' || '2' ;;
#   }
#   dimension: special_test_description {
#     sql: 'concatenate with pipe, tested: 1 || 2 (*single quotes around each removed for this note)' ;;
#   }
# }
