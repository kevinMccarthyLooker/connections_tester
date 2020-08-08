connection: "azure_postgres__test_db"

### NOTE: Nothing below should need to change between models
include:"@{base_explore_include_variable}"
include: "@{global_test_control_include_variable}"
include: "*" #files in this folder such as per connection fixes

### instantiate the explore in this model
# explore: +order_items {}
