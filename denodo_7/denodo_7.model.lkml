connection: "denodo7__test_db"

include: "*" #files in this folder such as per connection fixes
include: "@{denodo_7__connection_toggle}"

### NOTE: Nothing below should need to change between models
### instantiate the explore in this model
# explore: +order_items {}
