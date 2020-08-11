project_name: "connections_test"

constant: base_explore_include_variable {value: "/**/order_items_base_explore"}
constant: global_test_control_include_variable {value: "/**/global_test_control"}

#To turn off a connection, use value: "@{connection_off}"
#To turn back on, use value: "@{connection_on}"
constant: connection_on {value:"/**/global_test_control"}
constant: connection_off {value:"/**/empty_file_for_include_replacement"}

constant: amazon_athena__connection_toggle                {value: "@{connection_on}"}
constant: google_bigquery_standard_sql__connection_toggle {value: "@{connection_on}"}

constant: amazon_aurora__connection_toggle                {value: "@{connection_off}"}
constant: clickhouse__connection_toggle                   {value: "@{connection_off}"}
constant: microsoft_azure_postgresql__connection_toggle   {value: "@{connection_off}"}
constant: snowflake__connection_toggle                    {value: "@{connection_off}"}
constant: clustrix__connection_toggle                     {value: "@{connection_off}"}
constant: ibm_db2__connection_toggle                      {value: "@{connection_off}"}

constant: denodo_7__connection_toggle               {value: "@{connection_on}"}

constant: common_dt_sqlfor_combining_info_from_orders_to_order_items {value: "select order_items.*,orders.created_at,orders.status,orders.user_id from order_items left join orders on order_items.order_id=orders.id"}
# constant: amazon_athena__test_toggle{value: "/**/empty_file_for_include_replacement.lkml"}
# https://turtletown.dev.looker.com/projects/connections_test/files/empty_file_for_include_replacement.lkml
#
remote_dependency: financial_calendar_extension {
  url: "git://github.com/kevinMccarthyLooker/km_fiscal_dates_block.git"
  ref: "master"
}
########
