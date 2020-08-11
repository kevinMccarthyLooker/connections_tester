### LEARNINGS ABOUT THIS VALIDATOR 2020_08_08
- Validation of lookml changes in the test files taking a long time
- Changes in a connection specific refinement file take less time
- Possible Reasons:
- - Many lookml references
- - Expression based caclulations particularly bad
- - As expected, validation scales linear with models included
- - - For repeated testing of all dialects, while having dev convenience, seems like dev and lookml validation should happen in a separate dev project, wheras lookml tests across all dialects would happen here.

# Test Findings 2020 08 08

### Input Datatype
Have to ensure that the source field in the configure sql is _date type and includes implementer uses the extension::date




### Test Results on 'All Fiscal Dates Fields'
km 8/8 update:
- fixed the athena errors by adding 'required fields' to expressions that were referencing dates (gettin string where date was expected error)
km 8/8:
- athena indicates a logic error -> look into this
- clickhouse and bigquery complain about query size. -> do smaller queries and see where the fail point is or if singular fields can trigger this error.

3 of 6 tests passed

!! amazon_athena::fiscal_calendar_test
[Simba][AthenaJDBC](100071) An error has been thrown from the AWS Athena client. SYNTAX_ERROR: line 12:493: Unexpected parameters (varchar(4), integer, varchar) for function date_add. Expected: date_add(varchar(x), bigint, date) , date_add(varchar(x), bigint, time) , date_add(varchar(x), bigint, time with time zone) , date_add(varchar(x), bigint, timestamp) , date_add(varchar(x), bigint, timestamp with time zone)

OK- amazon_aurora_mysql::fiscal_calendar_test

!! clickhouse::fiscal_calendar_test

ClickHouse exception, code: 306, host: localhost, port: 8443; Code: 306, e.displayText() = DB::Exception: Maximum parse depth exceeded (version 19.15.3.6 (official build))

 google_bigquery_standard_sql::fiscal_calendar_test
Query execution failed: - The query is too large. The maximum standard SQL query length is 1024.00K characters, including comments and white space characters.

 microsoft_azure_postgresql::fiscal_calendar_test
 snowflake::fiscal_calendar_test

###
Ran 'one field at a time' tests on fiscal_years_ago, and it worked on 6 out of 6  dialects + the dev dialect (redshift).
