include:"@{base_explore_include_variable}"
# include: "*" #files in this folder such as per connection fixes
include: "@{global_test_control_include_variable}"


#most basic data test. at least see the connection is working and records are coming through
# test: order_items_has_records {
#   explore_source: order_items {column: count {}}
#   assert: test {expression: ${order_items.count}>0;;}
# }

### Toggle on/off additional tests
# include: "/**/bigquery_date_syntax_test/*"
# include: "/**/date_expression_test/*"
# include: "/**/misc_special_tests/*"
# include: "/**/ndt_test/*"
# include: "/**/pop_block_test/*"
# include: "/**/pop_block_test_on_timestamp/*"
# include: "/**/pop_block_with_params_test/*"
# include: "/**/pop_block_fix_double_quotes_issue/*"
include: "/**/fiscal_calendar_extension_test/*"
