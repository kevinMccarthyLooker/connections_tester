connection: "clickhouse__test_db"

### NOTE: Nothing below should need to change between models
include:"@{base_explore_include_variable}"
include: "*" #files in this folder such as per connection fixes
include: "@{global_test_control_include_variable}"

### instantiate the explore in this model
# explore: +order_items {}
