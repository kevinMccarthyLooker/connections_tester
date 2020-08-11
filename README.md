# Readme

Project for testing generic code against different dialects.

Each Dialect will have an order_items explore.

We will apply refinements to do different tests.

Create tests within folders and then turn on or off different tests in:
[global test control](https://turtletown.dev.looker.com/projects/connections_test/files/__tests/global_test_control.lkml)


2020_08_08:
Stable branch created with 6 functioning connections
amazon_athena, amazon_aurora_mysql,clickhouse,google_bigquery_standard_sql,microsoft_azure_postgresql,snowflake

Use this branch to start a brand new test:
multiple_connection_tests_with_extends_v1_2020_08_08

Other Notes: another project/set of base tables (eg. faa_demo) and additional connections (db2 had an issue creating order items and other dialects) to be added later.



###
2020_08_08 test of fiscal_blocks observations:
- 1st validation took about a minute (6 dialects)


###
Connections in this instance tried, but failed (alphabetical)
- bigquery_test_db_connection : skipped because another connection of the same type was used
- broken : doesn't connect
- dashdb_test_db : doesn't connect
- datavirtuality__test_db : doesn't connect
-
