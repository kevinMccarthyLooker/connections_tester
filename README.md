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
