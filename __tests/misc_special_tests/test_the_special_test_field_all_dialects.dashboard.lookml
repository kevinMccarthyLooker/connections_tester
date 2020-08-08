#need to explicitly add a tile for each model. Update name and model params accordingly.
- dashboard: test_the_special_test_field_all_dialects
  title: test_the_special_test_field_all_dialects
  layout: newspaper

  filters:
  - name: test_selector
    title: test_selector
    type: field_filter
    default_value: concat with bar
    allow_multiple_values: true
    required: false
  #   model: amazon_athena
    explore: order_items
    listens_to_filters: []
    field: order_items.test_selector

  elements:
  - name: google_bigquery_standard_sql
    model: google_bigquery_standard_sql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.special_test, order_items.special_test_description, order_items.commentary]
    sorts: [order_items.special_test]
    listen:
      test_selector: order_items.test_selector
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false


  - name: amazon_athena
    model: amazon_athena
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.special_test, order_items.special_test_description, order_items.commentary]
    sorts: [order_items.special_test]
    listen:
      test_selector: order_items.test_selector
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: amazon_aurora_mysql
    model: amazon_aurora_mysql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.special_test, order_items.special_test_description, order_items.commentary]
    sorts: [order_items.special_test]
    listen:
      test_selector: order_items.test_selector
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: microsoft_azure_postgresql
    model: microsoft_azure_postgresql
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.special_test, order_items.special_test_description, order_items.commentary]
    sorts: [order_items.special_test]
    listen:
      test_selector: order_items.test_selector
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false

  - name: clickhouse
    model: clickhouse
    type: looker_grid
    explore: order_items
    fields: [order_items.dialect, order_items.special_test, order_items.special_test_description, order_items.commentary]
    sorts: [order_items.special_test]
    listen:
      test_selector: order_items.test_selector
    limit: 1
    height: 2
    title_hidden: true
    truncate_text: false
