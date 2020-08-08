- dashboard: pop_block_test_on_timetamp
  title: pop_block_test_on_timetamp
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    # model: amazon_athena
    explore: order_items
    type: table
    fields: [order_items.created_date_periods_ago_pivot, order_items.created_month,
      order_items.count]
    pivots: [order_items.created_date_periods_ago_pivot]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc, order_items.created_date_periods_ago_pivot]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
