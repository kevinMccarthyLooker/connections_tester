#need to explicitly add a tile for each model. Update name and model params accordingly.
- dashboard: date_expression_test_with_all_dialects
  title: date_expression_test_with_all_dialects
  layout: newspaper
  # tile_size: 100
  elements:
  - name: google_bigquery_standard_sql
    model: google_bigquery_standard_sql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.expression_generated_date_add_sql, order_items.created_date, order_items.date_add_using_expression_as_a_date_test]
    sorts: [order_items.created_date]
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false


  - name: amazon_athena
    model: amazon_athena
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.expression_generated_date_add_sql, order_items.created_date, order_items.date_add_using_expression_as_a_date_test]
    sorts: [order_items.created_date]
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: amazon_aurora_mysql
    model: amazon_aurora_mysql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.expression_generated_date_add_sql, order_items.created_date, order_items.date_add_using_expression_as_a_date_test]
    sorts: [order_items.created_date]
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: microsoft_azure_postgresql
    model: microsoft_azure_postgresql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.expression_generated_date_add_sql, order_items.created_date, order_items.date_add_using_expression_as_a_date_test]
    sorts: [order_items.created_date]
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: clickhouse
    model: clickhouse
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.expression_generated_date_add_sql, order_items.created_date, order_items.date_add_using_expression_as_a_date_test]
    sorts: [order_items.created_date]
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false
