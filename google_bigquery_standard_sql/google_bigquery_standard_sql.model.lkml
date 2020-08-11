connection: "bigquery_publicdata_standard_sql"

include: "*" #files in this folder such as per connection fixes
include: "@{google_bigquery_standard_sql__connection_toggle}"

### NOTE: Nothing below should need to change between models
### instantiate the explore in this model
# explore: +order_items {}
