#need to explicitly add a tile for each model. Update name and model params accordingly.
- dashboard: dashboard_with_all_dialects
  title: dashboard_with_all_dialects
  # layout: tile
  layout: newspaper
  elements:
  - name: google_bigquery_standard_sql
    model: google_bigquery_standard_sql
    type: table
    explore: order_items
    fields: [order_items.count]

  - name: amazon_athena
    model: amazon_athena
    type: table
    explore: order_items
    fields: [order_items.count]

  - name: amazon_aurora_mysql
    model: amazon_aurora_mysql
    type: table
    explore: order_items
    fields: [order_items.count]

  - name: microsoft_azure_postgresql
    model: microsoft_azure_postgresql
    type: table
    explore: order_items
    fields: [order_items.count]

  - name: clickhouse
    model: clickhouse
    type: table
    explore: order_items
    fields: [order_items.count]
